Sequel.migration do
  up do
    create_table(:cars) do
      primary_key :id
      String :make, :null=>false
      String :model, :null=>false
      String :color, :null=>false
    end
  end

  down do
    drop_table(:cars)
  end
end