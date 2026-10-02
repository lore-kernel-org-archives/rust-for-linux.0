Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ADF2ECE86
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 05:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917604; cv=none; b=sAsACup2E4M7wg3EjMgZUezbTBR5ve5I+9ez5ZK4M+VXL/KwDW8ru12RTEpzExNTi6R9sejraKcWUtZ5ATAexDQ8iRow54XSnLhxrWKw3rUm1Ff5nc9dpAoDhQrd4YsDUftoHly6mgAeJvsjysiy00MdVmMHIpS/D0ZvLw2Ref0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917604; c=relaxed/simple;
	bh=S5lKs70ojWCbF3Y5P2kU2RIRm15S/6El9gOrOFTSIzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCTq5yBSj8OdaozGBNqjnJLgK+YEPR/q59L0PR59Upb3coFm9RH9ePqEfMo3ss8pZBWgCbNIwBGrGCq7VdJJwfFQCIZfXLG56hFR8yGpRlbymSRLaF7eeUQwX5G1c8wiGBdwYBx3GQ1g++1garsJhqVj11Quu4Cl0RjhdD+Gpk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=VO8PoWwq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=spXuTozM; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="VO8PoWwq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="spXuTozM"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 764331400184
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 01:06:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 02 Oct 2026 01:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790917601; x=
	1791004001; bh=BXOBiuZakuKilrhr3rjgclOXO3naxAPxFTnhj77ApnE=; b=V
	O8PoWwqlYNHsLUzXJA+rhxuzFcwI2LU/1oFfF4KQqGNpuBgQvh5pgyA4V0Cb/1dU
	+660SezrA+qHnvUC4FqiqVr12ZYxj+RIq/HpBIObwHA59AdiHCPIS4/SEC6R/mZn
	IAgyf3z9By5E9W98odn8/CUNuBOtYqKszcYjU/RV7u6Vjh0VpHKLip0cflGaYy35
	RZXB3TQHM/6kuOz5KV2KYLaqDgGCQR3tslHm4W1Nkz7/vjf7koRwHGiEd9u6BGtL
	fZZHJnpfrh35EMQQHBy5I3INxWOK1AT/xDNeMxa0cnQO4EhgSK4y15lGPGb5lofu
	7urX9mTpFl12XG/rOw4fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790917601; x=1791004001; bh=B
	XOBiuZakuKilrhr3rjgclOXO3naxAPxFTnhj77ApnE=; b=spXuTozMj+YjQYWVo
	fIMVmu0VPfO1OYWd3Ft0mq3eCadj+MFhEaSkEUl6pYM0tWe6uapgAY7mcENONxMI
	RjuV0TrqZllIhKMgwvX7MvQPa/xKDrejsfAS9Eg9r2uEHrGxhgIfghqqkW1P3DLc
	YJFz9MMo2T8YMOAQbT+tVuPG7UPfU9NCDJhMUzdzff9iDS9Ml0rMtaRI4HIFSfUw
	1RfYGoQgVvzQgFqZJhVTPKZFDoAi3i7KIrP15alh5xtHqQn1zqJgD1FwigG/8J1V
	dluhiq/Fw6QSGJ5LO1EwOKn0zRDCw1I4k0FMKWsYE5kBGrQ+drvyFZyVzFk8xvoR
	1yo3A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790917601; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:HXihTO1MOsfX/pjy+i9PuLAJtHklVR0DvbX0ESzrLzI5q0a
	UwtprV4raSc9WqEq5meOHnHAsxyEISN89zfa30wWR5jh7RPmFEvmrk35jtErznXi
	L/N3XFpuh6uT9fvgPTtYJX/Y3p1rKy/DXDbu8Y7YLOOx+R2d9wTb4jZyka7oSwcX
	mFsslmhjECGUj3q7ewlHuzGsm6n8hIjefXG3xXx4csHwgOtin+hMoJw9Z6R6anGd
	NjFFbUNNFi5aZTgG1kkApKDNyaORCKumeRAl2Rm0CtMe0fsR+yEJsazMugmCvPFS
	gAj1LCtiIThvanntSmAwE9pRwsiZAfd4zG9xfCA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:+eQx8siFmgO/FVYQp4dvgTRVFYsYUGWJXEN81jbD7tU=:S5lKs70ojWCbF3Y5P2kU2RIRm15S/6El9gOrOFTSIzQ=;
