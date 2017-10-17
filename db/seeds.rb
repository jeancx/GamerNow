# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create([{ name: 'admin' }, { name: 'editor' }, { name: 'author' }, { name: 'user' }])

# Video.create(provider: 'youtube', title: 'Final Fantasy 15/XV PS4 Trailer (TGS 2013)',vid: '_a4Y_0Oydcg')
# Video.create(provider: 'youtube', title: 'Fallout 4: (Gameplay) - FIRST LOOK - E3 Gameplay 2015',vid: 'InxJ59Netms')
# Video.create(provider: 'youtube', title: 'DOOM 4 GAMEPLAY 60FPS 1080p - Doom Gameplay Trailer',vid: 'CQpxDFExwhU')
#
# Category.create(title: 'Noticias')
# Category.create(title: 'Revisoes')
#
# Game.create(title: 'Fallout 4', cover: 'cover.jpg', background: 'E3-2015-Fallout-4.jpg' )
# Game.create(title: 'Final Fantasy XV', cover: 'cover.jpg', background: '2668179-key_art.jpg' )
#
# user1 = User.create(name: 'Jean Carlos Farias', email: 'jean_c12@hotmail.com', encrypted_password: '$2a$10$d6ivLAFkf2n7acQvxe8fE.R12/3XAfXBksJCZ4xT92xjWmIzojVba')
# user1.add_role = "admin"
# user2 = User.create(name: 'Editor', email: 'editor@gamernow.com.br', encrypted_password: '$2a$10$d6ivLAFkf2n7acQvxe8fE.R12/3XAfXBksJCZ4xT92xjWmIzojVba')
# user2.add_role = "editor"
# user3 = User.create(name: 'Author', email: 'author@gamernow.com.br', encrypted_password: '$2a$10$d6ivLAFkf2n7acQvxe8fE.R12/3XAfXBksJCZ4xT92xjWmIzojVba')
# user3.add_role = "author"
# user4 = User.create(name: 'User', email: 'user@gamernow.com.br', encrypted_password: '$2a$10$d6ivLAFkf2n7acQvxe8fE.R12/3XAfXBksJCZ4xT92xjWmIzojVba')
# user4.add_role = "user"
#
# content = "<p>Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit??, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium. Qui animated corpse, cricket bat max brucks terribilem incessu zomby. The voodoo sacerdos flesh eater, suscitat mortuos comedere carnem virus. Zonbi tattered for solum oculi eorum defunctis go lum cerebro. Nescio brains an Undead zombies. Sicut malus putrid voodoo horror. Nigh tofth eliv ingdead.</p>\r\n<p>Cum horribilem walking dead resurgere de crazed sepulcris creaturis, zombie sicut de grave feeding iride et serpens. Pestilentia, shaun ofthe dead scythe animated corpses ipsa screams. Pestilentia est plague haec decaying ambulabat mortuos. Sicut zeder apathetic malus voodoo. Aenean a dolor plan et terror soulless vulnerum contagium accedunt, mortui iam vivam unlife. Qui tardius moveri, brid eof reanimator sed in magna copia sint terribiles undeath legionis. Alii missing oculis aliorum sicut serpere crabs nostram. Putridi braindead odores kill and infect, aere implent left four dead.</p>\r\n<p>Lucio fulci tremor est dark vivos magna. Expansis creepy arm yof darkness ulnis witchcraft missing carnem armis Kirkman Moore and Adlard caeruleum in locis. Romero morbo Congress amarus in auras. Nihil horum sagittis tincidunt, zombie slack-jawed gelida survival portenta. The unleashed virus est, et iam zombie mortui ambulabunt super terram. Souless mortuum glassy-eyed oculos attonitos indifferent back zom bieapoc alypse. An hoc dead snow braaaiiiins sociopathic incipere Clairvius Narcisse, an ante? Is bello mundi z?</p>\r\n<p>In Craven omni memoria patriae zombieland clairvius narcisse religionis sunt diri undead historiarum. Golums, zombies unrelenting et Raimi fascinati beheading. Maleficia! Vel cemetery man a modern bursting eyeballs perhsaps morbi. A terrenti flesh contagium. Forsitan deadgurl illud corpse Apocalypsi, vel staggering malum zomby poenae chainsaw zombi horrifying fecimus burial ground. Indeflexus shotgun coup de poudre monstra per plateas currere. Fit de decay nostra carne undead. Poenitentiam violent zom biehig hway agite RE:dead p&oelig;nitentiam! Vivens mortua sunt apud nos night of the living dead.</p>\r\n<p>Whyt zomby Ut fames after death cerebro virus enim carnis grusome, viscera et organa viventium. Sicut spargit virus ad impetum, qui supersumus flesh eating. Avium, brains guts, ghouls, unholy canum, fugere ferae et infecti horrenda monstra. Videmus twenty-eight deformis pale, horrenda daemonum. Panduntur brains portae rotting inferi. Finis accedens walking deadsentio terrore perterritus et twen tee ate daze leighter taedium wal kingdead. The horror, monstra epidemic significant finem. Terror brains sit unum viral superesse undead sentit, ut caro eaters maggots, caule nobis.</p>"
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 2, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 2, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 2, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 2, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 2, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 2, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 2, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 2, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 2, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)
# Post.create(title: 'Zombie ipsum reversus ab viral inferno', category_id: 1, user_id: User.first, content: content)


 unless Rails.env.production?
   connection = ActiveRecord::Base.connection
   connection.tables.each do |table|
     connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
   end

   # - IMPORTANT: SEED DATA ONLY
   # - DO NOT EXPORT TABLE STRUCTURES
   # - DO NOT EXPORT DATA FROM `schema_migrations`
   sql = File.read('db/data.sql')
   statements = sql.split(/;$/)
   statements.pop  # the last empty statement

   ActiveRecord::Base.transaction do
     statements.each do |statement|
       connection.execute(statement)
     end
   end
 end
