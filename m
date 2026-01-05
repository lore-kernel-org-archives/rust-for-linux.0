Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E429533B967
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616992; cv=none; b=XH/9KXFztz/EY1LHN0KPViGbRD6UNutd72K6+Y1P3A7ezWh0Vxtj6QzPb3xWe3oyxJMnWxKXfvvMQ6QItrnzLhdAGAqV5KrjvWuiaGFN7CIDIrY1Ys9IOHv0ldJfCvZ4pSv6bGCNJGmLlIAFUDRsHwqj1LfYQJzmiw+i9Ordq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616992; c=relaxed/simple;
	bh=e4nrrm5xbcyZMzUpYLNjE75lZ2UOHD77VLTTOG+eLGE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IahOUkAr7AZnmBaiP9+WWdsY9hG2esKu1B8ZoOYnTwsbncV20HRwep2oVVB0p9W1ug5emnbbZjaLBnRkTYHtZ4T2foWZqw2i23KoeF/NC+MMpbbrn0ZagWO7auyvNEL+FM68Q3ZKzU5/toEYGUMniyvYmkXLIxOD4JkCzkhX1G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YVGfnjy4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YVGfnjy4"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so119207295e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616988; x=1768221788; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OYzWwgmAliEwfQEPHrauC5nD+rAzF1GQXy4sVPk7+lg=;
        b=YVGfnjy4imT54+zFjvwgkAbEINE1ZGIXOycI7QiAYEHicBFQ+OIqwtmG43r5yJHOAC
         JMYfEB+OPud1ABH4jc11mrBF1kEsErnmSDQWuiLzu8I5JybTJlXyGEEy8g3ncL3dqVlg
         uJsE1ll8s5W7DbqxXtSWGkrbUYk0ApS96LiiRKFNZpKPRn2zHJ1t1oEfXUnU1AfWON73
         M5UX8U6/u0Cvxtx+euBEo0m/0eqrDhDxGBTPrbqHsTRncxSwjYIoRzktEEXtV6jzbjRj
         ZC/O1gQBTozbGNf7o/R9r2nulQh4EhUfB3UYUGUXYCaV6G+jBjxYdXYRpMUiiIKc3WSh
         6Q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616988; x=1768221788;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYzWwgmAliEwfQEPHrauC5nD+rAzF1GQXy4sVPk7+lg=;
        b=lWDUYdZKLi0+LOBSsW0za+T50pIvmdtW2V3ubIkwoaZHmhCMoMF0Ognmtr3cmaR6UD
         bceXTfqj39Ay3botzIJpqslFK2SxdQsFAVS7FIhMZGtJJ3YBFKtMdfwlKujOPCGGkU0n
         gIwDv6oW1Zmm7kJuLyCujP2zMh06N458Pmu/dythBq2T3yT1YzldDnCURua5eDF1rPHq
         NgNfmExVURy0RxR1lmxuYaEglRlm3347b7HT9mrHrd8i68XwQLB0HH/lrvvXV1q7flPc
         AH5KIuCiQ/K9+6gwEYIYbOUitxqOEysc+viXizSWZnmnuFqTk+eKOomAm+2+uITTVeNo
         vrrA==
X-Gm-Message-State: AOJu0Ywebc2+8dEt+eVSWzGPBn0J0zdaNkEhJDWUzq3KhEfOPh67NlZi
	kY0pDqzKiM5V4o+uIW0gmlv8rF2nWcpTx9Z68iFrlp9s17swx6L3HM0dJAvzONIuuuD32/MNYC3
	D/QHKEKT9jqcXKhyQJ7HoCzKK+pyMvQ8SsC0UAgPTCi0KGj3oJsBg71h1aGq9yGRePBkrv9JdTE
	SeQqK9zPOPBRINjdX5MiL8/8/zKFUZ6fQXfgtPTIOhB5F1qIMsfVn/ehQk/bBYKWM=
