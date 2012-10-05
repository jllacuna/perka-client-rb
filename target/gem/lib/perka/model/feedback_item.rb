# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Feedback left by a Customer after a Visit has been completed.
    class FeedbackItem < BaseEntityGlobal

      PROPERTY_NAMES = [
        :visit,
        :rating,
        :signed,
        :customer_name,
        :feedback,
        :visit_uuid
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/visit'
      TYPE_MAP = {
        :visit => Perka::Model::Visit
      }

    end
  end
end