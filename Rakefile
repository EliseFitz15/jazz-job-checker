desc "Check if there are new jobs posted"
task :update_job_list do
  puts "Checking current job listings..."
  jazz_posted_jobs = HTTParty.get("https://api.resumatorapi.com/v1/jobs/status/open/private/false?apikey=#{ENV["JAZZ_API_KEY"]}")

  @url = "https://develop.raizlabs.xyz/careers/"
  doc = Nokogiri::HTML(open(@url)) do |config|
    config.noblanks.nonet
  end
  current_jobs_listed = doc.css(".linked-list li").count

  puts "Comparing to what is live on our site"
  if jazz_posted_jobs.count != current_jobs_listed
    HTTParty.get("https://zxm1bqf9jl.execute-api.us-east-1.amazonaws.com/prod/rzwebsite-trigger-pipeline")
    puts "...updating site"
  else
    puts "No new jobs."
  end
end
