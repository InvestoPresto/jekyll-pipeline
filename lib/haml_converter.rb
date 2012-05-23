# _plugins/haml_converter.rb
#
module Jekyll
  class HamlConverter < MarkdownConverter
    safe true

    def matches(ext)
      ext =~ /haml/i
    end 

    def output_ext(ext)
      ".html.haml"
    end
  end
end
