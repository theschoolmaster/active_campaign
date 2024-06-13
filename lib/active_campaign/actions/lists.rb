module ActiveCampaign
  module Actions
    module Lists

      def lists
        parse_response self.class.get("/lists", headers: @headers)
      end

      def list(id)
        parse_response self.class.get("/lists/#{id}", headers: @headers)
      end

      def list_create(options = {})
        parse_response self.class.post("/lists", headers: @headers, body: { list: options }.to_json)
      end

      def list_delete(id)
        parse_response self.class.delete("/lists/#{id}", headers: @headers)
      end

      def list_id_mapping()
        self.lists["lists"].map{ |f| [f["name"],f["id"]] }.to_h
      end

    end
  end
end
