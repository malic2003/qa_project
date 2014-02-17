json.array!(@articles) do |article|
  json.extract! article, :id, :title, :string,, :content, :text
  json.url article_url(article, format: :json)
end
