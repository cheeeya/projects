def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie.select(:id, :title)
    .joins(:actors)
    .where(actors: { name: those_actors })
    .group(:id)
    .having('COUNT(actors.id) = ?', those_actors.length)
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .group("LEFT(CAST(yr AS varchar(4)),3)")
    .order('AVG(score) DESC')
    .pluck("CAST(LEFT(CAST(yr AS varchar(4)),3) || '0' AS integer)").first
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  # Actor.find_by_sql([
  #   'SELECT
  #     actors.name
  #   FROM
  #     actors
  #   JOIN
  #     castings ON actors.id = castings.actor_id
  #   JOIN
  #     (
  #       SELECT
  #         movies.*
  #       FROM
  #         movies
  #       JOIN
  #         castings ON castings.movie_id = movies.id
  #       JOIN
  #         actors ON castings.actor_id = actors.id
  #       WHERE
  #         actors.name = ?
  #     ) AS movies_with_name ON castings.movie_id = movies_with_name.id
  #   WHERE
  #     actors.name != ?', name, name])

  movies = Movie.select(:id).joins(:actors).where(actors: { name: name })
  Actor.joins(:movies).where(movies: { id: movies } ).where.not( name: name ).pluck(:name).uniq
  #Actor.joins(:castings).joins("JOIN (#{movies}) AS movies_with_name ON movies_with_name.id = castings.movie_id").where.not(actors: { name: name }).pluck(:name)

end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor.left_outer_joins(:movies).where(movies: { id: nil }).pluck(:name).length
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  string = ""
  whazzername.chars.each do |letter|
    string+= "%" + letter.upcase
  end
  string += "%"

  Movie.select('movies.*').joins(:actors).where("upper(actors.name) LIKE '#{string}'")
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

  Actor
    .select('actors.id, actors.name, max(movies.yr) - min(movies.yr) as career')
    .joins(:movies)
    .group(:id)
    .order('max(movies.yr) - min(movies.yr) DESC')
    .order(:name)
    .limit(3)

end
