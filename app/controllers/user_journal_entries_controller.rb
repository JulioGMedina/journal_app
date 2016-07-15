class UserJournalEntriesController< ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_entry, only: [ :edit, :update, :destroy ]

  def index
    @entries = @user.journal_entries
  end

  def new
    @entry = @user.journal_entries.build
  end

  def create
    @entry = @user.journal_entries.new(entry_params)
    if @entry.save
      redirect_to user_journal_entries_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @entry.update_attributes(entry_params)
      redirect_to user_journal_entries_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to user_journal_entries_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_entry
    @entry = @user.journal_entries.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:content)
  end
end
