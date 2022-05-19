import 'package:flutter/material.dart';
import 'package:secondlab/models/event.dart';
import 'package:secondlab/models/place.dart';
import 'package:secondlab/models/accomodation.dart';
import 'package:secondlab/models/tour.dart';

List<Event> events = [
  Event(
    name: "Dreambeach",
    description:
        "In 2022 the town of Villaricos will once again become the epicenter of electronic music in Europe, THE DREAMBEACH IS BACK. And with this it will be the eighth edition. The main difference that there will be with respect to previous editions is the date. This year's edition will take place on July 13, 14, 15, 16 and 17, 2022. Dreambeach is the leading electronic music festival in Spain, and its line-up has always been characterized by having the most relevant stars of the music scene from different genres. During these five days of festival you will not only enjoy unforgettable sets of the best music, but also the experience that Dreambeach encompasses. Top-level production for sound, light, stage design, pyrotechnics, the sun, the beach, the Mediterranean, and above all, vacations with your colleagues. For the EDM, Mainstream and Hardstyle stage, artists such as Dimitri Vegas & Like Mike (number 5 in the world according to DJ Mag magazine), Illenium, DJ Diesel (Aka Shaquille O'Neal), Dr. Peacock, Brennan Heart , Mike Williams, Vini Vici, Thyron, Alesso, Brian Cross, Mattn, Miss K8, Nervo, Tac Team and Yves V. Artists such as Ann Clue, Boris Brejcha, Deborah de Luca, I Hate Models, Lilly Palmer, Paco Osuna, VTSS, Amelie Lens, Cuartero and Dennis Cruz, Gonçalo, Marco Carola, Michael Bibi, Nina Kraviz and Richie Hawtin. In addition to the performance of the duo Dubfire and Sharam (Deep Dish) it is exclusive to Dreambeach, since it will be the only one in 2022 in all of Spain. The Bass stage will witness the sessions of Noisia, who will say goodbye to the Spanish public in her only performance in our country, as part of her Farawell Tour, and of Mefjus & Maksim, well known in electronic music. There will also be artists such as Alix Perez, Critical Soundsystem XX ft Enei, Halogenix & Kasra, A.M.C, Break, DUB Elements, Eptic, Krewella and Oto. In Urban, attendees will be able to enjoy the rhymes of SFDK and Kase.O Jazz Magnetism, who have already confirmed their attendance. In addition to Ayax and Prok, the Argentine producer Bizarrap and Eladio Carrión. The festival will feature a special performance by I Am Hardstyle. In addition, there are still artists to be confirmed that, little by little, Dreambeach will announce. Get ready to live like never before 5 days of electronic party, immersing yourself in an intense experience that you will hardly forget.",
    address: "Playa de Palomares 04617 Palomares, Almería",
    location:
        "https://www.google.com/maps/place/04617+Palomares,+Almer%C3%ADa,+Almer%C3%ADa,+Spain/@37.2393182,-1.8047386,16z/data=!3m1!4b1!4m5!3m4!1s0xd7b2afc156fb527:0xa03d27b22c13cc0!8m2!3d37.2394923!4d-1.7995001",
    images: ["images/img13.jpg", "images/img14.jpg", "images/img15.jpg"],
  ),
  Event(
      name: "Feria",
      description:
          "La Feria de Almería tiene una duración de 8 días, donde contará como todos los años con un extenso programa de eventos, conciertos y actividades.",
      address: "04007 Vega de Aca, Almería",
      location: "https://www.google.com/maps/place/Av.+de+la+Vega+de+Aca,+04007+Almer%C3%ADa,+Spain/@36.8283299,-2.4400742",
      images: ["images/img22.jpg", "images/img23.jpg", "images/img24.jpg"]),
  Event(
      name: "Southwest Festival",
      description:
          "Último episodio de SouthWest! 🤠 Todo Western necesita su historia y toda historia su protagonista. El que pise hoy SouthWest, debe saber que pisa un lugar que otrora fue tranquilo, pero que hoy en día atrae a extraños visitantes por lo que sucedió aquel día en que la tierra brilló por sí misma. Desde ese día en que el infalible Cazarrecompensas sin nombre se vio al borde de la muerte, el equilibrio en SouthWest se vio truncado. Lo que pasó después, es un misterio. Un misterio que nadie ha sido capaz de resolver, ni de explicar. La única forma de comprenderlo es asistiendo al lugar donde todo sucedió, si es que alguien se atreve…. Una producción de @southwestfestival",
      address: "Paraje del Unihay, s/n, 04200 Tabernas, Almería",
      location: "https://www.google.com/maps/place/Texas+Hollywood/@37.0481234,-2.4231432,17z/data=!4m9!1m2!2m1!1sParaje+del+Unihay,+s%2Fn,+04200+Tabernas,+Almer%C3%ADa!3m5!1s0xd7aa702a3bbb113:0x8cc9509e7f681706!8m2!3d37.0469152!4d-2.4199335!15sCjBQYXJhamUgZGVsIFVuaWhheSwgcy9uLCAwNDIwMCBUYWJlcm5hcywgQWxtZXLDrWFaLyItcGFyYWplIGRlbCB1bmloYXkgcyBuIDA0MjAwIHRhYmVybmFzIGFsbWVyw61hkgESdG91cmlzdF9hdHRyYWN0aW9umgEjQ2haRFNVaE5NRzluUzBWSlEwRm5TVVJYZEdNeU5rNTNFQUU",
      images: ["images/img10.jpg", "images/img11.jpg", "images/img12.jpg"]),
];

