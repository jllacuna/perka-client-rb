# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    class Question < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :address,
        :state,
        :country,
        :email,
        :first_name,
        :last_name,
        :phone,
        :full_name,
        :city,
        :subject,
        :lead_source,
        :marketing_source,
        :zip,
        :business_name,
        :current_url,
        :device,
        :media_outlet,
        :question,
        :question_type
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end