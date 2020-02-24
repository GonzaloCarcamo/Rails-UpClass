Category.destroy_all
Tag.destroy_all

Category.create(title:'Desarrollo WEB')
Category.create(title:'Música')
Category.create(title:'Deportes')

Tag.create(title:'Ruby on Rails')
Tag.create(title:'Django')
Tag.create(title:'JavaScript')

Tag.create(title:'Guitarra Eléctrica')
Tag.create(title:'Batería')
Tag.create(title:'Armonía')

Tag.create(title:'Crossfit')
Tag.create(title:'Yoga')
Tag.create(title:'Personal Training')

User.create(
    email:'admin@admin.cl',
    password:'123123',
    name:'admin',
    last_name: 'admin',
    admin:'true')

User.create(
    email:'user@user.cl',
    password:'123123',
    name:'user',
    last_name: 'user')








