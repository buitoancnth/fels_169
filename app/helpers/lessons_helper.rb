module LessonsHelper

  def result_status answer
    if answer.nil?
      "default"
    elsif answer.is_correct
      "success"
    else
      "danger"
    end
  end

  def result_lesson lesson
    "#{[lesson.answers.answer_correct.size, lesson.answers.size].join("/")} #{t("words")}"
  end
end
