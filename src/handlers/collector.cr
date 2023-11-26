require "xml"

class CollectorHandler < Marten::Handler
  protect_from_forgery false
  def post
    body = request.body
    xml = XML.parse(body)
    #puts xml
#    puts xml.first_element_child.not_nil!
    # data = xml.first_element_child

    
    # if data
    #   monit_id = data["id"] # "1" : String?
    
    #   #puts typeof(data.children)                       # XML::NodeSet
    #   data.children.select(&.element?).each do |child| # Select only element children
    #     puts typeof(child)                               # XML::Node
    #     puts "child name: #{child.name}"                                  # firstname : String
    #     puts child.content
    #     puts "-----------"                               # Jane : String?
    #   end

    # end

    monit_id = xml.xpath_node("//monit/@id")
    puts monit_id
    puts xml.xpath_node("//monit/server/uptime")
    services =  xml.xpath_node("//monit/services")
    # services.each do |svc|
    #  puts svc 
    # end  

    #node.content
    #puts typeof(data)
    #if data
    #  puts typeof(data["id"])
      # agent = Agent.all.get_or_create!( id: data["id"]) do |new_record|
      #   new_record.id = data["id"]
      #   new_record.version = data["version"]
      # end
    #end
    respond("ok")
  end
end
