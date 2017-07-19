# require modules here
require "yaml"

def load_library(file)
  emoticons = YAML.load_file('lib/emoticons.yml')
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, emoji|
  	new_hash["get_emoticon"][emoji.first] = emoji.last
  	new_hash["get_meaning"][emoji.last] = meaning
  end
  new_hash
end

def get_japanese_emoticon(file, emoticon)
	emoji_hash = load_library(file)
	if emoji_hash["get_emoticon"].has_key?(emoticon)
  	emoji_hash["get_emoticon"][emoticon]
  else
  	return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
	emoji_hash = load_library(file)
	if !emoji_hash["get_meaning"].has_key?(emoticon)
		return "Sorry, that emoticon was not found"
	else
		emoji_hash["get_meaning"][emoticon]
	end
end
