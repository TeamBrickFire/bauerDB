create table bt_person
(
    id        varchar(36)  not null
        primary key,
    surname   varchar(24)  null,
    firstname varchar(24)  null,
    email     varchar(32)  null,
    password  varchar(128) null,
    phone     varchar(16)  null,
    token varchar(32) null,
    constraint bt_person_email_uindex
        unique (email)
);


create table bt_farmer
(
	id varchar(36) null,
	constraint farmer_pk
		primary key (id),
	constraint farmer_person_id_fk
		foreign key (id) references bt_person (id)
);

create table bt_helper
(
	id varchar(36) null,
	constraint bt_helper_pk
		primary key (id),
	constraint bt_helper_bt_person_id_fk
		foreign key (id) references bt_person (id)
);

create table bt_field
(
	id varchar(36) null,
	farmer_id varchar(36) null,
	constraint bt_field_pk
		primary key (id),
	constraint bt_field_bt_farmer_id_fk
		foreign key (farmer_id) references bt_farmer (id)
);


create table bt_square
(
	id varchar(36) null,
	field_id varchar(36) null,
	x int null;
	y int null;
	blocked boolean default false null;
	constraint bt_square_pk
		primary key (id),
	constraint bt_square_bt_field_id_fk
		foreign key (field_id) references bt_field (id)
);

create table bt_field_helper
(
	helper_id varchar(36) null,
	field_id varchar(36) null,
	constraint bt_worker_pk
		primary key (helper_id, field_id),
	constraint bt_field_helper_bt_field_id_fk
		foreign key (field_id) references bt_field (id),
	constraint bt_field_helper_bt_helper_id_fk
		foreign key (helper_id) references bt_helper (id)
);

create table bt_square_helper
(
	helper_id varchar(36) null,
	square_id varchar(36) null,
	harvest_time timestamp null,
	constraint bt_square_helper_pk
		unique (helper_id, square_id, harvest_time),
	constraint bt_square_helper_bt_helper_id_fk
		foreign key (helper_id) references bt_helper (id),
	constraint bt_square_helper_bt_square_id_fk
		foreign key (square_id) references bt_square (id)
);

