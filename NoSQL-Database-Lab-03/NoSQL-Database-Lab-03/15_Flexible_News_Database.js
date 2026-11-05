// Q15. Flexible News Database with different document structures
use("NoSQL_Lab3");
db.NewsArticles.drop();

db.NewsArticles.insertMany([
 {title:"Technology Expo Announced",category:"Technology",author:"Aarav",
  tags:["technology","education"],location:"Roorkee",images:["expo.jpg"],
  source:{name:"Campus News",url:"https://example.test/expo"},publishedAt:ISODate("2026-10-01")},
 {title:"Heavy Rain in Region",category:"Local",location:"Haridwar",
  tags:["weather","local"],source:"Local Desk",publishedAt:ISODate("2026-10-03")},
 {title:"National Sports Update",category:"Sports",author:{name:"Priya Verma"},
  tags:["sports","national"],images:[],publishedAt:ISODate("2026-10-05")},
 {title:"New Learning Centre Opens",category:"Education",
  author:"News Team",location:"Dehradun",tags:["education","local"],
  source:{name:"Education Bulletin"},publishedAt:ISODate("2026-10-08")}
]);

// Search by category
db.NewsArticles.find({category:"Technology"});
// Search by tag
db.NewsArticles.find({tags:"education"});
// Search by location even when other fields differ
db.NewsArticles.find({location:"Haridwar"});
// Articles where author exists, regardless of whether author is string or object
db.NewsArticles.find({author:{$exists:true}});
// Search nested author name where author is an object
db.NewsArticles.find({"author.name":"Priya Verma"});
// Articles that have an image field
db.NewsArticles.find({images:{$exists:true}});
// Search across title and category
db.NewsArticles.find({$or:[
 {title:{$regex:"sports",$options:"i"}},
 {category:{$regex:"sports",$options:"i"}}
]});
