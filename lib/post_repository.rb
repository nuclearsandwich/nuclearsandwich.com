class PostRepository
  def initialize directory
    @directory = case directory
                 when String
                   Dir.new directory
                 else
                   directory
                 end
    process
  end

  def process
    @posts = @directory.map do |post_file|
      next unless post_file =~ /\.(md|markdown)$/
      pathname = File.join @directory.path, post_file
      Post.new pathname
    end.select! { |p| p }
  end

  def each *args, &block
    @posts.each *args, &block
  end
end
