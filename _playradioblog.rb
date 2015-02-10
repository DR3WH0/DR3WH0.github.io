require 'yaml'
require 'open-uri'
require 'xmlsimple'
require 'nokogiri'
require 'erb'
require 'googl'
require 'colorize'

include ERB::Util

def shorten(url, blog, name) # create short urls with goo.gl
	begin
		shorturl = Googl.shorten(url).short_url
	rescue Exception
		puts "ERROR >> create goo.gl URL for #{name}".red
		"#{blog}"
	end
end

def format_hash(tagdata)
	hashtag = ""
	hashtag = tagdata['name'][0].gsub(/([- ])/, '').downcase.gsub("\:", '')
end

def get_tags(tags_url, tweetlen) # get up to three tags
	begin
		hashtags = ""
		open(tags_url, :read_timeout=>5) do |body|
			data = XmlSimple.xml_in body.read

			toptags = data['toptags'][0]
			if toptags['tag'].nil? # some tracks have no tags
				hashtags = "#lastfm #music"
			else
				tagone = toptags['tag'][0]
				tagtwo = toptags['tag'][1]
				tagtre = toptags['tag'][2]
				onehash = format_hash(tagone)
				tweetlen = tweetlen + html_escape(onehash).length + 2
				if tweetlen > 140
					puts "ERROR >> tweet too long (#{tweetlen}): ##{onehash} deleted (T1)".red
					hashtags = "#lastfm #music"
				else
					if tagtwo.nil?
						hashtags = "#lastfm #music ##{onehash}"
					else
						twohash = format_hash(tagtwo)
						tweetlen = tweetlen + html_escape(twohash).length + 2
						if tweetlen > 140
							puts "ERROR >> tweet too long (#{tweetlen}): ##{twohash} deleted (T2)".red
							hashtags = "#lastfm #music ##{onehash}"
						else
							if tagtre.nil?
								hashtags = "#lastfm #music ##{onehash} ##{twohash}" # T3 nil
							else
								trehash = format_hash(tagtre)
								tweetlen = tweetlen + html_escape(trehash).length + 2
								if tweetlen > 140
									puts "ERROR >> tweet too long (#{tweetlen}): ##{trehash} deleted (T3)".red
									hashtags = "#lastfm #music ##{onehash} ##{twohash}"
								else
									hashtags = "#lastfm #music ##{onehash} ##{twohash} ##{trehash}"
								end
							end
						end
					end
				end
			end
		end

		hashtags

	rescue OpenURI::HTTPError # 400 Bad Request
		puts "ERROR >> track tags (400)".red
		"#lastfm #music"
	rescue Timeout::Error # connection timed out
		puts "ERROR >> track tags (timeout)".red
		"#lastfm #music"
	end
end

def get_album(info_url)
	begin
		open(info_url, :read_timeout=>5) do |body|
			data = XmlSimple.xml_in body.read

			track = data['track'][0]
			if track['album'].nil?
				"![DR3WH0 Logo](https://dl.dropboxusercontent.com/u/8239797/DR3WH0.png \"DR3WH0 RadioBlog\")"
			else
				album = track['album'][0]
				title = album['title'][0]
				url = album['url'][0].gsub('(', '\(').gsub(')', '\)')
				image = album['image'][2]['content']
				"[![Album Cover](#{image})](#{url} \"#{title}\")"
			end
		end

	rescue OpenURI::HTTPError # 400 Bad Request
		puts "ERROR >> get image (400)".red
		"![DR3WH0 Logo](https://dl.dropboxusercontent.com/u/8239797/DR3WH0.png \"DR3WH0 RadioBlog\")"
	rescue Timeout::Error # connection timed out
		puts "ERROR >> get image (timeout)".red
		"![DR3WH0 Logo](https://dl.dropboxusercontent.com/u/8239797/DR3WH0.png \"DR3WH0 RadioBlog\")"
	end
end

