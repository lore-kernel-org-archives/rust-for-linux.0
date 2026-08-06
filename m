Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E1A38E8C7
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001599; cv=none; b=HYVc+D64k/XuGO7XjRv0MKSdt+OCtrFrxRpEqTRIbkqn5F0OnexZtrYKF0E0VG6Z9XP8GpLpp7e+IiU7TbtYN9ilWvKN8bOoRDRDb88TZS07cBJd+8bhQh6t3Xp1YXNgUqzJ5NNROg0GmukzakJLt6EE7th1a13L/NCkR3xrjOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001599; c=relaxed/simple;
	bh=oE3zD5duIy0wNA4+CmHH0sojI5Nxw8njWAWs0v2Btd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BynhSrq2PP4BFBNZxkxKuq//kY5pOGLyy4GrlgOnpGbQg/exxk019e8fVPIP89oDgz40Eh8Rhq9u5TTrjz7Oq/icAXAI7TmbIt9Tyuz8rO0WISduVQ+TnM6AdU6644GZAeUEkwp7ieuzhkqAXtpmqYl62Ylw3W3Toe15eAvUNB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=d9GsAbGC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LM92566i; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="d9GsAbGC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LM92566i"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id D7AA01380232;
	Thu,  6 Aug 2026 03:33:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 06 Aug 2026 03:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786001596; x=
	1786005196; bh=ATF/IolxIYCs1qUA47H4m+CJIoK4teBEzquMEAr2ISw=; b=d
	9GsAbGCi2nPAd7ymEtW7eiA2tEvgQJgfhSmvA5T+093wim9yYPcvA3GPuJTqDDqZ
	cscaFnwBQRbbRjKKqEkrkmCb4EI9CSsEkAZ4UiPzeeRQnLY9C4pN5ywFn6UQm+DM
	DOGK3kAixjqN2Lb76mzAI4+HCGpn6W3uMl4G2T3bQJScxv8fMk7cYlr6KVD29zjd
	V3smQAIFq7LZemo6NnK1gBVksx1zp6DIl/w8anq33Z2hus0asBXecGvSGzwxbY4i
	r4q23pzBClA+pNPozIpkWW6g9xMPESiDv8zD9v/ujesr/4TBCCHfZ2X+eIft060Q
	BWlN1BVGidDBPubrd15Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786001596; x=1786005196; bh=A
	TF/IolxIYCs1qUA47H4m+CJIoK4teBEzquMEAr2ISw=; b=LM92566iB1Pabf9fi
	x68bDzSNcQPipqN3Utl934J1q2ZHn8UdF3KXgtrsLOsvqSqF4HA3NxsrJDFyspnZ
	EtTlCW6LQkJQNI5I7dPLXOlTWSzLx3cdbKjuJwwPPiyIN+0OrQGHHCrEg+6kWsoB
	OXlUajTJjslWLi8LKKTQC+873bXqSPfAtTjAnZa+p2cck9LpzBafELvX2Pw2rt9L
	JtwGwBHofSJ6+rMNt0jpaE9fx7D4EaUKbp7e+bdIhahUQPqikPYFRE3VfDlpZ56V
	MCFg+WdopjHs9XbYHfm5SoiUntCqSewh50Dt5Q3OPSa64Qu3fCbPjRIcCf0DQGhX
	CGqGg==
X-ME-Sender: <xms:vDh0aqbFbbnt0X2lGYiOIuW5AzCfbpbKWAs96QoXYMFX4hxoACy6SA>
    <xme:vDh0agKYouS2Zb2ew15jBdJqvrqCVIyI22Vv1hEYU2zJrd8pJtprAkAQrwDZRXLp7
    IzpBwcgmaQzuIMKxMfCRbT8U3EKQx7fyvT-2HcyJCoXL_B_5GTPpF0>
