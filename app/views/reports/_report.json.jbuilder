json.extract! report, :id, :commentable_type, :commentable_id, :user_id, :body, :created_at, :updated_at
json.url report_url(report, format: :json)
