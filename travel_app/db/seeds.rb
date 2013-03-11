User.delete_all
Activity.delete_all
Place.delete_all
Trip.delete_all


u1 = User.create(:name => '', :image => 'Nigella Lawson', :bio => '', :connections => '', :activities => '', :currently => '', :trips => '')

a1 = Activity.create(:name => '', :type => '')

t1 = Trip.create(:tripname => '', :destination => '', :activities => '', :tripstart => '', :tripend => '')

p1 = Place.create(:area => '', :city => '', :country => '')

