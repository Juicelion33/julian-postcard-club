# Demonstration content. Students should replace samples with their own work.
if Article.count.zero?
  article1 = Article.create!(title: "The New York Weekend Walk", region: "Americas", destination: "New York City", trip_status: "Visited", body: "A day in a familiar city can still feel like an adventure if you slow down and look closely. I like noticing side streets, small shops, and views that people walk past every day. This entry is a reminder to record local experiences, too.")
  article2 = Article.create!(title: "Dreaming of Kyoto", region: "Asia", destination: "Kyoto, Japan", trip_status: "Wishlist", body: "Kyoto is on my list because I want to learn more about its temples, gardens, and neighborhoods. A future trip would be a chance to compare a place I have only read about with the everyday details you notice while walking around.")
  article3 = Article.create!(title: "A Lisbon Postcard", region: "Europe", destination: "Lisbon, Portugal", trip_status: "Wishlist", body: "The colorful streets and waterfront have put Lisbon on my travel wishlist. I want to research the neighborhoods, transit options, and local customs before planning a trip. For now, this is a place to save ideas and useful questions.")
  article1.comments.create!(commenter: "Guest", body: "Great introduction. Looking forward to more posts!")
end
