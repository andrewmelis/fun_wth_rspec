class String
  def self.normalize(candidate)
    candidate.downcase.gsub(/[^a-z]/, '')
  end

  def self.palindrome?(candidate)
    candidate = normalize(candidate)
    candidate == candidate.reverse
  end

  def self.overly_complex_palindrome_check(candidate)
    0.upto(candidate.size/2) { |front, back = (last_index(candidate)-front)| return false if candidate[front] != candidate[back] }
  end

  #avoid magic number...probably overkill
  def self.last_index(candidate)
    candidate.size - 1
  end
end
