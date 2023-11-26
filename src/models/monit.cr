class Agent < Marten::Model
  field :id, :uuid, primary_key: true, unique: true
  field :name, :string, max_size: 40
  field :version, :string, max_size: 25
end

class Service < Marten::Model
  field :id, :big_int, primary_key: true, auto: true
  field :agent, :many_to_one, to: Agent
  field :name, :string, max_size: 40
end 

class Alert < Marten::Model 
  field :id, :big_int, primary_key: true, auto: true 
  field :agent, :many_to_one, to: Agent
end