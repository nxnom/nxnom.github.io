task :dev do
  sh "bundle exec jekyll serve --watch --livereload --drafts"
end

task :preview do
  sh "bundle exec jekyll serve"
end

task :clean do
  sh "bundle exec jekyll clean"
end

task :build do
  sh "bundle exec jekyll build"
end

task :create_tags do
  sh "ruby create_tags.rb"
end
