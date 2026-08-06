Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC2838F639
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001617; cv=none; b=Fnxvz1Z1rjDODOGai4Kn/+HmQmR3uEP1vHNawpnO2qb7RfhNGvQ3ydfH+MeyE6hlk5JPG451AoRPRJ/a6zC/nBsiKHotx5UwOBISFLyYsk9SW4yNfySY+Ht0/AFRkRdpRmpZJSkVlUcRoba01s6kP2ZZMbUrXp0aQJu5GZWI85Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001617; c=relaxed/simple;
	bh=Cq6CHfD1VDn8enm92sBhYVT/TK0WSnStJY+D4LOpLL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXmGXiyIq4DHAczgcyum+fgzxdhvCkmvhuv7qf5Z70c25RENO+CkIvV27RKK4HMTl1e2hGwVXx+s2IRLlZ6Faaw+0cWYYdrUeinoXjsCsEyjKR1M8vInPa3xs6Br1++zw1cS1WoGKNdQrQNjX2M1U0lAO6+KuTbuihS9znGV4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=dE93E0Yw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=asfJNPrp; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="dE93E0Yw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="asfJNPrp"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id 76EF4138022E;
	Thu,  6 Aug 2026 03:33:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 06 Aug 2026 03:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786001614; x=
	1786005214; bh=YnvpxGjUdDPnwVdv39sCuVHJeYJIDj388v7/Pjvrdcg=; b=d
	E93E0YwVhFOm4fZ5Nq3CBctAjC3nF3/6RybWfbnKORa4rQFn6N35fjnNscfcAqa8
	t8O+i/FZyUkPvxAq4esKqV2M/I5Ln5EuVxaPaOQT5ot3ABKfDb73YuflRizfrTik
	4QwuEWP/k93Wtl0tbqvgeJk9oeYgcwCC5+mc8n53J94TFnVqwxMbBAj3wR7Ny+jn
	y2o3Hi0u+EirEOS3/kBoPan221L8V9p80a0Aq9BiF+98T1+Ur9pKewNFe9rdfZod
	psICa+MxpkNsV4913ec3tu5r7hOYJ+DU8e9hm2PR0AkThkNULs0sQXs2YAPEBYf7
	VcRF0aSBTFfSgL8PReZpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786001614; x=1786005214; bh=Y
	nvpxGjUdDPnwVdv39sCuVHJeYJIDj388v7/Pjvrdcg=; b=asfJNPrpIyfUjq/b+
	opH6f6mzMDZ6lTYOChrgNg804fWcC3/v5oSmkRCTqfcKVDVyWfFdUGuCXgeHRy/n
	GEPoexBEd+TNIJbEY8ke6ZT/Y1sW7m0UVmvOppF6A2DnO2kNTE+UUTagEOTBO1os
	9HHR2JtXLM6zTHJyfq9jtiEHUdrxvHGzgeTsuuu5WsnuMzN/I9MwS+UUasIxTQjM
	YZCJaXGsaXmJC8NIVlWMpsCCkiActY7AQhcxTW9e3Mn43VHQ4MWtMKz8H6taq4nC
	de3+CZtpufSJoulqYJt2NEucg0ce0g3JSZUwwNwGyiVqpCL+kkPQjHTgRgT1cnX5
	mfZjA==
X-ME-Sender: <xms:zjh0avznoEV4pLnWGkfgX-UrTimd0mb2cdj0ZfBZOmNUmgw1iVfOjw>
    <xme:zjh0ajZd4fJW4WksLuLCuqyKkq5QJcBGe6-FV-U2h7cU4_KL8dudSzUMckx2qVaij
    3WrttdCIBrpkL1Lxz9RtA19SVsNjIFE7NwEq5xJfjQBrQz3-cgWF4w>
