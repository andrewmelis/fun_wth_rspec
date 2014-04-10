module Palindrome
  class Checker
    def self.normalize(candidate)
      candidate.downcase.gsub(/[^a-z]/, '')
    end

    def self.is_palindrome?(candidate)
      candidate = normalize(candidate)
      0.upto(candidate.size/2) { |front, back = (last_index(candidate)-front)| return false if candidate[front] != candidate[back] }
    end

    #avoid magic number...probably overkill
    def self.last_index(candidate)
      candidate.size - 1
    end
  end

end
