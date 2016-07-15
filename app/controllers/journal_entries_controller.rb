class JournalEntriesController < ApplicationController
  before_action :authenticate_user!
  def show
    @entry = JournalEntry.find(params[:id])
  end
end
