namespace :jekyll_pipeline do
  desc "Precompile jekyll site to public assets directory"
  task :precompile do
    puts "Source Path: #{File.join(JekyllPipeline::Engine.root, 'app', 'content')}"
    puts "Destination Path: #{File.join(Rails.root, 'public')}"
  end
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["jekyll_pipeline:precompile"].invoke
end
