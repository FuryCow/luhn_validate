# frozen_string_literal: true

# Validates card pan by Luhn algorithm
class Luhn
  class CardNotPresentError < StandardError; end
  class PanLengthError < StandardError; end
  class PanTypeError < StandardError; end

  attr_reader :pan_array, :card_size, :valid

  def initialize(pan)
    @pan_array = pan.split('').map(&:to_i)
    @card_size = @pan_array.size
    @valid = valid?(calculate_luhn_score)
  end

  def self.validate(pan)
    raise CardNotPresentError, 'Card not present' unless pan
    raise PanTypeError, 'Wrong pan type, pan must be either String or Integer' unless pan.is_a?(String) || pan.is_a?(Integer)
    raise PanLengthError, 'Wrong pan length' unless (14..19).include? pan.to_s.split('').size

    new(pan.to_s)
  end

  private

  def calculate_luhn_score
    prepared_array = []
    @pan_array.map.with_index do |pan_part, part_index|
      prepared_array << calculate_pan_part(pan_part, part_index)
    end

    prepared_array
  end

  def pan_part_index_callback
    (@pan_array.length - 1).odd? ? :odd? : :even?
  end

  def calculate_pan_part(pan_part, pan_part_index)
    p_part = (pan_part_index + 1).send(pan_part_index_callback) ? (pan_part * 2) : pan_part
    reveal_part_number(p_part)
  end

  def reveal_part_number(pan_part)
    pan_part > 9 ? (pan_part - 9) : pan_part
  end

  def valid?(pan_array)
    (pan_array.sum % 10).zero?
  end
end
