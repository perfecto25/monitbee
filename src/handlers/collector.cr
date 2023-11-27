require "xml"
require "xml_converter"
require "json"
require "uuid"


class CollectorHandler < Marten::Handler
  protect_from_forgery false
  def post
    body = request.body
    xml = XML.parse(body)
    hash = XMLConverter.new(xml).to_h

    if hash && hash["monit"]
      begin
        h = hash["monit"].to_json
        json = JSON.parse(h)
        monit_id = UUID.new(json["id"].to_s)
        name = json["server"]["localhostname"].to_s
        monit_version = json["version"].to_s
        puts monit_id
        puts typeof(monit_id)
        puts monit_version
        puts typeof(monit_version)
      rescue exception
        puts exception
      end
    end


    if monit_id
      agent = Agent.all.get_or_create!(id: monit_id) do |new_record|
        new_record.id = monit_id
        new_record.name = name
        new_record.version = monit_version
        new_record.state = 1
      end
      puts agent
    end
    respond("ok")
  end
end
