puts "Deleting old tags..."

Dir.glob("articles/tags/*.md").each do |file|
  File.delete(file)
end

files = Dir.glob("_posts/*.md")

tags = []

files.each do |file|
  File.open(file, "r") do |f|
    f.each_line do |line|
      tags << line if line =~ /^tags:/
    end
  end
end

tags = tags
       .map { |tag| tag.gsub("tags:", "").strip }
       .join(" ")
       .split
       .map(&:strip)
       .uniq.sort

tags.each do |tag|
  puts "Creating articles/tags/#{tag}.md"
  File.write("articles/tags/#{tag}.md", "---\n---")
end
