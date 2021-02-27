import os
import pandas as pd
import sys
import torch
from transformers import PegasusTokenizer, PegasusForConditionalGeneration

fp=sys.argv[1]
idx = int(os.environ["SLURM_ARRAY_TASK_ID"])
parameters = pd.read_csv(fp)

ARTICLE_TO_SUMMARIZE = parameters['text'][idx-1]
goal_nwords = parameters['goal_nwords'][idx-1]

## Establish model and tokenizer
model = PegasusForConditionalGeneration.from_pretrained("/scratch/network/hyork/projects/nlp_trial/ref/")
tokenizer = PegasusTokenizer.from_pretrained('/scratch/network/hyork/projects/nlp_trial/ref/')


inputs = tokenizer([ARTICLE_TO_SUMMARIZE], max_length=goal_nwords,truncation=True, return_tensors='pt')

# Generate Summary
summary_ids = model.generate(inputs['input_ids'])
out = [tokenizer.decode(g, skip_special_tokens=True, clean_up_tokenization_spaces=False) for g in summary_ids]

# output to csv
pd_out = pd.DataFrame(data = {"summary": out})
pd_out.to_csv("../" + chr(idx) + ".csv")