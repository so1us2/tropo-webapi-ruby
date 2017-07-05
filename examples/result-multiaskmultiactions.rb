#require 'tropo-webapi-ruby'
require '/Users/xiangjyu/git/tropo-webapi-ruby/lib/tropo-webapi-ruby/tropo-webapi-ruby.rb'
require 'sinatra'

post '/index.json' do

  t = Tropo::Generator.new
  
  onsay = {:value=>"Nice answer!", :voice=>"Victor"}
    
  asksay = {:value=>"Please say 5 digits"}
  choices = {:value=>"[5 DIGITS]"}
  
  asksay2 = {:value=>"What color do you like?"}
  choices2 = {:value=>"red(red,1), blue(blue,2)"}
  
  t.on :event=>"continue",
    :next=>"continue.json"
    
  t.ask :say=>[asksay],
    :sensitivity=>80,
    :name=>"fivenum",
    :choices=>choices
      
  t.ask :say=>[asksay2],
    :sensitivity=>80,
    :name=>"yourcolor",
    :choices=>choices2
      
  
  headers \
      "WebAPI-Lang-Ver"   => "ruby-frank20170628",
      "rubyversion"   => "ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin16]"
      
  "This is t.response, where is t.response"
  t.response # def response  line 464
    
end


post '/continue.json' do
  
  v = Tropo::Generator.parse request.env["rack.input"].read
  t = Tropo::Generator.new
  #pppppppquts 'v is <<<'
  #pppppppquts v
  #pppppppquts 'v is >>>'
  actions = v[:result][:actions]
  p 'actions  is <<<'
  p actions  
  p 'actions  is >>>'
  
  yourcolorname = Tropo::Generator.getValueByActionNameKey(actions, 'yourcolor', 'name')
  yourcolorattempts = Tropo::Generator.getValueByActionNameKey(actions, 'yourcolor', 'attempts')
  yourcolordisposition = Tropo::Generator.getValueByActionNameKey(actions, 'yourcolor', 'disposition')
  yourcolorconfidence = Tropo::Generator.getValueByActionNameKey(actions, 'yourcolor', 'confidence')
  yourcolorinterpretation = Tropo::Generator.getValueByActionNameKey(actions, 'yourcolor', 'interpretation')
  yourcolorutterance = Tropo::Generator.getValueByActionNameKey(actions, 'yourcolor', 'utterance')
  yourcolorvalue = Tropo::Generator.getValueByActionNameKey(actions, 'yourcolor', 'value')
  yourcolorconcept = Tropo::Generator.getValueByActionNameKey(actions, 'yourcolor', 'concept')
  yourcolorxml = Tropo::Generator.getValueByActionNameKey(actions, 'yourcolor', 'xml')
  yourcoloruploadStatus = Tropo::Generator.getValueByActionNameKey(actions, 'yourcolor', 'uploadStatus')
  
  
  yournumname = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'name')
  yournumattempts = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'attempts')
  yournumdisposition = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'disposition')
  yournumconfidence = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'confidence')
  yournuminterpretation = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'interpretation')
  yournumutterance = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'utterance')
  yournumvalue = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'value')
  yournumconcept = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'concept')
  yournumxml = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'xml')
  yournumuploadStatus = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'uploadStatus')
  
  #yourcolor = v[:result][:actions][:yourcolor]
  t.sa505y(:value => "color is   #{yourcolorname}")
  t.sa505y(:value => "color is   #{yourcolorattempts}")
  t.sa505y(:value => "color is   #{yourcolordisposition}")
  t.sa505y(:value => "color is   #{yourcolorconfidence}")
  t.sa505y(:value => "color is   #{yourcolorinterpretation}")
  t.sa505y(:value => "color is   #{yourcolorutterance}")
  t.sa505y(:value => "color is   #{yourcolorvalue}")
  t.sa505y(:value => "color is   #{yourcolorconcept}")
  t.sa505y(:value => "color is   #{yourcolorxml}")
  t.sa505y(:value => "color is   #{yourcoloruploadStatus}")
  
  t.sa505y(:value => "account  #{yournumname}")
  t.sa505y(:value => "account  #{yournumattempts}")
  t.sa505y(:value => "account  #{yournumdisposition}")
  t.sa505y(:value => "account  #{yournumconfidence}")
  t.sa505y(:value => "account  #{yournuminterpretation}")
  t.sa505y(:value => "account  #{yournumutterance}")
  t.sa505y(:value => "account  #{yournumvalue}")
  t.sa505y(:value => "account  #{yournumconcept}")
  t.sa505y(:value => "account  #{yournumxml}")
  t.sa505y(:value => "account  #{yournumuploadStatus}")
  
  #yournum = v[:result][:actions][:fivenum]
  #yournum = Tropo::Generator.getValueByActionNameKey(actions, 'fivenum', 'value')
  ##pppppppquts yournum
  #t.sa505y(:value => "You  said  #{yournum}")
  
  t.response
  
end