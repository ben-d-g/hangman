require 'open-uri'

file = File.open("data/google-10000-english-no-swears.txt")

#read file, trim string, filter valid words
DICTIONARY = file.readlines.map{|word| word.chomp}.select{|word| word.length.between?(5,12)}