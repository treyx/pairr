class Seeds
  def self.create
    generate_languages
  end

  def self.generate_languages
    languages = %w[JavaScript Java Ruby C PHP Python
      Go Perl Scala Haskell Erlang Rust]
    languages.each do |name|
      Language.create(name: name)
    end
  end
end

Seeds.create
