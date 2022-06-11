import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate('serviceAccountKey.json')
firebase_admin.initialize_app(cred)

db = firestore.client()

data = db.collection('users')
docs = data.stream()

def read_data(collection_name, document_id):
    user = db.collection(collection_name).document(document_id)
    return user.get().to_dict()

def update_data(collection_name, document_id, score=None, num_recycled=None):
    user = db.collection(collection_name).document(document_id)
    user_info = user.get().to_dict()
    
    if num_recycled is None and score is None:
        user.update({
            'score': user_info['score'] - 20,
        })
    
    if num_recycled is not None and score is not None:
        user.update({
            'score': score,
            'num_recycled': num_recycled
        })
    
    if score is not None:
        user.update({'score': score})
        
    if num_recycled is not None:
        user.update({'num_recycled': num_recycled})



# update_data('EddieShowBenifts', 'IzyT4tkk7UYZbJqYjOrc', score=1500, num_recycled=5)
update_data('EddieShowBenifts', 'IzyT4tkk7UYZbJqYjOrc', score=1500, num_recycled=10)
# print(read_data('users', 'person1'))
