# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Feedback left by a Customer after a Visit has been completed.
    class FeedbackItem < BaseEntityGlobal

      PROPERTY_NAMES = [
        :visit,
        :signed,
        :customer_name,
        :feedback,
        :rating
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/visit'
      TYPE_MAP = {
        :visit => Perka::Model::Visit
      }

    end
  end
end