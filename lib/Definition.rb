class Definition
  @@allDefinitions = []
  attr_accessor(:definition, :id)

  define_method(:initialize) do |definition|
    @definition = definition
    @id = @@allDefinitions.length().+(1)
  end

  define_singleton_method(:all) do
    @@allDefinitions
  end

  define_singleton_method(:clear) do
    @@allDefinitions = []
  end

  define_method(:save) do
    @@allDefinitions.push(self)
  end

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@allDefinitions.each() do |define|
      if define.id().eql?(id)
        found_definition = define
      end
    end
    found_definition
  end
end
