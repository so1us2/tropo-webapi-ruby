#require 'tropo-webapi-ruby'
require '/Users/xiangjyu/git/tropo-webapi-ruby/lib/tropo-webapi-ruby/tropo-webapi-ruby.rb'
require 'sinatra'

post '/index.json' do

  t = Tropo::Generator.new
  
  t.call :to => ["+14155551212","+15105551212"]
  t.sa505y :value => "Hello, you were the first to answer."
  
  headers \
      "WebAPI-Lang-Ver"   => "ruby-frank20170628",
      "rubyversion"   => "ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin16]"
      
  "This is t.response, where is t.response"
  t.response # def response  line 464
    
end


post '/continue.json' do
  
  v = Tropo::Generator.parse request.env["rack.input"].read
  t = Tropo::Generator.new
  #pppppppquts v
  userType = v[:result][:user_type]
  #pppppppquts userType
  t.say(:value => "You are a  #{userType}")
  
  t.response
  
end