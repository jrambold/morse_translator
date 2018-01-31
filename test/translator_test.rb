require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class Test_Translator < Minitest::Test
  def setup
    @translator = Translator.new()
  end

  def test_translator_exists
    assert_instance_of Translator, @translator
  end

  def test_eng_to_morse
    assert_equal @translator.eng_to_morse("hello world"), "......-...-..--- .-----.-..-..-.."
  end

  def test_case_independence
    assert_equal @translator.eng_to_morse("Hello World"), "......-...-..--- .-----.-..-..-.."
    assert_equal @translator.eng_to_morse("There are 3 ships"), "-......-.. .-.-.. ...-- ..........--...."
  end

  def test_from_file
    assert_equal @translator.from_file("./test/input.txt"), ".. .--- ..-. .- ..-....-..."
  end

  def test_morse_to_eng
    assert_equal @translator.morse_to_eng(".... . .-.. .-.. ---  .-- --- .-. .-.. -.."), "hello world"
  end
end
