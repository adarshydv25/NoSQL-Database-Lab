# Practical 1 - Install and configure Riak KV on Linux

## Before installation
Riak KV versions and Linux package repositories have changed over time. Use a Riak KV
release that is compatible with your Linux distribution and follow the vendor's official
installation instructions for that exact release. Do not add an unknown repository or
download an unverified package.

## Basic service checks
After installation, depending on the package/service setup:

```bash
sudo systemctl status riak
sudo systemctl start riak
sudo systemctl enable riak
```

Some package builds use the Riak control utility instead:

```bash
riak ping
riak-admin cluster status
```

A successful ping normally returns `pong`.

## HTTP API check
The examples in this lab expect the HTTP interface at:

```text
http://127.0.0.1:8098
```

Check the endpoint:

```bash
curl -i http://127.0.0.1:8098/ping
```

Expected response body from a healthy HTTP interface is typically:

```text
OK
```

## Bucket creation
Riak KV commonly creates buckets implicitly when a key is written. Bucket properties
can be set using the bucket properties endpoint. The exact property syntax depends on
Riak KV version and configuration.

For the simple examples in this package, write to the `students` bucket first, then
read the object back.

If the HTTP endpoint is not enabled, inspect the Riak configuration for the HTTP listener
and enable it according to the installed version's documentation. Restart Riak after
configuration changes.

## Practical 1 - basic key-value operations
Use commands from `02_Riak_Buckets/students_crud.sh`.
