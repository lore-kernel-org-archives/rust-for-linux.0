Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3233403ED
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 01:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790732537; cv=none; b=FAv3PeyDsK8qmBaH7Pp8M1B7v3NDHMHWm3lwGeFKwLLkU1uNOhI92MIfuFvFpSc2Yu3p6TtbKKoMHjttTKMt+PXOae8nvc/dhUwjhHEwdhUG4L51Nr5UBUoKzkKmbv5tiphMoj3v5S8XxW0rZXn5wtJT1lJF555/HTMErMBpAcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790732537; c=relaxed/simple;
	bh=p0XSwbgJUnbt8Ph2dm3Q7J1DCI8a/m7lZx8TtMLZU6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAc7SDdMzFVBDeG0bZrgWJRdx17d4iJNpMhE7qfNp4t4Gj0XADhqcB3AGxYxqMaiJedmxx3m5S2zDVTIYp009yrKnsQKr2cNWVaFHYunLlvRBxBWJaGfIWsAxQOCNUmCOrvqtD5far2vveb0yX9PSojsArXlI8elhZ+Dk71BQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=YsTz+2HA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cSymv5/e; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="YsTz+2HA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cSymv5/e"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 993227A0794;
	Tue, 29 Sep 2026 21:42:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 29 Sep 2026 21:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790732534; x=
	1790818934; bh=AULc60q4NaY4/rWFwifW70hbd2/xbfkzFLrGU35So7M=; b=Y
	sTz+2HAs+7IHWJk9XZVSd28ao2s0+9JVdbj5UZBF3SdASg9R27Yerfkrj0+71t+L
	3P/z34puZd8b+mU5DtCFkqNK/j21yZyVDBuqnG4+oHX+qRgRy6XNEZeKM4P534NS
	Bxh3KVPPVeUN081xwOevBqjThi5R7bR0dPk6E/6UiU/QXWcmO6X1jys1FK/ZguWQ
	9MhQN4Y6lL5KnHpDQLvqzwJCf/zb1t0OZ9jnPNm+isV0QOS5LPnQYgDHjOZGX6Zl
	5GvNEPRK8eA3E6IEdBo4s6N0HOOcr0XOQTU9PRbpUTPfW8zjEhB1/zxp+var4OgN
	2oBbaquLyWn1or1K553gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790732534; x=1790818934; bh=A
	ULc60q4NaY4/rWFwifW70hbd2/xbfkzFLrGU35So7M=; b=cSymv5/eTCtU4qnFn
	ApFwaudDAXH+IkY0aX+IUqdzscBPhkUUdYDSgtwM0b6avlh6weUyRCSzzFDLGMYs
	rehcJVTDsvSCtXrrXVnSWlvd3zGDbXNJe6ZRaJdiec1Jr/8zizAvfXRO4UmRztMH
	UVyqwSmuPoHkxr8j0IudLq1mrBDXoz1D7QXF/ZX1ZwG8df02GPhTex9ujz1jlvQg
	/9RYiGrWgncV8HwsMcxfFRFT5XJgnQxgCMrCAWc01Oty/OegfPw+wDn/loS03eKV
	Kn5Wt/RGwFSAsbItSS6GydehEzcKrS9MnoaI7KBl1VF4rKPpH6S5ndcO9dqImvGN
	+r/BQ==
X-ME-Sender: <xms:9mi8arEZZ-oJyrPSsDoD3llNzOUNmYlvHixeKDOPNW_BQ1DWvW39BA>
    <xme:9mi8aguPawZxpMHjPfLCeNoiWoCppgKBu7Z9kYGvGrxe1kC9Bimdu3iPRs8TeXOEG
    kph8pwvGi_Z6W84DBP0WlGHzh3DSaD5bbYRT12WAzWEal_4KdjXFYpO>
