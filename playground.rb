# if you have not installed the needed gems, please do the following:
# gem install sqlite3
# gem install activerecord

require "sqlite3"
require "active_record"

# this line configures ActiveRecord to connect to a sqlite3 database in the same folder named "students.sqlite3"
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "./students.sqlite3")

# This sets up ActiveRecord to use Ruby OOP with SQL data
class Student < ActiveRecord::Base
end

####################################
# Write your test code here

# 1. Create a new student using new and save
	# student = Student.new(name: "Harry Potter", email: "harry@example.com", age: 18)
	# student.save

# 2. Create a new student using create
	# student = Student.create(name: "Luke Watt", email: "luke@example.com", age: 23)

# 3. Select all students
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?


		# students = Student.all  	#--> 	Returns an Active Record relation object
		# p students.count			#-->  	You should get 22

		# p students[5]  			#-->	Returns a user object

# Why can't you do Student.name or Student.email?
	# An Active Record relation object stores the info in an array, so even if there's one item, that item is stored in an array of length 1.
	# Use Student[0].name to achieve the same resutls

# 4. Select the first student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
	
	p Student.first 				# --> Returns a user/Student object

# 5. Select the last student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?

	p Student.last 					# --> Returns a user/Student object

# 6. Use each to iterate through the #<ActiveRecord::Relation> object to display the name of each student

	Student.all.each do |student|
    	p student.name
	end

	# pp or 'pp' / 'pretty print' makes things really nice without the use of a lopp
	# Try it:
		# pp Student.all
		# Note: at the end, you get an ugly block for all the items too 

# 7. Find student by the name Dr. Lois Pfeff using where.
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?
	student = Student.where(name: "Dr. Lois Pfeff")
	p student

	# .where returns an Active Record Relation


# What will the following return to you? (remember to comment out the code!)
# p student.id 			--> This doesn't work you get an error as there's no method defined the Active Record object
# p student.name 		--> Ditto for everything else here
# p student.email
# p student.age


# 8. Find student by name using find_by
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?

	# student = Student.find_by(name: "Dr. Lois Pfeff")
	# p student 				#--> Returns you a USER OBJECT/STUDENT OBJECT

	# Student.find(7) #--> If you use .find instead of .find_by, it'll just search by id/the primary key
	# Student.find_by(id: 7) #--> will return you the same USER object as above


# What will the following return to you?
# p student.id
# p student.name
# p student.email
# p student.age			# --> This time, since student has become a user object, all these methods will work and return you just that bit of info

# Do research on the difference between "where" and "find_by".
	# .where returns a Active Record Object, .find_by returns a User Object
	# Both find and find_by return a single record
	# .where will return an active record relation with zero or more records you need to use first to return only one record or nil in case zero records return.

	# find and find_by get you only 1 item (the first hit you get) (e.g. the first student they can find who is 18)
	# where gets you ALL objcts that fulfill the criteria (e.g. all the students who are 18)

# 9. Find the student with id = 7 using find and find_by
# pay attention to the object that is returned to you, is it the User object or Active Record relation object?
	# See above


# 10. Update information for student with id = 5 using student.email and save. Change the student's email to elsie@example.com
	# student = Student.find(5)
	# p student
	# student.email = "elsie@example.com"
	# student.save
	# p student # check that the email has indeed been updated.


# 11. Now use update to update this student's age to 21.
	# student = Student.find(5)
	# student.update(age: 21)
	# p student

# 12. Delete student with id 21 using delete
	# student = Student.find(21)
	# student.delete
	# p Student.all.count # there should be 21 students left in the database

# 13. Delete student with id 22 using destroy
	# student = Student.find(22)
	# student.destroy
	# p Student.all.count # there should be 20 records left in the database
