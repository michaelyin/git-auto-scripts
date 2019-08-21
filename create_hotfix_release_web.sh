#!/bin/bash

#create hotfix or release branch for web related projects
create_a_branch()
{
  git_link=$link_prefix$1$link_affix
  echo "gitlab link: $git_link"
  project_name=$1
  branch=$2
  
  COMMENTS=$@
  echo "create $branch for project $project_name ..."
  git clone $git_link
  cd $project_name

  if [ $branch = "release" ]
  then
      git checkout develop
      git checkout -b $branch develop
  else
      git checkout -b $branch
  fi

  git push origin $branch

  echo "done creating $branch with $project_name"
  cd ..
  rm -rf $project_name
}

if [ $# == 0 ]; then
    echo -e "usage: $0 branch_name (hotfix or release) "
    exit 1
fi

branch_to_be_created=$1
echo "branch to be created: $branch_to_be_created"

link_prefix="ssh://git@git.exxxxx.com:922/web/"
link_affix=".git"

create_a_branch yoomathm $branch_to_be_created
create_a_branch zycon $branch_to_be_created
create_a_branch rescon $branch_to_be_created
create_a_branch operation $branch_to_be_created
create_a_branch yoomath $branch_to_be_created
create_a_branch yoomath-wx $branch_to_be_created
create_a_branch yoomath-m $branch_to_be_created
create_a_branch channel-sales $branch_to_be_created

#yoo-correct web
link_prefix="ssh://git@git.exxxxx.com:922/web/yoocorrect/"
create_a_branch app $branch_to_be_created
