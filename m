Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6443128D9
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 21:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757113; cv=none; b=uWGab/GFqfk80qwgBKKbNs8B1qwYHv+ymmszwfwhulXlKxcmpY+pTwSskhx6SULUKh/OhwTlDFwqGAp3+3sB1oznHQoMTPZuM6w6TDDE0y80Mj7MGXAUTFndETBNeF/jGAcabfHZLurrUWmUig2Rzd32kA9ZaAKRoUO+WcxiBo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757113; c=relaxed/simple;
	bh=z7wk8z3fKgY3Y/3sqEDTjSHS8OoXxx4nWGG27uKB7zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9TouITeGUvksFqXIvTZFOUStYi63sqCWy4rwwt4g6wb/ExZguA+XcE8aUvebHHMV6P++FqmEmPIF0SFzMPWbgKFnZawqZOubDAZf1/3m14eAW4MbVjVvbNuXRHV0tSjhJDmbPBuYN+40d6laEq7tYfcOESOi1H5htlOYagMRt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=N8TJCdrc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mdq26PWX; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="N8TJCdrc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mdq26PWX"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 895CB13001FF;
	Wed, 22 Jul 2026 17:51:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jul 2026 17:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784757110; x=
	1784760710; bh=vNm/Q8af0obcOcWOukkB3ja9JtroCMxF15RaYJ9nMwE=; b=N
	8TJCdrcHsRBEBDVXimKfjJWsK5e7Gu1A82NcweiEk0P6HJcQSsDS6McPY/MQk21s
	Bl6WBZctkLWcllol2gEAtTUxvEJWI3lZbR3/Wr5tU/BwLOspl+bCCKOuRFxkxTFI
	z6sgQEN/ByUPGGTvr3F+pUFVis4guWmyhleLFUfsy5M5qaz2/BLU9sfFcPc67aUG
	833s7NYhiW9McFIYRoIolhMXm33vi7mYZP7NmAg/OK4wwZAzNmDbaGIBc2Dqvog+
	RJq8luzvd2qykxmRmSbzmxffycy1bsQFWCHl7n7WhQGqHjesbukQEJu9esun7PrM
	tYXzHkFClw8ZFphZ4MseQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784757110; x=1784760710; bh=v
	Nm/Q8af0obcOcWOukkB3ja9JtroCMxF15RaYJ9nMwE=; b=mdq26PWXM0fIcg729
	Mr1xB4ZVET8r9gRSZ2leptGTkmhfw6JpiURWTuvNofLIZi8geywgs792QD2/hixM
	XJv+t4YIa7NmeV4BdDZtjTDEg36jViHScvsMllZovkucSlwTfPp/AEu3LfxUzijL
	ds6L+4Slk3K8kRDvXSi1l3e/T29tCkY1gL/LLtD9KcEoY4NLmW90puaLnwU7kXzi
	crjykaf4TTg+p4/a8hgFApELNDi0wgqv4Tz1CaawTZ8V9XaxLflSyt4rr1CIlJOY
	6HFbazP0lrbKtcFnwAfAlzH61wP8mhGB6y2JyFY+dYIxHW9VPsrfXe01Dll4NduL
	WdKNQ==
X-ME-Sender: <xms:djthajCuaha0dqjDkOUZY7YIOqBQyL28shxldbaJQrg7R-5AbiROYA>
    <xme:djthalp5zfBVnxLP-sLT8ZzhFOK74IGsdZNS36rfPjaKuV26n0VEr1ajR8VnIODL6
    dMmkXaTwBuPVjT9IZ1JnekWewI6bY2V_97rWrTBTun6ZUUm8g8mp1Y>
X-ME-Received: <xmr:djthaqbTxTXqUXjQpoNn_RQiqYRxLmME4ucI-AjDQwtv6CbmcBBVdRb8F9ye65koXwRoRfODcIR-iZlSmuk>
X-ME-Proxy-Cause: dmFkZTFPtQh+XDiIlN/deL/zNNtaMycIlI2Lr+BxbJi1FsWXTVFzkk+8yYSvkRxAJHk4qW
    sgP6RWrlEhQ7XaDBYLcb5S8EzlOGHjpDFiZfVZXHDXuoddfD1VsT60d9mtHcd7WoBtj1KM
    HDIn45Jsio0Idz1r0FxQeMcnYGD8D/kMv7yYzHa4vnh1aepyfdsERDWX2oAoUZ19e+WaAp
    0CkqpCyStETs4zyYqQq5O/ZESt5ugjiLTUjKUAf9Ati9HSvq3vB0LLrTWr6+Aya1tm4WGa
    dKuqV2S8riFrEJAoN6SyqEI1lLaaHlL8v7BE6Sm0dm1RqBXhArzPCrk1jBqFih9himSbY0
    WinaJUg5e0djBW2Rv4fhxfZOk4B7C+LyFsRoDwcBt4Mw+ZAd6S10jCmQhc4MP7wfshnKdy
    8h6tEqERob2W3DLLpWucxsWxXQZ3grXzbcxdCCcoSlsHqVxmzrpiPeKLJ9x7xNCpFPIvoB
    GeGrLxOEJAfYhe5j669NrAH6hYxx327D7s0+6DEcUQJKuCH14x3J/NtA5c+gLhb1p7OaoZ
    XN0LyMcU1pe4n1CjKVpH42OYNaTYjqmliSk6h+KwlM40Uy7jZn+vA5kHEFkWEu+/V/GIcO
    KaplOZhPzawesAkbfSfPPbs0MBYMmXaq6Cxnn3Emi3PGOqY4+lxJIMBEcFzQ
X-ME-Proxy: <xmx:djthavHcxkUSLZDwfX-W2lWaUwxhPB141wTdsLoNS7JjpgOeRzhg_A>
    <xmx:djthaoZJVwkRrQ8-RJxLpoIjoN0NDUSDnZ7OYHH0raxp2vlzD64_7A>
    <xmx:djthasenL7tgW4ZGdw1oiv7318NqttG4y5jwvraMreLIQ1dDkncUfQ>
    <xmx:djthasCW58VdlLisVe8UEg20Mjhcvg8gNovZzh_wNxfChxpQAmjoQw>
    <xmx:djthanHKeqEPeXPRTYfSYIv6tPI2CmZfwKQ3jSufcfFOD4vwPQoLKdHh>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 17:51:44 -0400 (EDT)
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
Subject: [PATCH v4 5/7] rust: workqueue: take a Delta<Jiffy> for the enqueue delay
Date: Thu, 23 Jul 2026 06:49:49 +0900
Message-ID: <20260722214951.72941-6-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722214951.72941-1-tomo@flapping.org>
References: <20260722214951.72941-1-tomo@flapping.org>
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

