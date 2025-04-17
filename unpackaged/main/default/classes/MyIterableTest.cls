@isTest
public class MyIterableTest {
    @isTest
    static void testIteration() {
        List<Integer> nums = new List<Integer>{5, 10, 15};
        MyIterable iterable = new MyIterable(nums);

        Integer total = 0;
        for (Integer i : iterable) {
            total += i;
        }

        System.assertEquals(30, total); // 5 + 10 + 15
    }
}