require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#word') do
  it("returns the word") do
    test_word = Word.new({:word => "test"})
    expect(test_word.word()).to(eq("test"))
  end
end

describe('#id') do
  it("returns the id of the word") do
    test_word = Word.new({:word => "test"})
    expect(test_word.id()).to(eq(1))
  end
end

  describe('#definitions') do
    it("returns an empty array of definitions for the word") do
      test_word = Word.new({:word => "test"})
      expect(test_word.definitions()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a new word to the array of words") do
      test_word = Word.new({:word => "test"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".all") do
    it("doesn't have anything yet") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("clears the array of words") do
      Word.new({:word => "test"}).save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("finds word by id") do
      test_word = Word.new({:word => "test"})
      test_word.save()
      test_word2 = Word.new({:word => "test2"})
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe('#add_definition') do
    it("adds a new definition to a word") do
      test_word = Word.new({:word => "test"})
      test_definition = Definition.new({:definition => "practice"})
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end
end
