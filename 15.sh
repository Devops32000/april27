course="Devops from current script"

echo "before calling other script : $course"
echo "process ID of current script: $$"

source ./16.sh

echo "After calling other script: $course"