X-ME-Received: <xmr:vDh0ah0gAd8phJoudZ_ptI3ad3L8zowiDc7zGr66-yvjq6oDWy-_rDms7mRkpO2xp6Bv56PWbMhG3FoFrwk>
X-ME-Proxy-Cause: dmFkZTEgjQqBj2bjEymb1zbMZpPNtcgeFkIN1QZzQbxZUKA/RuRyg2DJgajv+NSiGStCeT
    yaYOrCQ7A9gm4WvsiYs1D5t6pPIrllqTbL1Ixlpbf00exSovWm+XcO2G2nbZr0gIMU9T5H
    LqUZEZ7mYO5L/yzE2XzC75M8q4ggUCox/oKRet71npKs8JL7T6FFF0IbK70RPW0nQUZLVJ
    G9VXR8Ti169JZ3zIVViQPK2ghSiO6EeNfHPs6UrpsWSoqkR8yv6qZOHEJ6g0y9pV5MgB8E
    MAD3aacXBW0NxzgaSjqINGlK1Su9gqkNfLS2YhXVvxpfxNqUzyd441y62Y4/nFeExS7hMC
    eKG91u3Gql/EpDwFV7Gkn+nUDWxPe4Jz3JLf1jbjhpXCj9XsSyfqgW735b8NzqoobgCouI
    EqhXiHSS19Ulu7OvYCqGhM4y14zMjKxmI2Eg4QWNWJvG/v5UNG35uxHol+PUrNse9ppbnh
    8mg/e9zbnw1+LOnJd5D25IaSjkTlWGZRrfUKieaLxMCfB/ZhEi36Ghl+MhqtaTfcFiXLhD
    dag3hdB/sDa41MU5pb9DK437X3x7IuoxdKWVwK4OwBOx/TnDu4l3lZNxO2dU79TJRFc2Eh
    MC6272T/7lKUsdprlARxVPyuMcdVmKzyaJ48AmmBURPr9nv3VAiJ2EYW3qNw
X-ME-Proxy: <xmx:vDh0akJrD7S0y7AXpiqRvocpGBPAkeakIMhedMUscq8zOZBJhpu3Lg>
    <xmx:vDh0atPsNPsS138G2kQzA6G98UvUaKkMab1ZNyx07_IueEz4_PBmYg>
    <xmx:vDh0atzEPtMWCi5l8AxuYY3bdRON39J-B5bVpGylWVO4ixwuyEVBng>
    <xmx:vDh0atL4SbpClFR5-WWeayX3yQ_7ZKdQZyovMKTISPqqiSRZY1eclQ>
    <xmx:vDh0aprT-Dzt65OBK5w-5fIiLC-lB_tLZDslxXcbMgTG803Mi2IY_Ngm>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 03:33:11 -0400 (EDT)
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
Subject: [PATCH v5 2/7] rust: time: add jiffies time unit for Delta
Date: Thu,  6 Aug 2026 16:32:36 +0900
Message-ID: <20260806073241.1024319-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806073241.1024319-1-tomo@flapping.org>
References: <20260806073241.1024319-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add a Jiffy time unit with isize as its representation and provide
Delta<Jiffy>::from_jiffies() and as_jiffies() as the unit-specific
constructor and accessor, mirroring from_nanos()/as_nanos() on the
nanosecond Delta.

Represent the jiffies span as isize: Delta is a signed span (nanoseconds
use i64) and, as a timeout, the value only needs to reach
MAX_JIFFY_OFFSET ((LONG_MAX >> 1) - 1). isize is signed and matches the
kernel's c_long, so it meets both.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 589bd7827523..71f6dafc79e5 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -295,6 +295,7 @@ mod private {
     pub trait Sealed {}
 
     impl Sealed for super::Nsec {}
+    impl Sealed for super::Jiffy {}
 }
 
 /// A trait for time units.
@@ -314,6 +315,17 @@ impl TimeUnit for Nsec {
     type Repr = i64;
 }
 
+/// A time unit of jiffies.
+///
+/// A [`Delta<Jiffy>`] stores its value as `isize` jiffies and can represent
+/// any `isize` value, including negative, zero, and positive numbers.
+#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
+pub struct Jiffy;
+
+impl TimeUnit for Jiffy {
+    type Repr = isize;
+}
+
 /// A span of time.
 ///
 /// The span is stored in the unit given by the type parameter `U` (see
@@ -325,6 +337,20 @@ pub struct Delta<U: TimeUnit = Nsec> {
     value: U::Repr,
 }
 
+impl Delta<Jiffy> {
+    /// Create a new [`Delta`] from a number of jiffies.
+    #[inline]
+    pub const fn from_jiffies(jiffies: isize) -> Self {
+        Self { value: jiffies }
+    }
+
+    /// Return the number of jiffies in the [`Delta`].
+    #[inline]
+    pub const fn as_jiffies(self) -> isize {
+        self.value
+    }
+}
+
 impl ops::Add for Delta {
     type Output = Self;
 
-- 
2.43.0

