require 'json'
require 'sinatra'

require 'pry-byebug'

require_relative 'password_maker'

before do
  unless @password_maker
    words = File.open(ENV['WORDS_FILE']).each_line.map(&:chomp).to_a
    @password_maker = PasswordMaker.new(words)
  end
end

get '/' do
  words = @password_maker.choose_words

  content_type :json
  headers 'Access-Control-Allow-Origin' => '*'
  words.to_json
end
