module EachVowel
  def each_vowel(&proc)
    vowels = ['a','o','u','i','e'].to_enum
    vowels.each{proc.call(vowels.next)}
  end
end
#Test
include EachVowel

each_vowel{ |x| puts x+x}