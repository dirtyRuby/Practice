class A
  def manipulate(hash)
      hash.each{ |k,v|
        if v.class == Hash
          manipulate(v)
        else
          hash.delete(k) if  v%2 == 0
        end
      }
  end
end

a  = {:a=>1,:b=>{:d=>1,:e=>2},:c=>3}
A.new.manipulate(a)

puts a
