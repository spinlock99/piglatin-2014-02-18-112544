$vowels = 'aeiou'

class PigLatin
  attr_accessor :phrase

  def phrase=(string)
    @phrase = string
  end

  alias :initialize :phrase=

  def translate
    return(nil) if @phrase.empty?
    return(@phrase.gsub(/(\w+)/) { |word| translate_word(word) })
  end

  private

  def translate_word(word)
    word += word.slice!(/^[^#$vowels]+/i) || ''
    word.gsub!(/(y)$/i, '\1n')
    word.gsub!(/([#$vowels])$/i, '\1y')
    word.capitalize! if word.downcase!
    return(word + 'ay')
  end
end
