void main (string[] args) {

    Test.init(ref args);

    register_value_test();
    register_prefix_test();

    Test.run();
}