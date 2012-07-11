# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    class Question < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :email,
        :first_name,
        :last_name,
        :phone,
        :city,
        :subject,
        :lead_source,
        :marketing_source,
        :zip,
        :business_name,
        :current_url,
        :media_outlet,
        :question,
        :question_type,
        :address,
        :state,
        :country,
        :device,
        :full_name
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end