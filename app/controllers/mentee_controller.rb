class MenteeController < ApplicationController
  before_action :authenticate_mentee!
  before_action :find_survey, only: [:answers, :complete]

  def home
  end

  def list_surveys
    mentee_surveys = current_mentee.mentee_surveys
    completed_survey_ids = mentee_surveys.where(:is_done => true).pluck(:survey_id)
    incomplete_survey_ids = mentee_surveys.where(:is_done => false).pluck(:survey_id)
    # TODO: lookup join table scoping queries?
    completed_surveys = current_mentee.surveys.where(id: completed_survey_ids)
    incomplete_surveys = current_mentee.surveys.where(id: incomplete_survey_ids)
    @survey_hash = {"Incomplete Surveys" => incomplete_surveys, "Completed Surveys" => completed_surveys}

  end

  def answers
  end

  def complete
  end
  #list all the surveys and the status of each survey, along with its due date

  #list the boolean in the join table, since that is specific to the one instance
private
    def find_survey
      @survey = current_mentee.surveys.find(params[:survey_id])
    end
end
