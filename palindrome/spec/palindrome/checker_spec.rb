require 'spec_helper'

module Palindrome
  describe Checker do
    describe "#normalize" do
      it "sets all letters in candidate to lowercase" do
	expect(Checker.normalize('AA')).to eq('aa')
      end

      it "strips non-alphabet characters" do
	expect(Checker.normalize("\nA. 13 a ")).to eq("aa")
      end
    end

    describe "#is_palindrome?" do
      context "single letter candidate" do
	it "returns true" do
	  expect(Checker.is_palindrome?('a')).to be_true
	end
      end

      context "two letter candidate" do
	it "returns true if two letters are the same" do
	  expect(Checker.is_palindrome?('aa')).to be_true
	end

	it "returns false if two letters are different" do
	  expect(Checker.is_palindrome?('ab')).to be_false
	end
      end

      context "three letter candidate" do
	it "returns true if the outside characters are the same" do
	  expect(Checker.is_palindrome?('aba')).to be_true
	end

	it "returns false if the outside characters are different" do
	  expect(Checker.is_palindrome?('abc')).to be_false
	end
      end

      context "four letter candidate" do
	it "returns true if have 'abba'-type candidate" do
	  expect(Checker.is_palindrome?('bccb')).to be_true
	end

	it "returns false if have outside characters same but inside different" do
	  expect(Checker.is_palindrome?('badb')).to be_false
	end

	it "returns false if have outside characters different but inside same" do
	  expect(Checker.is_palindrome?('baac')).to be_false
	end

	it "returns false if all characters different" do
	  expect(Checker.is_palindrome?('bazc')).to be_false
	end

	it "returns true if all characters same" do
	  expect(Checker.is_palindrome?('bbbb')).to be_true
	end
      end

      context "five letter candidate -- because odd numbers are just a little trickier" do
	it "returns true if have two pairs bookending any character in the middle" do
	  expect(Checker.is_palindrome?('aacaa')).to be_true
	end

	it "returns true with five of the same letter" do
	  expect(Checker.is_palindrome?('aaaaa')).to be_true
	end

	it "returns false with anything else" do
	  expect(Checker.is_palindrome?('aaada')).to be_false
	end
      end

      context "longest palindrome words in dictionary" do
	it "returns true on this rediculous test" do
	  expect(Checker.is_palindrome?('Detartrated')).to be_true
	end
	
	it "returns true on this other rediculous test with a number and whitespace" do
	  expect(Checker.is_palindrome?("ta1ttarra#tt\nat")).to be_true
	end
	
	it "returns false on this other rediculous test with a character added" do
	  expect(Checker.is_palindrome?("ta1ttarra#tt\nata")).to be_false
	end
      end
	
    end
      
  end
end

