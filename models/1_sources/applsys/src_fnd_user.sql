SELECT
    user_id AS fu_user_id,
    user_name AS fu_user_name,
    last_update_date AS fu_last_update_date,
    last_updated_by AS fu_last_updated_by,
    creation_date AS fu_creation_date,
    created_by AS fu_created_by,
    last_update_login AS fu_last_update_login,
    encrypted_foundation_password AS fu_encrypted_foundation_password,
    encrypted_user_password AS fu_encrypted_user_password,
    session_number AS fu_session_number,
    start_date AS fu_start_date,
    end_date AS fu_end_date,
    description AS fu_description,
    last_logon_date AS fu_last_logon_date,
    password_date AS fu_password_date,
    password_lifespan_days AS fu_password_lifespan_days,
    employee_id AS fu_employee_id,
    email_address AS fu_email_address,
    fax AS fu_fax,
    customer_id AS fu_customer_id,
    person_party_id AS fu_person_party_id
FROM
    {{ source('applsys', 'fnd_user') }}
