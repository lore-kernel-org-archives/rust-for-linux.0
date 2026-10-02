Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420DF2ECE86
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 05:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917590; cv=none; b=O7hZM1zD4vMBTL7a/kOaYblS+VTrWAQRo6gp1vHKQnD8/b3OBqZyV7VYHdDgIAVIQcIFkiav0e94+uWiK1ytmrCeigRZ5hxbufD8eVdFig+yMhZ8fdqQofzh1xVa9UZ9bGNL0pXsYv3eEtjEfxj3nZwxBd0om2LNEZia4OioyY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917590; c=relaxed/simple;
	bh=0QFjA46Deaj2fQFLv7W2LComnHVxBJV2c8bQvsL2xvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=buThKSwGIMbSie1PzsFtvn2hSZzuPR6RdK2p0uEISoiJ5SxTMnYQbIALV5NjjxIO1B6ZUJFPbvMx3s8NkcRVgj9lY9kxbiIQNSc16uEG1mew2R9KHRt28YDT3NvhTk0T8q1JZRm0tP53Bb2OarPA+KKSZP7K57eoefh5afh4rcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=WKeLICys; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZjEPk1nO; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="WKeLICys";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZjEPk1nO"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 655C9140017E
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 01:06:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 02 Oct 2026 01:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790917588; x=
	1791003988; bh=/86SHfo9lWcwsLgl92eN2tKrt8qqh+eMZKjiFz1VpxU=; b=W
	KeLICysflz8TxIg8rnoI4Gelts1vSwOv/lNT6FlyMCVgMXMAaSsO6wkwLyGR5TvM
	lKyS46rixtf1eYcqPlANQxMw2U6FWSD+IIrrsB5kuI7/aKT/S59QVEzhWYT/dpVW
	0y9PwLP1mi9tHS1NKkhmc4ZApEQDAlhVMSP2zbd19EHEItmsAheRfmso9fsQ4rQp
	OQRIu8cVhnGAU6l0vsGA+055omExno6WMm/8hTQYCGeUewxTSFVc6db8mrqs/too
	nhpvmCEoVflSDIcxL8nVPTh0E71xFcZKQSjFFYgH5/D3sqBLIFLrFgoVngFuCEes
	04LktZwnemeaR6mD2+dIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790917588; x=1791003988; bh=/
	86SHfo9lWcwsLgl92eN2tKrt8qqh+eMZKjiFz1VpxU=; b=ZjEPk1nOgKj2VPUFJ
	8Ul35tQNoIK97CTL7fc28S66lPbVw3tod8nXdbpGcJrsDbpUJLvzRMK6zbz56qNb
	EqIBrxPpYUgksstUHIhulDwumLrYgfebKNwvNZg6r19ss2cEtoNGUUWkUzRygnd/
	S3VUEw2fUgY/gzP/HYwgDekBrkSUOx6QWxC01qO7bIcTRQTyQep04dgRB4e4cmo0
	Tj8l4Opug1cslYPjkBak9n/SxSW8Mpc4/AXP6Q/3pHR+VP9b8S48BZzG6/XiPH1C
	7+fu1eMUnTOJfdqPA1BZZ8t18FDwbXvI4RhIS7T/12Z/8mDR0USdMngSubU5n+6M
	mIQJg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790917588; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:T93OVP1ELL9mhXx4PUz1nMmb3rqRziErHB3qs19k2uz5KBM
	+PrOZIv/P8djtJLMyy426vwAuKl9nezGVS9Ibxxqwqe52J480gE33BGhbzBigwCS
	prQKsFrrWxMhELsfVDHdoWGUKjLCDnL/jgKm/1C3Laaf/AdPXdi4a3uTINyj8TST
	7EdKbYSetXrQNjgZ5jjsASB+Xwu2V+gVAUxmcJBYjxATvWD9TfbaiqKBcWDRv/pP
	QJD5qB+wc0xQsxKFz5VGdbhyrLQjRJ41JkNRdGFWfZ170cTYegpbDMVklah0iXX1
	xzVv6mYi3L54m3vBhTdgROmZbJEyb+XhegvPgyQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ptpFgO0YjVKYSGArsORnHWtXm7ofa40CeoMhq9Wsnhg=:0QFjA46Deaj2fQFLv7W2LComnHVxBJV2c8bQvsL2xvs=;
X-ME-Sender: <xms:1Du_ag-FaANVPgt2gdfPbb1Ttkpeqmkt8SCCqg4Fo1R8zDmqYf_emQ>
    <xme:1Du_agN5175Wo_LmnR3fE40Twh9lJJFmKfk-YMW2Ftl2nBBhi27sjv0cRsdPiFLM8
    CjbQbA51GaqdRP3YXpyYWTs3lV9Q4rgn0Q5S-6qTGvEAx6lcqLjLv8>
