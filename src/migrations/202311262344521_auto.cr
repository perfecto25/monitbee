# Generated by Marten 0.3.2 on 2023-11-26 23:44:52 -05:00

class Migration::Main::V202311262344521 < Marten::Migration
  depends_on :main, "202309120903501_auto"

  def plan
    add_column :main_agent, :created_at, :date_time, null: true

    add_column :main_agent, :updated_at, :date_time, null: true

    add_column :main_agent, :state, :int, default: 1

    add_column :main_service, :created_at, :date_time

    add_column :main_service, :updated_at, :date_time

    add_column :main_service, :status, :int, null: true

    add_column :main_service, :state, :int, null: true

    add_column :main_service, :svc_type, :int, null: true

    add_column :main_service, :monitor, :int, null: true

    add_column :main_service, :event, :string, max_size: 300, null: true

    add_column :main_service, :data, :json, null: true

    change_column :main_service, :id, :big_int, primary_key: true, auto: true, index: true

    change_column :main_agent, :id, :uuid, primary_key: true, unique: true, index: true

    add_unique_constraint :main_service, :agent_name_constraint, [:agent_id, :name]

    create_table :main_ack do
      column :created_at, :date_time
      column :updated_at, :date_time
      column :id, :big_int, primary_key: true, auto: true, index: true
      column :state, :bool
      column :service_id, :reference, to_table: :main_service, to_column: :id, unique: true
    end
  end
end
