Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F0733B967
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616990; cv=none; b=avWWGI3gmMWqUNnFuy/CzNdqyXHUU7hs4EzybgGT76/eKScsXicmsCBdZ5XtOM3JdcK4UODBOaMNUXcJW/6JLFE1Rlo383xzF8h9dWasb75ascXB8ZPsq0yDL2gvB0DBHum+O4TT3dKg1+O+yuuI8jgvQYw4Em122g3Mvb6rJm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616990; c=relaxed/simple;
	bh=MiqyH+rkPNCl8g5063kvcwsyFJ5g45e9rJr0o4ETO/8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sYdH3Z25yuV/SRiiLqILNncBFi+dIFlGkPUdWf9ZvwDZcYM5dWoeUUQReCbUGbgXjZAaRorDm1p1obrFhGLBRGSv11dGNU08nCmSsLTSwZVND9ZaJiBkCpw03pf638sq2QNKkFsWe4vAhxbJUERZjQTxL0eJ65V79jOrbZAenkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDxeZghY; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDxeZghY"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477cf25ceccso149639385e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616987; x=1768221787; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTIoQaEnog9WD66pJsq6VxxlR/KCBsI4t9oYkfofaxI=;
        b=aDxeZghY4poXEMnXXNErzplsnia+Gfu3+lKTJUK8Iksh3bRkT6jkloykUXT/bvjDEX
         YxaifShAtjyPAHELznEq8NkY4t22BBEqGwAIj80Ei99YU5ef/bb+EhWB5yTmjaAh6bck
         nbUPJPMA+HRC+/HO9y5F+KTzPr6OH9rPnEJlneC1tdg36bvGOTBx3DEqIH/2ipNFo8M3
         ALwA1UxzzGA/wFqYTC4I0y1a61Jm5ZdJCXd02FhhqQCOT+c2fnzw6PMa8P/NCwIwtqXz
         EKT1oRFl/aJQaguhPX/AAPuHTf+HegKVBICh0h/VIcOyVc62ZpDbg/G/6pdO43PLj6Bq
         qNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616987; x=1768221787;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTIoQaEnog9WD66pJsq6VxxlR/KCBsI4t9oYkfofaxI=;
        b=rWBQrtcFvUw69z+PsCzsAFVRYKCuvI+CL1CpBet3xIg5cG7cZqo/n/uhrEOT6of+AW
         KldcWuBOemcUqGXyp6V56p0ZflHkXsV9bg8Z/DDTLvFIqV2aLDIQu4UEBAIJpsk4efuZ
         hyVui+J4VNe/j0+NjSig09SUOe0NCYZvcFA/kxHwWHtWcgM9XZMKiZ8FbJV/ilvFde2G
         RfVnvG4K3s1JuirpHrd4rPRWKnI/X75iuk6V98/VgDUTGjEFo6jW/2eJSaQvvKOrSSnD
         Olj1kQZrzBQpM7zMeYkKd3tb1TShk9Vog1s+4nzoX3QP4vWuVW90mLV9EKMNJW+cQ3Mk
         aYKw==
X-Gm-Message-State: AOJu0YxbrbtkCAfPwqDBeGo8zlCtQsUn/OQcoOYum/EZ/sTZWv31LlLg
	0cMI8oe9m9s1HE5UYbzdlwYEX2HO8wHjw9pfl3fK0jJa274Tp8aCssT9QvifRmCLObBRcjPxGx6
	QSpkxSA+4EC4i5/Nnf3u02LhipevYVT24h+QqpLZSFATDM198HyMUIXbL92KnMTxda4y69qYwAu
	Ni6xDjFGR/hFuulaWywFkrprDvEwz1JtfB2Aqag8I6ek5Hq3sAZQuF6FF2YQ3dEm8=
