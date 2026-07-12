Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A493769E6
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 23:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900455; cv=none; b=WJKYDd82ZowXxMurOiooyQAOUJnjhqV6I4CZ2T9ojcCa+65OLGWf3Hu/YqzeEeY+KL/ZZ3wx/Hlj4HuQWlsYkDaOI6v1TzDNHmSP/J7WoedoBHiGRzgj+HxX3ub0dlN6ZmVyz+RuwSD7gvQXdNnfBtMKpfG/UctTg+KKJsFWnt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900455; c=relaxed/simple;
	bh=pAk8/WeBtmpUDGF7SXCVLSU+S2kVLCgPD+TnAJC6yWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oC9JHSSCwR/JQ8R5Vb8KE+RSJS53hToEp7qkcie28mGknjohAtrXxoGO6H9ESWYNZeEww2XvC9zEtENQPA7EClEhQglxYXSjmWYWycLvp5U0E3m22I2hWEl2iLrSvZtto9lRJDO7U6iasxZeb3iHbP9UVgPzoz2ILU+sNJenX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=G4ZkpMjJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qLMnD4WQ; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="G4ZkpMjJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qLMnD4WQ"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id ADA831380279;
	Sun, 12 Jul 2026 19:54:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 12 Jul 2026 19:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1783900453; x=
	1783904053; bh=fF3d4WsbQKlYNIxvg4gx4QhgKbcExL+i4pZn+WgcrKE=; b=G
	4ZkpMjJnS1kJjNkVgM7M/ILCUz4hah2RPUXAV2CN5B+85WmzOULUy/WaljdWJJsf
	y8JLpQsMsameiFC8A3QP8a9i73KU+HQHimGk2irVEyf3sq2/0S4rDIYYLOaswArH
	LCQBfuXlPD96t0WRh52hsYxXE16fCVlOG41FaUF5qt5pPvOD8bq4o4UGbOsOprwK
	McTUBrf/78TV/KGi5PA2ujNJ//FquG6H4dsQR1myW5BCWxgio/I3HQojcRFGblpi
	OK827r0jfcnudC/zPuc/9+Ib9OTjMW6ls3irZYqGKjuSmMweEfwWor6sxCApfC30
	eEAW+mD22nHaqWzJ152aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783900453; x=1783904053; bh=f
	F3d4WsbQKlYNIxvg4gx4QhgKbcExL+i4pZn+WgcrKE=; b=qLMnD4WQA81WCCgRF
	DWvzZ/PlQ/3fcfTlkBRb6XNfuIfpkxm6qaKi/0yQOqOiaXoi5qCYhBgQ7GKVgx/0
	ZqUC/fkyY8txU68WEDNbm+mZhnnG0HgI1OQDhVqic/hZDquAairHJUiWmZf5qHvq
	k30ClRdbV39tfufnxnP1Q6ftI/jC6ruoEetmb3Lfyp7T/ejxuD98r45edBD3wT/H
	EJO1e9sktWfeJp2WTW2poImn2ZAXQ38OHXhv2gKuFH78IuuT1Z/kDGgxL0iwWEAR
	OEJ107g4Rdbjv73WIOe4ExdeKw3gTvCKdquD0fEtnWQscnZc7Cs6FoeOGdviQ/uA
	cjZuQ==
X-ME-Sender: <xms:JSlUagLgAHk87aMnEV0KcnbUo0BkqbJxR0kA4_lKYDQA_3WFneBzsg>
    <xme:JSlUasRbG-Viofy7gYxv3SRTgT2h12ob7XK9fYKL19HJyj_-DfxgaxJtxyhckG3mo
    f-QsqHjB7sXfc51_6IqCgWn2meF35rfGcd_6fNegNbuThL9_BvLIMA>
