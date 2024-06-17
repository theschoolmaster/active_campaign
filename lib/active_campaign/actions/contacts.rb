module ActiveCampaign
  module Actions
    module Contacts

      def contacts
        parse_response self.class.get("/contacts", headers: @headers)
      end

      def contact(id)
        parse_response self.class.get("/contacts/#{id}", headers: @headers)
      end

      def contact_create(options = {})
        parse_response self.class.post("/contacts", headers: @headers, body: { contact: options }.to_json)
      end

      def contact_update(id, options = {})
        parse_response self.class.put("/contacts/#{id}", headers: @headers, body: { contact: options }.to_json)
      end

      def contact_delete(id)
        parse_response self.class.delete("/contacts/#{id}", headers: @headers)
      end

      def contact_sync(options = {})
        parse_response self.class.post("/contact/sync", headers: @headers, body: { contact: options }.to_json)
      end

      def contact_find_by_email(email)
        c = parse_response self.class.get("/contacts?email=#{email}", headers: @headers)

        # only grabbing one contact, unwrap and return
        c["contacts"]&.first
      end

      def contact_field_values(id)
        parse_response self.class.get("/contacts/#{id}/fieldValues", headers: @headers)
      end

      # these should probably get moved but way easier for now

      def contact_update_list_status(options = {})
        parse_response self.class.post("/contactListss", headers: @headers, body: { contactList: options }.to_json)
      end

      def contact_add_note(options = {})
        parse_response self.class.post("/notes", headers: @headers, body: { note: options }.to_json)
      end

    end
  end
end
