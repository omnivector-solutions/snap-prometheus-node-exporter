#!/bin/bash
# Generate a jwt token, find slurmrestd ip, use the token to make a request to slurmrestd api "ping" endpoint.
# Exit 0 if slurmrestd api returns a 200, -1 if anything else.

set -e

token=$($(which python3) -c "import python_jwt as jwt, jwcrypto.jwk as jwk, datetime; print(jwt.generate_jwt({'some': 'payload'}, jwk.JWK.generate(kty='RSA', size=2048)));")
slurmrestd_ip=$(/snap/bin/juju status --format json | /snap/bin/jq -r '.applications["slurmrestd"].units[]["public-address"]')
slurmrestd_api_status_code=$(curl -H "X-SLURM-USER-NAME: ubuntu" \
                                  -H "X-SLURM-USER-TOKEN: $token" \
                                  -s -o /dev/null -w "%{http_code}" \
                                  "http://$slurmrestd_ip:6820/slurm/v0.0.35/ping")

if [[ $slurmrestd_api_status_code == "200" ]]; then
	exit 0
else
	exit -1
fi
