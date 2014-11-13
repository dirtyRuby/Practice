require 'rspec'
require 'spec_helper'
require 'deep_symbolize_keys'

describe Hash do
  before :each do
    @hash = {'fred' => {
        'name' => 'Fred Elliott',
        'age' => 63,
        'gender' => 'male',
        'favorite painters' => ['Monet', 'Constable', 'Da Vinci']
      },
      'janet' => {
        'name' => 'Janet S Porter',
        'age' => 55,
        'gender' => 'female'
      }
    }
  end

  it 'Should return object of Hash' do
    expect(@hash.deep_symbolize_keys!.class).to eq(Hash)
  end

  it 'Should return same object that call deep_symbolize_keys method' do
    id = @hash.object_id
    expect(@hash.deep_symbolize_keys!.object_id).to eq(id)
  end

  it 'All hash keys should be symbols' do
    def deep_test_func (hash)
      hash.each do |k,v|
        expect(k.class).to eq(Symbol)
        deep_test_func(v) if v.is_a?(Hash)
      end
    end
    deep_test_func(@hash.deep_symbolize_keys!)
  end
end
