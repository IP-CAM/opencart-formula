===========================
opencart-formula |travis-ci|
===========================
.. |travis-ci| image:: https://travis-ci.org/fintanmm/opencart-formula.svg?branch=master
    :target: https://travis-ci.org/fintanmm/opencart-formula
    
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

``opencart.backup``
-------------

Backup opencart sites

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
              dbdriver: 'mpdo'
              dbport: '3306'
              url: http://example.ie
              email: 'john.doe@acme.com'
              backup: true      

Formula Dependencies
====================

* `apache-formula <https://github.com/saltstack-formulas/apache-formula>`_
* `php-formula <https://github.com/saltstack-formulas/php-formula>`_

or

* `nginx-formula <https://github.com/saltstack-formulas/nginx-formula>`_
* `php-formula <https://github.com/saltstack-formulas/php-formula>`_

