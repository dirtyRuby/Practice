module MapVowel
  def map_vowel(&proc)
    vowels = ['a','o','u','i','e'].to_enum
    vowels.map{proc.call(vowels.next)}
  end
end
#Test
include MapVowel

map_vowel{ |x| puts x+'1'}
