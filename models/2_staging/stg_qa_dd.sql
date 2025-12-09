SELECT
    src_qa_dd.*
FROM
    {{ ref('src_qa_results_dd') }}
    src_qa_dd
WHERE (dd_status IS NULL OR dd_status = 2)  -- In progress or completed forms 
