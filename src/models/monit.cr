class Agent < Marten::Model
  with_timestamp_fields
  field :id, :uuid, primary_key: true, unique: true, index: true
  field :name, :string, max_size: 40
  field :version, :string, max_size: 25
  field :state, :int, primary_key: false, default: 1

end

class Service < Marten::Model
  with_timestamp_fields
  field :id, :big_int, primary_key: true, auto: true, index: true
  field :agent, :many_to_one, to: Agent, index: true
  field :name, :string, max_size: 40
  field :status, :int, primary_key: false, null: true
  field :state, :int, primary_key: false, null: true
  field :svc_type, :int, primary_key: false, null: true
  field :monitor, :int, primary_key: false, null: true
  field :event, :string, null: true, max_size: 300
  field :data, :json, null: true
  db_unique_constraint :agent_name_constraint, field_names: [:agent, :name]

end

class Ack < Marten::Model
  with_timestamp_fields
  field :id, :big_int, primary_key: true, auto: true, index: true
  field :service, :one_to_one, to: Service
  field :state, :bool
end

class Alert < Marten::Model
  field :id, :big_int, primary_key: true, auto: true
  field :agent, :many_to_one, to: Agent
end