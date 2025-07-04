Opened 2023-09-21

# to create a new group named <mygroup> you would run:

->% groupadd mygroup

# to suppress the error message

->% groupadd -f mygroup

## You can verify the group’s GID, by listing all groups and filtering the result with grep :

getent group | grep mygroup
