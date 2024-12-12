from setuptools import setup

package_name = 'rqt_action'
setup(
    name=package_name,
    version='2.2.0',
    package_dir={'': 'src'},
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        ('share/' + package_name, ['plugin.xml'])
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    author='Isaac Isao Saito',
    maintainer='Geoffrey Biggs',
    maintainer_email='geoff@openrobotics.org',
    keywords=['ROS'],
    classifiers=[
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Programming Language :: Python',
        'Topic :: Software Development',
    ],
    description=(
        'rqt_action provides a feature to introspect all available ROS action types.'
    ),
    license='BSD',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'rqt_action = ' + package_name + '.main:main',
        ],
    },
)
