#require 'tropo-webapi-ruby'
require '/Users/xiangjyu/git/tropo-webapi-ruby/lib/tropo-webapi-ruby/tropo-webapi-ruby.rb'
require 'sinatra'

post '/index.json' do
  t = Tropo::Generator.new
  t.start_recording(:name => 'myrecording', :url => "http://example.com/getrecord.php")
  # [From this point, until stop_recording(), we will record what the caller *and* the IVR say]
  t.sa505y [:value => "I am now recording!"]
  # Prompt the user to incriminate themselve on-the-record
  t.stop_recording
  t.response
end