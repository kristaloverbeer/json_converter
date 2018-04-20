class CsvIO
  def initialize(path)
    @path = path
  end

  def write(array_data)
    CSV.open(@path, 'w') do |csv|
      csv << array_data[0].keys
      for hash_record in array_data
        csv << hash_record.values
      end
    end
  end
end