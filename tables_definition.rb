
def gen_rand_string
	o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
	(0...50).map { o[rand(o.length)] }.join
end

table :Users do |t|
	t.display_name	:name
 	t.email		:email
	t.password	type: :string, string: gen_rand_string
end
