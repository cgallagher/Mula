require "uri"
require "net/http"
require 'iconv'

API_BASE = "http://www.google.com/ig/calculator"

module Mula
  module Helpers    
    def convert(amount=1, current_currency='USD', target_currency='GBP')
      uri = URI.parse("#{API_BASE}?hl=en&q=#{amount}#{current_currency}=?#{target_currency}")
      http = Net::HTTP.new(uri.host, uri.port)
      response = http.request(Net::HTTP::Get.new(uri.request_uri))
      # fix the mess than Google have made of the JSON
      fixed_json_str = response.body.gsub!(/(['"])?([a-zA-Z0-9_]+)(['"])?:/, '"\2":')
      ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
      valid_string = ic.iconv(fixed_json_str + ' ')[0..-2]
      parsed_response = ActiveSupport::JSON.decode(valid_string)
      return parsed_response["rhs"].split(" ")[0]
    end
    
  end
end