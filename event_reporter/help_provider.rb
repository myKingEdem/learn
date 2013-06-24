module HelpProvider
  def self.process_help(input)
    parts = input.split
    if parts.last == 'help'
      list_all_commands
    else
      describe_each_command(input)
    end
  end

  def self.list_all_commands
    puts 'Usage: help [command]'
    commands = ['find', 'queue print', 'queue save', 'queue count', 'queue clear']
    commands.each { |command| puts command }
  end

  def self.describe_each_command(input)
    parts = input.split
    parts.delete_at(0)
    command = parts.join(' ')
    case command
    when 'find' then describe_find_command
    when 'queue print' then describe_print_command
    when 'queue save' then describe_save_command
    when 'queue count' then describe_count_command
    when 'queue clear' then describe_clear_command
    else
     puts "Unknown command: #{ command }"
    end
  end

  def self.describe_find_command
    puts "find      find a record by a persons attribute      eg. find last_name Morris"
    puts "a new search clears the current queue"
  end

  def self.describe_print_command
    puts "queue print     print all records in a queue"
  end

  def self.describe_save_command
    puts "queue save      save the current queue to a file.    NOTE: Not Implemented"
  end

  def self.describe_count_command
    puts "queue count     count the number of records in a queue after a search"
  end

  def self.describe_clear_command
    puts "queue clear     clears the current queue"
  end
end