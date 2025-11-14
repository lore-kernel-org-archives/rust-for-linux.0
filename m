Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6252DC34E
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 06:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763100135; cv=none; b=kN/aF5cquKzNuWamsB3wQsNOaufll7o7EQqTRRkmUcXZRxh/pfQUQL02+/Zi+SDUHTVGACTZ8QtjvEE785lSXLUrc1Vn6CbLNx0qE6j5AeUyHMu+tKm4K5eYMvvW0o+7NQhLzXtawy4upYlutN+R/2U286MskgNcgQp0OfY7RjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763100135; c=relaxed/simple;
	bh=lvv1bTtYoBEe3pfLt016s8g00xygDEGVSL/llzbKK3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwM1440zgxm8QONaCEYQfTiG2mQHS4v5aGXoXOcw3rlFwdDoflwlDGof/NvrUNzP8uq9h/JFhYnl1RqwLKtfFj2nhcRFoA7Ng6k9Rs96TaziFyvykAvH9hbSG5zIpN9/iC995hdchcBODz34PVuoFfCyuuF1VRTUdD8fpAIsImI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrcqqIrj; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrcqqIrj"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8a3eac7ca30so106558485a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 22:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763100131; x=1763704931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n3AWjtCxQvzHDlbqNiWsS7jbJ8xKna7L0HUdBzVx2Fg=;
        b=FrcqqIrjoCX4PFGcdXqZaHoJSSoNJY51WK72MK8j4TWfz49isSG+ph9/7lsdYH6zAg
         D0Q71ty18gsDUP2G0Vd5kx8xkdTJEe9srMjOUWg7ys6Tdnl5xvUry7RrJD/+r+lHFVYk
         Wtl6rIf3eg56z4cS0mGju9yOb4mLMOAcZFda9UIuHHZi1aGvWhzyGzvNmiqX1rOBLz4e
         7AwE5opN/sXF3j4OFhdknR6l4/Pn8u2NujnrghXri8RSYga3HysvI4u0jn33FoqNi8Jw
         NJYkDZhCupXp8NMIDEblAwZZTpgxjGoNyVyHwz8NYWzf6xsQkTxpjEF/3EuJRcuyFM4Q
         9LmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763100131; x=1763704931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3AWjtCxQvzHDlbqNiWsS7jbJ8xKna7L0HUdBzVx2Fg=;
        b=hDdJFKlLw9k0TllAp0HYltxqCp0f2aPSFDRvW9xgZZmHZR/xPE1LGsYtTyJfUW+qpa
         cKPWAl9mOKeAiJfML6Fyd6KwyBGO6L7lhgucGlaJgq6L/GuOuY6racY5JFFoBkJtDt2j
         Mf0UUs/yMv8c18pBcoHwV3XOfJJBUHjE37enDHwvN/Tmq1l3+8HrjweorPbCaVn3sTYc
         R6pEedWXDNP9MMKJwXGYaFMl5KLD+O22ae1yaJwjOnnY+qPBq+qFg8gdp20gNisGeoZz
         UjMfeIaHpzrZsv0REDPj9IRBVy5P5XW6YdBikixocWgFmRwbW+Mn384c9MmjsZ8AkiDZ
         gSJw==
X-Forwarded-Encrypted: i=1; AJvYcCWlnABQbiQMn1YdVWXuJrqb0RKazab+EeQxChwUJ+QFlYVBtxOK88Wsc+ENaytlp1C6d7QRe56NNJ+AoGN6Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF99aTBbpWBXtT3+XeEWGAEv9cYG1yFfaTJovSaaKqun+vydBz
	hbz9A3HyF3Pyr2griuF6tJFIV/OdAL7ZupmK0Wv3cJYRhJQwSLm1/hqz
