--1. ����� ���� �Բ� �޿��� commission�� ����϶�. �޿��� õ�� �ڸ� �̻� ���(�ݿø�)�ϰ�, commission�� �Ҽ� ù°�ڸ������� ���(�ݿø�)�϶�.
select last_name, round(salary, -3), round(commission_pct, 1)
from employees;

--2. 60�� �μ��� ���� ����� ���� �빮�ڷ� ����϶�.
select upper(last_name)
from employees
where department_id = 60;

--3. JOB_HISTORY ���̺��� �̿��Ͽ�, �� ��� ��ȣ�� �ش� ����� ���ᳯ¥, ������ ��¥�� 2���� �� ���� ������ ��¥�� ����϶�.
