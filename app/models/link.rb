class Link < ApplicationRecord
    validates :link_source, presence: true
    validates :link_short, presence: true
  end