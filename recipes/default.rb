#
# Cookbook Name:: history-analysis
# Recipe:: default
#
# Copyright 2015, Mapzen
#
# Available under the GNU GPLv3, see LICENSE for more details.
#

%w(
  history-analysis::setup
  history-analysis::deploy
).each do |r|
  include_recipe r
end
