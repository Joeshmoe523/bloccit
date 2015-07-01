class FavoriteMailer < ApplicationMailer

  default from: "joeshmoe523@gmail.com"

  def new_comment(user, post, comment)

    #New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@joe-bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@joe-bloccit.example>"
    headers["References"] = "<post/#{post.id}@joe-bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
    
  end

end
