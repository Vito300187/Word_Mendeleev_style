# frozen_string_literal: true

require 'pry'
require 'json'

# Documentation about Words and Application class
class WordsApplication
  def initialize(word)
    @word_for_elements = word.chomp.downcase
    @mendeleev_elements = JSON.parse(File.read('PeriodicTableJSON.json'))['elements']
  end

  def name_mendeleev_elements
    @mendeleev_elements.map { |element| element['name'] }
  end

  def symbol_mendeleev_elements
    @mendeleev_elements.map { |element| element['symbol'] }
  end

  def output(type, word_symbols)
    type.eql?('none') ? word_symbols : word_symbols.join('')
  end

  def compare_element(mendeleev_elements, compare_el, type = 'symbol', twice_nil = nil)
    compare = mendeleev_elements.detect { |element| element['symbol'].downcase.eql?(compare_el) }
    if compare.nil? && twice_nil.eql?(nil)
      nil
    elsif twice_nil.eql?('X')
      mendeleev_elements.detect { |x_el| x_el['symbol'].eql?('X') }[type]
    elsif type.eql?('none')
      compare
    else
      compare[type]
    end
  end

  def find_elements(word_symbols = [], type = ENV['TYPE'].downcase)
    until @word_for_elements.empty?
      element_word = @word_for_elements.slice!(0, 2)
      if compare_element(@mendeleev_elements, element_word).nil?
        element_word.split('').each do |el|
          if compare_element(@mendeleev_elements, el, type).nil?
            word_symbols << compare_element(@mendeleev_elements, el, type, 'X')
          else
            word_symbols << compare_element(@mendeleev_elements, el, type)
          end
        end
      else
        word_symbols << compare_element(@mendeleev_elements, element_word, type)
      end
    end
    output(type, word_symbols)
  end

  app = WordsApplication.new(ENV['WORD'])
  puts app.find_elements
end

#Todo Добавить вариант, при котором сравнение по элементам будет проходить атомарно, есть хотя бы один элемент nil,
# то нужно перестраивать таблицу, до момента, пока все буквы не смогут выстроиться в ряд и пустых значений элементов,
# не будет nil, но! => может получиться, что ни найденный элемент, ни соседние элементы,
# не будут представлены в таблице Менделеева,
# в данном случае, заменяем элемент на hash {"name": "Not yet open element", "symbol": "X"}
#