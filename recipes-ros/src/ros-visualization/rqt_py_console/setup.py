from setuptools import setup

package_name = 'rqt_py_console'

setup(
    name=package_name,
    version='1.2.2',
    packages=[package_name],
    package_dir={'': 'src'},
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name + '/resource',
            ['resource/py_console_widget.ui']),
        ('share/' + package_name, ['package.xml']),
        ('share/' + package_name, ['plugin.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    author='Dorian Scholz',
    maintainer='Dharini Dutia',
    maintainer_email='dharini@openrobotics.org',
    keywords=['ROS'],
    classifiers=[
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Programming Language :: Python',
        'Topic :: Software Development',
    ],
    description=(
        'rqt_py_console is a Python GUI plugin providing an interactive Python console.'
    ),
    license='BSD',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'rqt_py_console = ' + package_name + '.main:main',
        ],
    },
)
