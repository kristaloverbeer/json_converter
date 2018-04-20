# Json Converter
A simple program that allows the user to convert a nested JSON to a CSV file, maintaining the keys integrity.

## Usage
```bash
./convert-json.rb
```

You will find yourself entering first the input JSON file path, then the CSV output file path (no need to create it, 
it will be created if it does not exist)

Then, the program will convert the JSON file and you will have a new CSV file ready to use.

## Tests
To test the program, you have to go in the same directory as the tests module (relative path reading file issue)
```bash
cd tests/unit/converter
ruby test_json_converter.rb
```