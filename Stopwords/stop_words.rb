class StopWords
  def self.get
    stopwords_filter = Stopwords::Snowball::Filter.new "en"
  end
end
