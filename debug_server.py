import sys
print("Python version:", sys.version)

try:
    print("Importing flask...")
    from flask import Flask, jsonify, request, make_response
    from flask_cors import CORS
    print("Importing pymysql...")
    import pymysql
    print("Importing bcrypt...")
    import bcrypt
    print("Importing joblib...")
    import joblib
    print("Importing numpy...")
    import numpy as np
    print("Importing os...")
    import os
    print("Importing pandas...")
    import pandas as pd
    print("Importing torch...")
    import torch
    print("Importing torch_geometric...")
    from torch_geometric.data import Batch
    print("Importing google-generativeai...")
    import google.generativeai as genai
    print("All imports successful!")
except Exception as e:
    print("Import failed:", e)
    import traceback
    traceback.print_exc()
