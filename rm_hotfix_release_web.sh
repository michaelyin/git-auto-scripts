#!/bin/bash


delete_a_branch()
{
  git_link=$link_prefix$1$link_affix
  echo "gitlab link: $git_link"
  project_name=$1
  branch=$2
  
  COMMENTS=$@
  echo "delete $branch for project $project_name ..."
  git clone $git_link
  cd $project_name
  git push --delete origin $branch
  
  echo "done deleting $branch with $project_name"
  cd ..
  rm -rf $project_name
}

if [ $# == 0 ]; then
    echo -e "usage: $0 branch_name (hotfix or release) "
    exit 1
fi

branch_to_be_deleted=$1
echo "branch to be deleted: $branch_to_be_deleted"

link_prefix="ssh://git@git.exxxxx.com:922/web/"
link_affix=".git"

delete_a_branch yoomathm $branch_to_be_deleted
delete_a_branch zycon $branch_to_be_deleted
delete_a_branch rescon $branch_to_be_deleted
delete_a_branch operation $branch_to_be_deleted
delete_a_branch yoomath $branch_to_be_deleted
delete_a_branch yoomath-wx $branch_to_be_deleted
delete_a_branch yoomath-m $branch_to_be_deleted
delete_a_branch channel-sales $branch_to_be_deleted

#yoo-correct web
link_prefix="ssh://git@git.exxxxx.com:922/web/yoocorrect/"

delete_a_branch app $branch_to_be_deleted
