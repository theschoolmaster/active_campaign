module ActiveCampaign
  module Actions
    module Fields

      def fields
        parse_response self.class.get("/fields", headers: @headers)
      end

      def field(id)
        parse_response self.class.get("/fields/#{id}", headers: @headers)
      end

      def field_create(options = {})
        parse_response self.class.post("/fields", headers: @headers, body: { field: options }.to_json)
      end

      def field_update(id, options = {})
        parse_response self.class.put("/fields/#{id}", headers: @headers, body: { field: options }.to_json)
      end

      def field_delete(id)
        parse_response self.class.delete("/fields/#{id}", headers: @headers)
      end

      def field_id_mapping()
        self.fields["fields"].map{ |f| [f["title"],f["id"]] }.to_h
      end

    end
  end
end
