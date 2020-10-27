User.create(email: 'sy@gmail.com', password: 'password')
User.create(email: 'nico@gmail.com', password: 'password')
User.create(email: 'ed@gmail.com', password: 'password')

Restaurant.create(name: "Piknik Köfte", address: 'Tomtom, İstiklal Cd. No:173 D:C, 34433 Beyoğlu/İstanbul', user: User.first)
Restaurant.create(name: "Tomtom Kebap", address: 'Firuzağa, Yeni Çarşı Cd. 39 A, 34425 Beyoğlu/İstanbul', user: User.first)
Restaurant.create(name: "DOĞACIYIZ GOURMET", address: 'Kılıçali Paşa, Mahallesi, Kasatura Sk. 16/A, 34433 Beyoğlu/İstanbul', user: User.first)
