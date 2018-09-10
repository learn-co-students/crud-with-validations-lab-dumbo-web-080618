Song.destroy_all

songs = [
  {title: "Unreleased: Adele Exposed", artist_name: "Adele", release_year: nil, released: false, genre: "Soul"},
  {title: "Human", artist_name: "Rag 'n Bone Man", release_year: 2017, released: true, genre: "Soul"},
  {title: "The Prayer", artist_name: "Bloc Party", release_year: 2010, released: true , genre: "Alternative Rock"},
  {title: "Kamikaze", artist_name: "Eminem", release_year: 2018, released:true , genre: "Rap"},
  {title: "What You Know", artist_name: "T.I.", release_year: 2006, released: true , genre: "Rap"},
]

songs.each{|e_song| Song.create(e_song)}