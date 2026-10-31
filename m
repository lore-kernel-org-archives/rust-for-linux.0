Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793406837;
	b=ZT7jDAvTTdX4qbGNI0CrGUvM87lj6TcUU1NDpEfMO2HVLO0rEKJSiDxuCvKKJeR51n2o
	 OhNb8GYPQ/uyKoabdTvxzGQCPEUhk5WJGDT37SsqrwrHtrMznqdNnb0YHUWKpvWFkkPci
	 d9VHC06Vzvrf/Y97q3QLyFn8oIF/AYaKy8Ix7sykDY216zkW+Q83tyb/52EgdRMek62g0
	 KBbSnTI7QY87UyDXcRY0S9UhVqCavcWcTIZXqQIKzmvTPS9BAHjGh6fjmxY6keNqTTtKv
	 JmrPvFbJOvjZe+qcvMQo5C7l6Ij0ipieyViBzVEpGPcRWlRgq2KjQJVmuuHTEbIQJwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793406837;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=DlY63W+Qo1UygJK9rz6TfvB/YBSsYoNvWMcl3xYopFY=;
	b=ZRWS1Dm+6sUAAPs07Ai+7BJ0T2zYZkWbM9snJECXcRlYSCq/PqpAA1QFN15IuZ+7UH9v
	 fa+vQA2weef9InpxpPqw1rr87JI6U/DOmm8+2htZYGM3M5gPDs8wxLP9WEqyeYISpyjng
	 5tpgnjkAI49s4b7Xib+R6hjmuYKTAxeuxWgx2FKtogKxw7a7XyTaWX7kPdpbnOo2ZQs/o
	 q0/YsGM1yvHchhUGUYcbDO6KdXE/fh56Txc8mTRcZ3cJUbMxvS4Yz/RwnmbY12jRyam6H
	 YhyUNGXr252NtOBC3eYOOFq/bIbplJji32yAh+mvtBgMAIxNLXjseMftAZ6JmxM6lyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=DmOJLZ9h;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=C5czQSKe;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3953E606A31A
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 00:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3953E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=DmOJLZ9h;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=C5czQSKe
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 924197A0161
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 20:33:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 30 Oct 2026 20:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793406833; x=
	1793493233; bh=DlY63W+Qo1UygJK9rz6TfvB/YBSsYoNvWMcl3xYopFY=; b=D
	mOJLZ9hFxjXwauWHIeWMgS/GOxGRDrGFhh0LjMKTYcQC+Nqt530spAK7DbCY/qIu
	uMF8Cmf3acBZ2BPIDFA7KcN4RaGo7JviLGT69bfSYcjxOKxw6B8GoQWuB2RpEwZp
	+REqRTIaoSrNqq10ga+g3Ffd/xtY2inCGGrD6Yl75hGC0mxc0/7pI5e/PgUR7jr5
	RPWmHun6HPQafOkye25wb9SgrMzntTXYl5j323vh4LZSgvotyG9yniOSNz+b+Chl
	2lx9DYSJBIdJ7dSex+jXu2zl3pmLP1DtPn7fACbm9GmJ+325mG7kjWp3dLt0+D7b
	eOctPsDl35mRonnIPX5BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793406833; x=1793493233; bh=D
	lY63W+Qo1UygJK9rz6TfvB/YBSsYoNvWMcl3xYopFY=; b=C5czQSKePdKjBEKCM
	ySNUIsvM/TFPMHoPCAjF5icIgpcbfBWwBTkZFM2r6vPBsbwjCTPcKj+JRyimYMJ8
	bYkjSjl/jEYD6m/k3O/nl4m9hYMXMLOZNImZA0+URKIdrxf8sYQkKnCw/duCgyus
	3s0O4c50EzXBhgXjJAp2TgHO095lHNcNCK1eTy8LfMGW4mfqEDByxwr4UUukTNKC
	hYvrFZCffBFWVPyvbdwaBprAM4xmdlH/BcGfhFXk9TooGVmF4Ce8rtVwB8b4xna4
	HYn3ms4BFFK6ZaxwJfPv+Le4ukU3fVW6DLJwF3YqMkCjrSW8pfnOwH1Uy5YsCtsY
	35HaQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793406833; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:Sn29utkI3nYetryUilg+ehZ/2D9kBNMy1Red9Avmxy9i8kM
	JmmakLRPohiz4VZI+fp6BUbbooWh/2I384MM/G/oCqTU3F+BVdvoscD9AJuJBgw0
	G2bZik4UKqAQjS714PHlM9RAoQAe/gi0Yfx4cz6/2ehcTm41pr7iXhJeygwHcE6O
	oVUaY8THCq2ASkRm6jem6BoywS2jE86KBFuvcsWjGuyMHx4BmyMUevj0pXcPdtNX
	1QNhBil8QTrB/w+0+HBXSW2g5HgCuU0uqkWjvcERjyLz1yvPmTRJoYEt1rjO2S3M
	hmoLpWnRqhuKS8nFToNV2Oa9rs63FjSxICtCxAA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:/pAdKqjfBdUEwqPpkPwRtQvPztCd9wDOWGAOxNk5xec=:yQXsV9bCg5EjhZEz/k2CVzUhxSI0gCgfoM0vBl2GfG4=;
