class Hash
  def deep_symbolize_keys!
    n = {}
    self.each do |k,v|
      if v.is_a?(Hash)
        n[k.to_sym] = v.deep_symbolize_keys!
      else
        n[k.to_sym] = v
      end
    end
    self.clear
    n.each {|k,v| self[k] = v}
    self
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