def manage_radio(station, q) # tweet tracks
	blog = "http://goo.gl/tQtGNR"
	infotags = "#lastfm #playmusic #ruby #twurl"
	tweet = "/1.1/statuses/update.json"
	config = YAML::load(File.open('_config.yml'))
	lfm_user = config['lastfm']['username']
	lfm_key = config['lastfm']['api']
	lfm_url = "http://ws.audioscrobbler.com/2.0/?method="
	recent_url = "#{lfm_url}user.getrecenttracks&user=#{lfm_user}&api_key=#{lfm_key}&limit=1"
	tcolen = 22 # t.co short_url_length https://dev.twitter.com/docs/api/1.1/get/help/configuration
	@names = []
	num = 0
	run = 0

	puts "\nEnter \'quit\' at any time ..."
	radiobegin = %x[twurl -d "status=BEGIN #{station} Radio on DR3WH0.NET #{infotags}" "#{tweet}"]

	time = Time.new
	t = time.strftime("%Y-%m-%d")
	dt = time.strftime("%A, %B %e, %Y")
	mdt = time.strftime("/%Y/%m/%d/")
	filestation = station.gsub(' ', '-')

	if File.file?("./_posts/#{t}-#{filestation}-radio.md")
		post = "\n\n**#{dt}**\n\n"
	else
		post = "---\nlayout: post\npublished: true\ncategory: radio\n---\n\n**#{dt}**\n\n"
	end
	File.open("./_posts/#{t}-#{filestation}-radio.md", 'a') { |file| file.write(post) }

	loop do
		sleep(60) # poll lfm api every 60 seconds
		break if q[:user_quit]

		begin # get most recent track
			open(recent_url, :read_timeout=>5) do |body|
				data = XmlSimple.xml_in body.read

				unless data.nil?
					run += 1
					recenttracks = data['recenttracks'][0]
					if recenttracks['track'][1].nil?
						track = recenttracks['track'][0]
					else  # ignore 'listening now' tracks
						track = recenttracks['track'][1]
					end


					@artist = track['artist'][0]['content']
					@apiartist = @artist.dup
					@artist.gsub!("&", "a.")
					@artist.gsub!("\"", "\'")

					@name = track['name'][0]
					@apiname = @name.dup
					@name.gsub!("&", "a.")
					@name.gsub!("\"", "\'")

					if run == 1
						@prev_name = @name.dup
						next
					end

					next if @prev_name == @name

					url = track['url'][0]
					loop do
						@shorturl = shorten(url, blog, @name)
						@shorturl == blog ? next : break
					end
					@prev_name = @name.dup
				end
			end

		rescue OpenURI::HTTPError # 400 Bad Request
			puts "ERROR >> recent tracks (400)".red
			next
		rescue Timeout::Error # connection timed out
			puts "ERROR >> recent tracks (timeout)".red
			next
		rescue
			puts "ERROR >> recent tracks (unknown)".red
			next
		end

		unless @names.include? @name # tweet new track
			urlartist = url_encode("#{@apiartist}")
			urltrack = url_encode("#{@apiname}")
			tags_url = "#{lfm_url}track.gettoptags&api_key=#{lfm_key}&artist=#{urlartist}&track=#{urltrack}"
			info_url = "#{lfm_url}track.getInfo&api_key=#{lfm_key}&artist=#{urlartist}&track=#{urltrack}"

			sleep(2) # give the lfm api a break
			tweetbase = html_escape("00:00:00  #{@name} by #{@artist}  #lastfm #music")
			tweetlen = tweetbase.length + tcolen
			@hashtags = get_tags(tags_url, tweetlen)

			time = Time.new
			displaytime = time.strftime("%H:%M:%S")
			displaytext = "#{displaytime}  #{@name} by #{@artist}"

			text = html_escape("#{displaytime}  #{@name.gsub("\'", "")} by #{@artist.gsub("\'", "")} #{@shorturl} #{@hashtags}")
			text_check = html_escape("#{displaytime}  #{@name} by #{@artist}  #{@hashtags}")
			textlen = text_check.length + tcolen
			@names.push(@name) # add track to session array

			if textlen > 140 # double check tweet length
				if @hashtags.length > 14
					puts "ERROR >> tweet too long (#{textlen}): track tags deleted".red
					text = html_escape("#{displaytime}  #{@name} by #{@artist} #{@shorturl} #lastfm #music")
					text_check = html_escape("#{displaytime}  #{@name} by #{@artist}  #lastfm #music")
					textlen = text_check.length + tcolen
					if textlen > 140
						puts "ERROR >> tweet still too long (#{textlen}): #music tag deleted".red
						text = html_escape("#{displaytime}  #{@name} by #{@artist} #{@shorturl} #lastfm")
						text_check = html_escape("#{displaytime}  #{@name} by #{@artist}  #lastfm")
						textlen = text_check.length + tcolen
						if textlen > 140
							puts "ERROR >> tweet still too long (#{textlen}): #lastfm tag deleted".red
							text = html_escape("#{displaytime}  #{@name} by #{@artist} #{@shorturl}")
							text_check = html_escape("#{displaytime}  #{@name} by #{@artist} ")
							textlen = text_check.length + tcolen
							if textlen > 140
								puts "ERROR >> track name is huge: url deleted".red
								text = html_escape("#{displaytime}  #{@name} by #{@artist} #lastfm")
							end
						end
					end
				else
					puts "ERROR >> tweet too long (#{textlen}): #music tag deleted".red
					text = html_escape("#{displaytime}  #{@name} by #{@artist} #{@shorturl} #lastfm")
					text_check = html_escape("#{displaytime}  #{@name} by #{@artist}  #lastfm")
					textlen = text_check.length + tcolen
					if textlen > 140
						puts "ERROR >> tweet still too long (#{textlen}): #lastfm tag deleted".red
						text = html_escape("#{displaytime}  #{@name} by #{@artist} #{@shorturl}")
						text_check = html_escape("#{displaytime}  #{@name} by #{@artist} ")
						textlen = text_check.length + tcolen
						if textlen > 140
							puts "ERROR >> track name is huge: url deleted".red
							text = html_escape("#{displaytime}  #{@name} by #{@artist} #lastfm")
						end
					end
				end
			end

			# tweet and write to jekyll post
			# ignore first stale track pulled from api
			if @names.size > 1
				text.gsub!("\'", "\\\'")
				tracktweet = %x[twurl -d "status=#{text}" "#{tweet}"]
				puts "#{displaytext} (#{textlen})"
				num += 1

				urlartist = @artist.gsub(' ', '+')
				artisturl = "http://www.last.fm/music/#{urlartist}"

				album = get_album(info_url)
				post = "*   #{displaytime}  [#{@name}](#{@shorturl}) by [#{@artist}](#{artisturl})\n\n    #{album}\n\n"
				File.open("./_posts/#{t}-#{filestation}-radio.md", 'a') { |file| file.write(post) }
				sleep(120) # pause for 2 minutes
			end
		end
	end

	num == 1 ? t = "track" : t = "tracks"
	radiodate = time.strftime("%Y/%m/%d")
	radioend = %x[twurl -d "status=#{station} radio (#{num} #{t}) DR3WH0.NET/#{radiodate}/#{filestation}-radio" "#{tweet}"]
	puts "\nEND \'#{station}\' Radio (#{num} #{t}) >> Goodbye!"
	exit
end

print "\nEnter station name: "
station = gets.chomp

# end radio station on 'quit'
q = Thread.new do
	until gets.chomp == 'quit' ; end
	Thread.current[:user_quit] = true
end

manage_radio(station, q)
