require 'mechanize'
require 'http'

# open the url with mechanies
# get the urls for each speech
# loop over that array of urls and get the speech text

class Speech
  attr_accessor :url, :title, :author

  def fetch_text

    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }

    a.get(url) do |page|
      return page
        .search(".post-body p")
        .map do |paragraph|
          paragraph.text
        end
        .join("\n\n")
    end

  rescue
    "Speech Text Not Found"
  end
end

def speech_links
  a = Mechanize.new { |agent|
    agent.user_agent_alias = 'Mac Safari'
  }

  links = []

  a.get('http://www.artofmanliness.com/2008/08/01/the-35-greatest-speeches-in-history/') do |page|


    links = page.search("h3 strong a").map do |link|
      author = link.parent.text.split(",").first # Winston Churchill, “We Shall Fight on the Beaches”
      speech_text = link.text
      url = link.attributes["href"].value

      speech = Speech.new
      speech.author = author
      speech.url = link.attributes["href"].value
      speech.title = link.text
      speech
    end

  end

  links
end

speech_links.each do |speech|
  # puts [speech.author, speech.title].join(": ")
  # puts speech.fetch_text
  # puts "===================="
  # puts

  speech_hash = {
    speech: {
      title: speech.title,
      author: speech.author,
      content: speech.fetch_text
    }
  }

  response = Http.post("http://localhost:3000/api/speeches.json", json: speech_hash)
  if [200, 201].include? response.status
    puts "Yay"
  else
    puts "Nay! #{response.status}"
    puts response.body.to_s
  end

end

# With the author, title, and text, we can do whatever we want with this data
