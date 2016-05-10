Item.destroy_all
User.destroy_all
Category.destroy_all
Comment.destroy_all
Favourite.destroy_all

i1 = Item.create :name => "Car", :description => "1998, 120,000km, red", :price => 4000
i2 = Item.create :name => "Work Desk", :description => "Pine wood, 3 years old", :price => 55
i3 = Item.create :name => "Sweater", :description => "full of moth balls, stained armpits", :price => 0
i4 = Item.create :name => "DVDs", :description => "selection of 15 DVDs", :price => 40

u1 = User.create :name_first => "Ian", :name_last => "Lenehan", :email => "ianlenehan@me.com", :admin => true
u2 = User.create :name_first => "Templeton", :name_last => "Peck", :email => "temp@me.com"

c1 = Category.create :name => "Cars"
c2 = Category.create :name => "Furniture"
c3 = Category.create :name => "Clothing"
c4 = Category.create :name => "Media"

c1.items << i1
c2.items << i2
c3.items << i3
c4.items << i4

u1.items << i1 << i2
u2.items << i3 << i4
