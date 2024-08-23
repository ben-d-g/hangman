require 'open-uri'

file = File.open("data/google-10000-english-no-swears.txt")

DICTIONARY = file.readlines