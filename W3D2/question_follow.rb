require_relative 'questions_database'
require_relative 'user'
require_relative 'question'
require_relative 'model_base'

class QuestionFollow < ModelBase
  attr_accessor :question_id, :following_user_id
  attr_reader :id

  # Obsolete with new parent class
  # def self.find_by_id(id)
  #   q_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       question_follows
  #     WHERE
  #       question_follows.id = ?
  #   SQL
  #   return nil if q_follow.empty?
  #   QuestionFollow.new(q_follow.first)
  # end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_follows ON users.id = question_follows.following_user_id
      WHERE
        question_follows.question_id = ?
    SQL
    return nil if followers.empty?
    followers.map { |follower| User.new(follower) }
  end

  def self.followed_questions_for_user_id(user_id)
    followed_questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      WHERE
        question_follows.following_user_id = ?
    SQL
    return nil if followed_questions.empty?
    followed_questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    most_followed_questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(questions.id) DESC
      LIMIT
        ?
    SQL
    return nil if most_followed_questions.empty?
    most_followed_questions.map { |question| Question.new(question) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @following_user_id = options['following_user_id']
  end

end
