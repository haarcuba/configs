#!/usr/bin/env ruby
require 'rake'


def current_branch
  `git rev-parse --abbrev-ref HEAD`
end

match_data = current_branch.match(/(?<ticket>CM-\d+)-(?<rest>.*)/)
ticket = match_data.named_captures['ticket']
rest = match_data.named_captures['rest']
title_text = rest.gsub('-', ' ')
pull_request_title = "[#{ticket}] #{title_text}"

puts "will create PR with title: #{pull_request_title}"
puts "OK? (Y/n)"
answer = gets.strip.downcase
exit(1) if ! ['yes', 'y' ].include?(answer)


sh "gh pr create -t '#{pull_request_title}'"

