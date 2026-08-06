Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59654A35
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001605; cv=none; b=oehd+aNwnjMbnRbp20Yp/adf6yjY4eTDm3yflJ2IxZ6sp1iK0mmSTExNOAzR1CzCf5o2T3T9/9plF+4UkVi++1U4C0Pd/uN3T721a8Y+93Uya5DLBbu39k1vCaxJ5A+VqyCUC7plRm9XYSb+Xn9eiAd/5WIwQPXtzORXdKIy9fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001605; c=relaxed/simple;
	bh=yYmF1Fs4/XexikS2mD3nr2Dbk6eNQxU/iToSwBIObkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+eGFSaon61gKeduVUvFCaCt6NnQBkaWyTf3iOdotv18r3eCN0xPT0+urzQhK6l+wb90wpWMUsNZdreEGvV9cTvW4JOVtdkfrwvHuFwQ5Ssf9/XfaaeN3xuFRPVx9knUTzehUrd9w2jRlQcwNLmCh4CtEriAa9jWyMuN157m6aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=i57e+lh3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dnLQTVz+; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="i57e+lh3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dnLQTVz+"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.phl.internal (Postfix) with ESMTP id CB18B138022E;
	Thu,  6 Aug 2026 03:33:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 06 Aug 2026 03:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786001602; x=
	1786005202; bh=e/Y03O2Fgf2v7mCQma+tiQq+/EkQRc6D3lbHMdaoy2U=; b=i
	57e+lh3hmWkSSxOe/mweKhJsFd29B9/xj9xm1sOf/GWcs9YWPslnBzGorrvvJqQM
	24h4uCa+VFq07lM52zfu1jIOeSTvLF/G8ZCUPsjX2RYEGmtsHy2Wo9ZJsbNjpD7n
	Xm50OK6IM5Myh6xTahh7Ji4RJYmRqODLni/k4NTnR2uMIJMyvEZQ5TLe7eGFFPUp
	uBVx5y8IK98f3G/ZQukfDl1mE+Q4EGa9OepLWrIkFyHEmloSEeNFm6bS8XmS82o2
	5JYYbnMIJNAxa3s5fJR0UyWK21uJFSuiZ8u1xxj7t7ihXyykG3SqZSCdRTJzJF7x
	fF695Px1HlikivpEw4LxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786001602; x=1786005202; bh=e
	/Y03O2Fgf2v7mCQma+tiQq+/EkQRc6D3lbHMdaoy2U=; b=dnLQTVz+6vgzvuP4M
	djQO4BNwTKSJTbtWSd3XG7c43nGDb1/DqxXuykG9s2H2E1EF0/bl3fOKX3phMamu
	VYkxmKpFs+enX7llTXmDiCHuYXSTfkrchuy9rCWUDavPvSeP2keR639ShKIliwYR
	wdABXMCoVHUoC86hzumG2px2q953TPwetOnHEIhs1nanrR+UzMo0F2lTi0YK1bvs
	93QkT/C5JH9m4yful4IejwvFCk4Vf8FGgJxrOtqkRHWZqnBZkSMwO+mIOG1Ums2r
	XznEh6QPq7h+K0jLmugPQJBSXzhesbhiUXYI2pPj9pV2ZT0UvH60OakKsDEwWpkk
	d33jA==
X-ME-Sender: <xms:wjh0ajugD-ag_5WyiuOFLhgQ5BW_FebyrYLY910-TNe8FiQrdUCqTg>
    <xme:wjh0aglqojeUSm7NwLskQXYIajh-96zS0eaAIOhff8qDUTvA0ozJ0k9fEzcfPjO2V
    DTqsqpajXjomBImqD7PIGbqMC0-S3G286GlmOSHCdd1jqcjZWG5vc0s>
