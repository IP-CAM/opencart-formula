=================
opencart-formula
=================

A saltstack formula to install and configure opencart, a free shopping cart system.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``opencart``
-------------

Install and configure opencart sites

``opencart.cli``
-------------

Installs sugarcli


``opencart.config``
-------------

Configure opencart sites

Pillar customizations:
======================

.. code-block:: yaml

    opencart:
        sites:
            sitename:
              username: <your-opencart-username>
              password: <your-opencart-user-password>
              database: <your-opencart-database-name>
              dbuser: <your-opencart-db-username>
              dbpass: <your-opencart-db-password>       
              url: http://example.ie
              title: 'My Blog'
              email: 'john.doe@acme.com'       

Formula Dependencies
====================

* `apache-formula <https://github.com/saltstack-formulas/apache-formula>`_
* `php-formula <https://github.com/saltstack-formulas/php-formula>`_

or

* `nginx-formula <https://github.com/saltstack-formulas/nginx-formula>`_
* `php-formula <https://github.com/saltstack-formulas/php-formula>`_

