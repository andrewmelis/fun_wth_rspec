module Palindrome
  class Checker
    def normalize(candidate)
      candidate.downcase.gsub(/[^a-z]/, '')
    end

    def is_palindrome?(candidate)
      candidate = normalize(candidate)

      #candidate do |front,back|
      front = 0
      back = candidate.size-1
      while front < back do
	if candidate[front] != candidate[back]
	  return false
	end
	front+=1
	back-=1
      end
      true
    end
  end


end