X-ME-Received: <xmr:wjh0aimIAVJDRpYD5gQwuikLAG3AlJJ-VOF-NWWk1kR7U7ymKcrUmXTvWnu6a23zs9V0H39dwJKmFOZovZs>
X-ME-Proxy-Cause: dmFkZTEgjQqBj2bjEymb1zbMZpPNtcgeFkIN1QZzQbxZUKA/RuRyg2DJgajv+NSiGStCeT
    yaYOrCQ7A9gm4WvsiYs1D5t6pPIrllqTbL1Ixlpbf00exSovWm+XcO2G2nbZr0gIMU9T5H
    LqUZEZ7mYO5L/yzE2XzC75M8q4ggUCox/oKRet71npKs8JL7T6FFF0IbK70RPW0nQUZLVJ
    G9VXR8Ti169JZ3zIVViQPK2ghSiO6EeNfHPs6UrpsWSoqkR8yv6qZOHEJ6g0y9pV5MgB8E
    MAD3aacXBW0NxzgaSjqINGlK1Su9gqkNfLS2YhXVvxpfxNqUzyd441y62Y4/nFeExS7hXe
    /3vOYIwIpe5OKF8ZNV8kAvRJQ/kPxudlvutL5SsBKvDbE29b+LGGFb1XNDpuOyLNw0Agvv
    N0zY6uboDhXBb8QdfShMmNaQCNnu44UmQHKtE82br03QDmGtlg9W33syGI8eXNTSvfG7LD
    ChCNtQVl0tl/KpdbbJPPa+CIeHJqNHpC7z/65pKYiuytI2tcL/4/0mHhv+6q/TQkQwPcbB
    29Cl9H4tQZIFN36s1hmOEqsumG8cLfoRA1vYFFVGs55M34VYkzMbwd1PEKU8aUP6r1SsFU
    6JuAuviuMgVkt2skAqiqM89jNtbENQ7cY4OpwdphKOdgYV8t/IInF1m6jonA
X-ME-Proxy: <xmx:wjh0arhqJPK8gUMBrRkYJKOi4jzN_0pAht05uWRPeTB4OqHKCfk7kw>
    <xmx:wjh0akFxAcBRZIBwAyZN06uEBMiTgVwAmmil6oRCDlTBCqGLpHHV9w>
    <xmx:wjh0amaUuCvF43wWiY3N20ZR-Ljj8IN9oE6bySifrbVnjK2Tu-lwww>
    <xmx:wjh0anMwX7lpU1p77cGHadoNFjeRWLUdA1t37ove3vDv0C102MkLiA>
    <xmx:wjh0asjVWvN9lkpGnJKdMmLHUnV-j0gWK9mNz5V7Fbs6HKuUpdvZ9cKc>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 03:33:17 -0400 (EDT)
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
Subject: [PATCH v5 3/7] rust: time: add Delta::as_millis_ceil()
Date: Thu,  6 Aug 2026 16:32:37 +0900
Message-ID: <20260806073241.1024319-4-tomo@flapping.org>
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

Add a ceiling variant, mirroring the existing as_micros_ceil() since
the existing as_millis() truncates towards zero.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 71f6dafc79e5..9d65a6c1992a 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -525,6 +525,32 @@ pub fn as_millis(self) -> i64 {
         }
     }
 
+    /// Return the smallest number of milliseconds greater than or equal
+    /// to the value in the [`Delta`].
+    #[inline]
+    pub fn as_millis_ceil(self) -> i64 {
+        // Only positive values need to be rounded up: truncating division already
+        // rounds towards zero, i.e. up, for negative values.
+        //
+        // The usual `(nanos + d - 1) / d` is not used because the addition overflows
+        // once `nanos` exceeds `i64::MAX - (d - 1)`; saturating the addition instead
+        // would drop the rounding bias and return a result one unit too small.
+        let n = self.as_nanos();
+
+        let (n, add) = if n > 0 { (n - 1, 1) } else { (n, 0) };
+
+        #[cfg(CONFIG_64BIT)]
+        {
+            n / NSEC_PER_MSEC + add
+        }
+
+        #[cfg(not(CONFIG_64BIT))]
+        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
+        unsafe {
+            bindings::ktime_to_ms(n) + add
+        }
+    }
+
     /// Return `self % dividend` where `dividend` is in nanoseconds.
     ///
     /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-- 
2.43.0

