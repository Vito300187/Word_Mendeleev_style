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

  def compare_element(mendeleev_elements, compare_el, type = 'symbol', twice_nil = nil)
    if mendeleev_elements.detect { |element| element[type].downcase.eql?(compare_el) }.nil? && twice_nil.eql?(nil)
      nil
    elsif twice_nil.eql?('X')
      mendeleev_elements.detect { |x_el| x_el['symbol'].eql?('X') }[type]
    else
      mendeleev_elements.detect { |element| element['symbol'].downcase.eql?(compare_el) }[type]
    end
  end

  def find_elements(word_symbols = [], array = false)
    until @word_for_elements.empty?
      element_word = @word_for_elements.slice!(0, 2)
      if compare_element(@mendeleev_elements, element_word).nil?
        element_word.split('').each do |el|
          if compare_element(@mendeleev_elements, el).nil?
            word_symbols << compare_element(@mendeleev_elements, el, 'symbol', 'X')
          else
            word_symbols << compare_element(@mendeleev_elements, el)
          end
        end
      else
        word_symbols << compare_element(@mendeleev_elements, element_word)
      end
    end
    array ? word_symbols : word_symbols.join('')
  end

  app = WordsApplication.new(ENV['WORD'])
  puts app.find_elements
end

# Второй вариант, основан на скрипте, с использованием метода сравнения.
#word_for_elements = ENV['WORD'].downcase.chomp
#mendeleev_elements = JSON.parse(File.read('PeriodicTableJSON.json'))['elements']

#def compare_element(mendeleev_elements, el, twice_nil=nil)
#  if mendeleev_elements.detect { |element| element['symbol'].downcase.eql?(el) }.nil? && twice_nil.eql?(nil)
#    nil
#  elsif twice_nil.eql?('X')
#    mendeleev_elements.detect { |x_el| x_el['symbol'].eql?('X') }['symbol']
#  else
#    mendeleev_elements.detect { |element| element['symbol'].downcase.eql?(el) }['symbol']
#  end
#end

#word_symbols = []
#until word_for_elements.empty?
#  element_word = word_for_elements.slice!(0,2)
#
#  if compare_element(mendeleev_elements, element_word).nil?
#    element_word.split('').each do |el|
#      if compare_element(mendeleev_elements, el).nil?
#        word_symbols << compare_element(mendeleev_elements, el, 'X' )
#      else
#        word_symbols << compare_element(mendeleev_elements, el)
#      end
#    end
#   else
#    word_symbols << compare_element(mendeleev_elements, element_word)
#  end
#end

#puts word_symbols.join('')

#Todo Добавить вариант, при котором сравнение по элементам будет проходить атомарно, есть хотя бы один элемент nil,
# то нужно перестраивать таблицу, до момента, пока все буквы не смогут выстроиться в ряд и пустых значений элементов,
# не будет nil, но! => может получиться, что ни найденный элемент, ни соседние элементы,
# не будут представлены в таблице Менделеева,
# в данном случае, заменяем элемент на hash {"name": "Not yet open element", "symbol": "X"}
#