X-ME-Received: <xmr:zjh0alKAxc2tUeTz2DFpR2fFH-hWMASuAJ0SNLzsE7zBNgfOiKDpKxEiFpTIrrTBJVTL0iA81lr7bncu1xA>
X-ME-Proxy-Cause: dmFkZTE+kuDwT/qJuMsX1YpJS6zwEoKXuxGjh5vSgXC3h96de0f5IUqE8F/sbtJUAQX4WI
    UyieCdA0ubi6p9Ib2Mmw5wQw+zQIhds3B/vlLhbx4/3LkN8rN98/3raNEPvdWIU49NwdJl
    +ztM55v7XL/Y06gUazDrfR3d6EBU2B/hmje26EW8x9aG8+b7y3KGKbl+0tqYu3GE4ZBp1m
    aD6wv4LvfsP/+AFVeHg4Z2+bnWsnCrIlmD/HSfNKJtxt25SmKHu+NDli8iBwIYR19HYUrm
    F98LQCBCq/j+sumRF3bxW1jiwn73pFB0joPsZmcvxphMkhX6VA3fijHcswZ5vlWP5USQbE
    6U/pxoWL/YnWiMPDk66hu8xDn88PgViSE2jurZR9io+QMq+8h833qfPEGvSxTHIgCYMeoa
    r+3TOfOmhSDepyEn+0MZ3O9AsooDu/TNxmdBuvLqf7MNKWG/WzzgyJpKu/Cfz51cmYyAbl
    5f2Wfu95Gzw3Ie2kJ4T3CkSit+M0HcY8eX67lfLEC0yfugG2YIyMcN528GykBOn/wjmhhD
    HTEC3qVGRCcPZwhmss4OnsKcOxfBAxLiddMKVUIkhlCIrw+bJZy0qLPdBGAYSA6NlwLi7x
    Z1/G5IXis9oKYikWFMWgANwBJ60gXaI/MGcdXjb4P7WEpanrJZxbjp5eeHWA
X-ME-Proxy: <xmx:zjh0ai3qVQkrImjb1TDF7CX77sR78hkjShUKVRcJA-XBkgda_qQxsQ>
    <xmx:zjh0ahLUcw4RLGTXx3h81mZOhK6vp0Y5QzCsZG1ooXzeky96JtRalQ>
    <xmx:zjh0amNt4K0G_3hKigbmGhV2tGkFg0zjwLt1U1VJR0soNeoj9q72ug>
    <xmx:zjh0aizihWCdgkPFKxJ_-gf8u-OumbUZn07EhYnbze1bLBI5DIe5Gw>
    <xmx:zjh0au0rpeDczgROgZ5RMvxo6XBhX183pyDRcN6cGAuF4VmVITXQMrQi>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 03:33:29 -0400 (EDT)
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
Subject: [PATCH v5 5/7] rust: workqueue: take a Delta<Jiffy> for the enqueue delay
Date: Thu,  6 Aug 2026 16:32:39 +0900
Message-ID: <20260806073241.1024319-6-tomo@flapping.org>
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

enqueue_delayed() takes the delay as a raw Jiffies (c_ulong). That is
the C representation rather than a kernel time type, so it neither
carries the unit in its type nor composes with the Delta arithmetic
used elsewhere for expressing spans, and it forces callers to hand the
API a bare integer.

Change the delay parameter to Delta<Jiffy> so a delay is expressed in
the same time vocabulary as the rest of the kernel crate. A signed
Delta can be negative, so clamp it to zero before handing it to the C
side, which keeps "no delay" the natural meaning of a non-positive
span.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/workqueue.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..d4f8a3ea5acb 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -171,7 +171,7 @@
 //! /// This method will enqueue the struct for execution on the system workqueue, where its value
 //! /// will be printed 12 jiffies later.
 //! fn print_later(val: Arc<MyStruct>) {
-//!     let _ = workqueue::system().enqueue_delayed(val, 12);
+//!     let _ = workqueue::system().enqueue_delayed(val, kernel::time::Delta::from_jiffies(12));
 //! }
 //!
 //! /// It is also possible to use the ordinary `enqueue` method together with `DelayedWork`. This
@@ -197,7 +197,10 @@
         Arc,
         LockClassKey, //
     },
-    time::Jiffies,
+    time::{
+        Delta,
+        Jiffy, //
+    },
     types::Opaque,
 };
 use core::{marker::PhantomData, ptr::NonNull};
@@ -303,11 +306,14 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     /// This may fail if the work item is already enqueued in a workqueue.
     ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
-    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueOutput
+    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delta: Delta<Jiffy>) -> W::EnqueueOutput
     where
         W: RawDelayedWorkItem<ID> + Send + 'static,
     {
         let queue_ptr = self.0.get();
+        // CAST: A negative delay is clamped to `0`, so the value is non-negative
+        // and fits in `c_ulong`.
+        let delay = delta.as_jiffies().max(0) as ffi::c_ulong;
 
         // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The other
         // `__enqueue` requirements are not relevant since `W` is `Send` and static.
-- 
2.43.0

