BASE_DIR = Dir.pwd

cookbook_path [
  BASE_DIR + '/cookbooks',
  BASE_DIR + '/vendor/cookbooks'
]

role_path BASE_DIR + '/roles'
