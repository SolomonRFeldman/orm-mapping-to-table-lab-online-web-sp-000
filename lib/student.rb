class Student
  attr_accessor :name, :grade
  attr_reader :id
  
  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end
  
  def save
    sql = <<-SQL
      INSERT INTO students(name, grade)
      VALUES (?, ?)
    SQL
    DOC[:conn].execute(sql, self.name, self.grade)
    
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE_TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER
      );
    SQL
    DOC[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = "DROP TABLE students;"
    DOC[:conn].execute(sql)
  end

end
