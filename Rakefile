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

namespace :new do
  name = ARGV[1..-1].join(" ")

  task :work do
    sh "bundle exec jekyll compose -c works -l work \"#{name}\""
    exit 0
  end

  task :post do
    sh "bundle exec jekyll post \"#{name}\""
    exit 0
  end

  task :draft do
    sh "bundle exec jekyll draft \"#{name}\""
    exit 0
  end
end
