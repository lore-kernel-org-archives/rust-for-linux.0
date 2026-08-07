Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2CC393DDC
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086161; cv=none; b=ZnT6xUoTMlGcck4w7GthpHkq3JTQ0R91BPYmcBXMMKDZNXOS2fiLW4vIAbzKI8lBiVzX4M4ep9mUJrgqMaAyfgOOmJeadnx3W++n/l1uOj/LHpil8lXVVHudF2oCKAq/FLhbkZ3Lc6l1JrtH73qrBtcRrYBNEu+XLRHestNAY9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086161; c=relaxed/simple;
	bh=ez8mh8KYXsxEZezHI84ye4skuWKbHPcxR5bfxvHXALU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bICLiOSer+7Zr8/aU2bWFNRm1s8grnN43K2J+pIeP+LKgO7PZC03JpCb1nW0zIuoBauCMoqSaurFPVz5aIKHcBS1jERKHmtm5mh0kUpf52tgtABX4vUimh6vH0Qd2V9lujx8Yphmtn3bdZy+1cuEa7eOqlK2+aef1GL0NZmGK78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dlo7++CU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dlo7++CU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C0F1F00AC4;
	Fri,  7 Aug 2026 07:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086158;
	bh=fJJjzop4LECjkHzK46lASg2zu9hWEBiVBs7rN6nvoKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dlo7++CUNKIfkGANka0v+UdbElRQCXhQP1X88UUT33qCiJc2wWOBfunOfGIuA05ta
	 0LN+uhH8N3xHK9KE2gl1s9DEYp1VMiFa2jbUgKh3DYS6TpLRL8r73wKlQnco0wzH19
	 hQJGC6tMwFFPPTMKjwn+878gNaEflyqIXUPLaDcY50GQclz5e/Jum1maQ1csWjzT5r
	 XKB7+IMd6CzP6NbgSzjDIyXDnGzwe0tYaii/EZUAJvSFw1bYIi1tBXHbCeHsphf/4z
	 EGXUMGu7FszlHUQxPEeYfArGdopvDHqwCNSBL/h/ra4bufizPUcPUSGOBw/rdk6h7D
	 02QoAAvuNYKGA==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id DD085F40066;
	Fri,  7 Aug 2026 03:02:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 07 Aug 2026 03:02:36 -0400
X-ME-Sender: <xms:DIN1aobr0vn-3mBYRTFsxszSeEFm5tolXEcVf06_NCQ17JNTcoE8IQ>
    <xme:DIN1avt1ct_g5lrtZ7yqPBPRZhPBYBBAog_Nddu8pdfoDMKeehiCREd55e-mZhibv
    s7jHoXdfdCY-g9lNKBSdeaToXSJg8IYvg6QfSDEFMyLPvwA1oWhYg>
X-ME-Received: <xmr:DIN1aklgFSEVusoTfP3EP9Hn_CJheaIHv1PDEa6UVhX3JNKpupyM6yTiRBiCNp8NmSik2KmOWoo4N3ZCL201MzrlaqhgSd1C>
X-ME-Proxy-Cause: dmFkZTGyvHdDd1GzGWN1VJTYexoeLWbYipFw83SRb2uXMsYl+KFTYaUEpOTqk5K+My00CP
    NgJOi8LOILsVWSxl4ccyvtrBefkjyfVln7ypRQ+bh49utynffTDp/Bsg/I+mtxl14w83ED
    50tRYjk+o0iP8mpu+QvCT+Dk+0ekkSaH2jaUkhQ2IGs7hn31QTDC3HO568nJzP+sCzaxl0
    cNxOjeFWag8Xux4s5MnrVTP/LpOs6EV32l4U2+8ipe5mhbLBKcn8VxJg/bq9Q7Ww63Su+/
    gyrSa0CaL2q4j6exaTekIVpxNJMTqSgpye9e2bSA0gixFi8opX6xU3WPxpol6ShOOMsGci
    X8KX7wH56UKvKXn9XIdhxlvE2o1o6X0XwFE8nMlN3dxon3F7XcR83EoSu//ZlVLhOTo3Zd
    ghXsDTTV2Nv8MFGRn4wReX928gEhL88cujsqtqC6KVcD5zVQOf5UWuJjL0dOnXzi8O+OdD
    4pKUoiOi73wcOnBEYDKuU4h52ZuIBPet4kBXCWT93blTUJ6gwLrzcKKw1JtOCJM+/Ap5Em
    cP+OSo5E9LsKKmLCphdtKVLUSvHPjJonq+smso87a2qnyhOSc/ZB/6Q1Jhx517Fq41VGfC
    j95gU73j5av8LrBwqx4TtqQwqoT7cru8yo2Ooxt2/mvuFil/kiAf04lTYFwA
X-ME-Proxy: <xmx:DIN1avxTLKW9O2cws_unudNjS-wHgaXemiMDonv0QyFsDZ3P6waJ5A>
    <xmx:DIN1aozGhd5Q3dOGZRN2I5XjgbsQXINbQCXpgk9mv19SZYQAGKuusA>
    <xmx:DIN1am8qDYNvnzyVtWIwKMRxYN3XrCHq9FAn0HXEll-UyG14OrY85Q>
    <xmx:DIN1ag9-zg037QabesggjPBfgEevSy5_oBjg04IqqVOtrJOaPCpTiw>
    <xmx:DIN1ahfCKTtTYDK638ZvG4oytQA6fBETFfRJ6fMCoZyCfmjNgAGNlJXo>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:36 -0400 (EDT)
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
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH v5 08/18] locking: Switch to _irq_{disable,enable}() variants in cleanup guards
Date: Fri,  7 Aug 2026 00:02:05 -0700
Message-ID: <20260807070218.27144-9-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260807070218.27144-1-boqun@kernel.org>
References: <20260807070218.27144-1-boqun@kernel.org>
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

