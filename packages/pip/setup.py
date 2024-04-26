# encoding=utf-8

from setuptools import setup, find_packages


with open("README.md", "r") as fh:
    long_description = fh.read()

setup(
    name = "uyghur-tili-quralliri",
    version = "0.1.5",
    keywords = ("uyghur", "uighur","til", "yeziq", "qural", "language", "tools"),
    description = "uyghur language writing and processing tool box ...",
    long_description = long_description,
    long_description_content_type="text/markdown",
    license = "MIT Licence",

    url = "https://github.com/kompasim/uyghur-tili-quralliri",
    author = "kompasim",
    author_email = "kompasim@163.com",

    packages = find_packages(),
    include_package_data = True,
    platforms = "any",
    install_requires = [],
    classifiers= [
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ]
)
