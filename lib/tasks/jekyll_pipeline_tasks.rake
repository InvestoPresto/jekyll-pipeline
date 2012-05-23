namespace :jekyll_pipeline do
  desc "Precompile jekyll site to public assets directory"
  task :precompile do
    puts "testing enhancements"
  end
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["jekyll_pipeline:precompile"].invoke
end
