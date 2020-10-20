# README

## Userテーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| email         | string     | null: false |
| password      | string     | null: false |
| country_id    | integer    | null: false |
| profile       | text       |             |
| birthday      | date       | null: false |

### Associate
- has_many :messages
- has_many :posts
- has_many :likes
- has_many :user_rooms
- has_many :rooms, through: :room_users
- has_many :favorites, through: :like, sources: :post



## Postテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| place         | string     |                                |
| user_id       | references | null: false, foreign_key: true |

### Associate
- belongs_to :user
- has_many :likes
- has_many :users, through: :likes
- has_many :post_rooms
- has_many :rooms, through: :post_rooms
- has_many :post_tag_relations
- has_many :tags, through: :post_tag_relations



## Likes
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| post_id | references | null: false, foreign_key: true |

### Associate
- belongs_to :user
- belongs_to :post



## Roomテーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     |             |

### Association
- has_many :messages
- has_many :user_rooms
- has_many :users, through: :user_rooms
- has_many :post_rooms
- has_many :posts, through: :post_rooms



## User_roomsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| room_id | references | null: false, foreign_key: true |

### Associate
- belongs_to :user
- belongs_to :room



## Post_roomsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_id | references | null: false, foreign_key: true |
| room_id | references | null: false, foreign_key: true |

### Associate
- belongs_to :room
- belongs_to :post



## Messagesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| room_id | references | null: false, foreign_key: true |

### Associate
- belongs_to :user
- belongs_to :room



## Tagsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null:false, uniqueness: true   |

### Associate
- has_many :post_tag_relations
- has_many :post, through: :post_tag_relations



## Post_tag_relationsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_id | references | foreign_key: true              |
| tag_id  | references | foreign_key: true              |

### Associate
- belongs_to :post
- belongs_to :tag