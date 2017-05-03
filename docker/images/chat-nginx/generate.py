import os

from jinja2 import Environment, FileSystemLoader

env = Environment(loader=FileSystemLoader('/scripts'))
template = env.get_template('default.conf.j2')

NGINX_DEV = os.environ.get('NGINX_DEV', False)

context = {
    'NGINX_DEV': NGINX_DEV
}

output_from_parsed_template = template.render(**context)

with open("/etc/nginx/conf.d/default.conf", "wb") as fh:
    fh.write(output_from_parsed_template)
