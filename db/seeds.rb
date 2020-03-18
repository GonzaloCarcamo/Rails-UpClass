Category.destroy_all
Tag.destroy_all
User.destroy_all
AdminUser.destroy_all


Category.create(title:'Musica')
Tag.create(title:'Guitarra Electrica', category_id:'1')
Tag.create(title:'Bajo Electrico', category_id:'1')
Tag.create(title:'Bateria', category_id:'1')
Tag.create(title:'Armonia', category_id:'1')
Tag.create(title:'Teoría Musical y Solfeo', category_id:'1')

Category.create(title:'Deporte')
Tag.create(title:'Yoga', category_id:'2')
Tag.create(title:'Crossfit', category_id:'2')
Tag.create(title:'Personal Training', category_id:'2')

Category.create(title:'Desarrollo WEB')
Tag.create(title:'Ruby On Rails', category_id:'3')
Tag.create(title:'Django', category_id:'3')
Tag.create(title:'C++', category_id:'3')
Tag.create(title:'Bases de Datos SQL', category_id:'3')
Tag.create(title:'Diseño WEB', category_id:'3')

Category.create(title:'Ciencias')
Tag.create(title:'Fisiologia', category_id:'4')
Tag.create(title:'Biologia Celular', category_id:'4')
Tag.create(title:'Algebra', category_id:'4')
Tag.create(title:'Estadistica', category_id:'4')
Tag.create(title:'Quimica Organica', category_id:'4')

Category.create(title:'Ingles')
Tag.create(title:'For Business', category_id:'5')
Tag.create(title:'For Kids', category_id:'5')
Tag.create(title:'Beginner', category_id:'5')
Tag.create(title:'TOELF Test', category_id:'5')
Tag.create(title:'Speaking Practice', category_id:'5')

Category.create(title:'Otros Idiomas')
Tag.create(title:'Aleman', category_id:'6')
Tag.create(title:'Ruso', category_id:'6')
Tag.create(title:'Frances', category_id:'6')
Tag.create(title:'Hebreo', category_id:'6')
Tag.create(title:'Italiano', category_id:'6')

Category.create(title:'Aprendizaje Diferencial')
Tag.create(title:'TEL', category_id:'7')
Tag.create(title:'Psicopedagogía', category_id:'7')
Tag.create(title:'Lenguaje Diferencial', category_id:'7')

Category.create(title:'Coaching')
Tag.create(title:'Prepara Tu CV', category_id:'8')
Tag.create(title:'Oratoria', category_id:'8')
Tag.create(title:'Crecimiento Personal', category_id:'8')

Category.create(title:'Asesorías')
Tag.create(title:'Asuntos Legales', category_id:'9')
Tag.create(title:'Comienza Tu Pyme', category_id:'9')
Tag.create(title:'Contabilidad', category_id:'9')
Tag.create(title:'Formulacion Proyectos', category_id:'9')



User.create(
    email:'admin@admin.cl',
    password:'123123',
    name:'admin',
    admin:'true')



AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