X-ME-Received: <xmr:JSlUash2EtqDCYE4G1plphCGyBikuiVveEWzDA2IB7r9FrlXRFQsnplOk7KPAcJDhiBZmfiOw9acqbE5Z38>
X-ME-Proxy-Cause: dmFkZTE31iBcvpgjYdZr1KIE/6DYlEJEulM18kywekYhcwjp6oc4qGtqEEiP0eBVYIviWA
    Hhrc40792y5g9p/vZn7wYZZCpVhEMJZPg6Ag9Cx9+eIG8lCJUQBaaWrWpvDtf9MRNXXgrp
    If9/LRtCsz7iF/x2Je2OLQRKSfaPWGZ9vc6tbm3bvH/9nu+UCTOj6k3rVTgzzqmkASkYUh
    9E8sCqTUteDvUBZFufbRe8/NIYjgeXIu4N0FXfH5N3WIGjAZtE/iS1e0EueImeH9yGOrOK
    ZHqNAT6bgvZmCQE1xp8VuNO73sqqBKuHU7QETGYMOABXyjd7rKLLYQHX10i6am1f9R+qeY
    EPDZOrBBLFJWw3NPZVs+NIbAOXXHJafR2jJUlb9g+wrh447YiT4V0U1+1yoIQGDQlAS4CC
    8CZBPk0kRQKV2bCIek2M9jAruXAhm18kosfWo0i1Ibi2Ti1o5tlKOVXZilsuQQGTkwQvl2
    N7HvMNhWQgzI5hF1WoVa7p1bDV8AVzss1ws/VVy2NlUOQTjVjlySmwWjOmFQTKaacefrU1
    baiwZ2t1ZtbbMThm9Q9WhhfIN2DNic/h03BgG3qaR8tGP9kUcqB9R3zi6w7uUK3JyPF9xn
    g5/agM7d/GF7q30jNTKjM74jLzftZ7/Ml9AZnJkOAMdnCHYL9QVODDm1n9Ow
X-ME-Proxy: <xmx:JSlUamveUPRSAyZ0SlEGBQY4t1FvDLBxqzWaukVvcRcx5P63ljJ19w>
    <xmx:JSlUaniG5X8SImlTzV9K4iLW2ro1OdyJMr_iAhMnA2BUnSeyhMdz7g>
    <xmx:JSlUatEGmQtUE8Ft7FmieHExx9QQEvUtQsW0maGlxDsDKbP-aC806g>
    <xmx:JSlUagIKYPfohIq_mluQnhDVwI0g9yE4IYjLoNU_BdjMMccP6LKHBQ>
    <xmx:JSlUakuwepdGwy8VEwBx6qUrAYOHI60NZutWdfxQ6s9FtoMGWymD54Eu>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Jul 2026 19:54:07 -0400 (EDT)
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
Subject: [PATCH v2 3/4] rust: workqueue: use Delta for enqueue_delayed's delay parameter
Date: Mon, 13 Jul 2026 08:52:45 +0900
Message-ID: <20260712235246.3069713-4-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712235246.3069713-1-tomo@flapping.org>
References: <20260712235246.3069713-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

enqueue_delayed() took a raw jiffies count (a plain c_ulong alias with
no type safety), so callers had to know on their own that the value
meant jiffies and convert to/from it themselves. This mirrors the
issue already fixed for CondVar's wait_interruptible_timeout().

Switch to Delta, the duration type already used elsewhere, so the
unit is part of the type instead of a caller convention.

Use as_jiffies_ceil() rather than a plain truncating conversion:
queue_delayed_work_on() treats a delay of 0 jiffies as "enqueue
immediately", so truncating a small nonzero Delta down to 0 would
silently turn a requested delay into no delay at all.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/workqueue.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..9022b22a83be 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -197,7 +197,7 @@
         Arc,
         LockClassKey, //
     },
-    time::Jiffies,
+    time::Delta,
     types::Opaque,
 };
 use core::{marker::PhantomData, ptr::NonNull};
@@ -303,7 +303,7 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     /// This may fail if the work item is already enqueued in a workqueue.
     ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
-    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueOutput
+    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Delta) -> W::EnqueueOutput
     where
         W: RawDelayedWorkItem<ID> + Send + 'static,
     {
@@ -328,7 +328,7 @@ pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::Enqu
                     bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_int,
                     queue_ptr,
                     container_of!(work_ptr, bindings::delayed_work, work),
-                    delay,
+                    delay.as_jiffies_ceil(),
                 )
             })
         }
-- 
2.43.0

