Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974382;
	b=rqhNnCtip7viqVADJi/Cwk6uy5oWmZCjX3bcwMEsjQvAQTHtGoq5XE/s1IOgs4sjgXdk
	 pianSIh58DT0n1BuUWSnw25QALJK9eJuCQb3WClynuVvsecWiTx9/1VGcpidXXhAp/RaC
	 7qakaAf0sMLv9qCEypvmXpOt2HrxHeKJHDEsBf9u1eIjMtySZVHSgiuCkOnD2VYSfZ6Qv
	 YP1/kR6ruscJNImKl1z0txEZT9A275J3APhD29FIKBByV5viOI0Gir+g9kFHlFzvFgCQC
	 Fvq8srLsosxPqKbEMAamtyqi0CZ7Y+TXSNMHhpN1rZTPLNREIAnPSmMHYowp8074aqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974382;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=K3PFIi9kdO3sng2wrRVdm/PobA0YV07+0TmKpx/wELI=;
	b=NLhgW+e8IxiB0BvLmGQVR/V0zOTTJEif3tfoh1pO1esINfDM2a3YSF4rMgJc+JJAaS8b
	 yWlt3U+F1oIogHgwjVj5GSVLzgEnsjeHWJUMi9eYa2IQHN6ZanoS/TQQQBjM03rnHdmvW
	 jn+rn1C6pl0/StVLIS76lfC7pKY8Dy/ayd7NgK5BawXPYJUjlfI7OZ0twLMd/gMcE6u2b
	 i4mMBlPaClFK6r2I0k1IF85+vEj1r/FL6qs+gFGDrZrm1E+pyhPEKjWlhVNvbUnX3fmfW
	 e1AOsm0WtTM1iMoCU/qwANJhUv49xOH5lgeTc5Got76kQlWRwiysnySmCOiUluDtTeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=JCj0vIVI;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=anVFoMYl;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A67606A32F
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 03:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A67606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=JCj0vIVI;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=anVFoMYl
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E343214001BB
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 22:59:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 17 Nov 2026 22:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1794974380; x=
	1795060780; bh=K3PFIi9kdO3sng2wrRVdm/PobA0YV07+0TmKpx/wELI=; b=J
	Cj0vIVIYl+QfU13IXQoAa/pIxAP7cxM7Wsec3lbm1IKaDjlvvKv9/pvpVD6HIehR
	i32byjBCPcoV7Zh6cniESDhO/1kzMPoi+JAdaeF6opZpjlrm/vswA/2jFKFT33iq
	8BC0JerOBV1cwMUvSD1NQz3RAKSsrTyejPe5kcChz/8kY9FGk0HR/Rf4+mVuBrgP
	ZHD3nIj+w3OEUAceYPgbL/LjmvYB0aGBPf8GqNJAncPgEyMvjLj/7rTFxcKzofPM
	EUkvxl+R8SaLBKSVIffXozPVYhU4XDxvJ27zMA170JFJL2+utSICyv891JUiuJOW
	tQcRULr1RDBbip8pcgNPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794974380; x=1795060780; bh=K
	3PFIi9kdO3sng2wrRVdm/PobA0YV07+0TmKpx/wELI=; b=anVFoMYlfEoIe7d3u
	pUmmcBCJd99zEJeEWOa1vYG7teCvp0StqMW384AZDZxXaS3J7sjWJ7Y8/N06RMpj
	2ekORxj4/shhu5fHBfW4EreFQmejTc0N3jd55x7hs0RNqJQ+OzBAIvjPO5oU/gn+
	NbiatF2/QFtpeEs1S77nY6Y+Xnvno+bKYGXJ7g50FyxkyCKSwQZPQcKGij03/azN
	8MYb66pLLQELfrOv0xHS/RqY1Le4YYxUZKXpcqKQbQ+FvSuRTzwBiZZUAPRBmXI/
	BIqJ1RVBWfnI12hONtTMpG6JLycA9r5boY0n2fsud6wieyOz9lsWvXkubl4sfGR9
	yajfA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794974380; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:gvD67TFJSjpPRTrHVl367EgFstRcS4Gdejeh1AgGXIemfS4
	/Kwy69MAi5o+U4oBhs/RpxN+IpWiQybGZQdiPH5jCRU7DPA8uOY6eGoWKAiVDdhR
	Y6eAvCY5plu3WXJJsNVYbTSNBffDvIeq64LxRUr1Vfa3hd7ng1LI9k8z+RpJpQAn
	1g9swnr0O5PmGzc4wz2LiiE7sHE6Km4gxhPvOGW6kPIIrVEQJigXmIa3VYGvtY3N
	EvPY+j5FfGr1O4XT4CeJpQZOLogz4ZsV+plbZ9kfT98Y/8CUXLynL4mxtSU04++x
	z1OTh/Y3g9UEBbNUzOE7R+FbL0/oHR4P+8Pm1Dg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:TY0QgO7Wie6BpLvGjg4fNL6RIAWlX2Q+uRL6YbhzU5I=:tIF3bonUzFzsn/tgFGDAqp5Qogm16VIkZoREnCu9vaA=;
