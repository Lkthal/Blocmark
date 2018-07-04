require 'random_data'

5.times do

   Topic.create!(

     title:  RandomData.random_sentence
   )
 end

 topics = Topic.all

 puts "Seed finished"
 puts "#{Topic.count} topiccreated"
