local home= os.getenv('HOME')
vim.g['dotoo#agenda#files']= { home.. '/Documents/org/**/*.dotoo' }
vim.g['dotoo#capture#refile']=home..'/Documents/org/refile.dotoo'
