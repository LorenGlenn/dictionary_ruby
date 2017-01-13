require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/') do
  newWord = params.fetch('word')
  Word.new({:word => newWord}).save()
  @words = Word.all()
  erb(:index)
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  @definitions = @word.definitions()
  erb(:word)
end

post('/word/:id') do
  newDefinition = params.fetch('definition')
  addedDefinition = Definition.new({:definition => newDefinition}).save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(addedDefinition)
  @definitons = @word.definitions()
  erb(:word)
end
