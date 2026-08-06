Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F003DCDBF
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 07:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001628; cv=none; b=gG5sWcqTeceUPhWvS5nQ94kmeXdtV+XUCYXMBwsPurQfZyecvg9YRROfAYXrkgYXjQG6tWF2rgB88yxSRrC9GABlQPtzNweyWosZ6zIzK/kYN1GxgE0x9kTbujM1etku1KlFlY8VdDHkHo4WGwHgcjkAeO8tdZZ7HjErpLFqOKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001628; c=relaxed/simple;
	bh=YpmOP9N3ZZ3wRLSnxJ7pL0uFyT4ErnZugJLtS2lAUxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfav4YdWKRUwShYCs/5X5jt98C+YecZreh8MsiWnv6cfucHUbEP1O/zYca9uwNS2Yl2dtMVq/Fpuxbp7fD6He1p0djV4HBx1AXXl9Fx0RkTEmLmKGeXzc8XSn1gZh1qNjeDgT+048E+CFRgejJwCZlxqJwzShuheagOA52CaPf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=LSd+TVhM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OtkIrdMp; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="LSd+TVhM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OtkIrdMp"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id D46F41380266;
	Thu,  6 Aug 2026 03:33:45 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 06 Aug 2026 03:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786001625; x=
	1786005225; bh=IIcnoibYK4haCPRSiqOAyyaCrU79FBNCsr3YIY7qX+s=; b=L
	Sd+TVhM3fUx8euIKZNwQyhvjNTzoNYua4L0z82bwZwLJbfK9ja2Int2pyMzZ3R2N
	PxL2IzXRGGzmIBKmXQF14TtLFeAOjCLPXPOpQ1m2Zv8z9KlKgipSmzRhNvDt8VRK
	gRxHnZMnXdX9Hp9ZwEHNEkE6N84MvSK0QxUABT1CIN+IRQyiuHJ+dQLbbGjE+vcy
	g1h94Q4oVW6W4npmzsxwZNuFZzts7ydrnKqqgZc//hE1PomVvgzaS51gEiklvQFy
	Uxi1wEJgl4bJBR/duMC08skeGOy7fXZoJOGk9h+rAuV3HSc/ufin/THMo6nA0bxM
	lxGfhR6LR7ZcPpHpvfNcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786001625; x=1786005225; bh=I
	IcnoibYK4haCPRSiqOAyyaCrU79FBNCsr3YIY7qX+s=; b=OtkIrdMpjw4xWp1MO
	5HXVJSlMnOMwSP9UIEjP5ooOlIGt2q+CKKZE3pI80pOpnNMjIfW56dv6EpEItZrz
	mx8z+1XjVc2ubdh02jynYAaQ2/yjuAWMsA+1J1uCRdTM0vPhb7IRKfnEkyI0PmOg
	Y3lqATBBB3OiRMpB+2EZtDSW1dy1FHlcQyJMsOcVbs7PnQoidMbL7LLBFArmRukI
	wCIY9SjRaxfW2ABO3Y9BlFve+kvje9VEWVEOHdX5pPTwXSaJIRuC7sH1SYNEL1K6
	fehXZHEP9dXGnDWwgtIu5w2+Bg5fCU57l0+XcVmqrf4gdcUn441y4t0yBiHYVm0b
	PlsnA==
X-ME-Sender: <xms:2Th0avQJ4GNZC9yLQ7_5QoWbIOVUDtbQWdDFrTgrx8uFH1HnBpHZIQ>
    <xme:2Th0as6j5-wxeuj5FbboQWJkCmvOjOOoEHXwt9-CTUSG8pY74W9mc5G2645ifOoi5
    Pklg81bn9-NPQFsPD8sFYMyzAJF48mGg5nbU9wQ3NOO11wZiP-cIRft>
