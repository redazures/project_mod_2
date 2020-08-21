# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'pry'
require 'dotenv'
require 'rest-client'
Dotenv.load

puts "lets go go go"

book_isbns = ("9780007123810,9780007123827,9780007129706,9780007129720,9780007144082,9780007149131,9780007149148,9780007149216,9780007149230,9780007149247,9780007171972,9780007171996,9780007172009,9780007182367,9780007203604").split(",")
book_isbns1 = ("9780449213940,9780553212419,9781616897987,9783836565547,9783836560146,9783836535960,9783836560429,9781514682050").split(",")
book_isbns2 = ("9780545010221,9780590353427,9780747532743,9780747532743,8498386314").split(",")
book_isbns = book_isbns+book_isbns2+book_isbns1
records=book_isbns.map{|record|BookRecord.populate(record)}
creation_line=records.each{|record|BookRecord.find_or_create_by(record)}
results=BookRecord.populate_by_author("rowling")
results=results.map{|b|{title:b["title"],author: "J.K. Rowling",synopsis:(b["synopsis"] ? b["synopsis"] : "The synopsis is not available"), img_url:b["image"],isbn13:b["isbn13"], isbn:b["isbn"]}}
results.each{|record|BookRecord.find_or_create_by(record)}

# users="greg,alexS,Tashawn,IanG,James,IanR,Jennifer,Alex,Junko,RyanW,Karan,SeMin,JakeL,Brian,Devin,Muhtasim,Josh,DavidKir,Amit,JakeM,Victor,Kevin,RyanF,Vincent,DavidK,Ward,Codyd,RyanL,Matthew,Gregory,Codyc,Mimi,Minelie,Joseph,Samuel,Sawandi,Iuri,Jzavier,Israel,Vlad,Teddy"
# users=users.split(",")
# users.each{|u|User.create(name:u, password_digest:"123456",email:"#{u}@flat.com")}

pergolas=[{
    name: Faker::Games::Witcher.location,
    address1: "233 Spring Street",
    address2: " ",
    city: "New York City",
    state: "New York",
    zip_code: 10013
},
{
    name: Faker::Games::Witcher.location,
    address1: "11115 75th Ave",
    address2: " ",
    city: "Flushing",
    state: "New York",
    zip_code: 11375
},
{
    name: Faker::Games::Witcher.location,
    address1: "285 Park Ave",
    address2: " ",
    city: "New York City",
    state: "New York",
    zip_code: 10171
},
{
    name: Faker::Games::Witcher.location,
    address1: "11 martine avenue",
    address2: " ",
    city: "White Plains",
    state: "New York",
    zip_code: 10606
},
{
    name: Faker::Games::Witcher.location,
    address1: "24056 65th Ave",
    address2: " ",
    city: "Douglaston",
    state: "New York",
    zip_code: 11362
}
]

pergolas.each{|p|Pergola.create!(p)}

300.times do
    Book.create(book_record_id:BookRecord.all.sample.id,pergola_id:Pergola.all.sample.id, count:rand(1..10))
end

BookRecord.image_checker

# BookRecord.populate(9780060731328)
# 006073132X

p BookRecord.count
p Pergola.count
p User.count
p Book.count
puts "cash Money"

# BookRecord.image_checker
# binding.pry
0
# The Forbidden Planet
# Ian Rosen
# 9781523775958
# 1523775955
# The year is 2276 and humans have long since left their home planet, Earth. Now they are spread across the Andromeda galaxy among thirty-three new colonies. Jason Frost has become complacent in a life of lonely non-achievement on New Earth. He can't seem to do anything right with his life, including keeping the woman he loves by his side. After leaving him to join Space Command and Patrol, she has gone missing. A mysterious new comrade knows exactly where to find her. But there's a catch. She is somewhere no one would ever think to look. Only Jason has the power to find her and save her and the entire universe from the turmoil that is about to ensue.