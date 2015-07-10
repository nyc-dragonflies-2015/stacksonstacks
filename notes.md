###Work Agreement
 >--work on Friday night (YAY!)
 
 >--work about 12 hours on Saturday, starting around 9AM.
 
 >--hopefully Sunday off
 
 >--When we can't agree on something then we'll call a vote. We're going to keep this democratic.  There are three of us, so there shouldn't be any ties.


###roles
your default person for Merge Requests:
> --Julia --> Marco

> --Marco --> Ross

> --Ross --> Julia

don't be afraid to reach out to another if your go to person is busy.

###other
>--Work on what we're weak on.
>--Let's split up features on thursday so folks will be working on features concurrently

>--Software - Trello, slackbot

###git workflow
1. `git checkout -b my_feature`
2. Work
  1.  [Spike][]: a timeboxed investigation
  2.  Test
  3.  Write a Test-driven implementation
  4.  Commit
    1.  Commits should have a subject line (fewer than 50 characters in length)
    2.  After the "subject line" there should be a blank line
    3.  After the blank line you should include a description of what happens
        in the code
2. `git checkout master`
3. `git pull`
4. `git checkout my_feature`
5. `git rebase master`
6. `git push origin my_feature`
7. `git checkout master`
8. `git pull`

