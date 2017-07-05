#require 'tropo-webapi-ruby'
require '/Users/xiangjyu/git/tropo-webapi-ruby/lib/tropo-webapi-ruby/tropo-webapi-ruby.rb'
require 'sinatra'

post '/index.json' do
  t = Tropo::Generator.new
  t.start_recording(:asyncUpload => true,
    :format => 'audio/wav',
    :method => 'POST',
    :url => "http://example.com/getrecord.php",
    :username => "gousheng",
    :password => "goudan",
    :transcriptionOutURI => "http://example.com/getrecord.php",
    :transcriptionEmailFormat => "encoded",
    :transcriptionID => "xianggang")
  # [From this point, until stop_recording(), we will record what the caller *and* the IVR say]
  t.sa505y [:value => "I am now recording!"]
  # Prompt the user to incriminate themselve on-the-record
  t.stop_recording
  t.response
end