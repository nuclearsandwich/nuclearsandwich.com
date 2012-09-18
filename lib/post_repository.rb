class PostRepository
  def initialize directory, skip_drafts = false
    @skip_drafts = skip_drafts
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
    end

    @posts.select! { |p| p }
    if @skip_drafts
      @posts.select! { |p| p.published? }
    end
    @posts.reverse!
  end

  def each *args, &block
    @posts.each *args, &block
  end

  def index_content
    builder = ""
    years = @posts.map { |p| p.date.year }.uniq
    years.each do |year|
      builder << %Q(<section class="year" id="#{year}">\n  <h1>#{year}</h1>)
      @posts.select{|p| p.date.year == year }.each do |post|
        builder << <<HTML
  <div class="article-link">
    <h1><a href="/blog/#{post.html_filename}">#{post.title}</a></h1>
    <h2>Published: #{post.date.strftime "%B %Y"}</h2>
  </div>
HTML
      end
      builder << "</section>"
    end
    builder
  end
end
