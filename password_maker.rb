class PasswordMaker
  attr_accessor :words

  def initialize(word_list)
    @words = word_list
  end

  # Chooses the words that make up the password.
  #
  # @param size
  # @return [Array<String>] a list of words
  # @yield [words] post-processes the chosen words
  def choose_words(size: 4)
    chosen = words.sample(size)

    block_given? ? (yield chosen) : chosen
  end
end
