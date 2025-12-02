Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BEE312824
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704323; cv=none; b=SIgIOO0UusypTLk9b0g1JxmwI68X86s1WOpJKAxJxVryLUncAtHRQUPlWaHYMlbdGuoNyd8JiZt+ie6bgfB5IgV8pTu9ReTQjN2/ptuvyd9LUJ6+d3C0oWWPyXuOdWWBoXfR5T7qlcKShYyWMlIoFxu/f7QitA13jADjj8ptJHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704323; c=relaxed/simple;
	bh=fhl2/L8d37xBi9+kQctstqXrXpvPTlJstd1hr/eEYas=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dYWKFrBnGy5gvPapvznRGvkOOr/J+bAjJdmx+Tmog0u5bobOXZSrIU1axDBspD+iLYtG1GsOPh7FKAuqJNecbl7cAW3QPQxk2iXTBEh2mro/b8oZtbNxjPMTb9t1Dy18O1rqWTIMrAOYYfeeJgQTf8fzDDgM3JpuYbbA7wisjbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4CdjiG0f; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4CdjiG0f"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so40374105e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704320; x=1765309120; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5OjswDPS0SLEUD22kwMsB1RpbvmlCyv0yd+mnCZz5cY=;
        b=4CdjiG0f7KKscTBCGBMsBp4Ro+VxQv1Y/lucZ9PgoHw9RX3PynPwNeBGNlY3CovULU
         RIjmhpLy1ipmfwVw0248x05VayCHzVyhERODEUcchk1bpTxulQW/h9Iqf1BSXjaHxndK
         yfzUOVzdvMC6zLgg9E0FearoB/xwI9I7ssrUKK1RZ9m82LFV2t+/HklcTWF3aNh3368l
         FinomYiXXHOIOaDfMtj3XcJLhs0fPA/OZbmJ2GZlYbh1awbpNOZFoO9JMu51Djt0/Zp7
         dPgR2uEt5vCHD42rPkIgjeO32HDuQmeNJeyn2NrG3+El8SUT09uoaJWEH50xVUaVL1PT
         +Auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704320; x=1765309120;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OjswDPS0SLEUD22kwMsB1RpbvmlCyv0yd+mnCZz5cY=;
        b=a5OcXGO6klv056HqC14YSqhONnS8FiaKpR5pdnN+6VO4UpngfO/kZZspuq3rEzCnHs
         5srnNBn3jt1OhxQ1PvvuLt1mzYKQcT67hzzJFG/f6mDJyDsGbifxNBY6kwx5wv6z7ZDs
         bnPOMaq5djWm0sP/N3LiDcV8OQ8ta73hv3B/yH6w99ag/oehqkwAaELNsGUbDBPPOcHF
         LiOjm/4FgWQGLeMIyO2hiaR5GRXPwIc3xJyBM6PMnVLIJ87ba+9WDVrtNg+l9uhsKWcg
         oIM5TWAzE3UyM85IWb562g2oz//vS77vmDC/9LMa7JoFz4kWqPWPRb83kY4EifHZUGjw
         Ku+A==
X-Gm-Message-State: AOJu0YwP5ijTFVnpGMWuQ6ThzXgO8F2To3Tps3NW/XrPbzzLgxdeSVm6
	6ioZLjJdLnPECzrOk3fKH7OuFXIjU82M3fbQni3U0tOD1ZBaSaJQe/FWXjyFaI4Jbr215NOMvyB
	E/UsbcOzL13E0GYH83KMUV8zEha12thxfeV+QhQrQPjRIIqM+EAOEBMkw9fZ4JDrU7/I09+AOXd
	1aBqUPggfQtYUtU1MYjRaA8bDhDFPVrI0Clzn9hfszTrePH8pEyZEhwhWR77SRJJA=
X-Google-Smtp-Source: AGHT+IH3IsNLxqVIjDsd8SX6LigRSR5jleDESEUf+lfOqtR1Qszy2ph3i0V1SbAjmB+T48mjcdigZszxhQtcWRo=
X-Received: from wmxb9.prod.google.com ([2002:a05:600d:8449:b0:477:9d88:de81])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:c857:0:b0:477:9fa0:74ed with SMTP id 5b1f17b1804b1-477c01c4d6emr308335215e9.26.1764704320104;
 Tue, 02 Dec 2025 11:38:40 -0800 (PST)
Date: Tue, 02 Dec 2025 19:38:04 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2996; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fhl2/L8d37xBi9+kQctstqXrXpvPTlJstd1hr/eEYas=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0ALE4/ozza32VHggOa8E2TzpS6ahFD7YWSBX
 KjidaIPDjCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACwAKCRAEWL7uWMY5
 RsjoD/oDFLlm/qNC48G1XnC1y3Dc+mvnTysw2z/2b0sVZcUXdJRgW0qkc57SsPqw+C3qenCmKot
 dTClk6SjRoQH9ReFezOs0tJq/pzuT//9z9NYg86CwhMzO/HtdJebaP51YO1R6OAU3f774KKWec0
 Sc5uE71FBaiYHmjVNX+PnC3Kb2WyiepQkL8zMnLkbeOLNEpg7lzW+Sc4SBCWwPF5yabt3YnFlbJ
 1TTbANQWWO4ihFPheYJBZ57UD7/toKocUsyIDrDQfznuu9jbXH7Ki1xdr9djCW0qAD1ucIGZeM2
 uS4OXAb67WymeIGWqe+rcT8A1MoSu8UrN32jJalqk40rEFAQK6ch7xv89r00cKWTFgjgtGY6wW5
 y68L1QU+1adblZ49fjaRo9BiTUkXtyouMyFE/OS6sHrd2BO1KXWYcmOU5eKG5RzSZsaoGOBjM2s
 UufZG8crGsg4YIUAWgmzcoE74GwBhLO2Djg03nP9R/Q6YB6oonxdB4HWwMBpNKeKvJjjHqNDFJz
 4fZ2y06n1Dn/XtcmMYIiyqxaikS+vD0+XirflkI4LgmpP7xzIkd+AFCyQp12paKyGFalgcT75Wh
 thzGVbOispm+T7LeLbXenlEAwzpxPoI+BIAyszOTd30BY1f56FdgpswpaSHEUlKwFrx1z08uW8j VHJ5fm+FpFME24A==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-40-a2e13cbc17a6@google.com>
Subject: [PATCH 40/46] rust: task: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

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
2.52.0.158.g65b55ccf14-goog

