require 'rspec'
require 'spec_helper'
require 'deep_symbolize_keys'

describe Hash do

  it 'Should return object of Hash' do
    hash = {'fred' => {
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
    hash.deep_symbolize_keys!.class.should == Hash
  end

  it 'Should return same object that call deep_symbolize_keys method' do
    hash = {'fred' => {
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
    id = hash.object_id
    hash.deep_symbolize_keys!.object_id.should == id
  end

  it 'Should turn all keys of String type into Symbols at all levels of Hash nesting' do
    hash = {'fred' => {
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

    def deep_test_func (hash)
      hash.each{ |k,v|
        k.class.should == Symbol
        if v.class == Hash
          deep_test_func(v)
        end
      }
    end
    deep_test_func(hash.deep_symbolize_keys!)
  end
end
