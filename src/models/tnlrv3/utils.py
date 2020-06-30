import logging


CLS_TOKEN = '[CLS]'
SEP_TOKEN = '[SEP]'
MASK_TOKEN = '[MASK]'


def add_file_handler(logger, log_file):
  fh = logging.FileHandler(log_file)
  fh.setLevel(logging.DEBUG)
  # create console handler with a higher log level
  formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
  fh.setFormatter(formatter)
  logger.addHandler(fh)
  logger.info("Set log file: {}".format(log_file))
