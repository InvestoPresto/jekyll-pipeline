require 'jekyll'

namespace :jekyll_pipeline do
  desc "Precompile jekyll site to public assets directory"
  task :precompile do
    options = {}
    options['source']      = File.join(JekyllPipeline::Engine.root, 'app', 'content')
    options['destination'] = File.join(Rails.root, 'public')
    options = Jekyll.configuration(options)

    content = Jekyll::Site.new(options)
    puts "Building content: #{options['source']} -> #{options['destination']}"
    begin
      content.process
    rescue Jekyll::FatalException => e
      puts
      puts "ERROR: YOUR CONTENT COULD NOT BE BUILT:"
      puts "------------------------------------"
      puts e.message
      exit(1)
    end
    puts "Successfully generated content: #{options['source']} -> #{options['destination']}"
  end
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["jekyll_pipeline:precompile"].invoke
end
