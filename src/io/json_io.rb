class JsonIO
  def initialize(path)
    @path = path
  end

  def read
    serialized_json = JSON.parse(File.read(@path))
    return serialized_json
  end
end