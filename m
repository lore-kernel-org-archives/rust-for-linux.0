Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593559;
	b=Qm2PA6dmoXf4BNlSx1v+oe+YacVsExRP56GQoGPpmlrybzZiM/zwcYfdeQ4UVT2b53up
	 M1eaFQ/50jAti5zG4sfiOLMibfEuCfCEtT6TCrvvI7tzV8aPUdi1wBi/z2so56IvTkh3J
	 nVhdn4awW1mDTer6acwUNRAAvn3hGBfHdnJe9x8Ba/pLh7IIqudBwYN+GF7ZSqTbgwPhK
	 UzlTcaVgVheRZfCEqTefJACTfN6bXQBzAgYZJRSJUCviokEivnPJrwjlHr0TAR+ENASUa
	 rpMpDxupqe9xtajJgAHTUMEgSFZysLUF4EQ6c0p3zPFfHxSQLsqhk1+M8P1cZKWCh2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593559;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=klnJ767tqKG1qIa3oLewxoXioZCGvLHmRpYlw+alCWo=;
	b=DWvj3OUmhHCor3kkSFsrsOgo3zwRgvTln45ak4PJsa5aoQ5/0hMsbu6Arj2rdWwK+3XZ
	 NV8mf1fKtvFRnllCw4bfprAhbe4nkwSU42hYFc4EHgFPqPwhi2VjsSIOkJGDyL7WDJ6a5
	 69Rl8vR+Sx26hdU6gfdTok6rzniwFVZN3ZbrMHmLkVG9MsvopnvqJiP9Sdm5kc1zxiYwd
	 LE/CRFDzeiVDvLVNZ0NKVtx0oZ+uDutQ9WxHx4ndNH+fznpsVHWHlnUX6wPeYB2YatnG1
	 RVi1/1ipOs4SFj4ZUvdQjQOqF7hGFolyhq4uzMmXf0IwxcrkUTkasjsNl+XK4FguXCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=d6i1pC0W;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dScwr9dt;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1F3606A324
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 04:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1F3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=d6i1pC0W;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dScwr9dt
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E595B14001F3
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Nov 2026 23:25:57 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 01 Nov 2026 23:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1793593557; x=1793679957; bh=klnJ767tqKG1qIa3oLewx
	oXioZCGvLHmRpYlw+alCWo=; b=d6i1pC0WrWfROelt8IQUr4gJBr2wLqg3PWkH2
	F8GcSL2xq0x3rPHt/XKPOz89AaSo+5K17kBbpXh2eYRBnYIsVj193VhQAArBcgD2
	sJpY7K/r7QaVF7l95xEwSymisAGTyHZNvgeioMmakB7hk39bPeVpWRkQgOhNBwdQ
	9V1IJPOV5ssdb1NTS4evjbOGpyeGztWlL50uPLkfxt4XKZ72j5gwlbnZ3gAeH+2u
	rFDdifVqbNJ2Lg35DGGIaBBdVLGdHXDuuV1Q2JQhMNfoVnAy2KgZNwmM1Dt91sqW
	KpjVOoMkLs/RCKvF37xnp+Qasv+DIIj9SSz92ROTQEo3QFwEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793593557; x=1793679957; bh=klnJ767tqKG1qIa3oLewxoXioZCGvLHmRpY
	lw+alCWo=; b=dScwr9dtd/nLMlrrd90p7Vq7IfkOBXH80KkBuIClNdJ2qD6enZg
	U01OyG9QQGc1tcYqARveIYqnnowAN7kqfHovoc/B+PBSgXmb+wVE2XHetQAl6eWh
	RqTr5RyztTv+wZPJxWlIQbdIeUEVZh5XMjJRsVjyAZXiBajpKXgGRWWevSaALKNU
	jQjDtSRu5JepYI3gvfaAiU0gJGlo9dwb0yBaPqME+UGKm5c80VuMXU0UvWQeodXL
	ZFsEQxOvxiiAr2Dvp9MwEyleNEgS26l+z67soL2itD2zMWo1FGmf2tJKzQjvb9OD
	203cXLTruOquZOPvda9xbXy9ZosetKA5zsg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593557; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:jv9tlf8cniNImfdS4uGnOrpgRedd/pouE3xT122YExa8eOh
	JlH2ZKYpfNIatSoqyJcjUwxgfR/KpRKuLw0JgsCP51TBaLGYacb75sL18VJCcapq
	p17k9GiYdjqTIRppbe20DFv4MESiNFuAbzoib+T6ejGMpeJpdnLHzGxGe7a+2Uu4
	6pvTIy5Vy7DEc4RyeLnmU7PRHQ9fKHqMG7l+ozm16MqNLjbcITFpuQ2CxJe6IzPF
	gsILDeyYxWA3mTdeF1XYb683DTx4xyvkzWlt8sMALr2O5fuoWS17YZ2P/cIow2SO
	kUyaFWhRVZ8LFb99hGs52r5bRKZAZz2GJ3WogUg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:QYm0gva6nC/nVsUHtWy2w8oCekIikhZIKqhc3GP1GCE=:iAe3dGD1Qb2QnpBuCTTNkd3st7jLGB7g01nDaRlk7Ak=;