List<Place> places = [
  Place(
    name: "La Alcazaba",
    description:
        "The Alcazaba of Almería can be seen from any part of the city and it is the biggest of the citadels built by the Arabs in Spain. Its construction was begun in 955 by Abderramán III and finished by Hayrán, taifa king of Almeria, in the XI century. After the Christian conquest it was reformed by the Catholic Monarchs and Carlos I. It has three walled enclosures. One of the three was built by the Catholic Monarchs. It was a royal residence and today stands at the foot of Al-Mutasin palace with all its rooms, its mosque, converted into a church since the end of the XV century, and its baths. It has only one entrance, made almost invisible by the enormous walls as well as large rooms with vaulted ceilings and gothic doors. From the top of the castle walls we can enjoy marvellous views of the city and the port.",
    address: "C. Almanzor, s/n, 04002 Almería, Spain",
    audio: "alcazaba.mp3",
    location:
        "https://www.google.com/maps/place/Conjunto+Monumental+de+la+Alcazaba+de+Almer%C3%ADa/@36.8410548,-2.4738401,17z/data=!3m1!4b1!4m5!3m4!1s0xd707607b5a1f473:0xdf577194575ccf6c!8m2!3d36.8400107!4d-2.4701489?hl=en",
    images: ["images/img19.jpg", "images/img20.jpg", "images/img21.jpg"],
    video: "video3.mp4",
  ),
  Place(
    name: "The cathedral",
    description:
        "The Cathedral of Almería (Spanish: Catedral de Almería), in full the Cathedral of the Incarnation of Almería (Spanish: Catedral de la Encarnación de Almería), is a Roman Catholic cathedral in the city of Almería, Andalusia. It is the seat of the Diocese of Almería.",
    address: "Pl. de la Catedral, 8, 04001 Almería, Spain",
    location:
        "https://www.google.com/maps/place/Almeria+Cathedral/@36.8381735,-2.4695795,17z/data=!3m1!4b1!4m5!3m4!1s0xd70760693a75ad7:0x318a826205f1c4f1!8m2!3d36.8381735!4d-2.4673908",
    video: "video3.mp4",
    images: ["images/img25.jpg", "images/img26.jpg", "images/img27.jpg"],
    audio: "cathedral.mp3",
  ),
  Place(
    name: "Cabo de gata",
    description:
        "Cabo de Gata-Níjar Natural Park in the southeastern corner of Spain is Andalusia's largest protected coastal area, a wild and isolated landscape. Spain's southeast coast, where the park is situated, is the only region in mainland Europe with a true hot desert climate (Köppen climate classification: BWh). The eponymous mountain range of the Sierra del Cabo de Gata, with its highest peak El Fraile, form a volcanic rock formation with sharp peaks and crags in red and ochre hues. It falls steeply to the Mediterranean Sea, creating jagged 100-metre (330 ft) high cliffs riven by gullies, creating hidden coves and white, sandy beaches. Offshore are numerous tiny rocky islands and extensive coral reefs teeming with marine life.[2] Its climate is dry, with rainfall below 160 mm (6.3 in) a year and average yearly temperatures above 19 °C (66 °F). In 1997, it was designated as a UNESCO Biosphere Reserve. In 2001, it was included among the Specially Protected Areas of Mediterranean Importance, due to the adsorptive properties and low permeability of its clays, the area was studied as a possible place for deep storage of sealed radioactive waste.",
    address: "04118 Níjar, Almería, Spain",
    location:
        "https://www.google.com/maps/place/Parque+Natural+del+Cabo+de+Gata-N%C3%ADjar/@36.722192,-2.1939447,17z/data=!3m1!4b1!4m5!3m4!1s0xd7a8d6eac00da71:0x804122782017fd50!8m2!3d36.722192!4d-2.191756",
    video: "video3.mp4",
    images: ["images/img28.jpg", "images/img29.jpg", "images/img30.jpg"],
    audio: "cabodegata.mp3",
  ),
  Place(
      name: "Mónsul and Genoveses",
      description:
          "Monsul is the most photographed beach of Natural Park Cabo de Gata in Spain. Clear water and curious rock formations of volcanic origin.",
      address: "Parque Natural Cabo de Gata-Nijar, 04118 San José",
      video: "video3.mp4",
      images: ["images/img16.jpg", "images/img17.jpg", "images/img18.jpg"],
      audio: "monsul.mp3",
      location:
          "https://www.google.com/maps/place/Playa+de+M%C3%B3nsul/@36.7307634,-2.1630215,14z/data=!3m1!4b1!4m5!3m4!1s0xd7a8d32af24788b:0xb309552702df2976!8m2!3d36.7307652!4d-2.1455119"),
  Place(
    name: "Tabernas dessert",
    description:
        "The Tabernas Desert (Spanish: Desierto de Tabernas) is one of Spain's semi-arid deserts, located within Spain's south-eastern province of Almería. It is in the interior, about 30 kilometers (19 mi) north of the provincial capital Almería, in the Tabernas municipality in Andalusia.",
    address: "04260, Almería, Spain",
    video: "video3.mp4",
    location:
        "https://www.google.com/maps/place/Tabernas/@37.0012035,-2.4679077,14z/data=!3m1!4b1!4m5!3m4!1s0xd7aa0bb2b0f7187:0xcc8e564e55726f59!8m2!3d37.0012053!4d-2.4503981",
    audio: "tabernas.mp3",
  ),
];

