Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46006394792
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 06:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170574; cv=none; b=npxPrbEqoPGTfKAky6j/kqy0AQB0WvVeMr5ASBe7SZAG+AubhnGvGRDF5QXaw6/hgK+Zyhoig0ZskElM7Kci4NpWabSIA29pOj+IfxpKdirWhlTHvEBiBVD0EAE0ukOZAyUmHLHfwqYCJpetJDGWpcTocnwYXyZxnpij6pbwORU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170574; c=relaxed/simple;
	bh=Cq6CHfD1VDn8enm92sBhYVT/TK0WSnStJY+D4LOpLL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vB3YIwZOwkeS/5xBmmaxucgWx3xv9M3aBaCx/4CNndRTiDDslSg8GGNXPUi+kYe8w5OD4LECxsSZ//Ram8adrD/uUW2/cAE1nJDUyXpWmQ/2oUGkLSehH5FcHpOnf5IW7QSxDbUhvmEjfriYZ0ITSPeH/vRuYGgyMC/IBEHQSLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=VKOebWJa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cdEQ3URy; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="VKOebWJa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cdEQ3URy"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailflow.phl.internal (Postfix) with ESMTP id 626D613801CB;
	Sat,  8 Aug 2026 02:29:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sat, 08 Aug 2026 02:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786170572; x=
	1786174172; bh=YnvpxGjUdDPnwVdv39sCuVHJeYJIDj388v7/Pjvrdcg=; b=V
	KOebWJaZDFw3NUyhx/ykVfYgXOugcL7YGxwGMERfvJf1RlMU5pwYmMH93SbnvUli
	34DWdXVH0cViRKrLBZJINA+shDgpT0MsjaD2DCyKlinSUc15l+z0GehFBwJLuUvb
	8osQLotqYoCe1UOOnMxFeqp5OwIaqSA/XSAgTvvYyWakAu6K21wEbpwDrnvhko6p
	xfUdIZEgrePZ6ymEQXZlt76zZvjcw4NKA1NB68K5N5pS0XJ5umBPUuLO6DivjJS3
	aBdJrWZ5OWBPOG5r0QAXK+JcFTq/PiAxYh2iw/YEv0kpJ4ZTAptHuC4o0zA/ERyt
	o8mAzcR7a5k6uQJlchPYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786170572; x=1786174172; bh=Y
	nvpxGjUdDPnwVdv39sCuVHJeYJIDj388v7/Pjvrdcg=; b=cdEQ3URyvzxPjbKt2
	cA7P2wmgyxtaffvdjCfNOqvGNFHcon1WkgAveU/3eb47qY3x2nmEqZ5LKT9rNZ0G
	DtvfZMq6nULkoTLlxu5+B3Qg+72vJZAuVn2lG7qeasaaom1ZAnnk9MIQx7buZOOM
	+XH5dr3mpyzpGLRUbB9Ap3LLjJNivPpqijrfBPj/K+uvmsV0Rw5nkK9WQ0XnFrTx
	zRmDp3ligOKRuIQ1n7nG1B35xijJmGpeHG0kVLD7BiLb5+WRXdkeibOT18SqTUR+
	bTxISdZ4bXDC21AH/PW9Ns/KJkB+maFRGHtrBtvaGxyqUS53olqhR1ZItpEk0aXI
	Y3pHw==
X-ME-Sender: <xms:y8x2ajHEZYsUzRxDRsRSL3yZPxWh__z53qrLvy_ps3nOSqO-sI-HKQ>
    <xme:y8x2ase9ZnxzGEec5q0woWyHAtJNmu2Psh2FWqH-tcz8WfH3DcojEaHeceIDASSch
    V1EcIbU7CxyDwyni2oHzWInGGvJbtJ0YBjzxu6gU40BuFFfAJ51mY2n>
X-ME-Received: <xmr:y8x2ag_k_fME0efVi_hQ8eHx2eLMlxUN7WH1hYODMl4DopdDooGrhE5kRmnXYDHSwCFGUiylgTnqi3XkEYQ>
X-ME-Proxy-Cause: dmFkZTGPkp/tjUF9QhjmhubFpVsEJiLyXpdymDQrM8aVQ3kZuefEetQxeEW0ZOf4RrEr9P
    LsxjTKn60UCLD1q8TGml7nMYQgaOZD6UryIwVsYw9c3jQPw69RG55VceGwySH18w/RXixP
    9ALHD292JMWwKQ2E2TR4oVe8cE/VF35DjCuy8p2zkKeBmUj7k5VChHrMhTMNGL9/0k+flN
    D/XO/y8C66ZMkHzR5HQRnvxIGNJ22YhihAosFjsscruigf2Ki1At7aI9+pPQrR08nl/TLi
    2PNvSDjqxzYH449vkP95HWg/wP5kxHrjdUvNcOiDpPYzwspfXJSX/omV4B8zmmoEMc26Ez
    8vKa+b1g0OECN40cLqXfWxT5wC1OvAwqb12cJd1OAk7KvsOiezQEatOssMe/526qLDHyyl
    OwGfwBW3oh9jO9/LVxhMcR+BVxswPCqXAneMKjFukVf1mJdJX9Ozfm7R5PACU2ytBdoWzk
    nqjztobeyfLZQ2ibltOhsHYJj/TpDNJGYvrpne2qcDzXgTfCSGKjdVJ9mI6wNS35pHk0hZ
    6dSl5gDP2F1+v1PSmXrzpilQE0cw9eUwzfg5iDbCzfxE2LPFqwq98IgmwujC7jNlKUpEie
    4rgRKNdcQHiTrQdPuF4l2AgEq/5Rc32JDkuF4K5l9I9wWWVSahHLk2+yQQ/g
X-ME-Proxy: <xmx:y8x2aqYvMNHpVyLGojzpB9cX9wyLRJ_CYGM_E35XJSoFBWmSHMniSg>
    <xmx:y8x2apceWjrr3-s0WNzjQSOpFYWpdGj4d7u23YJ6-oujAU_d-xwnCA>
    <xmx:y8x2agSmfU6zFVABcL_rPJOpZz0hxK3L4nwZ5RY-In4A2wZPuBELsw>
    <xmx:y8x2armkw9ZKJjaKLCu7JDueVCC3p-zuBrbRRIwdHkdBkaVqfdfMOQ>
    <xmx:zMx2atY_VynpQuUWsoyxhTgjufUrWY_AhuhRSkAuqdCtmOSI6H-Bj4_V>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Aug 2026 02:29:26 -0400 (EDT)
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
Subject: [PATCH v6 5/7] rust: workqueue: take a Delta<Jiffy> for the enqueue delay
Date: Sat,  8 Aug 2026 15:28:37 +0900
Message-ID: <20260808062839.1159990-6-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808062839.1159990-1-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
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

