class ArticlesSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :body, :image

  belongs_to :user, serializer: VeryBasicUserInfoSerializer

  def image 
    ActiveStorage::Current.set(host: "https://www.example.com") do
      object.image.service_url
    end
    # rails_blob_url(object.image)
    #object&.image&.service_path(expires_in: 1.hour, disposition: 'inline')
  end
end
