function prcheck --description "Get the job status for a given PR and job name" -a pr name
    if not set -q pr
        or not set -q name
        echo "need a pr and name"
        return 1
    end
    set job_status_line (gh pr checks $pr | string match --entire $name)
    and echo $job_status_line
    and set job_id (string match -r '\d+$' $job_status_line)
    and gh run view --job $job_id $argv[3..]
end
