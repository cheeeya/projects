require_relative 'questions_database'
require_relative 'user'
require_relative 'question'
require_relative 'model_base'

class Reply < ModelBase
  attr_accessor :og_question_id, :parent_reply_id, :reply_author_id, :body
  attr_reader :id

  # Obsolete with new parent class
  # def self.find_by_id(id)
  #   reply = QuestionsDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       replies
  #     WHERE
  #       replies.id = ?
  #   SQL
  #   return nil if reply.empty?
  #   Reply.new(reply.first)
  # end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.reply_author_id = ?
    SQL
    return nil if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.og_question_id = ?
    SQL
    return nil if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @og_question_id = options['og_question_id']
    @parent_reply_id = options['parent_reply_id']
    @reply_author_id = options['reply_author_id']
    @body = options['body']
  end

  def author
    User.find_by_id(@reply_author_id)
  end

  def question
    Question.find_by_id(@og_question_id)
  end

  def parent_reply
    raise "#{self} does not have a parent reply" if @parent_reply_id.nil?
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    child_replies = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.parent_reply_id = ?
    SQL
    raise "#{self} does not have any child replies" if child_replies.empty?
    child_replies.map { |child_reply| Reply.new(child_reply) }
  end

  def save
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, @og_question_id, @parent_reply_id, @reply_author_id, @body, @id)
        UPDATE
          replies
        SET
          og_question_id = ?, parent_reply_id = ?, reply_author_id = ?, body = ?
        WHERE
          id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, @og_question_id, @parent_reply_id, @reply_author_id, @body)
        INSERT INTO
          replies (og_question_id, parent_reply_id, reply_author_id, body)
        VALUES
          (?, ?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end
end
