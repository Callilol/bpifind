# encoding: utf-8

#users
User.create([
	{:name => 'Anne-Sophie', :email => 'rouaux.annesophie@gmail.com', :password => 'password'},
	{:name => 'Claire', :email => 'claire.lebreton@bpi.fr', :password => 'password'},
	{:name => 'Alice', :email => 'alice.vallard@bpi.fr', :password => 'password'},
	{:name => 'Béatrice', :email => 'beatrice.zenonie@bpi.fr', :password => 'password'},
	{:name => 'Sylvie', :email => 'sylvie.lemaire@bpie.fr', :password => 'password'}
])

#collections
Collection.create([
	{:name => 'portfoliodw', :full_name => 'Catalogue BPI', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'CSA_AmericanFilmIndex', :full_name => 'American Film Index (AFI)', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'CSA_ArtBibModern', :full_name => 'Art Bibliographies Modern', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Archives sonores', :full_name => 'Archives sonores', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Ebsco_ArtIndex', :full_name => 'Art Index', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Wilson_Art Museum Image Gallery', :full_name => 'Art Museum Image Gallery', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Ovid_Atla Religion', :full_name => 'Atla Religion', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'ged', :full_name => 'Bpi-Doc', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'cairn.info', :full_name => 'Cairn', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'cdrap', :full_name => 'Cd-Rap', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Wilson_Cinema Image Gallery', :full_name => 'Cinema Image Gallery', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'classiques_garnier', :full_name => 'Classiques Garnier', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'EU_citemusique', :full_name => 'Concerts et oeuvres Cité de la musique', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Contemporary authors_Gale', :full_name => 'Contemporary Authors', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'CRAWLER', :full_name => 'CRAWLER', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'CSA_DesignAppliedArtsIndex', :full_name => 'Design and Applied Arts Index', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'em_premium', :full_name => 'EM Premium', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Encyclopaedia Judaica_Gale', :full_name => 'Encyclopaedia Judaica', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Grolier-MultimEncyclopedia', :full_name => 'Encyclopedia Americana', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'europresse', :full_name => 'Europresse', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'factiva', :full_name => 'Factiva', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'CSA_FIAF', :full_name => 'FIAF', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'CSA_FilmIndexInter', :full_name => 'Film Index International (FII)', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Ovid_Francis', :full_name => 'Francis', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'gallica:integral', :full_name => 'Gallica', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'gallica:cartes', :full_name => 'Gallica : Documents cartographiques', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'gallica:theme:0', :full_name => 'Gallica : Généralités', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'gallica:monographies', :full_name => 'Gallica : Monographies', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'gallica:audio', :full_name => 'Gallica : Paroles et musiques', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'gallica:typedoc:partitions', :full_name => 'Gallica : Partitions', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'gallica:1', :full_name => 'Gallica : Philosophie', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Gallica : Religion', :full_name => 'gallica:2', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Gallica : Theme : Presse', :full_name => 'gallica:theme:0:07', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'DeGruyter_Germanistik', :full_name => 'Germanistik Journal', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'Ebsco_Historical Abstracts', :full_name => 'Historical Abstracts', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'irevues.inist', :full_name => 'I-Revues', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'IN_citemusique', :full_name => 'Instruments Cité de la Musique', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'CSA_IBSS', :full_name => 'International Bibliography of the Social Sciences (IBSS)', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'CSA_IntIndMusicPerie', :full_name => 'International Index to Music Periodicals', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'CSA_IntIndPerformingArts', :full_name => 'International Index to the Performing Arts', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'keesings', :full_name => 'Keesings World News Archives', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'quinzaine', :full_name => 'La Quinzaine Littéraire', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'lextenso', :full_name => 'Lextenso', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'ircam:musique', :full_name => 'Médiathèque de l\'Ircam : Musique', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'ircam:musique:post1945', :full_name => 'Médiathèque de l\'Ircam : Musique après 1945', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'CSA_MLA', :full_name => 'MLA International Bibliography', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
	{:name => 'MU_citemusique', :full_name => 'Musées Cité de la Musique', :connection_type => 'test', :host => '10.1.2.100', :user => 'postgresbpi', :password => 'postgresbpi', :record_schema => 'test', :definition => 'test', :word => 'test', :url => 'test'},
])

#harvest_logs
Collection.all.each do |c|
	HarvestLog.create([
	{:collection_id => c.id, :start => DateTime.now - 1.month, :end => DateTime.now - 1.month + 4.hours, :success => true, :full => true, :nb => 40000},
	{:collection_id => c.id, :start => DateTime.now - 15.days, :end => DateTime.now - 15.days + 4.hours + 22.minutes, :success => true, :full => false, :nb => 150},
	{:collection_id => c.id, :start => DateTime.now - 5.days, :end => DateTime.now - 5.days + 1.minute, :success => false, :full => true, :nb => 0}
	])
end

#collection_types
CollectionType.create([
	{:name => 'default_asynchronous_group_collection', :full_name => 'Collections asynchrones par défaut'},
	{:name => 'asynchronous_group_collection', :full_name => 'Collections asynchrones'},
	{:name => 'synchronous_group_collection', :full_name => 'Collections synchrones'},
	{:name => 'alphabetic_group_liste', :full_name => 'Liste alphabétique'}
])

#collection_groups
CollectionsGroup.create([
	{:name => 'a_tout_generalites', :full_name => 'Tout', :description => 'Interrogez toutes les ressources de la bibliothèque', :collection_type_id => 1},
	{:name => 'a_tout_actumediapresse', :full_name => 'Actualités, médias, presse', :description => 'Généralités + ressources spécialisées : CD-Rap, Europresse, Times Digital Archives...', :collection_type_id => 2},
	{:name => 'b_livres_tous', :full_name => 'Tous les livres', :description => 'Chercher tous types de livres', :collection_type_id => 1},
	{:name => 'c_articles_tous articles', :full_name => 'Revues et articles', :description => 'Trouver une revue, un journal, des articles dans les bases de généralistes ou de presse', :collection_type_id => 1},
	{:name => 'a_tout_art', :full_name => 'Arts', :description => 'Généralités + ressources spécialisées : Art bibliographies modern, Oxford Art Online, Francis, etc.', :collection_type_id => 1},
])

#collections_collections_groups
CollectionsCollectionsGroup.create([
	{:collection_id => 191, :collections_group_id => 1}
])

