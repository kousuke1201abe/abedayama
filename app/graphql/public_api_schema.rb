class PublicAPISchema < GraphQL::Schema
  mutation(Types::PublicAPI::MutationType)
  query(Types::PublicAPI::QueryType)

  use GraphQL::Batch
end
