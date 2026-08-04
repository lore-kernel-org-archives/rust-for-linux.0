Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33415374A1B
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860114; cv=none; b=EfNFklt1IJMz+fNiCk0vtAYpAw3WSTa3/awqySwGrQ1gtpKPreZwuLjn9wMumxQOQi1bZd7zboxNaMjtcyCKgYYf/3J60ElesOJLb707HXdIYPgOCy6Yi19g4HQvLVEu70k8ybc+1JprIYNGmiDjPZLwBU2mDCJuAR3+YK3SFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860114; c=relaxed/simple;
	bh=ez8mh8KYXsxEZezHI84ye4skuWKbHPcxR5bfxvHXALU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRVMTRB+VRqHcJetApUI127Vxqnf/wc8eQ0S1/EPsckIK/ZzMjaapHjB3zKFp67WPIRGL5BPD5SCQ5hPolHF+JMUJ490H1CKFSGzUvn9Om/gPu8qNEVEBNu9ep0PMgCLdAvVMSFRQ2+a1Ke/MWQg6jM4dFq5d4jIRFnoqd9db9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQp911EF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQp911EF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309DF1F00A3A;
	Tue,  4 Aug 2026 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860108;
	bh=fJJjzop4LECjkHzK46lASg2zu9hWEBiVBs7rN6nvoKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YQp911EFRdny3wLlSrq/lcVTkWfxKkERHi9PPssFucUSMBm2Rl30dck2AlV9hsCh7
	 +SDszV43ygIum5IKbw47FPOmWc3kMad8T7CVKpxfOcQhqzmDAUo78J3BaEKt29neKg
	 OKw/9QkgZYKICmsgRI20iD7mUF7m3CdeVgRLRHsw2exZyGMPr5WjpxbJVeA53JbDiu
	 J1GuIhfQDjCo1uz+4fA4AbMkxhBiNWpyHUTPCM4t4e32objF1rT8UUWfiBj5ldTJcu
	 Z/0j7inLJ/0HLjHDw9WDDCcKrW19qHzftRXFV4Wtm3x6w1KnPDviJUe9Yj2OY0trOy
	 ptrAgY9MoJilw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D477F40066;
	Tue,  4 Aug 2026 12:15:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 04 Aug 2026 12:15:07 -0400
X-ME-Sender: <xms:CxByatFW0QvTOo_zsewOtihmkxLBQfEGNspZutZ7O5B9cTy52-kzNA>
    <xme:CxByangETpOlFtg8DCfW2FiTUp77yKozSDcP3mcF_ES1KWUZSDMq_lJtRMdux30pF
    LwPpq54w-0andT3bsJghm3qxN1EJNOvRWdS_jXvYFW4n5Sq-tV2ogk>
X-ME-Received: <xmr:CxByaig_Rh4y0XFYtXz-AEaNER-8yjmhqWlexpaa-6RRuxNnQlYijBcPPMvwz9MK52tbTNLFPMGSHCgS0PcM3XODo2H5-5EG>
X-ME-Proxy-Cause: dmFkZTEjNALs/vHMOloma/FioWgq38LEDphqLbi/MDKjZ+skyek9CBm72qNR6fF0uZPdGp
    TNcnAR4AQwTabPyqXb4b8VVQVFCNoT48fsLJV/4jNEVJ0A9eFv0ovpeauV2dgztP0aY1Y0
    jIaZAzpZKJmSr5bjx5yubrqLJ++dH6uDgWLI4XXVkSa8jJqAXQgEQlXOv7WGccuHPTRlER
    Ylu8rJket0jbyQhGWZ+weYiCIeD4wr9LDagDzAHrKU27qzYbzXZIXOYWeFfQKFS5QVbMSU
    NlfDPJ2QDHkDrdBA1iUAq2dsmA2mOrsNEsIEQsqJKBWsANZHLO8XMG8BasrOULdBqAdbTv
    /tZiNGE041QSoQoleXBD2zzVVS8COIP//K06XOEDHhb1OjBYtERM67VN/fXGRN2GYjWBuR
    E+wgljilAj57wTBUc5ZC0YqFMaEc1Eg5KM3WySfyC5wytp6Ep1nMqJrklrMG3kf6c4lFDX
    ugsB0lRdJEBK7yuccrVuR3B8H5+PxFjusOMtGwizslZfTKlnN7t4U2RQtr5qKzKoywNorx
    B8pFXbiTtMsRJk9czxv6rue3a+1ah/cfVVrqRPVHR3C9ALz7rXK6Jmtxhr8PigzNp+KoCQ
    bJAnH4rYIvbvUrYxZ3xAJOVX8Jt+gxea3ZeO/GMTOgEGU/HNKXdhovj8ouEw
