# ubuntu-ros2-dev

ros2 build in arm-ubuntu

22.04 컨테이너 생성


작업 환경 및 위치

parallels@ubuntu-linux-22-04-02-desktop:~/work/riscv-ros2/docker-ros2$ pwd
/home/parallels/work/riscv-ros2/docker-ros2
parallels@ubuntu-linux-22-04-02-desktop:~/work/riscv-ros2/docker-ros2$ ll
total 44
drwxrwxr-x 2 parallels parallels  4096 Sep  2 16:20 ./
drwxrwxr-x 8 parallels parallels  4096 Sep  2 15:31 ../
-rw-r--r-- 1 parallels parallels 12288 Sep  2 16:20 .Dockerfile.swp
-rw-rw-r-- 1 parallels parallels  2366 Sep  2 16:20 Dockerfile
-rw-rw-r-- 1 parallels parallels   818 Aug 27 22:50 Makefile
-rw-rw-r-- 1 parallels parallels   420 Aug 27 22:50 README.md
-rw-rw-r-- 1 parallels parallels   267 Sep  2 15:33 build.sh
-rw-rw-r-- 1 parallels parallels    83 Aug 27 22:50 run-freedom.sh
-rw-rw-r-- 1 parallels parallels   236 Sep  2 15:33 run.sh



빌드 매뉴얼

https://docs.ros.org/en/jazzy/Installation/Alternatives/Ubuntu-Development-Setup.html#enable-required-repositories



빌드 로그

root@b8978c90ada5:/work/ros2_jazzy# rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"
WARNING: ROS_PYTHON_VERSION is unset. Defaulting to 3
executing command [apt-get install -y libeigen3-dev]
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Suggested packages:
  libeigen3-doc libmpfrc++-dev
The following NEW packages will be installed:
  libeigen3-dev
0 upgraded, 1 newly installed, 0 to remove and 5 not upgraded.
Need to get 1,056 kB of archives.
After this operation, 9,081 kB of additional disk space will be used.
Get:1 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 libeigen3-dev all 3.4.0-2ubuntu2 [1,056 kB]
Fetched 1,056 kB in 3s (401 kB/s)                   

........
........
........

Finished <<< rviz_default_plugins [5min 22s]                                   
Starting >>> rviz2
Finished <<< rviz2 [6.71s]                                
                                
Summary: 363 packages finished [22min 18s]
  104 packages had stderr output: action_tutorials_py ament_clang_format ament_clang_tidy ament_copyright ament_cppcheck ament_cpplint ament_flake8 ament_index_python ament_lint ament_lint_cmake ament_mypy ament_package ament_pclint ament_pep257 ament_pycodestyle ament_pyflakes ament_uncrustify ament_xmllint demo_nodes_py domain_coordinator examples_rclpy_executors examples_rclpy_guard_conditions examples_rclpy_minimal_action_client examples_rclpy_minimal_action_server examples_rclpy_minimal_client examples_rclpy_minimal_publisher examples_rclpy_minimal_service examples_rclpy_minimal_subscriber examples_rclpy_pointcloud_publisher examples_tf2_py foonathan_memory_vendor google_benchmark_vendor iceoryx_posh launch launch_pytest launch_ros launch_testing launch_testing_examples launch_testing_ros launch_xml launch_yaml lifecycle_py osrf_pycommon qt_gui_cpp quality_of_service_demo_py rclpy rmw_connextdds_common ros2action ros2bag ros2cli ros2component ros2doctor ros2interface ros2launch ros2lifecycle ros2multicast ros2node ros2param ros2pkg ros2run ros2service ros2test ros2topic ros2trace rosbag2_examples_py rosbag2_performance_benchmarking rosbag2_performance_benchmarking_msgs rosbag2_py rosidl_cli rosidl_pycommon rosidl_runtime_py rpyutils rqt rqt_action rqt_bag rqt_bag_plugins rqt_console rqt_graph rqt_gui rqt_gui_py rqt_msg rqt_plot rqt_publisher rqt_py_console rqt_reconfigure rqt_service_caller rqt_shell rqt_srv rqt_topic rti_connext_dds_cmake_module sensor_msgs_py sros2 test_launch_ros test_ros2trace test_tracetools test_tracetools_launch tf2_ros_py tf2_tools topic_monitor tracetools_launch tracetools_read tracetools_test tracetools_trace zstd_vendor



