Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BBC301037
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704321; cv=none; b=t5GoU+2o7/5SMSaGJpmxDrFT9J5rJ+j/AkfjBlDwouubONhS/VIu/6wqs2guEJRtu/pbMTLzif+4mzmUlLk/0+pK4DYTGHgDfrepHwagQahdv0dEOTByuIulxbHb8tShJ4xaEAd2PP4fyOK7gT44EPy+ePuPvyQDY90vyTwT3u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704321; c=relaxed/simple;
	bh=9sd35dLjfBIr4ySTscB92KQs0hjfJ9K08rqyCMh11R0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NMh3XnxIH+X3x1ahfQ2dYkn4AY9bK9Xh+FpcikWtiLgitkRyl6mSUjWzVu7Wa/hFb+eRxZ0xY29UPgcxIH2T+Qo1fe8pL6vCVx1utfoS9cTrwtVtOTGTUDaLzEgHl7l+Y0ePRs7ee48gzyWROydvfogNWACci/fnRx6x7EQt6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VjrIwbVB; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VjrIwbVB"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b73533b84eeso513933566b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704317; x=1765309117; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BcTtAwcIUdoQIiOTydVG9uZu0V4P1X92ytgjA3f10BE=;
        b=VjrIwbVBPQdPS3zCrXkwMv33/2BMk79s+FfZ/E8NRiB5MxShZYth+vYNYTIL2tVv6T
         UeZTpe4dhep+66rKfyxWtnMidUdV5JvKPC9DLJPV447RNHGFA0WTwR+TxZUra9fslYLc
         CP5OmFMmE9KJ3tw4GsHG00VlGJwOYNZmiN192C7Y4DK2zqvjD4K+mTqfvFevlc7z/EMl
         A8ZGW/eRmioyVF6dO8H9R1ZcHuQ8hR+zJumPyRX4ivXzwOO6SUa0Cmz6W3VIp6Y4QhAC
         HIYRFBXOjhOJBBwGsYWIEcGayFJ+CXaDFbOzYQ1+PPf6xEwcpQjGf4yAfchw/qNxInj3
         NxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704317; x=1765309117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BcTtAwcIUdoQIiOTydVG9uZu0V4P1X92ytgjA3f10BE=;
        b=P5Y9DbNkQ1t24ANWl69bXHmauKwDqGoqAY9BAQwJ+rr2+fPB/xduVxQ5qOvgb51upR
         cyEad1sTnq1yL6QhFfYC86oTOvAoGF6hKKg4QSGrDcbpSHfzXSIuO6+/FUwIvqr+NpJU
         1XVlVbjjTXCrVKpRN9DQk+8bfryTxkvfFa0aJyrAgHQ21KOhbUxi4e643i6x/fxZYReZ
         9LG6Y/pEpqA/D/0IJJehfECQ3DQe7hQrJSH/CHWQtQ/yEwM7dQx6Te20ML4/ySyClyTs
         UkUnyufgA+QY7gTFX6yZeTeYXEisDSSukXBulXFIkXzJnr3SyLhvrMk2cKYAc+z+SMU0
         sGmQ==
X-Gm-Message-State: AOJu0Yw02BpJ55r59upEi5uII/b7r8lPGHqt4cXgYYZFeZhD8diezPs9
	86+GrUIvWXtwIaj18zbVfMmaX/7grwQgkl/NjKRNB0mhT5OYSBZI+EJ67Seki4IQv2d+yVlpRw9
	lTBvmrb6hsLhqfApw4OfAtQ3JMLwrbtc8RfG39cGGIhjajb/UNDv+3cexfq9T5Qa6nZJJGfLKhJ
	7GtiTPt76W+a/C3LzZ9mrEWdddDRcuSWHDou+snsBE1k+FIBjrUXvYi9M8vMmIDvw=
X-Google-Smtp-Source: AGHT+IFx8QUiRueY0SUcnLRlCKX1GgoenQ+z+9TsVrAIG6VQYyC2OT8A4BtrIEIJyfslJuVypkcQKxxuZt2+Wzo=
X-Received: from ejcrl22.prod.google.com ([2002:a17:907:6c16:b0:b73:6fbe:a15e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:728a:b0:b73:8d2e:2d38 with SMTP id a640c23a62f3a-b76718ba73bmr4763116966b.50.1764704317658;
 Tue, 02 Dec 2025 11:38:37 -0800 (PST)
Date: Tue, 02 Dec 2025 19:38:03 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3754; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=9sd35dLjfBIr4ySTscB92KQs0hjfJ9K08rqyCMh11R0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0ALY7CC84fe2jOMgOdOpe3kwEvaxpWHppCWj
 nxPnGhkIVaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACwAKCRAEWL7uWMY5
 RgAmEACnn1+0gHmj8o9AQH30HSt0Y9nJ2a4rjg7INu0yP5tL380pnhyRJZshrwufQqH0d0DuNRw
 PSiQo6QvjSVCPjBvLrTcLrNtpdyDjYRsmR1B7PhWIeU8LamfDtWKzo28/LFsoQSHusrtKbViWPi
 gAn+IJvmlnZwp1GATVDiDq1xXh+3jcxS1j7gIpqfybC4vCYvI1Xq5cOj0zRz79PG9+AqY1mIe9/
 9AZj2N7mEePSiusMhE2vwvGFazatSteR6+Zgdh3o/3VEHrYcngxpink3uMXRfvk/XfrgPRE+6c8
 pcUo5CZcM9NCe9NeE2+KUPmYeB78rgjvNlJ+wMQ+cLl8J4gNp22+uXY8x7CaigZbOBwC2GK6MsH
 LTxXJYi9gKyjltl5N1Gzi507hjHoPgRTj+Tmx/1PaHO9v/hz3kMZMt05dVLXhZ7JdqyGGjZvL/g
 oTVj6RBQWXt0mnLpZRTgVpTpfe77PzFV5/PP3M+9gqbVgu/ndXQ0DEmmKBMeGGTPpXr8TMcIymR
 cV8TRdHplLpCKStdFxni9Z6mQMeS4YTububLo7m6BLFp6LZ+r5w7XzsP+kZpDhlDWhoeqjVE2Nd
 hQEF9uIay0s/DU2JzW7uYZz9enEOdKBNV6rHI/w9MLjmPKJGDlVZ2R37tr48M3OcMyv5u9mXUpo d4YNdo+gOEPDceQ==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-39-a2e13cbc17a6@google.com>
Subject: [PATCH 39/46] rust: sync: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Mitchell Levy <levymitchell0@gmail.com>, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

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
2.52.0.158.g65b55ccf14-goog

