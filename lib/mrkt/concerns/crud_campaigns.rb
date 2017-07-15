module Mrkt
  module CrudCampaigns

    def get_campaign(id)
      get("/rest/v1/campaigns/#{id}.json")
    end

    def request_campaign(id, lead_ids, tokens = {})
      post("/rest/v1/campaigns/#{id}/trigger.json") do |req|
        params = {
          input: {
            leads: map_lead_ids(lead_ids),
            tokens: tokens
          }
        }

        json_payload(req, params)
      end
    end
  end
end
