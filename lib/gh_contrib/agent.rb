require 'nokogiri'
require 'mechanize'

module GhContrib
  class Agent
    GITHUB_URL = 'https://github.com'

    def initialize
      @agent = Mechanize.new
    end

    def login(username, password)
      page = @agent.get "#{GITHUB_URL}/login"
      form = page.forms[0]
      form.field_with(name: 'login').value = username
      form.field_with(name: 'password').value = password
      @agent.submit(form)
    end

    def contributions(username)
      page = @agent.get "#{GITHUB_URL}/users/#{username}/contributions"
      doc = Nokogiri::HTML(page.body)
      doc.xpath('//rect').map {|element|
        { date: element["data-date"], count: element["data-count"].to_i }
      }.reverse
    end

    def contributions_by_month(username)
      contributions(username).each_with_object({}) {|row, h|
        key = row[:date][0, 7] # "2014-10-01" => "2014-10"
        h[key] ||= 0
        h[key] += row[:count].to_i
      }.map {|element|
        { date: element[0], count: element[1].to_i }
      }
    end
  end
end
