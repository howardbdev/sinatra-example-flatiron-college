howard = Instructor.create(name: "Howard", email: "howard@howard.com", password: "password")
bob = Instructor.create(name: "Bob", email: "bob@bob.com", password: "password")
luisa = Instructor.create(name: "Luisa", email: "luisa@luisa.com", password: "password")

Student.create(name: "Connie", email: "connie@connie.com")
Student.create(name: "Suchitra", email: "suchitra@suchitra.com")
Student.create(name: "EunYi", email: "eunyi@eunyi.com")
Student.create(name: "Judy", email: "judy@judy.com")
Student.create(name: "Sara", email: "sara@sara.com")
Student.create(name: "Katleiah", email: "katleiah@katleiah.com")

Course.create(name: "Fly fishing", description: "Learn to fish!", instructor_id: howard.id)
Course.create(name: "Fast driving", description: "Drive fast", instructor_id: bob.id)
Course.create(name: "Joke making", description: "Learn to be funny", instructor_id: luisa.id)
