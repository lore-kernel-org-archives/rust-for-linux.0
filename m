Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127104AE8DE
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843139; cv=none; b=QLxNSeiQgnrx+ImJUYriVdGYDwgRlT6Mv9pbvaJkXZv/GgxQbnK9Ro8nH5zSE551VvY6oMyo4vhlxWRiVRadt9yBNjBH/KTypB1BwL9FIFVtW5jLc8sait4NajLjBkZHqq8FSxfxxY03o12heT8bVeLY4ZeWyPbjLiBDA1WpXow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843139; c=relaxed/simple;
	bh=uAvJ/4GuH3Jbbv6um4hA/PVJzjMwaiB9sPPRbSjA2ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlKM1oimwvMepCdqENhPI01d6BnZbvZQ7hVmz8GYvUA3AFBb52OsKmEC2VH53+14vnTwErGzDh2VuNzqvmB/bpNcFLDvh3KM88Eck2SEl2pGyobdhof6hO+L5yf8ZccKGoPBftlaqRC/idyOkhjpiWChEtZ6R2dSpBEJEHXPM9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXy/Je4p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXy/Je4p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C264B1F0089F;
	Thu,  1 Oct 2026 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843133;
	bh=/BEdQBJR6WDJGgF8LBmoLuMdvtqbd2IDFagzx+0WCOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cXy/Je4phKJv0VefVr9utQ6uGUonRADsZn3upbqor0eKM+nQmgWSiRc4HVo+d4rOj
	 H20+IhXXjbmZLj+DFfSOHlvd4uGltu4uhozTnad4GLHHvZnRy9rufPUU/9tVwgdyuc
	 Rsb2LpmUrgtoU502SSNvQoMMl78yi7x6PdxvuU681ocL1UZHIXwOIOIttDxsSBnNWa
	 xdgMeKmR9y4ubOYbR45gW2ycNGMh+83heFfHj0TorEjAF4G2X5NTDb1oM/kF3PxMrU
	 znyXMxl7GmLE+uQNlGZ7Te1sxS604YFc9vKDwELvvGT962wc2vTzWFRIEn34gEmiGR
	 OFCtX5o6Ccpew==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id EA3A3F40066;
	Thu,  1 Oct 2026 04:25:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 01 Oct 2026 04:25:31 -0400
X-ME-Sender: <xms:-xi-ah6xfL5aXnrhds7i0O5NTp5CEARByTz7gcgeDxQwu-6Bar6kJg>
    <xme:-xi-ake9kyFdLpOI8zwn26JuEVzgwz_CNSWP2SUZULLcaAuaJ5Iw9YA53VWixLs3j
    34oQiuwr3lhBi1xqxH-NJ8gTT0oa7soNSr8wWekL8hO2e3BohygbT8>
X-ME-Received: <xmr:-xi-aiDpuishDeH9e-5VFAyL7AFUutkpiDA591u65TU8Ow9mI6qLwhGjZcf8>
X-ME-Proxy-Cause: dmFkZTFTtZ9e+AEXGyH/UMNFNKx7GWX00fXAsakj+PulafEHjbIKBMQx7Xnly6B3nqNRyA
    VpoObhA1Qhfd5N42FAzO0sTBGw4yFG6PnLFuaeM1bW97EfiTCSnufadyR4ojJhWoPi2Orp
    Nw2JMX8opnwBw/C+wIQG8nb1UCGojK0rMbXtCocQAaV/C59AWyi9HRGVAloGTrFNLENSW6
    18Nhy0c76z6pdAWuM1RbSN8pspZwRgkcin1hWylWhTZJTEMyJuzlL76xznqewDQePbxkmp
    OZxFI4a4FQttqB7KZKggwQOHJeTyNiNl9FbtOJ+hzXoyQwWY84px4TyS7SR9tfVXrM6gQN
    0q8th5cy7ucgtJNbXq7udsigvzsq2MX/gR681xu8jocuj4Pt3zyxbjNdslYSskZl+2PjB6
    dvsFlHDJb30hr1vVqp8JKidbYvBH1fe5MKWQDcwe4P8T0sNjWjrCK6xk7I0uWxkL697xDn
    sRx7KmZlP9FJvheXFYm/dDIca0kL9uG4P7dmNh8EpbVRgSaQAcU0Sgvy3Y9Maivvj8Xby6
    XPNJeDrua/HDbtT0ankOPq1xtMVWK4JrAumffCu2peiphAOow6QMeXpl8IhW9MaGNp8tlD
    7RxuMTOuzdeww3LKMx9L/ezUrqERT2j/dYjSIShfzYrUCAkonPvjWKu822lA
X-ME-Proxy: <xmx:-xi-arBADhVJptQfwOP6xpfFm2uAjmj1-qHw0u3DcBTAjvpVH1ABBw>
    <xmx:-xi-asbGa30k9cdg06o0JK2VUjnuJFw7lc2XgbZYxW6DMHnZu4gjpQ>
    <xmx:-xi-agzSZ_9L9F50nsJXoLqaryM17g8VDj3dYfkAZFFIvbDROM6Jng>
    <xmx:-xi-avd0-uD7FGkqpVrRhqYcRYZZwI04-4AZzSLTY4-w9uXdJ0ZaFQ>
    <xmx:-xi-amI1phEy6ZL1SUZ1-0HQYY0Ulk3bfNxoHgmDBhtjaP2YStSw1GTB>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 04:25:31 -0400 (EDT)
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
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v2 2/5] irq: Add {over,under}flow detection for local_interrupt_{enable,disable}
Date: Thu,  1 Oct 2026 10:25:16 +0200
Message-ID: <20261001082519.16195-3-boqun@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261001082519.16195-1-boqun@kernel.org>
References: <20261001082519.16195-1-boqun@kernel.org>
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
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/interrupt_rc.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
index a9ed937a80e7..d385ab05a2b6 100644
--- a/include/linux/interrupt_rc.h
+++ b/include/linux/interrupt_rc.h
@@ -11,6 +11,7 @@
  * make it easier to include without hitting circular header dependencies.
  */
 
+#include <linux/debug_locks.h>
 #include <linux/irqflags.h>
 #include <linux/preempt.h>
 #include <linux/processor.h>
@@ -65,6 +66,13 @@ static inline void local_interrupt_disable(void)
 	local_irq_save(flags);
 	new_count = hardirq_disable_enter();
 
+	/* Is hardirq disable count overflow soon? */
+	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
+	    DEBUG_LOCKS_WARN_ON(((new_count & HARDIRQ_DISABLE_MASK) +
+				 (10 << HARDIRQ_DISABLE_SHIFT)) >=
+				HARDIRQ_DISABLE_MASK))
+		return;
+
 	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
 		_local_interrupt_save_state(flags);
 }
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
2.51.0

