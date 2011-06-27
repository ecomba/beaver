require 'rubygems'
require File.join(File.dirname(__FILE__), 'features/testapp')
require File.join(File.dirname(__FILE__), 'lib/beaver')

use Beaver
run Website
