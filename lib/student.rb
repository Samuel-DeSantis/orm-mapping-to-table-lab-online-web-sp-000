class Student
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id=nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS songs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        album TEXT
        )
      SQL
      DB[:conn].execute(sql)
  end

  def self.create(name, grade)
    student = Student.new(name, grade)
    student.save
    student
  end

  def self.drop_table

  end

  def save
    sql = <<-SQL
      INSERT INTO songs (name, grade)
      VALUES songs_name, songs_grade
    SQL

    DB[:conn].execute(sql, self.name, self.grade)
  end

end
