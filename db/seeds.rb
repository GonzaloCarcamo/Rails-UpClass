Category.destroy_all
Tag.destroy_all
User.destroy_all


User.create(
    email:'admin@admin.cl',
    password:'123123',
    name:'admin',
    admin:'true')

User.create(
    email:'user@user.cl',
    password:'123123',
    name:'user')
