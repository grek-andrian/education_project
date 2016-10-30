# Define StudentSerializer class
class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name,
             :age, :group_id, :school_id

end