X-ME-Sender: <xms:rCL9alLTtAyhoD0mQEotRMDEn6Kqv4Gsi88TfMYWH3W2t0rCC-PJJA>
    <xme:rCL9atD0dKY25gG4xIjbiyGfPKNB5ND6XGIYCocdJupTLHOadFuksBesWurgIGyRC
    eLMeKpYK2vIymS19X0gO2QR2352AoTLGTxM6Gda-MV8nPRRJ-nVsGrw>
X-ME-Received: <xmr:rCL9apMDkwx7CGdpgFc3uobLTzanNWs8yPIyMMkUX3-luiTkNpPeq7F4PfHSV-dGYC3ulPuRF3yeJ3QZexQ>
X-ME-Proxy-Cause: dmFkZTFaeiJKKYQgf9DfWMtf3Mtlnh52oWdg90HZNB1dB41Sqi7Rilq+HUBvtM7D9mai6C
    0CqMy2rjSmXnq6tQMpr4T7oSo6ypBEk7qAHm8J9gNsDCAHa++kWEEf0w/zoc5n5JN+yTEK
    EgUy9xW25Dg1ibK5OVuV348w7WtmhX9Xxkxkq67Q9rIa+gnemDmFYDWMjzNo9zKFgK52P/
    oIToXZl2jNOWW68kL38YRzdrsWs6GJdo59oaYY2MbDeKTpH2c3Zy3E10XkO1BzQ0/0ktLg
    mxeFPojcIpCgDbEyBsfz6g9jS0mEai+R7qkmuNXQVowBevK3Y5SKwB+lPcS92O241OUOcs
    kxXrHBFlPEmr/SkZVnM4ULvEHO8h4xazkACnx7nEm1OONWjWvghiS4tKR4QegmtGgXlLZQ
    lPuZ6jRMi85wqm2l+kUnn2PQmw8xo0ELgzvcrikGh8DzQeTbUsnYyiPR7B+JeHbxhnuv08
    u50QseLh3Er/1WM7nMvP1L4Vrl/clVN9UOlxIjHUPzWjFAXEtNTxZW+CT+qy2Be1zbHF+e
    TBYhWiSp7NGt0p2JpiCUCafHdB/JTv90Dycs628JedofbG5tn4+r7OG1jq4eQIVwjuPDCd
    OjPx8yI2O3F3fOJk8HGNi01+/E+FJpk0SminKZhaoy1Jg61nupA4r60tFCfQ
X-ME-Proxy: <xmx:rCL9aqWBxYgLgkCjc9Ujx-bDEm93or0_EnZlHYNCVio40Y6lm9TyTw>
    <xmx:rCL9akQqGsTz8s-F4GJ5UrojyEDOnRCn1cc54dkL0zWpyqr3Gv9L8Q>
    <xmx:rCL9ao2tKLA1bGUhPK0u85Y7n3eGfoOMv6k2YxlruHc15YbIqrNEgQ>
    <xmx:rCL9api0BNuh-k9VgfgG3o0HH6yK_T6OiD3d36rVjHbu48EMsBIMQA>
    <xmx:rCL9at1iMT25_DcHcEUUbOK7kyY-Ach492bAW3nlEQbM3oXkmsLFERM3>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 22:59:35 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
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
Subject: [PATCH v1 1/2] rust: time: add examples to Delta methods
Date: Wed, 18 Nov 2026 12:57:22 +0900
Message-ID: <20261118035723.2380960-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118035723.2380960-1-tomo@flapping.org>
References: <20261118035723.2380960-1-tomo@flapping.org>
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

Add examples to the following Delta methods: from_micros(),
from_millis(), from_secs(), as_micros_ceil(), as_millis(),
as_millis_ceil() and rem_nanos().

