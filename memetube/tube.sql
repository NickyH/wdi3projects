create table clips
    (
    id serial8 primary key,
    title varchar(25),
    description text,
    genre varchar(50),
    url varchar(1000)

    );