# DevOps Assignment – EKS + Helm + CI/CD

אפליקציית Flask מינימלית שרצה ב-**Gunicorn** (פורט `5000`), נארזת ל-**Docker**, נדחפת ל-**ECR**, ונפרסת ל-**EKS** בעזרת **Helm** דרך **GitHub Actions**. ניטור בסיסי באמצעות **kube-prometheus-stack** (Prometheus + Grafana).

---

## תוכן העניינים
- [סקירה](#סקירה)
- [דרישות מוקדמות](#דרישות-מוקדמות)
- [איך מריצים מקומית](#איך-מריצים-מקומית)
- [דפלוי אוטומטי (CI/CD)](#דפלוי-אוטומטי-cicd)
- [דפלוי ידני (Helm)](#דפלוי-ידני-helm)
- [ניטור (Grafana/Prometheus)](#ניטור-grafanaprometheus)
- [מבנה הרפו](#מבנה-הרפו)
- [קונפיגורציה](#קונפיגורציה)
- [ניפוי תקלות נפוצות](#ניפוי-תקלות-נפוצות)
- [ניקוי סביבה / Destroy](#ניקוי-סביבה--destroy)

---

## סקירה
- **קוד**: Flask + Gunicorn מאזין ל-`0.0.0.0:5000`.
- **דוקר**: בניית אימג' מהתיקייה `app/` ודחיפה ל-ECR.
- **Kubernetes/EKS**: Deployment + Service מסוג **LoadBalancer** (שם ה-Service: `alon-app`).
- **Helm**: צ'ארט יחיד שהוא מקור האמת ל-K8s (`deploy/helm/alon-app`).
- **CI/CD**: כל `push` ל-`main` מפעיל build→push→helm upgrade.
- **Monitoring**: kube-prometheus-stack; Grafana נגיש ע"י LoadBalancer (אופציונלי).

---

## דרישות מוקדמות
מקומית:
- Docker
- kubectl
- Helm 3
- AWS CLI מחובר לחשבון (עם הרשאות ל-EKS/ECR)
- Python 3.11+ (לריצה מקומית בלבד)

בענן:
- EKS קיים בשם **`devops-alon-eks`** (ברירת מחדל)
- ECR קיים בשם **`devops-alon-app`**
- Region: **`eu-central-1`**

---

## איך מריצים מקומית
```bash
cd app
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
export PORT=5000
python main.py
# בדיקה:
curl -I http://127.0.0.1:5000/