X-Gm-Gg: ASbGncsoEhxd4okBAUAIWj0RMGCI/KYE9+DDUpdSvV5a/WNMH6c2d8UBYpQbLQw/Sqn
	VzRzpqWOy9EQF0/Qjpadqjb97gQgqz3aBmnan1pvmAT7XjipB5hr2pbaxyfKpOJdqk0RRXmatiP
	rKZgsAFb8dtIhbjNvZHlsdHd4YN0RrAgBIop2zmaUnCmFUYvDmPOUd4J5GBLHvLW7QznUGyDf7P
	+ZCgVJLR81+d016tezR7zFQaCayUle41L2R6NNZSOd8IcDuhvMgNbSAuTwFCj0eUuKOEeVyb2H5
	kcGuCoz9GGHjdbyacV6xKolK5oRrp+B8T9PwhOgvbRUO9/2yAkppwEuYYlf2xqbM4U37YE36ZaN
	W/ZnOwYCx2WCqUSwu31U9/2k2fJcphhiNxRT2AjkfDrTm1usU9v2TETlsMckB+5+u/VPzeNBdwb
	Tm4OIT8bLgevXltemRPG+fRT/vB+/VkYCy3vNlkxTfdNQLAaVy7a276LnA1D91xjV0RaFdDqBBF
	Eld9yfQ+yIQ1YQ=
X-Google-Smtp-Source: AGHT+IHKq0DOsKLq3CHeU4c/K8+jRGXnhsevQbrZ2GhAUEKBX/DBD8ZSsY/DK1OavAhKvof7FqlVOA==
X-Received: by 2002:a05:620a:288d:b0:8a2:ef8:348f with SMTP id af79cd13be357-8b2c31a1111mr248747385a.55.1763100131161;
        Thu, 13 Nov 2025 22:02:11 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2af05d29asm274125985a.50.2025.11.13.22.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 22:02:10 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4141CF4007E;
	Fri, 14 Nov 2025 01:02:10 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 14 Nov 2025 01:02:10 -0500
X-ME-Sender: <xms:4sUWaa7Al_tGa1yHmU1LHxvQAaBFDMkGaTwOGSuqFzTCI_hUZROdrA>
    <xme:4sUWaTKW1x_J7K5IGj6vEunFJgelFFTsQi-g73947L3cPu5k10zJR8GV86nXjXSMR
    Q07E51B_8QjoYGLQ2uk49vmw372gLPa3Sk4dj0l6MAu1Sz_q5Lr6Q>
X-ME-Received: <xmr:4sUWacTTMizjNuBP5fw3oF9aS48TONtWBNj3bPOKSZ842fFnXY4eX5ImUHYJtkkUD-f18p6lfLFVqA2KDIVb5rSZcpG9ZTGT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeltdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhnghhmrg
    hnsehrvgguhhgrthdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgv
    uggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmh
    grihhlrdgtohhm
X-ME-Proxy: <xmx:4sUWaeoZaCm1nfcJ6Osr55hnG8t09jv01N-LCdkwc3c8mzjiPMTUkw>
    <xmx:4sUWaSaNnyu4dV1tC5GwQ5ujgLkr_c8jfSdKKrkkacMw9s3LO7DDXA>
    <xmx:4sUWaRSMytoX9rONB8FmZjx1QECj2I7XjPmplfW_j1gZf8gscwR2LA>
    <xmx:4sUWaYeDm6XEU0makx0dA-adwwaoEaWYiJhYl21RDEXZpDQ8mODpqg>
    <xmx:4sUWaYk0SeGWx1ltUzuNlp9ywswgzEGtjOwM1Zqd1BVhIKU8B8ZNxVSa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Nov 2025 01:02:09 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: "Will Deacon" <will@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	reg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 4/4] locking/mutex: Redo __mutex_init()
Date: Thu, 13 Nov 2025 22:02:00 -0800
Message-ID: <20251114060200.12982-5-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251114060200.12982-1-boqun.feng@gmail.com>
References: <20251114060200.12982-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mutex_init() invokes __mutex_init() providing the name of the lock and
a pointer to a the lock class. With LOCKDEP enabled this information is
useful but without LOCKDEP it not used at all. Passing the pointer
information of the lock class might be considered negligible but the
name of the lock is passed as well and the string is stored. This
information is wasting storage.

Split __mutex_init() into a _genereic() variant doing the initialisation
of the lock and a _lockdep() version which does _genereic() plus the
lockdep bits. Restrict the lockdep version to lockdep enabled builds
allowing the compiler to remove the unused parameter.

