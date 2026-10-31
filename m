Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793406847;
	b=CKWPTpVMKDIZeRu27huaIK7IdJTJpr5l4VNvUsYtsXeANIHUWlMnXNE/pg0O9+0k4z66
	 pnYbFyYWAoOcAFtI/zGd/IIkxbiYZ+ozQxn9MRn9aE/cf+hZo6txHjZyFigVaJP6cqsyj
	 0gpXql7YI49Y5KokbXQ9w+YnJ/sDVB5951tjWdc39MmaArxN7i51YXExYmMQcS4v8tEQP
	 CNsEUKpxqrT12IJvClqHj0zyKtQ+lg290dU+MdsKIIPYtVsNqfo5p0jvU0hj1VxqYCBHt
	 OiPxwrD4cmmtknGUTxE7dbfEBrmiOxve7EDIBItaJfnzGcCT3VYND8VMmPcnwut2zKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793406847;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Y5iDyA3XTHxpGj48DBVdobATbaOUeuPuL3Kp59bXBUw=;
	b=qW+vr3uYOdJWog+/nV5G/eQkV7W3nOpJmHsP4lvMsL7M4uueUuVx71vW7vyn2GdBwUpB
	 a558pxGnoMD+HUyZlnhs3sd57VyMqR5JxEkPxLIJEqvnXew2aFSWSKU+ZduUQxvHYFAEg
	 eZNXQB8BYwgQiocRDMTxzsZwpJ3oE/8p5Jk5+0gq0QitGjadR9K+5DoCMAxYIyPNhJio5
	 TMfivYmurChBNe19QKOW8abb+m2sE7XjTaHRuoLTq7+Gwmv8TPUSsmShQQ/cIY7jsXDmW
	 JdGcyu7K2N60uJpSlyfJbw5c0NcEbAFjKjNblOvicVBzTE50/zKKU+5ndvist012Mnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=kCrL58KD;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=quRSooLY;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CB2606A31C
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 00:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5CB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=kCrL58KD;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=quRSooLY
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0A6D57A0152
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 20:34:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 30 Oct 2026 20:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793406842; x=
	1793493242; bh=Y5iDyA3XTHxpGj48DBVdobATbaOUeuPuL3Kp59bXBUw=; b=k
	CrL58KDmonXiabV1ZOHa+dbb4vMpN1xQZMNOU+EE2AHZAVAxQ+Rtavvq9GjGArjv
	OX4S3feYY+w88XC7uvm2Yma8W5pweLGxmvdlhL/7KwPkT+XEIvKdWy3P3RM5ufsc
	lIfm5y2QV4SDjenVK/p0dNiAQ7g2tSjMcWMBxcOA45xTv1jm886YOSmfZ9KoE+el
	9tTYsEjplVyQN8obz6DjiRGdJRzhksoTAOcx8q/OspFm8H2q7b/b4jLXZkh8T7c8
	BXs3K5mcuXqVV8sEebXKVUiZdkt0iPFoVCoBN+RoR+f4vLCzS08DvWbTU6UZEwYd
	lMQiYxZOFbjzRYI6gZFvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793406842; x=1793493242; bh=Y
	5iDyA3XTHxpGj48DBVdobATbaOUeuPuL3Kp59bXBUw=; b=quRSooLY4Fo/jwhxn
	XFjNGnuVMHUboj1sC/nZZhEoQLUpFLsh0c3FGP84ADKHA9wdoHsCAus49dTn2QwV
	pdgV1EbHaBJxut/G1sljBFWGmkMRtpoj2CXHcoWC1rbInK12ltVck/gZH5EocoVt
	qCN6b5kwDibAsenB9gf/Pg0F+XvGCPpOPB20QYDPT2ufBeXoyzYFF9SJTU0EmW7t
	sq9jSBeGNpTWbyVlNnvrCkfLo2Yy2uUdl7DFTNVueVqDeIPn4gDHTgXUj8PA6lMl
	ZGLw+ACFJq/SPtnCVOpdAeEv+naRMqk/qjyBPOG79bLdOhiedFPd9Dlp8iObsSF5
	rmWiQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793406842; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:LvKDwAyteUeTYaSk5KFO6E6nehK5LW0InqISEQuYUFG9F+0
	xfs4b6+WVZjH/SWs76Y1ov6zEOKaOayKIZVtN6Et7QNww7QYMwPc9cDvgK6JiPI8
	ciC36XKrHbuiI0jYprB+e1Sd6qmRsR+dON43GTpSjvFmeueGEUJPleoUgITwV3BK
	hoX+2Z08yL7TJEWisVNW8DR23balO9uRvwNpcVNVMQEBp6kQlxgXEPu1ZaCx8AXs
	39iZeqzxXJ7Su/xyngUWsrX7rfR9Hx0OTpCUbP8E5O1gZj17QPYV59AhLemAtEPc
	R/cM1e8Fj1ods1os2Nf7anq+L2xSBc5rqKOKBlA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:d3mI6i7EkwHzqoY/I5lnvuyD2n23oPmnaNrZj5lWX1I=:NBtsZhMUHz3xOfB2uZEU7tV8aAgMIVvw622KNpRxSZU=;
