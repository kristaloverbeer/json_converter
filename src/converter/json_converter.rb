require 'json'
require 'csv'


class JsonConverter
  def to_csv(json_path, csv_path)
    serialized_json = read_json(json_path)
    flattened_hash = flatten_json(serialized_json)

    CSV.open(csv_path, 'w') do |csv|
      csv << flattened_hash[0].keys
      for record in flattened_hash
        csv << record.values
      end
    end

  end

  def flatten_json(raw_json)
    json_result = []
    for raw_record in raw_json
      flatten_record = flatten_hash(raw_record)
      json_result << flatten_record
    end
    return json_result
  end

  def flatten_hash(raw_hash, hash_result={}, concatenated_key='')
    raw_hash.keys.each do |key|
      if concatenated_key == ''
        current_key = "#{key}"
      else
        current_key = "#{concatenated_key}.#{key}"
      end
      if raw_hash[key].is_a?(Hash)
      hash_result = flatten_hash(raw_hash[key], hash_result, current_key)
      else
        if raw_hash[key].is_a?(Array)
          hash_result[current_key] = raw_hash[key].join(',')
        else
          hash_result[current_key] = raw_hash[key]
        end
      end
    end
    return hash_result
  end

  def read_json(json_path)
    serialized_json = JSON.parse(File.read(json_path))
    return serialized_json
  end

  private :read_json, :flatten_hash, :flatten_json
end
