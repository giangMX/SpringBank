-- public."user" definition

-- Drop table

-- DROP TABLE public."user";

CREATE TABLE users (
	user_id varchar(12) NULL,
	username varchar(255) NULL,
	password varchar(255) NULL,
	full_name varchar(255) NULL,
	email varchar(255) NULL,
	mobile varchar(50) NULL,
	photo varchar(255) NULL,
	is_active bool NULL,
	is_email_verified bool NULL,
	created_at timestamp NULL,
	updated_at timestamp null,
	CONSTRAINT uk_sdgdfgsdfsdfg234eg57odfsd UNIQUE (user_id)
);

-- public.email_verification_token definition

-- Drop table

-- DROP TABLE public.email_verification_token;

CREATE TABLE email_verification_token (
	token_id bigserial NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	expiry_dt timestamp NOT NULL,
	"token" varchar(255) NOT NULL,
	token_status varchar(255) NULL,
	user_id varchar(255) NOT NULL,
	CONSTRAINT email_verification_token_pkey PRIMARY KEY (token_id),
	CONSTRAINT uk_idu2ippaks8bn6vcsq62khvdu UNIQUE (token)
);


-- public.password_reset_token definition

-- Drop table

-- DROP TABLE public.password_reset_token;

CREATE TABLE password_reset_token (
	token_id bigserial NOT NULL,
	expiry_dt timestamp NOT NULL,
	token_name varchar(255) NOT NULL,
	user_id varchar(255) NOT NULL,
	CONSTRAINT password_reset_token_pkey PRIMARY KEY (token_id),
	CONSTRAINT uk_p4ksw3dweftlkig5mtd3onr9a UNIQUE (token_name)
);


-- public."role" definition

-- Drop table

-- DROP TABLE public."role";

CREATE TABLE "role" (
	role_id bigserial NOT NULL,
	role_name varchar(255) NULL,
	created_at timestamp NULL,
	updated_at timestamp null,
	CONSTRAINT role_pkey PRIMARY KEY (role_id),
	CONSTRAINT uk_epk9im9l9q67xmwi4hbed25do UNIQUE (role_name)
);


-- public.user_device definition

-- Drop table

-- DROP TABLE public.user_device;

CREATE TABLE user_device (
	user_device_id bigserial NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	device_id varchar(255) NOT NULL,
	device_type varchar(255) NULL,
	is_refresh_active bool NULL,
	notification_token varchar(255) NULL,
	user_id varchar(255) NOT NULL,
	CONSTRAINT user_device_pkey PRIMARY KEY (user_device_id)
);


-- public.refresh_token definition

-- Drop table

-- DROP TABLE public.refresh_token;

CREATE TABLE refresh_token (
	token_id bigserial NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	expiry_dt timestamp NOT NULL,
	refresh_count int8 NULL,
	"token" varchar(255) NOT NULL,
	user_device_id int8 NOT NULL,
	CONSTRAINT refresh_token_pkey PRIMARY KEY (token_id),
	CONSTRAINT uk_8ogx3ejsbfbf2xsgl4758otrm UNIQUE (user_device_id),
	CONSTRAINT uk_r4k4edos30bx9neoq81mdvwph UNIQUE (token),
	CONSTRAINT fkr92opronarwe7pn1c41621grv FOREIGN KEY (user_device_id) REFERENCES user_device(user_device_id)
);


-- public.user_role definition

-- Drop table

-- DROP TABLE public.user_role;

CREATE TABLE user_role (
	user_id varchar(255) NOT NULL,
	role_id int8 NOT NULL,
	CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id),
	CONSTRAINT user_role_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT role_user_id_fk FOREIGN KEY (role_id) REFERENCES role(role_id)
);