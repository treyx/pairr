class Seeds
  def self.create
    generate_languages
    generate_users
  end

  def self.generate_languages
    languages = %w[JavaScript Java Ruby C PHP Python
      Go Perl Scala Haskell Erlang Rust]
    languages.each do |name|
      Language.create(name: name)
    end
  end

  def self.generate_users
    User.create(name: "ted", image_url: "http://robohash.org/#{rand(4000)}.png")
    User.create(name: "bill", image_url: "http://robohash.org/#{rand(4000)}.png")
    User.create(name: "frank", image_url: "http://robohash.org/#{rand(4000)}.png")
    User.create(name: "tony", image_url: "http://robohash.org/#{rand(4000)}.png")
    User.create(name: "plaster", image_url: "http://robohash.org/#{rand(4000)}.png")
    User.create(name: "gorilla", image_url: "http://robohash.org/#{rand(4000)}.png")
    User.create(name: "ok", image_url: "http://robohash.org/#{rand(4000)}.png")
  end
end

Seeds.create