X-ME-Sender: <xms:ejflanGjCleDyDEl5Htdnbmao-Z-pvqk2bjm4sjUjO8P7ub5Syk35A>
    <xme:ejflalrOXOaIHjogFfZXBYktaXaiDPOF2xktOtBPqSjC9EkBDnhRDuCb50Sqhe4eN
    1UGNECO7U3khHrtrwiFVKNEzUNGoINcqCFOMPEG3GRvYdW7UFdtHDMB>
X-ME-Received: <xmr:ejflaty8D1lPqbayeDuYUfquIAmdgFPfFPrnwsk5RPaouxY_0peICTfcu7KUW45Nn2YgP6mhPdqX0CZvs94>
X-ME-Proxy-Cause: dmFkZTF/28JLRbNDVjuv80jGf4n4L0fO90AIoBZiMqjXhP+096AatJskRdiOYzh7x7gCU4
    6qbDr+VyOvl2erUl0beTQCxujg+bPZL+4H1g3NpDNuc5huJA6FtimPiUwS6HDw/A7AvqiS
    +/3On6zM+rI/8ENZRfAmy3yBkZXwydiTgPuyUjY4mMS7GBnsPX0JUyVHzzoCPvWz9KsGBc
    t3qgdCTQfKqmD35r566N5i54BAbaXzX+UYALyA+KrWCOLJqu5JNJKuir3zwezGe35Us3TU
    XWHNMvvS2xIqPG+heHLPo0eyUvbmAd7PeafGlgF+4jqQbUaBynweq7qu3r6UVvu1lz8RS6
    xgXCRm84pv9SFo/roE9GEuC+9dR+Vwn+3l0gPSjkT4i/9Ktz2UQ45ORy4M6zqgZbVuw6MV
    1n31WJaagZ2Es9PqSTbTayk1JIuX9IbGBifsbH6hFd/pkrD2omG72OlUfhdYyUSjqAWrvn
    i94f/WbYvJcw6FpZlz+LPlNbRjEkv/UIhkEYECRM49Ha7ZwpCbndCzDgEN7vmfXK5blO6i
    sJBTI5kqXBkYUUnwB3GDZY0sec6QqhWTfQ1qoParh4WG5/qeBZci84sffUKZcRmlODZYRJ
    VkEu2WzNbcD7KbVPTC3uELaQlZOxqN+FDDphaOAexQ5TUWEBIbwytXTBJOTw
X-ME-Proxy: <xmx:ejflany57JyekQiqT6kV0ecdsRR3tryCdEyyUPYnZS6jT3igVMpsPw>
    <xmx:ejflakT_5Uty28Zcw3copLhW4RZOkf_ZBPgWTwmmFbUu368Nkictfg>
    <xmx:ejflaiOPYVq_PQa7ZdkNrArlh--R9eOoox3TN6Hz8sEZvCTZDeNHWg>
    <xmx:ejflanSnJUUw0oJmbV0Rn09V1XC381FQ2LOPXXEet2q7vMA7BeDLZA>
    <xmx:ejflahjhwbO5gFhhSMec6cN7RWV1Ils8wS5uQN_qVpaHnFpECchXp8V2>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 20:33:57 -0400 (EDT)
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
Subject: [PATCH v1 2/2] rust: time: add Instant in seconds
Date: Sat, 31 Oct 2026 09:33:34 +0900
Message-ID: <20261031003334.4161188-3-tomo@flapping.org>
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

Add `Sec` as a time unit for `Instant`. `Instant<C, Sec>::now()` reads
the clock in seconds through a new `ClockId::ktime_get_seconds()`, which
wraps `ktime_get_seconds()`, `ktime_get_real_seconds()`,
`ktime_get_boottime_seconds()` and `ktime_get_clocktai_seconds()`.
`as_secs()` returns the value.

`Instant<C, Sec>` has only `now()` and `as_secs()`, and it cannot be
compared. There is no `Delta<Sec>`. One can be added when a user needs it.

The first user is the drm/vino driver, which passes the wall clock time
in seconds to the firmware of a DisplayLink dock.

Link: https://lore.kernel.org/rust-for-linux/20260826162851.2497-10-mike@fireburn.co.uk/
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/time.c | 10 ++++++
 rust/kernel/time.rs | 83 ++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 85 insertions(+), 8 deletions(-)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 32f495970493..47b7b2e111b9 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -19,6 +19,16 @@ __rust_helper ktime_t rust_helper_ktime_get_boottime(void)
 	return ktime_get_boottime();
 }
 
