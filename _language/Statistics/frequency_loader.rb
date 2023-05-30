require "naive_bayes"

# Get the date.
system("date > _date/date.txt")

# Immutables
date             = File.read("_date/date.txt").strip
date_title       = date.tr " ", "_"

a = NaiveBayes.load('_data/language_stats/fraponic.nb') 

## Sections for testing individual characters.
b = File.readlines("_input/alphabet_set.txt")

interval = 0

total_size = b.size.to_i

open("_posts/input.md", "w") { |f|
  f.puts "## #{date_title}"

  total_size.times do
    read_line = b[interval].to_s.split(" ")

    result = a.classify(read_line)

    langstat = :langstat, "#{result[0]} #{result[1]}"

    puts "[#{langstat[0]}, #{langstat[1]}]."

    f.puts "[#{langstat[0]}, #{langstat[1]}]."

    interval = interval + 1
  end
}
