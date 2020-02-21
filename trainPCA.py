import numpy as np
from sklearn.metrics import classification_report
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
from sklearn import svm
from sklearn.metrics import classification_report, confusion_matrix  
from sklearn.neighbors import KNeighborsClassifier


def get_one_hot(targets, nb_classes):
   res = np.eye(nb_classes)[np.array(targets).reshape(-1)]
   return res.reshape(list(targets.shape)+[nb_classes])
 
def calc_accuracy(mat):
    c = 0
    s = np.zeros(6)
    for m in mat:
        acc = m[c]/np.sum(m,dtype=np.float32)
        s[c] = acc
        c = c+1
    print "Mean: " + str(np.mean(s)) + " Variance: " + str(np.std(s))

field_order = ['blanket','grass','rubber','carpet','mdf','tile']
sensor_order = ['angX','angY','accX','accY','accZ','gyroX','gyroY','gyroZ','torque3','torque4']

# Total: 800 + 200 = 1000
num_train = 600
num_valid = 400
num_total = num_train + num_valid
 
num_impact = 28
num_sensors = len(sensor_order)
num_fields = len(field_order)
 
 
all_data   = np.zeros(num_fields*num_sensors*num_impact*num_total).reshape([num_fields, num_sensors, num_impact*num_total])
all_output = np.zeros(num_fields*num_fields*num_total).reshape([num_fields, num_total, num_fields])


# Fill the input data
for sensor in sensor_order:
  #all_data[:,sensor_order.index(sensor),:] = np.loadtxt("real/" + sensor + ".csv", delimiter=",")
  all_data[:,sensor_order.index(sensor),:] = np.hstack((np.loadtxt("real_new/" + sensor + ".csv", delimiter=","),
                                                        np.loadtxt("real/" + sensor + ".csv", delimiter=",")))
  #all_data[:,sensor_order.index(sensor),:] = np.loadtxt("sim/" + sensor + ".csv", delimiter=",")

all_data = all_data.reshape([num_fields, num_sensors, num_total, num_impact])

# Shuffle data for each sensor/field
# Fill one-hot expected outputs
for sensor in sensor_order:
  for field in field_order:
    np.random.shuffle(all_data[field_order.index(field),sensor_order.index(sensor),:,:])
    all_output[field_order.index(field),:,:] = get_one_hot(np.array([field_order.index(field)]),num_fields)


# Separate into training/validation/testing data input and output
x_train = all_data[:,:,:num_train,:]
x_valid = all_data[:,:,num_train:(num_train + num_valid),:]

y_train = all_output[:,:num_train,:]
y_valid = all_output[:,num_train:(num_train + num_valid),:]

# Standardization of data for each sensor type
x_train = x_train.transpose((1,0,2,3))
x_valid = x_valid.transpose((1,0,2,3))

x_train_fit = x_train.reshape(num_sensors,num_fields*num_impact*num_train, -1)
x_valid_fit = x_valid.reshape(num_sensors,num_fields*num_impact*num_valid, -1)
scalers = {}
for i in range(num_sensors):
  scalers[i] = StandardScaler()
  x_train_fit[i, :, :] = scalers[i].fit_transform(x_train_fit[i ,:, :]) 
  x_valid_fit[i, :, :] = scalers[i].transform(x_valid_fit[i ,:, :]) 
x_train = x_train_fit.reshape([num_sensors, num_fields, num_train, num_impact])
x_valid = x_valid_fit.reshape([num_sensors, num_fields, num_valid, num_impact])

x_train = x_train.transpose((1,2,0,3))
x_valid = x_valid.transpose((1,2,0,3))

x_train = x_train.reshape([-1, num_sensors*num_impact])
x_valid  = x_valid.reshape([-1, num_sensors*num_impact])
y_train = y_train.reshape([num_train*num_fields, num_fields])
y_valid = y_valid.reshape([num_valid*num_fields, num_fields])


y_train = [np.where(r==1)[0][0] for r in y_train]
y_valid = [np.where(r==1)[0][0] for r in y_valid]

print np.shape(x_train)
print np.shape(x_valid)
print np.shape(y_train)
print np.shape(y_valid)

# Make an instance of the Model
pca = PCA(0.999999999999999)
pca.fit(x_train)

x_train = pca.transform(x_train)
x_valid = pca.transform(x_valid)

print "SVM-RBF"
func = svm.SVC(kernel = "rbf",C=1.0, max_iter=100000,gamma = 'auto')
func.fit(x_train, y_train) 

count = 0
pred_y = func.predict(x_valid)  

mat = confusion_matrix(y_valid,pred_y)
print mat
calc_accuracy(mat)
print(classification_report(y_valid,pred_y,target_names=field_order, digits = 10))  