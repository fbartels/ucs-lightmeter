# A template for running the Lightmeter Control Center on Univention Corporate Server (UCS)

Will be worked on every once in a while. Contributions welcome!

(Probably) opinionated recipe for running dockerised applications on Univention Corporate Server (UCS). The provided app is the Lightmeter Control Center, the Open Source mailops monitoring application.

## Installation

Just run `./run.sh` and afterwards go to `https://your-ucs-domain/lightmeter` to finish the installation.

### Updating

To update to the latest version simple rerun `./run.sh` which will retrieve the current release version, pull updated containers and restart the current container afterwards.

### Getting logs

To view logs simply run `docker-compose logs -f`.

### Password reset

To reset the password of your user run the following command:

```bash
docker-compose exec lightmetercontrolcenter /lightmeter -workspace /workspace -email_reset 'you@email.com' -password 'new-password'
```

### Further configuration

The only configuration option that can be modified at this given time is the version of Lightmeter to run. The value is stored in a file called `.env`. To apply changes from the `.end` file to the container it needs to be restarted with `docker-compose up -d`.
