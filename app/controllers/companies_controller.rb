class CompaniesController < ApplicationController

  before_filter :set_company_id, :except => [:index, :new]

  def set_company_id
    @company = Company.first
  end

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  def employee_profile
    @new_comment = SpreadsheetComment.new
    @comments = SpreadsheetComment.where(:employee_id => params[:employee_id], :commented_on => nil).order('created_at DESC')
    session = GoogleDrive.login(@company.gmail, @company.gpassword)

    @sheet_id = params[:employee_id].to_i
    # Employee Sheet
    @es = session.spreadsheet_by_key(@company.drive_id).worksheets[@sheet_id]
    @upcomings = []

    for i in 1..@es[3, 9].to_i do
      hash = { :date => @es[4+i, 8] + " " + @es[4+i, 9], :start_time => @es[4+i, 10], :end_time => @es[4+i, 11], :dur => @es[4+i, 12], :pay => @es[4+i, 13] }
      @upcomings << hash
    end

    @previous = []

    for i in 1..@es[15, 9].to_i do
      hash = { :date => @es[17+i, 8] + " " + @es[17+i, 9], 
        :start_time => @es[17+i, 10], :end_time => @es[17+i, 11], :dur => @es[17+i, 12],
        :act_start_time => @es[17+i, 13], :act_end_time => @es[17+i, 14], :act_dur => @es[17+i, 15], :note => @es[17+i, 16]
      }
      @previous << hash
    end

  end

  def weekly_schedule
    session = GoogleDrive.login(@company.gmail, @company.gpassword)
    @es = session.spreadsheet_by_key(@company.drive_id).worksheets[1]
    @url = @es[1,5]
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    session = GoogleDrive.login(@company.gmail, @company.gpassword)

    # Schedule Sheet
    @ss = session.spreadsheet_by_key(@company.drive_id).worksheets[0]
    @schedule = []

    for i in 1..@ss[1, 2].to_i do
      hash = { :id => (i+1), :name => @ss[i+1, 4], :start_time => @ss[i+1, 5][0..1].to_i, :end_time => @ss[i+1, 6][0..1].to_i, :note => @ss[i+1, 10] }
      @schedule << hash
    end

    #Event Sheet
    @es = session.spreadsheet_by_key(@company.drive_id).worksheets[1]
    @events = []
    for i in 1..@es[1,2].to_i do
      @events << @es[i,3]
    end


    @new_comment = SpreadsheetComment.new
    @comments = SpreadsheetComment.where(:employee_id => 1, :commented_on => nil).order('created_at DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  def create_comment
    @comment = SpreadsheetComment.new(params[:spreadsheet_comment])

    if @comment.save
      redirect_to :back
      flash[:notice] = "A new comment has been added."
    else
      redirect_to :back
      flash[:notice] = "Error. Please try again."
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
end
