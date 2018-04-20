require 'csv'
require 'test/unit'

require_relative '../../../src/converter/json_converter'


class TestJsonConverter < Test::Unit::TestCase

  def test_should_return_csv_from_basic_json
    # Given
    json_path = 'assets/basic/basic.json'
    csv_path = 'assets/basic/basic.csv'
    output_csv_path = 'assets/basic/test.csv'
    # When
    csv_convert = JsonConverter.new.to_csv(json_path, output_csv_path)
    csv_result = CSV.read(output_csv_path)
    # Then
    expected_csv = CSV.read(csv_path)
    assert_equal(expected_csv, csv_result)
  end

  def test_should_return_csv_from_json_with_list_values
    # Given
    json_path = 'assets/array/array.json'
    csv_path = 'assets/array/array.csv'
    output_csv_path = 'assets/array/test.csv'
    # When
    csv_convert = JsonConverter.new.to_csv(json_path, output_csv_path)
    csv_result = CSV.read(output_csv_path)
    # Then
    expected_csv = CSV.read(csv_path)
    assert_equal(expected_csv, csv_result)
  end

  def test_should_return_csv_from_json_with_nested_json_values
    # Given
    json_path = 'assets/nested/nested.json'
    csv_path = 'assets/nested/nested.csv'
    output_csv_path = 'assets/nested/test.csv'
    # When
    csv_convert = JsonConverter.new.to_csv(json_path, output_csv_path)
    csv_result = CSV.read(output_csv_path)
    # Then
    expected_csv = CSV.read(csv_path)
    assert_equal(expected_csv, csv_result)
  end
  
  def test_should_return_csv_from_complete_json_sample
    # Given
    json_path = 'assets/sample/sample.json'
    csv_path = 'assets/sample/sample.csv'
    output_csv_path = 'assets/sample/test.csv'
    # When
    csv_convert = JsonConverter.new.to_csv(json_path, output_csv_path)
    csv_result = CSV.read(output_csv_path)
    # Then
    expected_csv = CSV.read(csv_path)
    assert_equal(expected_csv, csv_result)
  end

end
