require 'spec_helper'

module Palindrome
  describe Checker do
    let(:checker) { Checker.new }

    describe "#normalize" do
      it "returns lowercase version of candidate" do
	expect(checker.normalize('AA')).to eq('aa')
      end

      it "strips non-alphabet characters" do
	expect(checker.normalize("\nA. 13 a ")).to eq("aa")
      end
    end

    describe "#is_palindrome?" do
      context "single letter candidate" do
	it "returns true" do
	  expect(checker.is_palindrome?('a')).to be_true
	end
      end

      context "two letter candidate" do
	it "returns true if two letters are the same" do
	  expect(checker.is_palindrome?('aa')).to be_true
	end

	it "returns false if two letters are different" do
	  expect(checker.is_palindrome?('ab')).to be_false
	end
      end

      context "three letter candidate" do
	it "returns true if the outside characters are the same" do
	  expect(checker.is_palindrome?('aba')).to be_true
	end

	it "returns false if the outside characters are different" do
	  expect(checker.is_palindrome?('abc')).to be_false
	end
      end

      context "four letter candidate" do
	it "returns true if have 'abba'-type candidate" do
	  expect(checker.is_palindrome?('bccb')).to be_true
	end

	it "returns false if have outside characters same but inside different" do
	  expect(checker.is_palindrome?('badb')).to be_false
	end

	it "returns false if have outside characters different but inside same" do
	  expect(checker.is_palindrome?('baac')).to be_false
	end

	it "returns false if all characters different" do
	  expect(checker.is_palindrome?('bazc')).to be_false
	end

	it "returns true if all characters same" do
	  expect(checker.is_palindrome?('bbbb')).to be_true
	end
      end

      context "five letter candidate -- because odd numbers are just a little trickier" do
	it "returns true if have two pairs bookending any character in the middle" do
	  expect(checker.is_palindrome?('aacaa')).to be_true
	end

	it "returns true with five of the same letter" do
	  expect(checker.is_palindrome?('aaaaa')).to be_true
	end

	it "returns false with anything else" do
	  expect(checker.is_palindrome?('aaada')).to be_false
	end
      end
	
    end
      
  end
end