X-ME-Received: <xmr:2Th0agof_skBaSzjQwswMUuqaIfcoAwQV0jK-YjDv1IjYWLNAgKnrNNxJ0c_c_A2i3z0P47Ml6DmQZlHyAU>
X-ME-Proxy-Cause: dmFkZTE+kuDwT/qJuMsX1YpJS6zwEoKXuxGjh5vSgXC3h96de0f5IUqE8F/sbtJUAQX4WI
    UyieCdA0ubi6p9Ib2Mmw5wQw+zQIhds3B/vlLhbx4/3LkN8rN98/3raNEPvdWIU49NwdJl
    +ztM55v7XL/Y06gUazDrfR3d6EBU2B/hmje26EW8x9aG8+b7y3KGKbl+0tqYu3GE4ZBp1m
    aD6wv4LvfsP/+AFVeHg4Z2+bnWsnCrIlmD/HSfNKJtxt25SmKHu+NDli8iBwIYR19HYUrm
    F98LQCBCq/j+sumRF3bxW1jiwn73pFB0joPsZmcvxphMkhX6VA3fijHcswZ5vlWP5USQqb
    gn3h3wYvQ3DevG9dQArtH1IlcKz4oGsyBgaRjg1pDmdqiG8Uh0D07+SkAAeSZSfCRLm585
    NpvDvoJnsd9PV8AKNmfJKFBszp24XyyMQxLwckXqOG/yWkhsx6XBaQ5kTx41QmRjScYRdH
    hVnsBT8BUHSDNPizmoFDXE/xsqjjAJoiX1wOVJWOiZ8Vnj2VKLozkyFqVjPL+ZMLDla/0k
    mxu5Lu8bcwDF+xCl/OQMypYv9jc9EP9gTztaQQ4teEIRPYapPqU9OIP9LAlVktyD+PALp2
    eTTydRr6HX1DY633GEMtR/HVMM8kWR8hSbfg85Pwwaf9iMMIUka0qTix5q3Q
X-ME-Proxy: <xmx:2Th0aoXOqi1BZAfB7cu1KjcWy_fBZZRgSJfj00w8Ly3DAvlYq5x2HA>
    <xmx:2Th0aood4JxTxK5Tvr8KzNUzrMb-6L-LuCysrmvc8EPgU74IpImmDg>
    <xmx:2Th0anuFnWaqf5kefNDTtvxQY2nKbxEtdzJJjZad_jP867sTTvTtyQ>
    <xmx:2Th0amS0zvKQUVsaYEJaC4bYED3s3VebBrWd-vTgeZxEp7r0dLfgRQ>
    <xmx:2Th0asVaZVH7u6Dvw83cNu68VOSgKMw4U2g0K0MFnBa2e19E9Wfx4uu6>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 03:33:40 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v5 7/7] rust: time: remove unused Jiffies/Msecs helpers
Date: Thu,  6 Aug 2026 16:32:41 +0900
Message-ID: <20260806073241.1024319-8-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806073241.1024319-1-tomo@flapping.org>
References: <20260806073241.1024319-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

CondVar's wait_interruptible_timeout() and workqueue's
enqueue_delayed() have both moved from raw jiffies counts to Delta, so
nothing in the tree calls msecs_to_jiffies() or uses the Jiffies and
Msecs aliases anymore.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 5844ee985a7b..5a32d29f1db9 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -39,20 +39,6 @@
 /// The number of nanoseconds per second.
 pub const NSEC_PER_SEC: i64 = bindings::NSEC_PER_SEC as i64;
 
-/// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
-pub type Jiffies = crate::ffi::c_ulong;
-
-/// The millisecond time unit.
-pub type Msecs = crate::ffi::c_uint;
-
-/// Converts milliseconds to jiffies.
-#[inline]
-pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
-    // SAFETY: The `__msecs_to_jiffies` function is always safe to call no
-    // matter what the argument is.
-    unsafe { bindings::__msecs_to_jiffies(msecs) }
-}
-
 /// Trait for clock sources.
 ///
 /// Selection of the clock source depends on the use case. In some cases the usage of a
-- 
2.43.0

