import matplotlib.pyplot as plt
import numpy as np

real_field_order = ['Blanket','Artif. Grass','Rubber','Carpet','MDF','Tile']
sim_field_order  = ['Terrain 1','Terrain 2','Terrain 3','Terrain 4','Terrain 5','Terrain 6']


def plot_confusion_matrix(cm, classes,
                          normalize=False,
                          title=None,
                          cmap=plt.cm.Blues):
    """
    This function prints and plots the confusion matrix.
    Normalization can be applied by setting `normalize=True`.
    """
    if not title:
        if normalize:
            title = 'Normalized confusion matrix'
        else:
            title = 'Confusion matrix, without normalization'

    if normalize:
        cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]
        print("Normalized confusion matrix")
    else:
        print('Confusion matrix, without normalization')

    print(cm)

    fig, ax = plt.subplots()
    im = ax.imshow(cm, interpolation='nearest', cmap=cmap)
    ax.figure.colorbar(im, ax=ax)
    # We want to show all ticks...
    ax.set(xticks=np.arange(cm.shape[1]),
           yticks=np.arange(cm.shape[0]),
           # ... and label them with the respective list entries
           xticklabels=classes, yticklabels=classes,
           title=title,
           ylabel='True label',
           xlabel='Predicted label')

    # Rotate the tick labels and set their alignment.
    plt.setp(ax.get_xticklabels(), rotation=45, ha="right",
             rotation_mode="anchor")

    # Loop over data dimensions and create text annotations.
    fmt = '.2f' if normalize else 'd'
    thresh = cm.max() / 2.
    for i in range(cm.shape[0]):
        for j in range(cm.shape[1]):
            ax.text(j, i, format(cm[i, j], fmt),
                    ha="center", va="center",
                    color="white" if cm[i, j] > thresh else "black")
    fig.tight_layout()
    return ax


"""[REAL - ONE VELOCITY]:"""
#  Training Number of Walking Steps: 600
#  Validation Number of Walking Steps: 100
#  Test Number of Walking Steps: 100
conf_mat =   np.array([[98,  2,  0,  0,  0,  0],
                       [ 0, 93,  5,  0,  0,  2],
                       [ 0,  4, 93,  3,  0,  0],
                       [ 0,  0,  4, 96,  0,  0],
                       [ 1,  0,  0,  0, 99,  0],
                       [ 0,  2,  0,  0,  0, 98]])
plot_confusion_matrix(conf_mat, classes=real_field_order,normalize=True, title="Confusion Matrix: Real Robot with null forward velocity")
plt.show()

"""[REAL - TWO VELOCITIES]:"""
#  Training Number of Walking Steps: 600
#  Validation Number of Walking Steps: 200
#  Test Number of Walking Steps: 200
conf_mat =    np.array([[190,  10,   0,   0,   0,   0],
                        [  9, 161,  17,   4,   2,   7],
                        [  1,  13, 172,  13,   1,   0],
                        [  0,   1,   8, 184,   6,   1],
                        [  3,   1,   1,   3, 186,   6],
                        [  1,   5,   1,   2,   3, 188]])
plot_confusion_matrix(conf_mat, classes=real_field_order,normalize=True, title="Confusion Matrix: Real Robot with two velocities")
plt.show()

"""[SIM - VARYING VELOCITY]:"""
#  Training Number of Walking Steps: 600
#  Validation Number of Walking Steps: 200
#  Test Number of Walking Steps: 200
conf_mat =    np.array([[195,   1,   0,   4,   0,   0],
                        [  1, 199,   0,   0,   0,   0],
                        [  2,   0, 194,   0,   0,   4],
                        [ 12,   1,   0, 186,   1,   0],
                        [  0,   0,   0,   0, 200,   0],
                        [  0,   3,   3,   0,   0, 194]])
plot_confusion_matrix(conf_mat, classes=sim_field_order,normalize=True, title="Confusion Matrix: Simulated Robot with varying velocity")
plt.show()