X-ME-Sender: <xms:cDflajhYD6SOSA-IBrpCXOt3o6q-1il-d6_yIxJZfjSqQvPsXXeugg>
    <xme:cDflahWRPCXkfk4cPdq95k4rC90cACOGyjIJfo5jwnYJTx0AThYMZUL8g4x6xtYsD
    zlMV9X2PJNgESGsqC7heVLviB16gIE3N-3f9FtzPnFnROdSgnee_Z7Ufw>
X-ME-Received: <xmr:cDflanuordXwnREyDKaNGkjYpCSVWFbS5aGEx1HWOqex3WAwPvEcA3XLzPRj8ZhWufquoGtcZe1dqlfD2PI>
X-ME-Proxy-Cause: dmFkZTGAGLzkanaDbvFJUTptnIhzrMox8VZEHf9mE0HmLxYf0PdHk8dQY++7lc3a7NeWwv
    XhyHc5rpQ/YUyH+J1Ce50vt72xlrm5dBiEDGpUj8FqBLrU4XK0YA2EOjfqymotuZzDKQgX
    nRxNgFws6zKA9mBYsTSq8XyImc2/Ike87PdKAJUODcHiHYBTljqgveogEbllueATbw7yTB
    Ru46+Mfoqvm3xIpNTRYk1N3hr0N4nraV8iKfGyPi390XTTQFo0JAIthmdD55PS17gjnbcN
    6xmfkeOzUVsZgS/nI/AQuAl/fv2L+b+PIoqfUUufIctIDXZT1EABx+veCq/ddLBPA5ljbD
    AIfLIRnvb919jh4bGd9FnNtotNh0nBmpxxfB1tCa/Y2uPQdY7+nyszHEyd8P9r/VZCnxsK
    GiNYR0TVYhh+TicVW3MoflBja5MKwW70LKf4Qhyx1lXG39LikZguPR/ZD3MHm8S1tB4hMf
    KzuZLDBbCmR17dsuLYCdx9o0vPIVTnrnbqUd39aJSpj7j0jOw9ojCaNOH2iazJ9vh7TN2+
    ZcY6dCQ/fvOUN4PlDlt/oACgM2zatSYedau3pnPm+wz/ZJnQljrLz9rb86CSuqg6+Ss+m4
    l1041BLNVFX7U9dB+1wEQ+9Bl9CoRZg3o0/rj8hG4ihsnDFCmZbmG80X96WA
X-ME-Proxy: <xmx:cDflai_mbqb0OuGQnBJc0mhGO086vdM6lLbMoKNVAXicBQ5qSBZb_Q>
    <xmx:cDflanvZf7sfFYBeVu_lmdcj60MP0UoDt-kEE96TCiAikVo0Zxp5YQ>
    <xmx:cDflao7ipPU4gW5D7PAadz9pnHVIoML0J2jKzFUz60wHCC5Hy7nleQ>
    <xmx:cDflagNOZo5tiJBAI9eDc0y-X2cfHz6grjPsbsMNQIpNWERh8ayl0w>
    <xmx:cTflah_CyDPO3UaGZOTnjSf9oqz0o5GKvH18f6wU_mySN8Cl7hW2Q1Sy>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 20:33:48 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	boqun@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	mike@fireburn.co.uk,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 1/2] rust: time: make Instant generic over the time unit
Date: Sat, 31 Oct 2026 09:33:33 +0900
Message-ID: <20261031003334.4161188-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031003334.4161188-1-tomo@flapping.org>
References: <20261031003334.4161188-1-tomo@flapping.org>
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

Add a type parameter `U` to `Instant`, with `Nsec` as the default, so
that an `Instant` in seconds can be added later. The value is stored as
`U::Repr`, like `Delta<U>`.

