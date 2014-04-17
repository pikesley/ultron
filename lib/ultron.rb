require 'singleton'
require 'curb'
require 'dotenv'
require 'json'
require 'yaml'
require 'digest'
require 'ostruct'
require 'active_support/core_ext/string'

require "pry"

require 'ultron/version'
require 'ultron/auth'
require 'ultron/config'
require 'ultron/connection'
require 'ultron/url'

require 'ultron/models/entities'
require 'ultron/models/characters'
require 'ultron/models/comics'
require 'ultron/models/creators'
require 'ultron/models/events'
require 'ultron/models/series'
require 'ultron/models/stories'

require 'ultron/exceptions/marvel_exception'
require 'ultron/exceptions/ultron_exception'
