class Assignment < ActiveRecord::Base
  belongs_to :student
  
   def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
       assignment = find_by_id(row["id"]) || new
       assignment.attributes = row.to_hash.slice(*Assignment.attribute_names())
       assignment.save!
    end
    end
end