X-Google-Smtp-Source: AGHT+IHUtIcXtQ90BbZJ5bLyfIZ6RT6K+jZHmCXbUV+wMcYP7ltmZI6aFNS9LkiV88dg6NGvWhDFVNUlOaNMPLw=
X-Received: from wrig10.prod.google.com ([2002:a5d:64ea:0:b0:431:3b0:d1fe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c01:b0:431:92e:1d44 with SMTP id ffacd0b85a97d-4324e4cbc63mr57747274f8f.20.1767616986764;
 Mon, 05 Jan 2026 04:43:06 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:33 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3844; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=MiqyH+rkPNCl8g5063kvcwsyFJ5g45e9rJr0o4ETO/8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G93m1K7h7qTz6d0Iqe0RvvIqF+lEQO4z03o
 V2rDhsHoWCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvQAKCRAEWL7uWMY5
 RuGCD/9jqGVfJNTuUpjAxXuBBo0MIZvorxYUdtZ0z2YXWkuWmka7fiDyesLytHRSM3+koqFIz67
 pd8ft4TI9YnFsac7QQrRO4NTFmVNrfgTbsXqB83R7BaUCaAbQVgqCJIAAsJqbi4ivraD1H4tQ3/
 qCGk51fFDaNauFe7ewikFdIZ4iATd6u9w3wCXbeKY+VgHCj8k44TkL+B4SHOFX09+Vwt88QIPxp
 e1MNXbdXy0WIWDfuKeLeodnHHZ+2/BHKBJZRg57I+FO1yeyRC1W7Rjr7zSe5xVIv50GBxxZPnZy
 SPO5mLb80f6nVa0fC3ERA7nzrQMH7hXoTLiASuOWNl+aSfQ0tOqTKaC42yPWj3CN7GgpXsDjFDe
 CHVK2191cLf/nVn/83XbW3K/qgJnSUVaY/JinZWUOpmuiL19peF8cKzWtwxYcJ1mPwqRDrT1JT6
 m+i4fkcmWUOnDl5whjZ4yxtq3yj2em4e05dusiW/JHWcu+qeRxrcNTXikHnDYbfL9nLKYgZDcnF
 k9n49gCarVV4fnHueHK4FB7I/p5rZDJjSnlMLdMWGbYO/Gq6CXv+zy1+x5qnpKce6USWC+aeoxh
 OYMsQyVIm3Lviog+PfO2KLAjaK/LehwxcFxOXAWIjMBgiD+MYX5aJUCR1rxCoHR7+Dwp7ENCX2b kHDWYYQI/lRrV/A==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-20-51da5f454a67@google.com>
Subject: [PATCH v2 20/27] rust: sync: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Mitchell Levy <levymitchell0@gmail.com>, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Mitchell Levy <levymitchell0@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>
---
 rust/helpers/mutex.c    | 13 +++++++------
 rust/helpers/spinlock.c | 13 +++++++------
 rust/helpers/sync.c     |  4 ++--
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/rust/helpers/mutex.c b/rust/helpers/mutex.c
index e487819125f0dfe0741601205e8f84d322c973d5..1b07d6e64299d509bc3ce1af99b19aa97b721fc6 100644
--- a/rust/helpers/mutex.c
+++ b/rust/helpers/mutex.c
@@ -2,28 +2,29 @@
 
 #include <linux/mutex.h>
 
-void rust_helper_mutex_lock(struct mutex *lock)
+__rust_helper void rust_helper_mutex_lock(struct mutex *lock)
 {
 	mutex_lock(lock);
 }
 
-int rust_helper_mutex_trylock(struct mutex *lock)
+__rust_helper int rust_helper_mutex_trylock(struct mutex *lock)
 {
 	return mutex_trylock(lock);
 }
 
-void rust_helper___mutex_init(struct mutex *mutex, const char *name,
-			      struct lock_class_key *key)
+__rust_helper void rust_helper___mutex_init(struct mutex *mutex,
+					    const char *name,
+					    struct lock_class_key *key)
 {
 	__mutex_init(mutex, name, key);
 }
 
-void rust_helper_mutex_assert_is_held(struct mutex *mutex)
+__rust_helper void rust_helper_mutex_assert_is_held(struct mutex *mutex)
 {
 	lockdep_assert_held(mutex);
 }
 
-void rust_helper_mutex_destroy(struct mutex *lock)
+__rust_helper void rust_helper_mutex_destroy(struct mutex *lock)
 {
 	mutex_destroy(lock);
 }
diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index 42c4bf01a23e4003ea82c65b16bc8f495ad37750..4d13062cf253e67894aaa9ba968ff381db2c651e 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -2,8 +2,9 @@
 
 #include <linux/spinlock.h>
 
-void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
-				  struct lock_class_key *key)
+__rust_helper void rust_helper___spin_lock_init(spinlock_t *lock,
+						const char *name,
+						struct lock_class_key *key)
 {
 #ifdef CONFIG_DEBUG_SPINLOCK
 # if defined(CONFIG_PREEMPT_RT)
@@ -16,22 +17,22 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
 #endif /* CONFIG_DEBUG_SPINLOCK */
 }
 
-void rust_helper_spin_lock(spinlock_t *lock)
+__rust_helper void rust_helper_spin_lock(spinlock_t *lock)
 {
 	spin_lock(lock);
 }
 
-void rust_helper_spin_unlock(spinlock_t *lock)
+__rust_helper void rust_helper_spin_unlock(spinlock_t *lock)
 {
 	spin_unlock(lock);
 }
 
-int rust_helper_spin_trylock(spinlock_t *lock)
+__rust_helper int rust_helper_spin_trylock(spinlock_t *lock)
 {
 	return spin_trylock(lock);
 }
 
-void rust_helper_spin_assert_is_held(spinlock_t *lock)
+__rust_helper void rust_helper_spin_assert_is_held(spinlock_t *lock)
 {
 	lockdep_assert_held(lock);
 }
diff --git a/rust/helpers/sync.c b/rust/helpers/sync.c
index ff7e68b4881011ce0aa9beb2df14bf0ffd147337..82d6aff73b04f0ab1030bb5170e40ed6ccac41c0 100644
--- a/rust/helpers/sync.c
+++ b/rust/helpers/sync.c
@@ -2,12 +2,12 @@
 
 #include <linux/lockdep.h>
 
-void rust_helper_lockdep_register_key(struct lock_class_key *k)
+__rust_helper void rust_helper_lockdep_register_key(struct lock_class_key *k)
 {
 	lockdep_register_key(k);
 }
 
-void rust_helper_lockdep_unregister_key(struct lock_class_key *k)
+__rust_helper void rust_helper_lockdep_unregister_key(struct lock_class_key *k)
 {
 	lockdep_unregister_key(k);
 }

-- 
2.52.0.351.gbe84eed79e-goog