List<Accomodation> accomodations = [
  Accomodation(
    name: "Gran Hotel",
    description:
        "One of the most emblematic hotels in the city, an obligatory meeting place for high-ranking national and international personalities from public and cultural life, it has a privileged location facing the sea, being a wonderful viewpoint of the Mediterranean and the city of Almería. It was the first four-star hotel in the city, and since its opening in 1967, it has been the living history of cinema in Almería. From Sergio Leone's time with the Westem to our days with Steven Spielberg and his Indiana Jones, both have stayed at the charismatic Gran Hotel Almería. Like them, Harrison Ford, Sofia Loren, Clint Eastwood, Lee Van Cleef, The Beatles, Brigitte Bardot, Raquel Welch, David Carradine, Faye Dunaway, Catherine Deneuve, and many more! Its strategic location in the nerve center of the city of Almería allows you to visit the city's points of interest on foot: Alcazaba, Cathedral, Town Hall, Puerta de Purchena, Mercado de Abastos, Teatro Apolo and Teatro Cervantes, Iglesias de San Pedro and Santiago, Basilica of the Virgin of the Sea, etc.",
    address: "C. Reina Regente, 8, 04001 Almería",
    location:
        "https://www.google.com/maps/place/C.+Reina+Regente,+8,+04001+Almer%C3%ADa,+Spain/@36.8346221,-2.4659644,17z/data=!3m1!4b1!4m5!3m4!1s0xd707603a0cd2899:0xa1763ae1e6b0b65f!8m2!3d36.8346221!4d-2.4637757",
    images: ["images/img1.jpg", "images/img2.jpg", "images/img3.jpg"],
  ),
  Accomodation(
    name: "HO Paseo",
    description:
        "Situated in Almería, 1.3 km from Cabo de Gata Beach, HO Paseo de Almería offers accommodation with air conditioning and free WiFi.",
    address: "P. de Almería, 9, 04001 Almería",
    location:
        "https://www.google.com/maps/place/P.%C2%BA+de+Almer%C3%ADa,+9,+04001+Almer%C3%ADa,+Spain/@36.8405323,-2.4656747,17z/data=!3m1!4b1!4m5!3m4!1s0xd707600faca9363:0xa95575c12b3ad6ab!8m2!3d36.8405323!4d-2.463486",
    images: ["images/img4.jpg", "images/img5.jpg", "images/img6.jpg"],
  ),
  Accomodation(
    name: "Hotel Catedral Almería",
    description:
        "Hotel Catedral Almería, located in an old bourgeois palatial house, dating back to the 19th century, is located in the Plaza de la Catedral in Almería, offering an attractive mix of comfort, luxury and design in the heart of the city centre. The classic design of the building, the modern roof terrace and the attention to detail make this a unique hotel that transports you to the most authentic Almería. Its 20 rooms, located next to the Cathedral of Almería, are equipped with modern and elegant decoration that make the stay an experience. In addition, you can enjoy a fantastic outdoor pool with a solarium to disconnect from the routine, with views of the Cathedral and the Alcazaba. To celebrate the best events, both business and private, the Hotel has the La Catedral Restaurant, Catedral Bar and La Azotea, which offer Mediterranean cuisine and local products, as well as rooms with different capacities and terraces, for all kinds of events. In La Azotea, located in the highest part of the Hotel, you can enjoy the best cocktails with unbeatable views, it has become a sophisticated and exclusive proposal, a benchmark for Almeria nightlife.",
    address: "Pl. de la Catedral, 8, 04002 Almería",
    location:
        "https://www.google.com/maps?q=Pl.+de+la+Catedral,+8,+04002+Almer%C3%ADa&rlz=1C1GCEU_plPL988PL988&um=1&ie=UTF-8&sa=X&ved=2ahUKEwje-pD-0tn3AhXFlosKHSWTBcoQ_AUoAXoECAIQAw",
    images: ["images/img7.jpg", "images/img8.jpg", "images/img9.jpg"],
  ),
];

List<Tour> tours = [
  Tour(
      name: "Beach Tour",
      description:
          "Exciting beach tour around some of the most beautiful beaches in Almeria.",
      places: [
        "Playa de Monsul",
        "Playa de Genoveses",
        "Playa Cala de Enmedio"
      ],
      map: "images/map1.png"),
  Tour(
    name: "Almeria Tour",
    description: "Tour of the main places of Almeria.",
    places: ["Cathedral of Almeria", "Alcazaba", "University"],
    map: "images/map2.png",
  ),
  Tour(
    name: "Beach Tour 2",
    description: "Discover even more beacher around Almeria!",
    places: [
      "Parque Natural Cabo de Gata",
      "Playa de los Muertos",
      "Playa Cala de Enmedio"
    ],
    map: "images/map3.png",
  ),
];
