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
        """Find and click bbs link"""
        try:
            self.driver.get(baseUrl)
            el = self.driver.find_element_by_xpath("/html/body/article/aside/ul/li[1]/div/a")
            el.click()
            self.driver.save_screenshot('../output/bbs.png')
        except NoSuchElementException as ex:
            self.fail(ex.msg)


    def test_case_2(self):
        """Find and click bbs webapp link"""
        try:
            self.driver.get(baseUrl)
            el = self.driver.find_element_by_xpath("/html/body/article/aside/ul/li[2]/div/a")
            el.click()
            self.driver.save_screenshot('../output/bbswebapp.png')
        except NoSuchElementException as ex:
            self.fail(ex.msg)


    def test_case_3(self):
        """Find and click bwof link"""
        try:
            self.driver.get(baseUrl)
            el = self.driver.find_element_by_xpath("/html/body/article/aside/ul/li[3]/div/a")
            el.click()
            self.driver.save_screenshot('../output/bwof.png')
        except NoSuchElementException as ex:
            self.fail(ex.msg)

    def test_case_3(self):
        """Find and click github link"""
        try:
            self.driver.get(baseUrl)
            el = self.driver.find_element_by_xpath("/html/body/header/nav/li[1]/a")
            el.click()
            self.driver.switch_to_window(self.driver.window_handles[1])
            self.driver.save_screenshot('../output/github.png')
        except NoSuchElementException as ex:
            self.fail(ex.msg)

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(TestTemplate)
    unittest.TextTestRunner(verbosity=2).run(suite)

