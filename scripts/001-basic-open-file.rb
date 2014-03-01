#### Let's open a file with Ruby
# We use `open`, which is a *class* method of the `File` class 
# and pass in two `String` arguments:
#
# 1. The file path
# 2. The *mode*, in this case `'r'`
file = File.open('data/legislators.csv', 'r')

# `file` is the label/name we'll use to refer to this *instance* of a `File` object
#
# This is often confusing: `file` does not explicitly contain what you might expect: a 
# giant `String` that holds all of the characters found in the `legislators.csv` text file
#
# Instead, `file` can be thought of as a *handle* that we use to *read* the data from. We'll see
# later that there are various ways we can read a file: one line at a time, or even one 
# character at a time. 
#
# For now, we'll just gulp all the text into one `String`, which we'll refer to by the
# `data` label 
data = file.read


# Confirm that `data` actually contains a bunch of characters by invoking the
# `String` *instance* method, `length`
puts "#{data.length} characters"

# You'll see this:
#
#     => 221224 characters
#
# And if you are curious, you can just print the whole thing to screen:
puts data

# Now that we've read all the data from `file`, we `close` it:
file.close
# Nothing horrible (in *general*) will happen if you forget to `close` a file,
# so you won't notice any negative consequences in simple examples like these.
# However, it is *good* practice, and not soemthing you want to be sloppy about 
# in production apps.
#
# In the next example, we'll see Ruby's more idiomatic style, which we'll use
# going forward.