import PyPDF2
import os
import sys

# Directory with PDFs
pdf_dir = r"C:\Users\mjaniau\Documents\perso\site\ancienne pages"

# Get all PDF files
pdf_files = [f for f in os.listdir(pdf_dir) if f.endswith('.pdf')]

for pdf_file in sorted(pdf_files):
    pdf_path = os.path.join(pdf_dir, pdf_file)
    print(f"\n{'='*80}")
    print(f"FILE: {pdf_file}")
    print('='*80)
    
    try:
        with open(pdf_path, 'rb') as file:
            pdf_reader = PyPDF2.PdfReader(file)
            print(f"Pages: {len(pdf_reader.pages)}\n")
            
            for page_num, page in enumerate(pdf_reader.pages, 1):
                text = page.extract_text()
                if text.strip():
                    print(f"\n--- Page {page_num} ---")
                    # Use UTF-8 encoding for special characters
                    print(text.encode('utf-8', errors='ignore').decode('utf-8'))
    except Exception as e:
        print(f"Error reading {pdf_file}: {e}")

print(f"\n{'='*80}")
print("EXTRACTION COMPLETE")
print('='*80)
