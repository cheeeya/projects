require_relative 'questions_database'
require_relative 'user'
require_relative 'question'
require_relative 'model_base'

class QuestionLike < ModelBase
  attr_accessor :question_id, :user_id
  attr_reader :id

  # Obsolete with new parent class
  # def self.find_by_id(id)
  #   like = QuestionsDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       question_likes
  #     WHERE
  #       id = ?
  #   SQL
  #   return nil if follow.empty?
  #   QuestionLikes.new(like.first)
  # end

  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL
    return nil if likers.empty?
    likers.map { |user| User.new(user) }
  end

  def self.num_likes_for_question_id(question_id)
    num_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT DISTINCT
        COUNT(question_id)
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    num_likes.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    liked_questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL
    return nil if liked_questions.empty?
    liked_questions.map { |question| Question.new(question) }
  end

  def self.most_liked_questions(n)
    most_liked_questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(question_likes.question_id)
      LIMIT
        ?
    SQL
    return nil if most_liked_questions.empty?
    most_liked_questions.map { |question| Question.new(question) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end
