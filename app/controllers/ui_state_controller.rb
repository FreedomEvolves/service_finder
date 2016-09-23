class UiStateController < ApplicationController
  def clear_selected_profile
  end

  def back_to_profile
    event = Event.find(params[:event_id])
    if current_user.client?
      @profile = current_user.providers.find(event.provider_id).to_profile_presenter

    elsif current_user.provider?
      @profile = current_user.clients.find(event.client_id).to_profile_presenter
    end
  end
end
