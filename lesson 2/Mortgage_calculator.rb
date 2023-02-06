require 'yaml'
MESSAGES = YAML.load_file('Mortgage.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

loan = ''
prompt(MESSAGES['welcome'])

loop do
  loan = gets.chomp
  if integer?(loan)
    break
  else prompt(MESSAGES['valid'])
  end
end

apr = ''
prompt(MESSAGES['rate'])

loop do
  apr = gets.chomp
  if number?(apr)
    break
  else prompt(MESSAGES['valid'])
  end
end

time = ''
prompt(MESSAGES['time'])

loop do
  time = gets.chomp
  if number?(time)
    break
  else prompt(MESSAGES['valid'])
  end
end

months = time.to_i * 12
aprr = apr.to_i.to_f / 100
mapr = (aprr / 12)
loans = loan.to_i

payment = loans.to_f * (mapr / (1 - (1 + mapr)**(-months)))

prompt "Your Monthly payment will be #{payment}, have a wonderful day!"