This results in the following size reduction:

      text     data       bss        dec  filename
| 30237599  8161430   1176624   39575653  vmlinux.defconfig
| 30233269  8149142   1176560   39558971  vmlinux.defconfig.patched
   -4.2KiB   -12KiB

| 32455099  8471098  12934684   53860881  vmlinux.defconfig.lockdep
| 32455100  8471098  12934684   53860882  vmlinux.defconfig.patched.lockdep

| 27152407  7191822   2068040   36412269  vmlinux.defconfig.preempt_rt
| 27145937  7183630   2067976   36397543  vmlinux.defconfig.patched.preempt_rt
   -6.3KiB    -8KiB

| 29382020  7505742  13784608   50672370  vmlinux.defconfig.preempt_rt.lockdep
| 29376229  7505742  13784544   50666515  vmlinux.defconfig.patched.preempt_rt.lockdep
   -5.6KiB

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Waiman Long <longman@redhat.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251105142350.Tfeevs2N@linutronix.de
---
 include/linux/mutex.h        | 45 ++++++++++++++++++++++++++++--------
 kernel/locking/mutex.c       | 22 +++++++++++++-----
 kernel/locking/rtmutex_api.c | 19 +++++++++++----
 3 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 847b81ca6436..bf535f0118bb 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -86,8 +86,23 @@ do {									\
 #define DEFINE_MUTEX(mutexname) \
 	struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
 
-extern void __mutex_init(struct mutex *lock, const char *name,
-			 struct lock_class_key *key);
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+void mutex_init_lockep(struct mutex *lock, const char *name, struct lock_class_key *key);
+
+static inline void __mutex_init(struct mutex *lock, const char *name,
+				struct lock_class_key *key)
+{
+	mutex_init_lockep(lock, name, key);
+}
+#else
+extern void mutex_init_generic(struct mutex *lock);
+
+static inline void __mutex_init(struct mutex *lock, const char *name,
+				struct lock_class_key *key)
+{
+	mutex_init_generic(lock);
+}
+#endif /* !CONFIG_DEBUG_LOCK_ALLOC */
 
 /**
  * mutex_is_locked - is the mutex locked
@@ -111,17 +126,27 @@ extern bool mutex_is_locked(struct mutex *lock);
 #define DEFINE_MUTEX(mutexname)						\
 	struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
 
-extern void __mutex_rt_init(struct mutex *lock, const char *name,
-			    struct lock_class_key *key);
-
 #define mutex_is_locked(l)	rt_mutex_base_is_locked(&(l)->rtmutex)
 
-#define __mutex_init(mutex, name, key)			\
-do {							\
-	rt_mutex_base_init(&(mutex)->rtmutex);		\
-	__mutex_rt_init((mutex), name, key);		\
-} while (0)
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+extern void mutex_rt_init_lockdep(struct mutex *mutex, const char *name,
+			     struct lock_class_key *key);
+
+static inline void __mutex_init(struct mutex *lock, const char *name,
+				struct lock_class_key *key)
+{
+	mutex_rt_init_lockdep(lock, name, key);
+}
 
+#else
+extern void mutex_rt_init_generic(struct mutex *mutex);
+
+static inline void __mutex_init(struct mutex *lock, const char *name,
+				struct lock_class_key *key)
+{
+	mutex_rt_init_generic(lock);
+}
+#endif /* !CONFIG_LOCKDEP */
 #endif /* CONFIG_PREEMPT_RT */
 
 #ifdef CONFIG_DEBUG_MUTEXES
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index de7d6702cd96..f3bb352a368d 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -43,8 +43,7 @@
 # define MUTEX_WARN_ON(cond)
 #endif
 
-void
-__mutex_init(struct mutex *lock, const char *name, struct lock_class_key *key)
+static void __mutex_init_generic(struct mutex *lock)
 {
 	atomic_long_set(&lock->owner, 0);
 	raw_spin_lock_init(&lock->wait_lock);
@@ -52,10 +51,7 @@ __mutex_init(struct mutex *lock, const char *name, struct lock_class_key *key)
 #ifdef CONFIG_MUTEX_SPIN_ON_OWNER
 	osq_lock_init(&lock->osq);
 #endif
-
-	debug_mutex_init(lock, name, key);
 }
-EXPORT_SYMBOL(__mutex_init);
 
 static inline struct task_struct *__owner_task(unsigned long owner)
 {
@@ -142,6 +138,11 @@ static inline bool __mutex_trylock(struct mutex *lock)
  * There is nothing that would stop spreading the lockdep annotations outwards
  * except more code.
  */
+void mutex_init_generic(struct mutex *lock)
+{
+	__mutex_init_generic(lock);
+}
+EXPORT_SYMBOL(mutex_init_generic);
 
 /*
  * Optimistic trylock that only works in the uncontended case. Make sure to
@@ -166,7 +167,16 @@ static __always_inline bool __mutex_unlock_fast(struct mutex *lock)
 
 	return atomic_long_try_cmpxchg_release(&lock->owner, &curr, 0UL);
 }
-#endif
+
+#else /* !CONFIG_DEBUG_LOCK_ALLOC */
+
+void mutex_init_lockep(struct mutex *lock, const char *name, struct lock_class_key *key)
+{
+	__mutex_init_generic(lock);
+	debug_mutex_init(lock, name, key);
+}
+EXPORT_SYMBOL(mutex_init_lockep);
+#endif /* !CONFIG_DEBUG_LOCK_ALLOC */
 
 static inline void __mutex_set_flag(struct mutex *lock, unsigned long flag)
 {
diff --git a/kernel/locking/rtmutex_api.c b/kernel/locking/rtmutex_api.c
index bafd5af98eae..59dbd29cb219 100644
--- a/kernel/locking/rtmutex_api.c
+++ b/kernel/locking/rtmutex_api.c
@@ -515,13 +515,11 @@ void rt_mutex_debug_task_free(struct task_struct *task)
 
 #ifdef CONFIG_PREEMPT_RT
 /* Mutexes */
-void __mutex_rt_init(struct mutex *mutex, const char *name,
-		     struct lock_class_key *key)
+static void __mutex_rt_init_generic(struct mutex *mutex)
 {
+	rt_mutex_base_init(&mutex->rtmutex);
 	debug_check_no_locks_freed((void *)mutex, sizeof(*mutex));
-	lockdep_init_map_wait(&mutex->dep_map, name, key, 0, LD_WAIT_SLEEP);
 }
-EXPORT_SYMBOL(__mutex_rt_init);
 
 static __always_inline int __mutex_lock_common(struct mutex *lock,
 					       unsigned int state,
@@ -542,6 +540,13 @@ static __always_inline int __mutex_lock_common(struct mutex *lock,
 }
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
+void mutex_rt_init_lockdep(struct mutex *mutex, const char *name, struct lock_class_key *key)
+{
+	__mutex_rt_init_generic(mutex);
+	lockdep_init_map_wait(&mutex->dep_map, name, key, 0, LD_WAIT_SLEEP);
+}
+EXPORT_SYMBOL(mutex_rt_init_lockdep);
+
 void __sched mutex_lock_nested(struct mutex *lock, unsigned int subclass)
 {
 	__mutex_lock_common(lock, TASK_UNINTERRUPTIBLE, subclass, NULL, _RET_IP_);
@@ -598,6 +603,12 @@ int __sched _mutex_trylock_nest_lock(struct mutex *lock,
 EXPORT_SYMBOL_GPL(_mutex_trylock_nest_lock);
 #else /* CONFIG_DEBUG_LOCK_ALLOC */
 
+void mutex_rt_init_generic(struct mutex *mutex)
+{
+	__mutex_rt_init_generic(mutex);
+}
+EXPORT_SYMBOL(mutex_rt_init_generic);
+
 void __sched mutex_lock(struct mutex *lock)
 {
 	__mutex_lock_common(lock, TASK_UNINTERRUPTIBLE, 0, NULL, _RET_IP_);
-- 
2.50.1 (Apple Git-155)

