class ContactsController < ApplicationController
  def new
    @errors = []
  end
  
  def create
    @errors = []
    
    if params[:name].empty?
      @errors << '名前が未入力です。'
    end
    
    if params[:email].empty?
      @errors << 'メールアドレスが未入力です。'
    end
    
    if params[:text].empty?
      @errors << 'お問い合わせ内容が未入力です。'
    end
    
    if params[:text].length > 500
      @errors << '500文字以内で入力してください。'
    end
    
    if @errors.present?
      render 'new' and return
    end
    
        csv = CSV.open("tmp/contacts.csv", "a")
        time = Time.now;          #変数timeにいまの日時を取得するメソッドを代入
        csv.puts([params[:name], params[:email], params[:text], time.strftime("%Y/%m/%d %H:%M:%S")]) 
        csv.close
        redirect_to("/") #他のURLに転送すること　→トップページに転送する
 
  end
end
