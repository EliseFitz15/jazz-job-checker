require "sinatra"
require 'open-uri'
require 'nokogiri'
require 'httparty'

configure :development do
  require 'dotenv'
  Dotenv.load
end

get "/" do
  @jobs = HTTParty.get("https://api.resumatorapi.com/v1/jobs/status/open/private/false?apikey=#{ENV["JAZZ_API_KEY"]}")
  erb :index
end

get "/jobs" do
  @url = "https://develop.raizlabs.xyz/careers/"
  jazz_posted_jobs = HTTParty.get("https://api.resumatorapi.com/v1/jobs/status/open/private/false?apikey=#{ENV["JAZZ_API_KEY"]}")

  doc = Nokogiri::HTML(open(@url)) do |config|
    config.noblanks.nonet
  end
  current_jobs_listed = doc.css(".linked-list li").count

  if jazz_posted_jobs.count != current_jobs_listed
    response = HTTParty.get("https://zxm1bqf9jl.execute-api.us-east-1.amazonaws.com/prod/rzwebsite-trigger-pipeline")
    @message = "...updating website with jobs posted."
  else
    @message = "No new jobs."
  end
  erb :jobs
end
