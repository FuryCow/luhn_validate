# frozen_string_literal: true

# Validates card pan by Luhn algorithm
class Luhn
  class CardNotPresentError < StandardError; end

  def initialize(card_number)
    @card_number = card_number

    calculate_luhn_score
  end

  def self.validate(card_number)
    raise CardNotPresentError, 'Card not present' unless card_number

    new(card_number)
  end

  private

  def calculate_luhn_score
    @card_number
  end
end
