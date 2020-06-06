class User < ApplicationRecord
  mount_uploader :image_id, ImagesUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :name, presence: true, length: { maximum: 50, minimum: 2 }

  has_many :idols
  has_many :places
  has_many :events
  has_many :place_photos
  has_many :event_photos

  has_many :favorites, dependent: :destroy
  has_many :favorite_idols, through: :favorites, source: :idol
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_places, through: :bookmarks, source: :place
  has_many :goods, dependent: :destroy
  has_many :good_event_photos, through: :goods, source: :event_photo

  has_many :place_comments, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :event_registers, dependent: :destroy
  has_many :event_event_registers, through: :event_registers, source: :event, dependent: :destroy

  # フォロワー機能
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy # フォロー取得
  # 外部キーの定義
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy # フォロワー取得
  # 外部キーの定義
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  # foregin_key = 入口　source = 出口　through: :○○○ = 中間テーブルは○○○
  # follower_id(自分) → follower_id(自分)を目印にfollower(中間テーブル)に入り,
  # followed_id(自分がフォローしている人＝他人)の情報を取得して出てくる。
  # following_userで取得できるのは自分がフォローしている＝他人のデータ

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  # Twitter認証
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        provider_image_id: auth.info.image.gsub(/http/,'https').gsub(/_normal/,''),
        name: auth.info.name,
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
