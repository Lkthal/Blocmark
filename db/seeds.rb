require 'random_data'

5.times do

   Topic.create!(

     title:  RandomData.random_sentence
   )
 end

 topics = Topic.all


 5.times do
   Bookmark.create!(
     topic: topics.sample,
     url: RandomData.random_sentence
   )
 end
 bookmarks = Bookmark.all

 puts "Seed finished"
 puts "#{Topic.count} topic created"
 puts "#{Bookmark.count} bookmark created"
