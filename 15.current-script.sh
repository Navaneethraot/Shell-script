#!/bin/bash

COURSE="Devops from Current Script"

echo "before calling other script, course:$COURSE"
echo "Process ID of the current script: $$"

#./16.other-script.sh
source ./16.other-script.sh
echo "After calling other script, Course:$COURSE"