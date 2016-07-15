class JournalEntriesController < ApplicationController
  before_action :authenticate_user!
  def show
    @entry = JournalEntry.eager_load(:comments).find(params[:id])
  end
end
