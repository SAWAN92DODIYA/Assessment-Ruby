class EmployeeInformation
  def initialize
    @employees_info = {}
  end

  def collect_data(employees_info, threshold)
    @employees_info = employees_info
    @threshold = threshold

    filtered_employees = filter_employees(@employees_info, @threshold)
    sorted_employees = sort_employees(filtered_employees)
    formatted_string = format_employees(sorted_employees)

    write_to_file(formatted_string)
  end

  private

  def filter_employees(employees_info, threshold)
    employees_info.select { |id, details| details[:performance] > threshold }
  end

  def sort_employees(filtered_employees)
    filtered_employees.sort_by do |id, details|
      [details[:department], -details[:salary], details[:age]]
    end
  end

  def format_employees(sorted_employees)
    formatted_string = ""
    current_department = ""

    sorted_employees.each do |id, details|
      if details[:department] != current_department
        formatted_string += "\nDepartment: #{details[:department]}\n"
        current_department = details[:department]
      end
      formatted_string += " Name: #{details[:name]}, Age: #{details[:age]}, Salary: #{details[:salary]}\n"
    end

    formatted_string.strip
  end

  def write_to_file(formatted_string)
    File.open('employee_details.txt', 'w') do |file|
      file.puts formatted_string
    end
  end
end

# Sample Input
employees = {
  101 => {name: "Alice", age: 30, salary: 70000, department: "HR", performance: 85},
  102 => {name: "Bob", age: 25, salary: 90000, department: "IT", performance: 95},
  103 => {name: "Charlie", age: 35, salary: 120000, department: "IT", performance: 90},
  104 => {name: "David", age: 40, salary: 60000, department: "Finance", performance: 70},
  105 => {name: "Eve", age: 28, salary: 110000, department: "IT", performance: 99},
  106 => {name: "Sawan",age:23,salary:5000,department:"Sales",performance:81}
}

threshold = 80

employee_information = EmployeeInformation.new
employee_information.collect_data(employees, threshold)





