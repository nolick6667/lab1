TASKID=20
LOG_FILE="dns-tunneling.log"
RESULT_FILE="results.txt"
VAR_1=$(wc -l < "$LOG_FILE")
tail -n 200 "$LOG_FILE" \
  | awk -F'\t' '{print $15}' \
  | grep -E '^aD' \
  | sort -u > "$RESULT_FILE"



if [[ -s "$RESULT_FILE" ]]; then
  VAR_2=$(awk 'BEGIN{min=-1}{len=length($0); if(min<0||len<min)min=len}END{print min}' "$RESULT_FILE")
else
  VAR_2=0
fi
