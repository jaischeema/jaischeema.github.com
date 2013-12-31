Time.zone = "Melbourne"

activate :blog do |blog|
  blog.sources = "posts/:year-:month-:day-:title.html"
end

page "/feed.xml", layout: false

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript
end

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :directory_indexes

helpers do
  def article_tags(article)
    options = {:two_words_connector => ", ", :last_word_connector => ", "}
    tags = article.tags.map { |tag| "<a href='/'>#{tag}</a>" }.to_sentence(options)
    " - #{tags}" if tags.present?
  end
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
  deploy.branch = "master"
end
