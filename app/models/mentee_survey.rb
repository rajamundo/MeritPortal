class MenteeSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :mentee
end

# == Schema Information
#
# Table name: mentee_surveys
#
#  id         :integer          not null, primary key
#  mentee_id  :integer
#  survey_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_done    :boolean          default(FALSE)
#