X-ME-Received: <xmr:9mi8avUhOPFIgKili_6h6NFNN-z-ABjXQ7aRND7jraewv-W5YuZGFn8_i1f981ObLVUWKiv4m8O2ghr3yYo>
X-ME-Proxy-Cause: dmFkZTFJ7VgXgFgflXfl/68DiwR5XOIfR0vGfOZsDNR8DbsVp6/eFa6vYquKogxylfT1nm
    FOLP/u2MRZFJpf6qZt2Fb10cVUVxuz4a+Nk8aCJlo2zYRoqtJbAt3j4tueAauno89BBKn4
    KYED0niWRRhf0S1fcLTNPu3iMassj3uWuNtfsqVxkm1Iq7Lt8UoBp7bg8+Turc2e9lD6kp
    sYukkxWb7rUfKsUKTl4P+oreuDMj5WDhBc3sUFROxizT931P6++7B2nCDVXSRr/uRZVqey
    agcxmQRvKQdiTZPdolGYYeETPCYYs382fQKFdNahFFql6esXMN0QTeg0UYGvcG8xlDydNW
    fyCXvTZ2uqHf+FE8ZeMUigiRVaaGqeURZR7auNmY6/3YWNf4zeGVujlRoXUb/ExiM3yoSy
    mZtti5VeuT1nIENrdlkz22ZWFEvIAUzWK4RDgpUbPkx4Un5hj0wYvzH7uQzeNiD3iKz1Fe
    uMty5Wqj0HxEU1Va9OWYxEU3jBv8oodEGSSaOLSQc+vf3DDGyolMo21qUFhRObufmYXsX9
    rz0JSnSMNZiSxRG111s6Fz2nTSPysFjZk28LC8NQsersAkvvKUwe0vUJ3P4gB0ug2EG1l0
    kRaL9f7wORSGl5tmvRqphl+yEw9q90HvYKfvsxpRyPQZCwlaY5nKgJQ+HjNA
X-ME-Proxy: <xmx:9mi8ag7Fotgw6l4skiX_mg8FeYxwdZFApYs0UWXXRz1u6K67Hg9Wnw>
    <xmx:9mi8ajbkEZFmvL2E_bymx2tRPj1yuuN3Qm066llP83GGmFT7DnISMQ>
    <xmx:9mi8akAOflHY-PIpg0f3XDIu3s3GPS1lO86VKU_XADc9OnJXYIaEsA>
    <xmx:9mi8ako7azoxFQEdRKHefWqxpzUvjEHnQ3YJVuBscvVBmvBYafnnug>
    <xmx:9mi8aqHwAhjVF1_NmUqSZxyVI0OCrNu4omsRhUx32LBherptMy0760Lv>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 21:42:08 -0400 (EDT)
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
	tkjos@android.com,
	tj@kernel.org
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jiangshanlai@gmail.com,
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
Subject: [PATCH v7 1/2] rust: workqueue: take a Delta<Jiffy> for the enqueue delay
Date: Wed, 30 Sep 2026 10:41:23 +0900
Message-ID: <20260930014124.1454138-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930014124.1454138-1-tomo@flapping.org>
References: <20260930014124.1454138-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

enqueue_delayed() takes the delay as a raw Jiffies, which is a c_ulong
alias. The type does not show the unit, so callers pass a bare integer.

Take the delay as Delta<Jiffy> instead. A caller that already has a
value in jiffies passes it without conversion. A caller that has a
Delta in nanoseconds converts it with Delta::to_jiffies_timeout(),
which rounds up, so a short delay does not become zero.

Delta<Jiffy> is signed, but queue_delayed_work_on() takes an unsigned
long. Clamp a negative delay to zero, so it means "no delay" instead
of a very long delay.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/workqueue.rs | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..6cca8d26766d 100644
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
@@ -303,11 +306,16 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
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
         let queue_ptr = self.0.get();
+        // CAST: A negative delay is clamped to `0`, so the value is non-negative
+        // and fits in `c_ulong`.
+        let delay = isize::max(delay.as_jiffies(), 0) as ffi::c_ulong;
 
         // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The other
         // `__enqueue` requirements are not relevant since `W` is `Send` and static.
-- 
2.43.0

