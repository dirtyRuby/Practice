class Hash
 private
  def perform(hash)
    raise ArgumentError, "Wrong argument type. Hash expected when #{hash.class} given." if hash.class != Hash
    new_hash = {}
    hash.each { |k,v|
        key = k.sub(" ","_")
      if v.class == Hash
        new_hash[key.to_sym] = perform(v)
      else
        new_hash[key.to_sym] = v
      end
    }
    hash.clear
    new_hash.each{ |k,v|
      hash[k] = v
    }
    hash
  end

  public
  def deep_symbolize_keys!
    perform (self)
  end
end
people = {'fred' => {
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
puts people.deep_symbolize_keys!


