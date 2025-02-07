require 'net/http'
require 'uri'
require 'json'

def log_inf(msg)
  puts "#{Time.now} [INF:] #{msg}"
end

def log_err(msg)
  puts "#{Time.now} [ERR:] #{msg}"
end

def print_usage
  log_inf "Usage: ruby #{__FILE__} [connector-config]"
  log_inf "Example: ruby #{__FILE__} dst-es-emp01"
end

def conf_valid(args)
  if args.length != 1
    puts "No arguments supplied"
    print_usage
    exit 1
  else
    puts "good"
  end
end

def create_connect(schema)
  uri = URI.parse("http://192.168.50.102:8083/connectors")
  header = {'Content-Type': 'application/json'}
  
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri, header)
  request.body = schema.to_json
  
  response = http.request(request)
  
  puts JSON.pretty_generate(JSON.parse(response.body))
end

conf_valid(ARGV)

schema_file = File.join(Dir.pwd, ARGV[0])
schema = JSON.parse(File.read(schema_file))

create_connect(schema)

uri = URI.parse("http://192.168.50.102:8083/connectors")
response = Net::HTTP.get_response(uri)

puts JSON.pretty_generate(JSON.parse(response.body).sort)

