class EntriesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: [:edit, :update, :destroy]

  # POST /entries/lookup
  def lookup
    word = params['word-mirror'][0].strip

    Ldoce::Word.api_key = "c76094e55b60175b5cbb4c91d15f9701"

    lookup = Ldoce::Word.search(word)
    find_def = lookup.definition
    find_word = lookup.word
    find_def = find_def.gsub!( '","', "</li><li>" )
        find_def = find_def.gsub!( '"', "<ol>" )

    find_mp3 = lookup.mp3_url

   # lookup2 = Ldoce::Word.search(word)
    #find2 = lookup2.definition

    #api_key = "c76094e55b60175b5cbb4c91d15f9701"
    #response = HTTParty.get('https://api.pearson.com/longman/dictionary/entry.json?q=' + word + '&apikey=' + api_key)
#   @lookup = response['Entries']['Entry']['Sense'][0]['Subsense'][0]['DEF']['#text']
     #format.json { render json: @lookup} 
  # render :partial => @lookup, :content_type =>'text/html'
 #render :partial => @lookup2, :content_type =>'text/html'
  #render :partial => 'lookup', :content_type =>'text/html'
  #render :partial => 'lookup2', :content_type =>'text/html'
  render :text => '<h2>Word: ['+find_word+']</h2>'+'<center><audio controls="controls"><source src="'+ find_mp3 +'" type="audio/mp3"></audio></center>' +'<br><h3>'+ find_def + '</h2>' , :content_type =>'text/html'
 #render :text => find_word
 # render :text => find_pronounce, :content_type =>'text/html' 
  #render :text => find_mp3, :content_type =>'text/html'
  #render :partial => 'find2', :content_type =>'text/html'
  end

  # GET /entries
  # GET /entries.json    
  def index
    @entries = Entry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = current_user.entries.build(params[:entry])
    url = params[:entry][:imageurl]
    @entry.picture_from_url(url)
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end
  
  def search(word)
    @api_key = "c76094e55b60175b5cbb4c91d15f9701"

    return HTTParty.get('https://api.pearson.com/longman/dictionary/entry.json?q=' + word + '&apikey=' + @api_key)
  end
    
  private
    def correct_user
      @entry = current_user.entries.find_by_id(params[:id])
      redirect_to root_url if (@micropost.nil? || current_user.admin?)
    end  

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end    
end
