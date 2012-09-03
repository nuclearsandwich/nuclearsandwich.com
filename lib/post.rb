require "yaml"
require "github/markdown"

class Post
  attr_reader :filename, :content, :metadata

  def initialize filename
    @filename = filename
    read_file
  end

  def read_file
    content = File.read filename
    if md = content.match(/^(---\s*\n.*?\n?)^(---\s*$\n?)/m)
      @content = md.post_match
      @metadata = YAML.load md[0]
    end
  end

  def html_content
    GitHub::Markdown.render @content
  end

  def html_filename
    "#{File.basename(@filename).split('.').first}.html"
  end
end