X-Google-Smtp-Source: AGHT+IGDqrgAr5Z4MQA8RIWhocXuGBP5+eed7VhAoVwELBrQWnPlaU+/SaKT+l0gBAl6Qgp78Sk+dWYi3fCN08U=
X-Received: from wmby2.prod.google.com ([2002:a05:600c:c042:b0:477:165e:7e2a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5493:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-47d19595fa9mr541367195e9.18.1767616987981;
 Mon, 05 Jan 2026 04:43:07 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:34 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3086; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=e4nrrm5xbcyZMzUpYLNjE75lZ2UOHD77VLTTOG+eLGE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G9p4uCEFC397NTuGfU1oBczrREYrVE2w2RL
 DtKwR5WcR+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvQAKCRAEWL7uWMY5
 RgHHD/9MbsXH2qKm6d9XPnZqN1nMhXxq1bfN4YyliMKl2mIo8yU3R4/99/yARD+V/Minjnvdx9t
 MDcQmyaXDY/XWs7iZspiJw/HiWmPwBw/WZH2pT3amtX53DmiUZXIGN1t2MVjd1yMqK9Eyvlu+q1
 o3A8oGg7KBGtbDVry9nqUgXlxLJ/VdWVOP41rU554GfU+C+SKgt9qSjpuUDJppyITGtWfC6ObJP
 POfMe0KArzR7SC/IHaIMjXJMcbkUMqvpbG5pzImLfdah+BPDtIp6sZjAraiDwFuQ9OTGMWDIDjz
 p+FXQlHPoKV2uSu0UYEh8Quu5J+hHBARUrW08S/Mrr9Xkic94H4wtZordEZa2+jW/u3/tMEA5t/
 mnZ83OLp9j6+7k/5MEa+jZ4ubhdXwpzN7Li1vrd0zXPGE8lxzCAMbZ0ZRKBZ6ObKf91gnvTyAGL
 WGfiPO0Zl2YKTEMwu/ZQpNRg0Ow1FYc6DnS5TEOnfEi7h1R0UEDRjV6ywfi7cfBfGIuRaMK44Re
 KnenMhGUM477eaWUgPFg7ouv93voGNDQfD2cvSTJlkcIOoXVJ7cPlSRt+Eiif5mwA4X+H1uXdu5
 jZhLpmQsy+o+BQwlSmf1BkHcX51s/y+0pxdwPqKiVn0PolQHRsggNjWXnDzmYNuRR8ngvTcftFx pmOi3CX6AJQJbXQ==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-21-51da5f454a67@google.com>
Subject: [PATCH v2 21/27] rust: task: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/signal.c |  2 +-
 rust/helpers/task.c   | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/rust/helpers/signal.c b/rust/helpers/signal.c
index 1a6bbe9438e281cd8b61141a390cea042949e7bd..85111186cf3d77508fefac9407c87c5f000d15cf 100644
--- a/rust/helpers/signal.c
+++ b/rust/helpers/signal.c
@@ -2,7 +2,7 @@
 
 #include <linux/sched/signal.h>
 
-int rust_helper_signal_pending(struct task_struct *t)
+__rust_helper int rust_helper_signal_pending(struct task_struct *t)
 {
 	return signal_pending(t);
 }
diff --git a/rust/helpers/task.c b/rust/helpers/task.c
index 2c85bbc2727efedf5eb61fe496cd80598fafcdd1..c0e1a06ede78c0b0641707b52a82725543e2c02c 100644
--- a/rust/helpers/task.c
+++ b/rust/helpers/task.c
@@ -3,60 +3,60 @@
 #include <linux/kernel.h>
 #include <linux/sched/task.h>
 
-void rust_helper_might_resched(void)
+__rust_helper void rust_helper_might_resched(void)
 {
 	might_resched();
 }
 
-struct task_struct *rust_helper_get_current(void)
+__rust_helper struct task_struct *rust_helper_get_current(void)
 {
 	return current;
 }
 
-void rust_helper_get_task_struct(struct task_struct *t)
+__rust_helper void rust_helper_get_task_struct(struct task_struct *t)
 {
 	get_task_struct(t);
 }
 
-void rust_helper_put_task_struct(struct task_struct *t)
+__rust_helper void rust_helper_put_task_struct(struct task_struct *t)
 {
 	put_task_struct(t);
 }
 
-kuid_t rust_helper_task_uid(struct task_struct *task)
+__rust_helper kuid_t rust_helper_task_uid(struct task_struct *task)
 {
 	return task_uid(task);
 }
 
-kuid_t rust_helper_task_euid(struct task_struct *task)
+__rust_helper kuid_t rust_helper_task_euid(struct task_struct *task)
 {
 	return task_euid(task);
 }
 
 #ifndef CONFIG_USER_NS
-uid_t rust_helper_from_kuid(struct user_namespace *to, kuid_t uid)
+__rust_helper uid_t rust_helper_from_kuid(struct user_namespace *to, kuid_t uid)
 {
 	return from_kuid(to, uid);
 }
 #endif /* CONFIG_USER_NS */
 
-bool rust_helper_uid_eq(kuid_t left, kuid_t right)
+__rust_helper bool rust_helper_uid_eq(kuid_t left, kuid_t right)
 {
 	return uid_eq(left, right);
 }
 
-kuid_t rust_helper_current_euid(void)
+__rust_helper kuid_t rust_helper_current_euid(void)
 {
 	return current_euid();
 }
 
-struct user_namespace *rust_helper_current_user_ns(void)
+__rust_helper struct user_namespace *rust_helper_current_user_ns(void)
 {
 	return current_user_ns();
 }
 
-pid_t rust_helper_task_tgid_nr_ns(struct task_struct *tsk,
-				  struct pid_namespace *ns)
+__rust_helper pid_t rust_helper_task_tgid_nr_ns(struct task_struct *tsk,
+						struct pid_namespace *ns)
 {
 	return task_tgid_nr_ns(tsk, ns);
 }

-- 
2.52.0.351.gbe84eed79e-goog