X-ME-Received: <xmr:1Du_asFO34rfrYhOsvlKnjBAOSElMqSiooPoQ94ZVT8zNPjP6M9kXZz-mRFGXr5j5CSqK1tGypw9O25EoHs>
X-ME-Proxy-Cause: dmFkZTGobTblO5ghfhzqeIvxM5zSivTwE4tobvLBWTjAl2nJedd2S0jhQe1OVF3VKR7svR
    0VTa+Gydwlyx1KxTwGn4OyVExZyywehkbgZfCwvaTP3plREPrdsoLFvSJEMRT8U4a7TY3v
    vUp1z4rvSssHILavzjO/HctT5URLdkCoTlPaYNiNLunSeMVzjUHxMACeidbZGUh/y/9O/G
    WpxVJFYNZxDogftMs/sPCIfawaZ9AevVXrNfB8riuoSoAMKFoJKykqeQn5imRKAUHG+5sb
    srxe7moDNGHYyNPiZpw+uVdOrS7LmI7rWffnHA0l8YW6kBJBoFJ6Bgsm3UjXUEzeexxpBO
    Til9hhMGX/MuihccWsaVv7Ptx975I36keHDoaWBqkiu3UnL06/nTHGHkkwASctIX+UVR+1
    c6mjRcDn/RlEYiai7COIoWutQEVhTdEbKEZy6wzFoPv5XtBLTl5Mpw8WPPXO0/oz6slCxg
    8GIy8fU1IQLeSBDhUyWEKTBsPNJs5jbxt657mpcUgCXa4VMZ92Hsc2LUgNthl9BVrcAnsA
    g/2pLNKA6h969LIwdp3EkzS0irViOGACksSRpJgmRYiPGS4J/eVZR/XTAR+7hSeSSDb0Oq
    3i6kBKDIc3q9J6EEy0B3LzYMo4aMk/UOVpFKlNyM7lMyPo34PWe3dcFyAsBg
X-ME-Proxy: <xmx:1Du_auj3cglycybpmDhzev-HsKT-jf7Nf77HfkNm0PElGZtpOBYE1Q>
    <xmx:1Du_agTfOwg02DsLOHm7AJzZ2niuyl9df1cjMYRBktHTBC3Rn-ArAA>
    <xmx:1Du_au_frpjFu3Upztbx_uqSfchqOYLgC32S78TLnUa6RBKPe4CJ-Q>
    <xmx:1Du_auT8tLZInrn7Fu3vbbyLXG5S5-9YB88LOoBiOq1rrZotzn-1pQ>
    <xmx:1Du_anwWubHXKwaBzUVbtv86ZcZQdJFMOQFcZa2l-wLxbSS_glmhsbwd>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 01:06:22 -0400 (EDT)
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
Subject: [PATCH v8 1/4] rust: time: make Delta::ZERO generic over the time unit
Date: Fri,  2 Oct 2026 14:04:25 +0900
Message-ID: <20261002050428.2746277-2-tomo@flapping.org>
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

Delta::ZERO is defined only for Delta<Nsec>, so code that needs a zero
Delta<Jiffy> has to write Delta::from_jiffies(0).

Define ZERO for every Delta<U> instead. An integer literal cannot be
used for a generic U::Repr, so add ZERO to TimeUnit.

Suggested-by: Markus Probst <markus.probst@posteo.de>
Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 5ae377e70dd8..9f231bf25ead 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -306,6 +306,9 @@ impl Sealed for super::Jiffy {}
 pub trait TimeUnit: private::Sealed {
     /// The underlying representation of the time unit.
     type Repr: Copy + Clone + PartialEq + PartialOrd + Eq + Ord + core::fmt::Debug;
+
+    /// The zero value of [`Self::Repr`].
+    const ZERO: Self::Repr;
 }
 
 /// A time unit of nanoseconds.
@@ -317,6 +320,7 @@ pub enum Nsec {}
 
 impl TimeUnit for Nsec {
     type Repr = i64;
+    const ZERO: Self::Repr = 0;
 }
 
 /// A time unit of jiffies.
@@ -328,6 +332,7 @@ pub enum Jiffy {}
 
 impl TimeUnit for Jiffy {
     type Repr = isize;
+    const ZERO: Self::Repr = 0;
 }
 
 /// A span of time.
@@ -341,6 +346,11 @@ pub struct Delta<U: TimeUnit = Nsec> {
     value: U::Repr,
 }
 
+impl<U: TimeUnit> Delta<U> {
+    /// A span of time equal to zero.
+    pub const ZERO: Self = Self { value: U::ZERO };
+}
+
 impl Delta<Jiffy> {
     /// Create a new [`Delta`] from a number of jiffies.
     #[inline]
@@ -428,9 +438,6 @@ fn div(self, rhs: Self) -> Self::Output {
 }
 
 impl Delta {
-    /// A span of time equal to zero.
-    pub const ZERO: Self = Self { value: 0 };
-
     /// Create a new [`Delta`] from a number of nanoseconds.
     #[inline]
     pub const fn from_nanos(nanos: i64) -> Self {
-- 
2.43.0

