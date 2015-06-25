class Message < ActiveRecord::Base

  Tweet = Struct.new(:uid  , :tweet , :from_user , :user_uid  , 
                       :to_user, :profile_image_url , :tweet_at)
                       
  def self.fetch_tweets(term)
    tweets = []
    $twitter.search(term, result_type: "recent", since_date: (Date.today), until: (Date.today +1.day)).take(10).collect do |tweet|
#      tweets << Tweet.new(:uid => tweet.id , :tweet => tweet.full_text, :from_user => tweet.from_user, :user_uid => tweet.to_user_id , :to_user => tweet.to_user_name, :profile_image_url => tweet.profile_image_url("original"), :tweet_at => tweet.created_at)
      tweets << tweet
    end
    tweets
  end

  def self.get_user(term)
    user = $twitter.user(term)
  end
  
  def self.trending(woeid)
    trends = []
    $twitter.trends(id=woeid, options={}).collect do |trend|
      trends << trend
    end
    trends
  end
  
end

