
def time_rand from = 0.0, to = Time.now
	t = Time.at(from + rand * (to.to_f - from.to_f))
	t.strftime("%F")
end

table :individual do |i|
	i.forename			type: :first_name, :unless => lambda { |i| i[:forename] == "" || i[:forename].nil? }
	i.middlename		type: :first_name, :unless => lambda { |i| i[:middlename] == "" || i[:middlename].nil? }
	i.surname			type: :last_name, :unless => lambda { |i| i[:surname] == "" || i[:surname].nil? }
 	i.email				type: :fixed, string: nil, :unless => lambda { |i| (i[:email] || '').include? "example.com" }
 	i.dob				type: :fixed, string: proc { |row| time_rand Time.local(1901, 1, 1) }, :unless => lambda { |i| i[:dob] == "" || i[:dob].nil? }
 	i.telephone_day		type: :fixed, string: proc { |row| "0151" << rand(10**6..10**7).to_s }, :unless => lambda { |i| i[:telephone_day] == "" || i[:telephone_day].nil? }
 	i.telephone_evening	type: :fixed, string: proc { |row| "0151" << rand(10**6..10**7).to_s }, :unless => lambda { |i| i[:telephone_evening] == "" || i[:telephone_evening].nil? }
 	i.telephone_mobile	type: :fixed, string: proc { |row| "0790" << rand(10**6..10**7).to_s }, :unless => lambda { |i| i[:telephone_mobile] == "" || i[:telephone_mobile].nil? }
 	i.nationality_id	:null
 	i.sex				type: :fixed, one_of: ["M", "F"]
end

table :user_access do |ua|
	ua.password			type: :fixed, string: "test"
end

table :company do |c|
	c.company_name			type: :name, :unless => lambda { |c| c[:company_name] == "" || c[:company_name].nil? }
end

table :contracts do |c|
	c.contract_name			type: :fixed, string: proc { |row| "Contract " << rand(10**6..10**7).to_s }, :unless => lambda { |c| c[:contract_name] == "" || c[:contract_name].nil? }
end

