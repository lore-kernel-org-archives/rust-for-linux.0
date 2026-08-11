Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293129C33F
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 04:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421842; cv=none; b=Ah0P3TEkjJ0FHNUttA5aiIF4L681xENDL4Ppe1HJBQSh+UZjm2QdyFBIB8uWZqb6ebU33Hz6ft6WquPm/EVTfJCPEkeeolhFc44qTH9E8ziGTJwJldtfDRtkt4fAvu8MSTVgTxi9Qvu1jh3vzLGGL/n5uLKQ0AaXf4M6lonGcwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421842; c=relaxed/simple;
	bh=r+2NyJ+8cLw/gTrq7CrMO+BUfJ0zEFGOC0qQx6gO4Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TsWAEkfuh6L5iYboZcuDjIrwqVpdwfHL7Bk6Hk5JtOgLUFxi7PmLT7fD4brbs2xMvGUJs0KOgQ0gcIAL9E3NJb11K4F1FdRnC7OGGTLy3HlJ2mfw3SD5jD/Vo1UIfFY+ws2p0Gy601zaCjGufaRCkT2aT9SnN6yYeoZYgOc3xGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSCgCK2O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSCgCK2O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724A61F00A3E;
	Tue, 11 Aug 2026 04:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786421840;
	bh=GFTRh8K9ao1Em0M3ZaR9f6KuHfXT+zHCDFY51R1n7EA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cSCgCK2Oho+ylWkIuJuIEkD8Nacp6F30s4z1W2n2oX6oKCNEP4tXiQFQtnY4HL0OE
	 bMjF6zoP1/pXrwq5HOvqWBa042Jg9CqUT7igO26/k/1U3sR9vzBssua+q0qRFnAKH9
	 7GKdxQfX+8D9Pyo6Br9c7ZnQTGi9u+Vl38ZPx8FPgHTUUMD1WnALdieDPW8WJQxLmW
	 w2s9dytkFmWWO/vUyvyIgRQ7wPEAQLJrIJJgdpulskU23AqE+tIos21UfrGJXYEWsf
	 AWJS2qNRtlGF4MJLL0XVpz52CCvFT61s37dmjj9v82Bp6I9FYpgidx/9gBLplkQ1Dv
	 BzkVX4kk4qeag==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id AF1EFF40067;
	Tue, 11 Aug 2026 00:17:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 11 Aug 2026 00:17:19 -0400
X-ME-Sender: <xms:T6J6aoZVIsgwQk-3wXByeLXeWWIj1JgRu5dUsKmlGOSCgN7rJMtrDQ>
    <xme:T6J6ai3yYzZFQlh78O9AsQjRO_L7s9yE5BE94ndYdjfoFCTets79vX8g5UYnXZsZg
    Con0jUlKiZmCxJnzniCG9wGn85PSgeUzZ7H0khGHEt362rAWQ1k>
X-ME-Received: <xmr:T6J6akCQyc8SD6XkrrJ2U3VxCS53ZGXVspYgCxJ-GC4f5MacGoGF8fzOz-Zal-nJDF6slUjmqWZIJ8ey7whLZtmqzizBwdBr>
X-ME-Proxy-Cause: dmFkZTFcHzrhXyc0hnypovlJb9g9E7tJfxSxtSmVOni2o4Z0btOd3O0kXf/OsfEdeTwWWt
    sfbUizPnOdS26Htcmx9apVGOWKxWk+wwPpxYEq9frjxZ2FxQpco5+ZZwomcL9FwE9d4fNS
    oevDjxTnIiU7+zHZiay/54MDECaPVHjwLyS96w/B5Sn5DGoooChP5NgFUVVKEJyxwN28Um
    Ld6gWozLgvLzSJiV+a9p+OUuLs0I2bwZeWF4Y3dMuFZzemOg9WiRd/K0zK3J4CSVSOPd27
    hphNIVrkXD5dt0hYBf2mNvHC0T9otlvMegJU45fh9pbloduDE6zLHpprgijfzk0RgrW3EG
    s0D5z6LlJDQWGINj/hUk4CXmbrv6s/dueEgSE8JYNuP/i34JxmgwFmt4M+Dew3e9qvaMUj
    qp1rCttBy9pSa1WsfKy2CjQmgsHg8BsgaPF00laQDH6rGhYiuy2XeiZOFo9BpQl2fqtLRW
    o/00xSzKrzloC75dkMkegayXS6aAH+Y8BoEPMrSD71NqBQz3DePn+Zb1qpT4ETVi7Gz7YT
    1f3KD9hdRKcMy4l/oJ6ceCdIkXkVBC1d7pfAqHLNyO0MDPtb/AXMYcFwHjGztOOj/8gVqp
    3Zla1LFvQ+kPpLa5WPrn/hRGhuZ1Z3fZCJGrmbcLccq/0OaBZBwViRuI2B2g
X-ME-Proxy: <xmx:T6J6am9eFj9raiuRWUUDbbwA9Yxf10sOD5HziyjH5pkbnakZyeq_KQ>
    <xmx:T6J6anVflabjYsJANaah4ltCEuibqWXDxeCh6C_vlQO4yt_U0RBIxA>
    <xmx:T6J6anKSyu1tRNJuxBjuzIGeqJInKdcAxGkmkZ3EIlp2Kji1hVbKGQ>
    <xmx:T6J6ajDRlTZfLL9XYZNJP-7e0ABfm-sSSucT4kEpLpyU1bs3_qg-ZA>
    <xmx:T6J6avGQrgNrFC8xI6ESSImK-vbCtyO0dBgkjR_V5Jgem0DkPHXvlijB>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 00:17:19 -0400 (EDT)
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
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH 1/4] irq: Add {over,under}flow detection for local_interrupt_{enable,disable}
Date: Mon, 10 Aug 2026 21:17:11 -0700
Message-ID: <20260811041714.27679-2-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811041714.27679-1-boqun@kernel.org>
References: <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
 <20260811041714.27679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently there is no way to detect overflow and underflow inside the
HARDIRQ_DISABLE_MASK part of preempt_count. Add these detection guarded
by DEBUG_PREEMPT similar to the detection for PREEMPT_MASK
{over,under}flow.

Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/interrupt_rc.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
index b9a7f05ecf42..e2456500a646 100644
--- a/include/linux/interrupt_rc.h
+++ b/include/linux/interrupt_rc.h
@@ -11,6 +11,7 @@
  * make it easier to include without hitting circular header dependencies.
  */
 
+#include <linux/debug_locks.h>
 #include <linux/irqflags.h>
 #include <linux/preempt.h>
 #include <linux/processor.h>
@@ -63,6 +64,13 @@ static inline void local_interrupt_disable(void)
 
 	new_count = hardirq_disable_enter();
 
+	/* Is hardirq disable count overflow soon? */
+	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
+	    DEBUG_LOCKS_WARN_ON(((new_count & HARDIRQ_DISABLE_MASK) +
+				 (10 << HARDIRQ_DISABLE_SHIFT)) >=
+				HARDIRQ_DISABLE_MASK))
+		return;
+
 	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
 
 	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
@@ -73,6 +81,11 @@ static inline void local_interrupt_enable(void)
 {
 	int new_count;
 
+	/* Unpaired local_interrupt_enable()? Warn and abort. */
+	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
+	    DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) == 0))
+		return;
+
 	new_count = hardirq_disable_exit();
 
 	if ((new_count & HARDIRQ_DISABLE_MASK) == 0)
-- 
2.50.1 (Apple Git-155)

