class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = {"a" => ".-",
                    "b" => "-...",
                    "c" => "-.-.",
                    "d" => "-..",
                    "e" => ".",
                    "f" => "..-.",
                    "g" => "--.",
                    "h" => "....",
                    "i" => "..",
                    "j" => ".---",
                    "k" => "-.-",
                    "l" => ".-..",
                    "m" => "--",
                    "n" => "-.",
                    "o" => "---",
                    "p" => ".--.",
                    "q" => "--.-",
                    "r" => ".-.",
                    "s" => "...",
                    "t" => "-",
                    "u" => "..-",
                    "v" => "...-",
                    "w" => ".--",
                    "x" => "-..-",
                    "y" => "-.--",
                    "z" => "--..",
                    "1" => ".----",
                    "2" => "..---",
                    "3" => "...--",
                    "4" => "....-",
                    "5" => ".....",
                    "6" => "-....",
                    "7" => "--...",
                    "8" => "---..",
                    "9" => "----.",
                    "0" => "-----",
                    " " => " "}
  end

  def eng_to_morse(phrase)
    morse = ""
    phrase.each_char do |phrase|
      morse += @dictionary[phrase.downcase]
    end
    morse
  end

  def from_file(filename)
    phrase = ""
    phrase_file = IO.readlines(filename)
    phrase_file.each do |phrase_file|
      phrase += phrase_file.chomp.downcase
    end
    eng_to_morse(phrase)
  end

  def morse_to_eng(phrase)
    eng = ""
    phrase = phrase.split("  ")
    phrase.each do |phrase|
      word = phrase.split(" ")
      word.each do |word|
        eng += @dictionary.key(word)
      end
      eng += " "
    end
    eng.rstrip
  end

end