`U` is bound by a new trait `InstantUnit` rather than `TimeUnit`. It
reads the clock in its unit, and jiffies is not a clock, so
`Instant<C, Jiffy>` must not exist.

`now()` stays one function on `Instant<C, U>`. With two inherent `now()`,
one per unit, the existing `Instant::now()` calls do not compile (E0034,
multiple applicable items). The other methods and operators are
implemented for `Instant<C, Nsec>` only. `Instant<C>` still means
`Instant<C, Nsec>`, so no user changes.

No functional change.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 44 ++++++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index b6a2aab12a50..8232880bffe7 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -179,36 +179,43 @@ fn ktime_get() -> bindings::ktime_t {
 
 /// A specific point in time.
 ///
+/// The time is read from the clock given by the type parameter `C` (see
+/// [`ClockId`]) and stored in the unit given by `U` (see [`InstantUnit`]); its
+/// value has type `U::Repr`. `U` defaults to [`Nsec`], so a plain
+/// [`Instant<C>`] is a point in time in nanoseconds.
+///
 /// # Invariants
 ///
 /// The `inner` value is in the range from 0 to `KTIME_MAX`.
 #[repr(transparent)]
 #[derive(PartialEq, PartialOrd, Eq, Ord)]
-pub struct Instant<C: ClockId> {
-    inner: bindings::ktime_t,
+pub struct Instant<C: ClockId, U: InstantUnit = Nsec> {
+    inner: U::Repr,
     _c: PhantomData<C>,
 }
 
-impl<C: ClockId> Clone for Instant<C> {
+impl<C: ClockId, U: InstantUnit> Clone for Instant<C, U> {
     fn clone(&self) -> Self {
         *self
     }
 }
 
-impl<C: ClockId> Copy for Instant<C> {}
+impl<C: ClockId, U: InstantUnit> Copy for Instant<C, U> {}
 
-impl<C: ClockId> Instant<C> {
-    /// Get the current time from the clock source.
+impl<C: ClockId, U: InstantUnit> Instant<C, U> {
+    /// Get the current time from the clock `C`.
     #[inline]
     pub fn now() -> Self {
-        // INVARIANT: The `ClockId::ktime_get()` function returns a value in the range
-        // from 0 to `KTIME_MAX`.
+        // INVARIANT: `InstantUnit` is sealed and its only impl, `Nsec`, calls
+        // `ClockId::ktime_get()`, which returns a value in the range from 0 to `KTIME_MAX`.
         Self {
-            inner: C::ktime_get(),
+            inner: U::now::<C>(),
             _c: PhantomData,
         }
     }
+}
 
+impl<C: ClockId> Instant<C, Nsec> {
     /// Return the amount of time elapsed since the [`Instant`].
     #[inline]
     pub fn elapsed(&self) -> Delta {
@@ -243,7 +250,7 @@ pub(crate) unsafe fn from_ktime(ktime: bindings::ktime_t) -> Self {
     }
 }
 
-impl<C: ClockId> ops::Sub for Instant<C> {
+impl<C: ClockId> ops::Sub for Instant<C, Nsec> {
     type Output = Delta;
 
     // By the type invariant, it never overflows.
@@ -255,7 +262,7 @@ fn sub(self, other: Instant<C>) -> Delta {
     }
 }
 
-impl<T: ClockId> ops::Add<Delta> for Instant<T> {
+impl<T: ClockId> ops::Add<Delta> for Instant<T, Nsec> {
     type Output = Self;
 
     #[inline]
@@ -275,7 +282,7 @@ fn add(self, rhs: Delta) -> Self::Output {
     }
 }
 
-impl<T: ClockId> ops::Sub<Delta> for Instant<T> {
+impl<T: ClockId> ops::Sub<Delta> for Instant<T, Nsec> {
     type Output = Self;
 
     #[inline]
@@ -335,6 +342,19 @@ impl TimeUnit for Jiffy {
     const ZERO: Self::Repr = 0;
 }
 
+/// A trait for time units that can be used with [`Instant`].
+pub trait InstantUnit: TimeUnit {
+    /// Return the current time of the clock `C` in this unit.
+    fn now<C: ClockId>() -> Self::Repr;
+}
+
+impl InstantUnit for Nsec {
+    #[inline]
+    fn now<C: ClockId>() -> i64 {
+        C::ktime_get()
+    }
+}
+
 /// A span of time.
 ///
 /// The span is stored in the unit given by the type parameter `U` (see
-- 
2.43.0