X-ME-Proxy: <xmx:CxByaikTpYcMTk4oFuzBjcFCG4bnNEnIClYZ1FAZoQm4HjZpQVhaQA>
    <xmx:CxByauaRxyox-YxJWtbJwYigzyKF-sAOj8c7mFv00jnXnpPgGQlXfQ>
    <xmx:CxByatxC9rgW9So-maS3TX6O6YSAxr7Be66jeG9koHUO-46djKUcKw>
    <xmx:CxByatawd6501QLNLKstPHrYEkz_CrL5JNO-yMo4ilh5LDh16o6E6g>
    <xmx:CxByauyjU_K-XPUjC4NXREs3YrH2bxReKqpeIlbxmPR3lKMkftYjw-2H>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:06 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 07/17] locking: Switch to _irq_{disable,enable}() variants in cleanup guards
Date: Tue,  4 Aug 2026 09:14:29 -0700
Message-ID: <20260804161447.84806-8-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804161447.84806-1-boqun@kernel.org>
References: <20260804161447.84806-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The semantics of various IRQ disabling guards match what
*_irq_{disable,enable}() provide, i.e. the interrupt disabling is
properly nested, therefore it's OK to switch to use
*_irq_{disable,enable}() primitives.

[boqun: Adjust the user-side changes in do_sched_cfs_*_timer() provided
by Peter and Lyude]

Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/spinlock.h | 26 ++++++++++++--------------
 kernel/sched/fair.c      | 12 ++++++------
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index 3d405cc4c121..799a8f7d2741 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -572,12 +572,12 @@ DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_nested, __acquires(_T), __releases(*(raw
 #define class_raw_spinlock_nested_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_nested, _T)
 
 DEFINE_LOCK_GUARD_1(raw_spinlock_irq, raw_spinlock_t,
-		    raw_spin_lock_irq(_T->lock),
-		    raw_spin_unlock_irq(_T->lock))
+		    raw_spin_lock_irq_disable(_T->lock),
+		    raw_spin_unlock_irq_enable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irq, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
 #define class_raw_spinlock_irq_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irq, _T)
 
-DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq(_T->lock))
+DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq_disable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irq_try, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
 #define class_raw_spinlock_irq_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irq_try, _T)
 
@@ -592,14 +592,13 @@ DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_bh_try, __acquires(_T), __releases(*(raw
 #define class_raw_spinlock_bh_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_bh_try, _T)
 
 DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
-		    raw_spin_lock_irqsave(_T->lock, _T->flags),
-		    raw_spin_unlock_irqrestore(_T->lock, _T->flags),
-		    unsigned long flags)
+		    raw_spin_lock_irq_disable(_T->lock),
+		    raw_spin_unlock_irq_enable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irqsave, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
 #define class_raw_spinlock_irqsave_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irqsave, _T)
 
 DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
-			 raw_spin_trylock_irqsave(_T->lock, _T->flags))
+			 raw_spin_trylock_irq_disable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irqsave_try, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
 #define class_raw_spinlock_irqsave_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irqsave_try, _T)
 
@@ -618,13 +617,13 @@ DECLARE_LOCK_GUARD_1_ATTRS(spinlock_try, __acquires(_T), __releases(*(spinlock_t
 #define class_spinlock_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_try, _T)
 
 DEFINE_LOCK_GUARD_1(spinlock_irq, spinlock_t,
-		    spin_lock_irq(_T->lock),
-		    spin_unlock_irq(_T->lock))
+		    spin_lock_irq_disable(_T->lock),
+		    spin_unlock_irq_enable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irq, __acquires(_T), __releases(*(spinlock_t **)_T))
 #define class_spinlock_irq_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irq, _T)
 
 DEFINE_LOCK_GUARD_1_COND(spinlock_irq, _try,
-			 spin_trylock_irq(_T->lock))
+			 spin_trylock_irq_disable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irq_try, __acquires(_T), __releases(*(spinlock_t **)_T))
 #define class_spinlock_irq_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irq_try, _T)
 
@@ -640,14 +639,13 @@ DECLARE_LOCK_GUARD_1_ATTRS(spinlock_bh_try, __acquires(_T), __releases(*(spinloc
 #define class_spinlock_bh_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_bh_try, _T)
 
 DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
-		    spin_lock_irqsave(_T->lock, _T->flags),
-		    spin_unlock_irqrestore(_T->lock, _T->flags),
-		    unsigned long flags)
+		    spin_lock_irq_disable(_T->lock),
+		    spin_unlock_irq_enable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irqsave, __acquires(_T), __releases(*(spinlock_t **)_T))
 #define class_spinlock_irqsave_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irqsave, _T)
 
 DEFINE_LOCK_GUARD_1_COND(spinlock_irqsave, _try,
-			 spin_trylock_irqsave(_T->lock, _T->flags))
+			 spin_trylock_irq_disable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irqsave_try, __acquires(_T), __releases(*(spinlock_t **)_T))
 #define class_spinlock_irqsave_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irqsave_try, _T)
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d78467ec6ee1..a46c4ff49f74 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7120,7 +7120,7 @@ static bool distribute_cfs_runtime(struct cfs_bandwidth *cfs_b)
  * period the timer is deactivated until scheduling resumes; cfs_b->idle is
  * used to track this state.
  */
-static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun, unsigned long flags)
+static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun)
 	__must_hold(&cfs_b->lock)
 {
 	int throttled;
@@ -7155,10 +7155,10 @@ static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun, u
 	 * This check is repeated as we release cfs_b->lock while we unthrottle.
 	 */
 	while (throttled && cfs_b->runtime > 0) {
-		raw_spin_unlock_irqrestore(&cfs_b->lock, flags);
+		raw_spin_unlock_irq_enable(&cfs_b->lock);
 		/* we can't nest cfs_b->lock while distributing bandwidth */
 		throttled = distribute_cfs_runtime(cfs_b);
-		raw_spin_lock_irqsave(&cfs_b->lock, flags);
+		raw_spin_lock_irq_disable(&cfs_b->lock);
 	}
 
 	/*
@@ -7266,7 +7266,7 @@ static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq)
 static void do_sched_cfs_slack_timer(struct cfs_bandwidth *cfs_b)
 {
 	/* confirm we're still not at a refresh boundary */
-	scoped_guard(raw_spinlock_irqsave, &cfs_b->lock) {
+	scoped_guard(raw_spinlock_irq, &cfs_b->lock) {
 		u64 runtime = 0, slice = sched_cfs_bandwidth_slice();
 
 		cfs_b->slack_started = false;
@@ -7351,14 +7351,14 @@ static enum hrtimer_restart sched_cfs_period_timer(struct hrtimer *timer)
 	int idle = 0;
 	int count = 0;
 
-	CLASS(raw_spinlock_irqsave, cfsb_guard)(&cfs_b->lock);
+	guard(raw_spinlock_irq)(&cfs_b->lock);
 
 	for (;;) {
 		overrun = hrtimer_forward_now(timer, cfs_b->period);
 		if (!overrun)
 			break;
 
-		idle = do_sched_cfs_period_timer(cfs_b, overrun, cfsb_guard.flags);
+		idle = do_sched_cfs_period_timer(cfs_b, overrun);
 
 		if (++count > 3) {
 			u64 new, old = ktime_to_ns(cfs_b->period);
-- 
2.50.1 (Apple Git-155)

