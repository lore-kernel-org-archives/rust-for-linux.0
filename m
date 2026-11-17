Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920032;
	b=3IfpwX279CWha4PwFr4AURnV7y5HrukbXVCOgjRA9PWbMA8H9omU9VVi0YLm/dhCyk2w
	 KVdpnDwwhT/tyaGuluKJ24XM00dgqsJb6a3Inh+VhHH34FkCC2hMTudSDtjZ5TmIVY5Dk
	 KgQcfH5nE36mR9YIS8cMBpsJL79J5DHRJIeCjDmqt+TxsfhOyZl0mcrsn1a63z6gxHDDZ
	 Vp2DlwUhdYCom51OESODCjWa7v3mRa9Q2r6PI5bMTvlKdFyN8jY5q/1NLG52wjpg3v5Uh
	 iNTWtj+npMEwdheJ6imkVtgQ61O6DWFBOBTxPN+wc3RiO4H3lD1Q9vHrme9E3xwqtTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920032;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aq4YYD6IK9RMKjvNRNt+aAL1Kj9Kop3kNd77oTLOhrE=;
	b=WziwFfzyZHjLnAq1KYGJXmfLTSMqj90EUcaeF6GUw08vN8/mLinDWEvqnYaRirYTiUMO
	 mdH1VA+fSAl0Ox5K+G/fUEmI/itkxue00MwDlJ6VVvNznPiRgCqOH0neN5urucdyHhhqX
	 zL6ymYpPtdZFYhdUqncF7jKQdqh6RE64rS9dMx2YXIm//7JF+ONRFNUtl9q/YxS1Zggxz
	 76o3F994klsLI9O4+RX1yKQiXZVfDa/NWpNSD6H441ZelF1fL58u+in44Dgt/E/4YZ3tx
	 D6du51C43b1khYI7Qr7nzvNGIdgI30su2QW3DZwHRCXIL4xXcEy7rdwkfhORyGVtGAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=hNMVT5yY;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="trt/IcBU";
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B0D606A33D
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 12:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B0D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=hNMVT5yY;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=trt/IcBU
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E404D1400174
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 07:53:49 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 17 Nov 2026 07:53:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1794920029; x=1795006429; bh=aq4YYD6IK9RMKjvNRNt+a
	AL1Kj9Kop3kNd77oTLOhrE=; b=hNMVT5yYQdDiNk5LA5RkFWHBtY7Dhudb5bFmZ
	iS2AjqjQ43jD6a60yldLYwLR9o5oy+pI8LLDr9ILu23DMp/4lvVJujrd3wqAwghC
	iJ2yj5xz+NZeBcEFoF+5dca1HD//30BLNG4WWbWCQvzG2CSlPA03KqDjBCyuOnSB
	MqYPq7ilXh9TozqwGKM4T3mS/w7fnfDsvk/VE9uS5aDr6fS9nBQTg9qOG43L6sxf
	Y1otOIRokdFuajb6ae+ngsFrxLsDrt9YYjZ/WHsYqLQ1/QROeWOv8llhjjIToY12
	nVP87jZbW0h/dMj/Wp7Pw/t3DMlucXcF+bLj5LYku9J2CxrwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794920029; x=1795006429; bh=aq4YYD6IK9RMKjvNRNt+aAL1Kj9Kop3kNd7
	7oTLOhrE=; b=trt/IcBUCoPw2us+tynJxQF1gvXOkfy3jGbGQ1dtjUmmk0mjgD/
	9Q7KVeGNr6zI/LdToETEmE4aiaJxQZDLk0NutwdSPVAT1HuchMTSmSaH6BpR0rqS
	7RDbFN+8NIsreO9D8JMsM+WRqHavOCn8AY3e1rlikFFRuKRLHR+LTcJ1npvu2HYP
	Uf0ZFMlXOvKHnbfUp0Y0WoYZgwhKym16gFXmM1aHY3V96yB3N22nTibwHZEbW3+d
	vcisQaI28dA3oZwU/OPIANq/r52IA9kLo2u2bxGZIBUPUQWpqWJ2eozjLHM8a/xT
	WYTqpcWk8HM03HSxZWrQjhXVQDS8KCffUwA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794920029; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:NxeqHz4muYVF5hVhM8MRxpgmOxwWmp7gfMp8mSTEE9MbAgM
	mCPR78olsxnkwnFgyw+2eUXcTcQBSVMfAE8wJ3XLG3CMaCwfelDvj4djTV9GCjyG
	RR/1yCxqQuP0ZUMt4TgHIjPAhCTHsxquTeVDT3bJuSpd/Bc7fDotryKlHYRf5r99
	E9fMm6oguBU6Mnsd8Vs9TWw/VjNUof2U2r2iq51oTKfgQhxhBqgHS7MS0oiuByTx
	iky40yobhxnN3TqaAHQS9xEX8exDCM1d+Z+Ebxdtc0qAH7eh3uUfXsCnfaMC3DrP
	PP4WxLdMb3zJTjNQ2GHhNgl9lIaFQxvDQOgbsZw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:1kpsBRd84zeeo3P2aM52d0y2adiTiAD9DngjpqgQjOU=:7KGUGEgtfdC9JZAy0t7PcW1mzCG9xIiSbAcUfZGzacQ=;
X-ME-Sender: <xms:XU78auWRr7VSZHyz1rJdjb5D1WVdwXQ1It0VzOU8iNMzjTYWGoUJ8w>
    <xme:XU78alf47KMsX_Ga8T-UlrDpcBIS_5yM4A0JNxRorBZthvVMxyqKLug5Dxj_PRN5r
    YH9__O03wIzIJlUEDe8x-fCpjSKLdrd9WoM-XmyAB4hjqc8dUGN2P4>
