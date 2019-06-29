def create_table(table_name, args = {})
  args[:options] = ["ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", args[:options]].compact.join(' ')
  super(table_name, args) do |t|
    yield(t)
    t.timestamps
  end
end

module HandleIndexSettings
  def references(ref, options = {})
    index_options = options[:index]

    if index_options&.respond_to?(:[])
      options[:index] = false
      super(ref, options)

      foreign_key = "#{ref.to_s.singularize}_id"
      index foreign_key, **index_options
    else
      super
    end
  end

  [
    :binary,
    :boolean,
    :date,
    :datetime,
    :decimal,
    :float,
    :integer,
    :bigint,
    :string,
    :text
  ].each do |column_type|
    define_method column_type do |*args|
      name = args[0]
      options = args[1]

      return super(*args) unless options

      index_options = options[:index]

      if index_options&.respond_to?(:[])
        options.delete(:index)
        args[-1] = options
        super(*args)

        index name, **index_options
      else
        super(*args)
      end
    end
  end
end

class Ridgepole::DSLParser::TableDefinition
  prepend HandleIndexSettings
end