X-ME-Sender: <xms:4Tu_aqLmKNaSzv3PRfBs_as_w14jBIUMW6aSIiuS4vJ-mh7vX7SjUA>
    <xme:4Tu_apoW77-gMGf-f-tn9CuR2Tj25RZmLIBNWQG8idc06hyG3VgenM9Clv1HwNvc9
    3HP1HZlJyK7Xn1p1eKigMNFOxVmsIXzCEV3mMv4Zqtgred2YXjmdsQ>
X-ME-Received: <xmr:4Tu_agwSt3K-aNr9uC8Xswkp2KxOBpZC-Lydp8envoDshylQ2QNH-4RB_vcHhUhfe_lwAOx7zfBR6hJK1Y0>
X-ME-Proxy-Cause: dmFkZTGMLpOgI2OKNeAvmCDvHDAYJl5lB5ZqQ7VKKVShk7EFNspaz0BsSVXNLLBrCeHsEk
    Ke9vRnGsFFiB+JOqE1D2zVZYBL0AQfoCkHjPMcdQmQMk14xZIkl2go0wy1j1ZZ6MXvz6JY
    Kt0Rv6da0+m/rcnSnZhuAQrCCTgxLyr15JXVweaVjin+10Z4xVHmGoMpGwabh8Vxo+tDBz
    gN0hoIJubNRJGHcUEp95Q7hZrdR2s1QTTpLvsVxlCzOEkIlt2/amEw60ID8Z6NIUZYUBLa
    Tb7zRH5pZmGVCkJV21yGrxt0w9CyHRIT2FJm1N4IZx+S2WcphYycV9+0a8TEY6/P+SyNCD
    9tkKivkdSzgINBmB9SrNeNRcg509jiaBNLWrst/Ba1r/tXTP5OZnL9tHjrXwLNG0eeCoz5
    tFHZkerd3wwhsx0T71s3wA81xexlZooap29aN6qXEIO8wV/L43Nf/Px6gpRDbeyoWFig/m
    83bTOb2lGZ6fOUvPz3ICfcVsrHBFZzYsM0jfNw4qTnNi9W+s5wBGGO0VbflhJVMVJImnn4
    /fvNOkJa/gZs5xL+Y40LyquUhk33wQ8dLazYzsq/vYnnwZUjF3VeOcQPPZKeLBRPiSM5lU
    5hDSfiupDT1J/42zRgCEDwAR5PzJ+I6kYk+pgdKnr6NHkrVuEFJWZ/t1aMiw
X-ME-Proxy: <xmx:4Tu_ateA6qyV88UsYYiNr3FeKhg3PGXjkI8021NNNH3jtyTsTOVQUw>
    <xmx:4Tu_asfme4W-Lbm3iuOOaH0no3sJAbIu2P4Q_CTkwKYNFqp6LyIVBw>
    <xmx:4Tu_avZfr7Xfi1q57_ELIjtPOVZu8A_UBqDKh4x9x6UHdY1e47h5rA>
    <xmx:4Tu_at_JZZs56HXuzX9WHKgYaRjByt-QVYVktk3P2x97gZUgOC18QQ>
    <xmx:4Tu_agtca2T7148SwZAUEVJanMZV6adoQ4k-wel2e5F0ZVA5uIKh_jLc>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 01:06:35 -0400 (EDT)
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
	tj@kernel.org,
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
	jiangshanlai@gmail.com,
	markus.probst@posteo.de,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v8 3/4] rust: workqueue: take a Delta<Jiffy> for the enqueue delay
Date: Fri,  2 Oct 2026 14:04:27 +0900
Message-ID: <20261002050428.2746277-4-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002050428.2746277-1-tomo@flapping.org>
References: <20261002050428.2746277-1-tomo@flapping.org>
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

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/workqueue.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..6dc33bac07aa 100644
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
-- 
2.43.0