# run demo test
root@99a26e6e8a24:/work/ubuntu-ros2-dev# ros2 run demo_nodes_cpp talker
[INFO] [1732951534.389697046] [talker]: Publishing: 'Hello World: 1'
[INFO] [1732951535.390516232] [talker]: Publishing: 'Hello World: 2'
[INFO] [1732951536.387399599] [talker]: Publishing: 'Hello World: 3'
[INFO] [1732951537.390925209] [talker]: Publishing: 'Hello World: 4'
[INFO] [1732951538.391165909] [talker]: Publishing: 'Hello World: 5'
[INFO] [1732951539.389802040] [talker]: Publishing: 'Hello World: 6'
^C[INFO] [1732951539.492913128] [rclcpp]: signal_handler(signum=2)
root@99a26e6e8a24:/work/ubuntu-ros2-dev# ros2 run demo_nodes_cpp talker &
[1] 269847
root@99a26e6e8a24:/work/ubuntu-ros2-dev# [INFO] [1732951548.834187928] [talker]: Publishing: 'Hello World: 1'
[INFO] [1732951549.836074294] [talker]: Publishing: 'Hello World: 2'
[INFO] [1732951550.834373071] [talker]: Publishing: 'Hello World: 3'
[INFO] [1732951551.833693585] [talker]: Publishing: 'Hello World: 4'
[INFO] [1732951552.832496922] [talker]: Publishing: 'Hello World: 5'
[INFO] [1732951553.837428390] [talker]: Publishing: 'Hello World: 6'
[INFO] [1732951554.837625417] [talker]: Publishing: 'Hello World: 7'
[INFO] [1732951555.832116744] [talker]: Publishing: 'Hello World: 8'
[INFO] [1732951556.832694909] [talker]: Publishing: 'Hello World: 9'
ros2 run demo_nodes_py listener[INFO] [1732951557.835554835] [talker]: Publishing: 'Hello World: 10'
ros2 run demo_nodes_py listener
[INFO] [1732951558.837004571] [talker]: Publishing: 'Hello World: 11'
[INFO] [1732951559.833874335] [talker]: Publishing: 'Hello World: 12'
[INFO] [1732951559.866716699] [listener]: I heard: [Hello World: 12]
[INFO] [1732951560.833103646] [talker]: Publishing: 'Hello World: 13'
[INFO] [1732951560.836635626] [listener]: I heard: [Hello World: 13]
[INFO] [1732951561.837261611] [talker]: Publishing: 'Hello World: 14'
[INFO] [1732951561.840662095] [listener]: I heard: [Hello World: 14]
[INFO] [1732951562.837272870] [talker]: Publishing: 'Hello World: 15'
[INFO] [1732951562.839853712] [listener]: I heard: [Hello World: 15]
[INFO] [1732951563.837317218] [talker]: Publishing: 'Hello World: 16'
[INFO] [1732951563.840274799] [listener]: I heard: [Hello World: 16]
^Croot@99a26e6e8a24:/work/ubuntu-ros2-dev# [INFO] [1732951564.837346196] [talker]: Publishing: 'Hello World: 17'
ps
    PID TTY          TIME CMD
      1 pts/0    00:00:00 bash
 269847 pts/0    00:00:00 ros2
 269850 pts/0    00:00:00 talker
 269890 pts/0    00:00:00 ps
root@99a26e6e8a24:/work/ubuntu-ros2-dev# [INFO] [1732951565.836178840] [talker]: Publishing: 'Hello World: 18'
ki[INFO] [1732951566.835118944] [talker]: Publishing: 'Hello World: 19'
ll [INFO] [1732951567.836072703] [talker]: Publishing: 'Hello World: 20'
[INFO] [1732951568.837063674] [talker]: Publishing: 'Hello World: 21'
[INFO] [1732951569.833233828] [talker]: Publishing: 'Hello World: 22'
[INFO] [1732951570.832393734] [talker]: Publishing: 'Hello World: 23'
-9 [INFO] [1732951571.834208152] [talker]: Publishing: 'Hello World: 24'
[INFO] [1732951572.836969340] [talker]: Publishing: 'Hello World: 25'

