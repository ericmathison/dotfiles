Pry.config.editor = "vim"
Pry.config.pager = false

# Using this custom printer saves vertical space in the ouput
Pry.config.print = proc do |output, value|
    result = "=> #{value.inspect}"
    puts CodeRay.scan(result, :ruby).term
end

# See https://gist.github.com/jimweirich/4950443
def edit(file, line)
  `gvim #{file} +#{line}`
end

def src(object, method)
  if object.respond_to?(method)
    meth = object.method(method)
  elsif object.is_a?(Class)
    meth = object.instance_method(method)
  end
  location = meth.source_location
  edit(*location) if location
  location
rescue NameError => ex
  nil
end
