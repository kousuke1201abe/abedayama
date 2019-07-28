class InternalAPI::GraphqlController < ApplicationController
  UnauthorizedError = Class.new(StandardError)

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      internal_identity: internal_identity,
    }
    result = InternalAPISchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  def internal_identity
    internal_identity_session =
      authenticate_with_http_basic do |token, _|
        ::InternalAPI::InternalIdentity::Session.find_by(token: token)
      end
    raise UnauthorizedError unless internal_identity_session
    internal_identity_session.internal_identity
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
