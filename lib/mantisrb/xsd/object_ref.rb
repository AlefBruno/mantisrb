module Mantis::XSD

  class ObjectRef
    
    include Mantis::XSD::DocBuilder

    attr_accessor :id, :name

    # Generate an ObjectRef XSD type given an #element_name
    # that you want to tag it with.
    #
    # Let's say ObjectRef is id: 10, name: "public", and you want
    # to generate the XMl for it under the <style> attribute:
    #
    # to_doc "style"  # should yield
    #
    # <status type="tns:ObjectRef">
    #   <id>10</id>
    #   <name>public</name>
    # </status>
    def to_doc(element_name)
      builder = Nokogiri::XML::Builder.new { |xml|
        xml.send(element_name, type: "tns:ObjectRef") do 
          xml.id_ @id
          xml.name @name
        end
      }
      builder.doc.root
    end
  end # ObjectRef
end # Mantis::XSD