+__rust_helper time64_t rust_helper_ktime_get_boottime_seconds(void)
+{
+	return ktime_get_boottime_seconds();
+}
+
+__rust_helper time64_t rust_helper_ktime_get_clocktai_seconds(void)
+{
+	return ktime_get_clocktai_seconds();
+}
+
 __rust_helper ktime_t rust_helper_ktime_get_clocktai(void)
 {
 	return ktime_get_clocktai();
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 8232880bffe7..f7f6a674fec6 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -69,7 +69,9 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
 ///
 /// Implementers must ensure that `ktime_get()` returns a value in the inclusive range
 /// `0..=KTIME_MAX` (i.e., greater than or equal to 0 and less than or equal to
-/// `KTIME_MAX`, where `KTIME_MAX` equals `i64::MAX`).
+/// `KTIME_MAX`, where `KTIME_MAX` equals `i64::MAX`), and that `ktime_get_seconds()`
+/// returns a value in the inclusive range `0..=KTIME_SEC_MAX` (where `KTIME_SEC_MAX`
+/// equals `KTIME_MAX / NSEC_PER_SEC`).
 pub unsafe trait ClockId {
     /// The kernel clock ID associated with this clock.
     ///
@@ -80,6 +82,11 @@ pub unsafe trait ClockId {
     ///
     /// The function must return a value in the range `0..=KTIME_MAX`.
     fn ktime_get() -> bindings::ktime_t;
+
+    /// Get the current time from the clock in seconds.
+    ///
+    /// The function must return a value in the range `0..=KTIME_SEC_MAX`.
+    fn ktime_get_seconds() -> bindings::time64_t;
 }
 
 /// A monotonically increasing clock.
@@ -96,7 +103,7 @@ pub unsafe trait ClockId {
 pub struct Monotonic;
 
 // SAFETY: The kernel's `ktime_get()` is guaranteed to return a value
-// in `0..=KTIME_MAX`.
+// in `0..=KTIME_MAX`, and `ktime_get_seconds()` a value in `0..=KTIME_SEC_MAX`.
 unsafe impl ClockId for Monotonic {
     const ID: bindings::clockid_t = bindings::CLOCK_MONOTONIC as bindings::clockid_t;
 
@@ -104,6 +111,11 @@ fn ktime_get() -> bindings::ktime_t {
         // SAFETY: It is always safe to call `ktime_get()` outside of NMI context.
         unsafe { bindings::ktime_get() }
     }
+
+    fn ktime_get_seconds() -> bindings::time64_t {
+        // SAFETY: It is always safe to call `ktime_get_seconds()` outside of NMI context.
+        unsafe { bindings::ktime_get_seconds() }
+    }
 }
 
 /// A settable system-wide clock that measures real (i.e., wall-clock) time.
@@ -123,7 +135,7 @@ fn ktime_get() -> bindings::ktime_t {
 pub struct RealTime;
 
 // SAFETY: The kernel's `ktime_get_real()` is guaranteed to return a value
-// in `0..=KTIME_MAX`.
+// in `0..=KTIME_MAX`, and `ktime_get_real_seconds()` a value in `0..=KTIME_SEC_MAX`.
 unsafe impl ClockId for RealTime {
     const ID: bindings::clockid_t = bindings::CLOCK_REALTIME as bindings::clockid_t;
 
@@ -131,6 +143,11 @@ fn ktime_get() -> bindings::ktime_t {
         // SAFETY: It is always safe to call `ktime_get_real()` outside of NMI context.
         unsafe { bindings::ktime_get_real() }
     }
+
+    fn ktime_get_seconds() -> bindings::time64_t {
+        // SAFETY: It is always safe to call `ktime_get_real_seconds()` outside of NMI context.
+        unsafe { bindings::ktime_get_real_seconds() }
+    }
 }
 
 /// A monotonic that ticks while system is suspended.
@@ -143,7 +160,7 @@ fn ktime_get() -> bindings::ktime_t {
 pub struct BootTime;
 
 // SAFETY: The kernel's `ktime_get_boottime()` is guaranteed to return a value
-// in `0..=KTIME_MAX`.
+// in `0..=KTIME_MAX`, and `ktime_get_boottime_seconds()` a value in `0..=KTIME_SEC_MAX`.
 unsafe impl ClockId for BootTime {
     const ID: bindings::clockid_t = bindings::CLOCK_BOOTTIME as bindings::clockid_t;
 
@@ -151,6 +168,11 @@ fn ktime_get() -> bindings::ktime_t {
         // SAFETY: It is always safe to call `ktime_get_boottime()` outside of NMI context.
         unsafe { bindings::ktime_get_boottime() }
     }
+
+    fn ktime_get_seconds() -> bindings::time64_t {
+        // SAFETY: It is always safe to call `ktime_get_boottime_seconds()` outside of NMI context.
+        unsafe { bindings::ktime_get_boottime_seconds() }
+    }
 }
 
 /// International Atomic Time.
@@ -167,7 +189,7 @@ fn ktime_get() -> bindings::ktime_t {
 pub struct Tai;
 
 // SAFETY: The kernel's `ktime_get_clocktai()` is guaranteed to return a value
-// in `0..=KTIME_MAX`.
+// in `0..=KTIME_MAX`, and `ktime_get_clocktai_seconds()` a value in `0..=KTIME_SEC_MAX`.
 unsafe impl ClockId for Tai {
     const ID: bindings::clockid_t = bindings::CLOCK_TAI as bindings::clockid_t;
 
@@ -175,6 +197,11 @@ fn ktime_get() -> bindings::ktime_t {
         // SAFETY: It is always safe to call `ktime_get_tai()` outside of NMI context.
         unsafe { bindings::ktime_get_clocktai() }
     }
+
+    fn ktime_get_seconds() -> bindings::time64_t {
+        // SAFETY: It is always safe to call `ktime_get_clocktai_seconds()` outside of NMI context.
+        unsafe { bindings::ktime_get_clocktai_seconds() }
+    }
 }
 
 /// A specific point in time.
@@ -186,7 +213,8 @@ fn ktime_get() -> bindings::ktime_t {
 ///
 /// # Invariants
 ///
-/// The `inner` value is in the range from 0 to `KTIME_MAX`.
+/// * For `U = Nsec`, the `inner` value is in the range from 0 to `KTIME_MAX`.
+/// * For `U = Sec`, the `inner` value is in the range from 0 to `KTIME_SEC_MAX`.
 #[repr(transparent)]
 #[derive(PartialEq, PartialOrd, Eq, Ord)]
 pub struct Instant<C: ClockId, U: InstantUnit = Nsec> {
@@ -206,8 +234,10 @@ impl<C: ClockId, U: InstantUnit> Instant<C, U> {
     /// Get the current time from the clock `C`.
     #[inline]
     pub fn now() -> Self {
-        // INVARIANT: `InstantUnit` is sealed and its only impl, `Nsec`, calls
-        // `ClockId::ktime_get()`, which returns a value in the range from 0 to `KTIME_MAX`.
+        // INVARIANT: `InstantUnit` is sealed. `Nsec` calls `ClockId::ktime_get()`, which
+        // returns a value in the range from 0 to `KTIME_MAX`, and `Sec` calls
+        // `ClockId::ktime_get_seconds()`, which returns a value in the range from 0 to
+        // `KTIME_SEC_MAX`.
         Self {
             inner: U::now::<C>(),
             _c: PhantomData,
@@ -302,10 +332,28 @@ fn sub(self, rhs: Delta) -> Self::Output {
     }
 }
 
+impl<C: ClockId> Instant<C, Sec> {
+    /// Return the number of whole seconds in the [`Instant`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::{Instant, RealTime, Sec};
+    ///
+    /// let secs: i64 = Instant::<RealTime, Sec>::now().as_secs();
+    /// assert!(secs >= 0);
+    /// ```
+    #[inline]
+    pub fn as_secs(&self) -> i64 {
+        self.inner
+    }
+}
+
 mod private {
     pub trait Sealed {}
 
     impl Sealed for super::Nsec {}
+    impl Sealed for super::Sec {}
     impl Sealed for super::Jiffy {}
 }
 
@@ -330,6 +378,18 @@ impl TimeUnit for Nsec {
     const ZERO: Self::Repr = 0;
 }
 
+/// A time unit of seconds.
+///
+/// An [`Instant<C, Sec>`] stores its value as [`i64`] seconds. [`Sec`] does not
+/// implement the comparison traits, so two such instants cannot be compared.
+#[derive(Copy, Clone, Debug)]
+pub enum Sec {}
+
+impl TimeUnit for Sec {
+    type Repr = i64;
+    const ZERO: Self::Repr = 0;
+}
+
 /// A time unit of jiffies.
 ///
 /// A [`Delta<Jiffy>`] stores its value as [`isize`] jiffies and can represent
@@ -355,6 +415,13 @@ fn now<C: ClockId>() -> i64 {
     }
 }
 
+impl InstantUnit for Sec {
+    #[inline]
+    fn now<C: ClockId>() -> i64 {
+        C::ktime_get_seconds()
+    }
+}
+
 /// A span of time.
 ///
 /// The span is stored in the unit given by the type parameter `U` (see
-- 
2.43.0