X-ME-Received: <xmr:XU78askynuYvezKgMThl3JGB2TFw5DwIhJQy3cC7vPPFnqADGCqQRRbzPApKcl5z_rVzdnfm_ExbRANglJc>
X-ME-Proxy-Cause: dmFkZTGxy2UOuMXRdMV9loqtMx51Vey7grA2VZNeu8hnAwP/AV72pQZkxbQbAG2ZKXzJju
    UxPWTXUS6RZ5csFymvuHQxel9m2x8q8mOL+CwG0d2y3NJOPleiCAeaJ3Ybtc1C766a8MSA
    PwetVy9jaaHrhIHFC/xrGAV/tTG070lOVAgwQA03dqmNphXTtVKy2N1sV4vJk5PpYpY3D7
    D7y+Upf/JiXfxhsH/aNYpbgZvT6/BskuMvCGXbsbOrU1nIhTbZaWhtj9P/dX719O+1/tHf
    dfRL5bpdUqZPnw2BUMjdD8rHXeFP4MpoFRLqAJmxkMC1EtWIAkAZMZvdlZlVLz5l/Q1HPf
    IWe9f+mHEHizS4o/UE0CqIVTrOhbzbB5J7tPNKIDB90gk2QjS8e/YDBjhSbG93Odq0U+JI
    Fabz4/g7ZoK71bK3XJojmXTrFGooCBeOw88fGOYCBEZvZWS3D6nCtYofAn/6T+kdzp/+U7
    4SqpvIqAIgJrDzIarTO1TGkSyZFfoe3Q4s0taCibUZKRflsKnxp2/TVohC5J/iGd2dZ8KC
    k5vKvIQ1pbmNPHeL2AAF346QLcsw6VUJ2F+aXYcBo8kjqYTHFuu7vou0j+NpQGxcFJ/dPp
    OicK4kgNr7s+hC8JdSWgFX37z4kkSKsBQId6ruOfaBEPeuXvrIuUZdN15Trw
X-ME-Proxy: <xmx:XU78anBzR0ImCWRyuTByfifMstTDirmxPqVH5WuzJQVEx5XqsmqNIw>
    <xmx:XU78audEmzFxZsHe4iCOoCjh4gmAGT7HT5h4dfS25b-ynST5XXkuxQ>
    <xmx:XU78ai7mpFTcIcCR3r-b0mc9iiI-6g-ItMDSsvMa1fAHp-XYcKKDzQ>
    <xmx:XU78aoMf7fSVqty5-57vrIh_0FXw8JILi9GHyAX_TaenJSiJ3q8LVA>
    <xmx:XU78aqA2LWj_-bd4N7wdZUEfh1F5dtp5z-fJTvBLbhf-ISBjd6ah61Fi>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 07:53:45 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: dakr@kernel.org,
	ojeda@kernel.org,
	tj@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	jiangshanlai@gmail.com,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v10] rust: workqueue: take a Delta<Jiffy> for the enqueue delay
Date: Tue, 17 Nov 2026 21:53:32 +0900
Message-ID: <20261117125332.2293479-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

enqueue_delayed() takes the delay as a raw Jiffies, which is a c_ulong
alias. The type does not show the unit, so callers pass a bare integer.

Take the delay as Delta<Jiffy> instead. A caller that already has a
value in jiffies passes it without conversion. A caller that has a
Delta in nanoseconds converts it with Delta::to_jiffies_timeout(),
which rounds up, so a short delay does not become zero.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v10:
- Import Delta in the doc example so that the line is shorter (Alice)
- Add Alice's Reviewed-by
v9: https://lore.kernel.org/rust-for-linux/20261102042524.735613-1-tomo@flapping.org/
- Send as a single patch. Patches 1/4 and 2/4 of v8 are in v7.4-rc1,
  and the condvar patch was sent separately
- Rebase on v7.4-rc1. The doc example now uses system_dfl()
v8: https://lore.kernel.org/rust-for-linux/20261002050428.2746277-1-tomo@flapping.org/
---
 rust/kernel/workqueue.rs | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index a872f9fffb90..8717a78a1ebe 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -135,6 +135,7 @@
 //!
 //! ```
 //! use kernel::sync::Arc;
+//! use kernel::time::Delta;
 //! use kernel::workqueue::{self, impl_has_delayed_work, new_delayed_work, DelayedWork, WorkItem};
 //!
 //! #[pin_data]
@@ -171,7 +172,7 @@
 //! /// This method will enqueue the struct for execution on the system workqueue, where its value
 //! /// will be printed 12 jiffies later.
 //! fn print_later(val: Arc<MyStruct>) {
-//!     let _ = workqueue::system_dfl().enqueue_delayed(val, 12);
+//!     let _ = workqueue::system_dfl().enqueue_delayed(val, Delta::from_jiffies(12));
 //! }
 //!
 //! /// It is also possible to use the ordinary `enqueue` method together with `DelayedWork`. This
@@ -197,7 +198,10 @@
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
@@ -303,7 +307,9 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     /// This may fail if the work item is already enqueued in a workqueue.
     ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
-    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueOutput
+    ///
+    /// A negative delay is treated as zero.
+    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Delta<Jiffy>) -> W::EnqueueOutput
     where
         W: RawDelayedWorkItem<ID> + Send + 'static,
     {
@@ -328,7 +334,7 @@ pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::Enqu
                     bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_int,
                     queue_ptr,
                     container_of!(work_ptr, bindings::delayed_work, work),
-                    delay,
+                    delay.as_jiffies_unsigned(),
                 )
             })
         }

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

