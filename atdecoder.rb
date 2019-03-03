require 'nokogiri'

html = File.read(ARGV[0])
doc = Nokogiri::HTML.parse(html)
pres = doc.css("span.lang-ja").css("pre")[1..-1]

pres.each_slice(2).with_index(1) do |pre, i|
  input = pre[0]
  output = pre[1]
  File.open("#{i}_input.txt", "w") do |f|
    f.puts input.text
  end
  File.open("#{i}_output.txt", "w") do |f|
    f.puts output.text
  end
end
