# Generated by Marten 0.3.2 on 2023-08-31 23:57:34 -04:00

class Migration::Main::V202308312357341 < Marten::Migration
  def plan
    create_table :main_host do
      column :id, :big_int, primary_key: true, auto: true
      column :name, :string, max_size: 40
    end
  end
end