X-ME-Sender: <xms:1RDoav5Ub9qPJxhBM4ifU8JIgSvC4TtrREv3DbLoOYRbBNAguTW1aw>
    <xme:1RDoajaicYW11uWQOoaZEACMeQPd0ZWs5Q3J35XokL8E4ldCYPdfjizBdCS7JyqKE
    xJdSlxDuoQAmMkcl7ZbIBEskcFOp9M9rLfJqk9icDpx0aQF814fV85l>
X-ME-Received: <xmr:1RDoatSw4rxhodhaju_NV8k2QYjibqgg-2VHBClJiBDuCuhvGwpzK36Ak5AEN4Sp88knztVyD0imlzKQawM>
X-ME-Proxy-Cause: dmFkZTF3ZencbtGG7L9Gv9Csmc37umqGN/XPSMbJDpNXz6WATRE1rfzC7fR9599qRYMq1q
    JEKLrbcKPVw+zElvEZqgw2LOi9ZYyZk1TzHUL+xjgFdIvfFx6iKFJ+XZgTk4AeH0fNfDup
    PlovRNZw3UKTU0m6B/Vpx9xLxetDd6cWMDMtRaXWkLnUqFf3t0Vze7NWR5XIYAWi59rRk/
    p6O7+FFKwFD38fGxttGs7CH8xhw8GAwNDFBLT8ZNRq/PGfGqeXdEM6iTg1304WJHyUJpk6
    7Xa9sckRqXobGtUM86dgzMXGKSgMjpZR34cA191uJ6vNoViQMTFJxpIRWzo5mxXMRWMEYh
    n54SW9hY17V+wvqNXeT11fB2ne06T2qFsfUBecEvebmzLACS6zY8aESu+o8NAw0OdiRVmA
    QBuan4bKoIOuHV50ibC4pnP1IOES5DY+cltle18eMt/5o2z7Xqy8quR8em9ULcW7clahzv
    rosGlWSM6+JkuCeEoAYV6CkJrrYMPOn8otkQXlMA351zeWs3VBJg/lOCetcdQ83wssBcGM
    j5vcW0C3icrmJJEwQv5Ng1VuKMW7IQKLKNvV54v7XG6s0wHe397Yzdr+SpKWumN3jVDb58
    dgO+ZVzp8YHESb8h3ZgbQ+KVUt7OHxd7URDuMfiMaVeM2iV99EgCi457PQ1w
X-ME-Proxy: <xmx:1RDoagIOOsR1kkkqdTH8OiN0OcUvNaN3-4b04t7puHi7Q1mQ46JO3A>
    <xmx:1RDoarUAJSsvUxewHNO-P6fgYUQSxc9KvjTBog4grIzeMTPwACi_5Q>
    <xmx:1RDoakhpeHZSRy6iTKw3FRbbnlh6TfIl7i698b4aI171KXCEZu5mTg>
    <xmx:1RDoanuJ6Pwe2Vg6EeVbfTMgmEaiMHB3wBEv_LKlA_jgON5zsNu_ZQ>
    <xmx:1RDoaiT2Puwjaq-gGTapCqQzCl2l0SVnrH5rBQY81b1GWiuYnRFtUzJN>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:25:53 -0500 (EST)
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
Subject: [PATCH v9] rust: workqueue: take a Delta<Jiffy> for the enqueue delay
Date: Mon,  2 Nov 2026 13:25:24 +0900
Message-ID: <20261102042524.735613-1-tomo@flapping.org>
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
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v9:
- Send as a single patch. Patches 1/4 and 2/4 of v8 are in v7.4-rc1,
  and the condvar patch was sent separately
- Rebase on v7.4-rc1. The doc example now uses system_dfl()
v8: https://lore.kernel.org/rust-for-linux/20261002050428.2746277-1-tomo@flapping.org/
---
 rust/kernel/workqueue.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index a872f9fffb90..e9bf30570aee 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -171,7 +171,7 @@
 //! /// This method will enqueue the struct for execution on the system workqueue, where its value
 //! /// will be printed 12 jiffies later.
 //! fn print_later(val: Arc<MyStruct>) {
-//!     let _ = workqueue::system_dfl().enqueue_delayed(val, 12);
+//!     let _ = workqueue::system_dfl().enqueue_delayed(val, kernel::time::Delta::from_jiffies(12));
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
@@ -303,7 +306,9 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
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
@@ -328,7 +333,7 @@ pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::Enqu
                     bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_int,
                     queue_ptr,
                     container_of!(work_ptr, bindings::delayed_work, work),
-                    delay,
+                    delay.as_jiffies_unsigned(),
                 )
             })
         }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

