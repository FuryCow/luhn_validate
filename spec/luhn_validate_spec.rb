require 'spec_helper'

describe 'Luhn' do
  it 'should raise PanLengthError' do
    expect { Luhn.validate('434') }.to raise_error(Luhn::PanLengthError, 'Wrong pan length')
  end

  it 'should raise CardNotPresentError' do
    expect { Luhn.validate(nil) }.to raise_error(Luhn::CardNotPresentError, 'Card not present')
  end

  it 'should raise PanTypeError' do
    expect { Luhn.validate(4111111111111111.to_f) }.to raise_error(Luhn::PanTypeError, 'Wrong pan type, pan must be either String or Integer')
  end

  it 'should return valid=true for card presented as Integer' do
    expect(Luhn.validate(4111111111111111).valid).to eq(true)
  end

  it 'should return valid=true for card presented as String' do
    expect(Luhn.validate('4111111111111111').valid).to eq(true)
  end

  it 'should return valid=false for wrong card presented as String' do
    expect(Luhn.validate('4111111111111112').valid).to eq(false)
  end

  it 'should return valid=false for wrong card presented as Integer' do
    expect(Luhn.validate(4111111111111112).valid).to eq(false)
  end

  it 'should return valid pan size' do
    expect(Luhn.validate(4111111111111111).card_size).to eq(16)
  end
end