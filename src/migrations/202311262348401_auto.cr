# Generated by Marten 0.3.2 on 2023-11-26 23:48:40 -05:00

class Migration::Main::V202311262348401 < Marten::Migration
  depends_on :main, "202311262344521_auto"

  def plan
    change_column :main_agent, :created_at, :date_time, null: true

    change_column :main_agent, :updated_at, :date_time, null: true
  end
end
