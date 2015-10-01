class LogTagging < ActiveRecord::Base
  belongs_to :log
  belongs_to :tag
end