The examples show positive and negative values, and how the methods
saturate or round.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 84 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index aeb518b91e1c..f0e36077bb4a 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -547,6 +547,19 @@ pub const fn from_nanos(nanos: i64) -> Self {
     /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.
     /// If `micros` is outside this range, `i64::MIN` is used for negative values,
     /// and `i64::MAX` is used for positive values due to saturation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// assert_eq!(Delta::from_micros(1).as_nanos(), 1_000);
+    /// assert_eq!(Delta::from_micros(-1).as_nanos(), -1_000);
+    ///
+    /// // A value out of range saturates.
+    /// assert_eq!(Delta::from_micros(i64::MAX).as_nanos(), i64::MAX);
+    /// assert_eq!(Delta::from_micros(i64::MIN).as_nanos(), i64::MIN);
+    /// ```
     #[inline]
     pub const fn from_micros(micros: i64) -> Self {
         Self {
@@ -559,6 +572,19 @@ pub const fn from_micros(micros: i64) -> Self {
     /// The `millis` can range from -9_223_372_036_854 to 9_223_372_036_854.
     /// If `millis` is outside this range, `i64::MIN` is used for negative values,
     /// and `i64::MAX` is used for positive values due to saturation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// assert_eq!(Delta::from_millis(1).as_nanos(), 1_000_000);
+    /// assert_eq!(Delta::from_millis(-1).as_nanos(), -1_000_000);
+    ///
+    /// // A value out of range saturates.
+    /// assert_eq!(Delta::from_millis(i64::MAX).as_nanos(), i64::MAX);
+    /// assert_eq!(Delta::from_millis(i64::MIN).as_nanos(), i64::MIN);
+    /// ```
     #[inline]
     pub const fn from_millis(millis: i64) -> Self {
         Self {
@@ -571,6 +597,19 @@ pub const fn from_millis(millis: i64) -> Self {
     /// The `secs` can range from -9_223_372_036 to 9_223_372_036.
     /// If `secs` is outside this range, `i64::MIN` is used for negative values,
     /// and `i64::MAX` is used for positive values due to saturation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// assert_eq!(Delta::from_secs(1).as_nanos(), 1_000_000_000);
+    /// assert_eq!(Delta::from_secs(-1).as_nanos(), -1_000_000_000);
+    ///
+    /// // A value out of range saturates.
+    /// assert_eq!(Delta::from_secs(i64::MAX).as_nanos(), i64::MAX);
+    /// assert_eq!(Delta::from_secs(i64::MIN).as_nanos(), i64::MIN);
+    /// ```
     #[inline]
     pub const fn from_secs(secs: i64) -> Self {
         Self {
@@ -598,6 +637,18 @@ pub const fn as_nanos(self) -> i64 {
 
     /// Return the smallest number of microseconds greater than or equal
     /// to the value in the [`Delta`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// assert_eq!(Delta::from_nanos(1_000).as_micros_ceil(), 1);
+    ///
+    /// // A value between two whole microseconds is rounded towards positive infinity.
+    /// assert_eq!(Delta::from_nanos(1_001).as_micros_ceil(), 2);
+    /// assert_eq!(Delta::from_nanos(-1_001).as_micros_ceil(), -1);
+    /// ```
     #[inline]
     pub fn as_micros_ceil(self) -> i64 {
         // Only positive values need to be rounded up: truncating division already
@@ -623,6 +674,18 @@ pub fn as_micros_ceil(self) -> i64 {
     }
 
     /// Return the number of milliseconds in the [`Delta`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// assert_eq!(Delta::from_nanos(1_000_000).as_millis(), 1);
+    ///
+    /// // A value between two whole milliseconds is rounded towards zero.
+    /// assert_eq!(Delta::from_nanos(1_999_999).as_millis(), 1);
+    /// assert_eq!(Delta::from_nanos(-1_999_999).as_millis(), -1);
+    /// ```
     #[inline]
     pub fn as_millis(self) -> i64 {
         #[cfg(CONFIG_64BIT)]
@@ -639,6 +702,18 @@ pub fn as_millis(self) -> i64 {
 
     /// Return the smallest number of milliseconds greater than or equal
     /// to the value in the [`Delta`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// assert_eq!(Delta::from_nanos(1_000_000).as_millis_ceil(), 1);
+    ///
+    /// // A value between two whole milliseconds is rounded towards positive infinity.
+    /// assert_eq!(Delta::from_nanos(1_000_001).as_millis_ceil(), 2);
+    /// assert_eq!(Delta::from_nanos(-1_000_001).as_millis_ceil(), -1);
+    /// ```
     #[inline]
     pub fn as_millis_ceil(self) -> i64 {
         // Only positive values need to be rounded up: truncating division already
@@ -725,6 +800,15 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
     ///
     /// Panics if `divisor` is zero, or if `self` represents [`i64::MIN`]
     /// nanoseconds and `divisor` is `-1`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// assert_eq!(Delta::from_nanos(10).rem_nanos(3).as_nanos(), 1);
+    /// assert_eq!(Delta::from_nanos(-10).rem_nanos(3).as_nanos(), -1);
+    /// ```
     #[inline]
     pub fn rem_nanos(self, divisor: i32) -> Self {
         if divisor == 0 {
-- 
2.43.0

