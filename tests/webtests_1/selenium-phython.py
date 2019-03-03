import os
import unittest
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException

baseUrl = os.environ['BASE_URL']
print('BASE_URL is set to: {:s}'.format(baseUrl))

# Docs: see https://selenium-python.readthedocs.io/
class TestTemplate(unittest.TestCase):
    """Include test cases on a given url"""

    def setUp(self):
        """Start web driver"""
        chrome_options = webdriver.ChromeOptions()
        chrome_options.add_argument('--no-sandbox')
        chrome_options.add_argument('--headless')
        chrome_options.add_argument('--disable-gpu')
        self.driver = webdriver.Chrome(chrome_options=chrome_options)
        self.driver.implicitly_wait(10)

    def tearDown(self):
        """Stop web driver"""
        self.driver.quit()

    def test_case_0(self):
        """Open website"""
        try:
            self.driver.get(baseUrl)
            self.driver.save_screenshot('../output/setup.png')
        except NoSuchElementException as ex:
            self.fail(ex.msg)

    def test_case_1(self):
        """Find and click tags link"""
        try:
            self.driver.get(baseUrl)
            el = self.driver.find_element_by_xpath("/html/body/section[1]/div/nav[2]/div/a[2]/h2")
            el.click()
            self.driver.save_screenshot('../output/tags.png')
        except NoSuchElementException as ex:
            self.fail(ex.msg)


    def test_case_2(self):
        """Find and click Category link"""
        try:
            self.driver.get(baseUrl)
            el = self.driver.find_element_by_xpath("/html/body/section[1]/div/nav[2]/div/a[1]/h2")
            el.click()
            self.driver.save_screenshot('../output/category.png')
        except NoSuchElementException as ex:
            self.fail(ex.msg)


    def test_case_3(self):
        """Find and click github link"""
        try:
            self.driver.get(baseUrl)
            el = self.driver.find_element_by_xpath("/html/body/section[1]/div/nav[1]/div[2]/nav/a[2]")
            el.click()
            self.driver.switch_to_window(self.driver.window_handles[1])
            self.driver.save_screenshot('../output/github.png')
        except NoSuchElementException as ex:
            self.fail(ex.msg)

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(TestTemplate)
    unittest.TextTestRunner(verbosity=2).run(suite)

