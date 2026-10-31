Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442752;
	b=qhlb13uE7CvWaNQPIzMaW9v2Jj1cXEB+fqj95uAOxYVTJ4m/+CzRGZUreZTYR9IImHOh
	 ICDQ5tSpogEDn82HniSlKMYnd/ICi1KyXTZUnQVwnXluAqzZD2HGT3OWo6pIlwwI+vQ4n
	 eYddIACYDvYjWYAEIMdMVuOuIIIieTyPyQ22DNMrGHC9A82jZGYUK52EY73kzf3LbD2bK
	 fwaUDnCeIOqlTIty5jv85CgVtzmVcLkFV9cvwIZU+JOD8YpOB6pqtHyrQeLvel+pf1qD7
	 o5/neyiwygtkBXtJcxylOLWhgc8TkXRTYYBwqHcH4++eZlnC5TOSlMn67QYDXYWjqgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oJN7YW5/O/ypFLA5SZlEpqsSiwnIwF3r1Sqf8UEUf7U=;
	b=MnWMZJbk5MbPEpx6+uKFx5n+4ECetdHx2HLvAfHY5keQZS146Rz9pzPHjVC+uEQU7Gd5
	 4u4zutpW4hiLuvEnshm0kphamH3FzrLgmq1WGiPoTYXaMTZclHpwWcEAzNgxh3bPuFBLC
	 IZWkR0pc+QY21WKofffz6VvWIF5Zb+vMGuH4MPvMqZgFySFD+6p6QG/pgFf9Ckj6EQd4u
	 qsW+qG+4g3/IMyMyWUEe/ipWuN3YqvQNACucF2m/6awSHH0tIQLrSq7Z3YJeBAF+zDnzn
	 +uJwRiD2vLrwKhfbK1dyMTF71nch4xOTuFlapSEpQTjOy0ftRaR+YCTShgL7v0v/ADg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IG2dBK1D;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD93606A31C
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 10:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IG2dBK1D
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c1c8so5959995ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442751; x=1794047551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJN7YW5/O/ypFLA5SZlEpqsSiwnIwF3r1Sqf8UEUf7U=;
        b=IG2dBK1D/gON6XrQZb6YL4yw44KeH4c93SSt801VAPx7/9qdsTBfQkL1IrxWBKO69t
         Nyf7j8xBomGvQ0LAiZ5F7hJNix1WkxBFT4xlj1cU9d/t4CJe43YrMqqpEwMFvGqWPAho
         CUWhmY3Y4zsVyG2pWNKK2FcJ5m2zN+eWMS5bAUmkFZIhm8QIFOBdfnVy4hm9meIYx0C6
         3PXF3JCnsrM24zVv9wrdrILEBBPjtNhs7raZw7HWa53ANAFLvn61w2aTwdFYqX1+BWG6
         POMgq+7RdxCTPjYp4SwAwZ/CCJcPd2vz812Kl3xcZ0pr9CkNJ6aolObgJFTcvE9WywN2
         y68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442751; x=1794047551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJN7YW5/O/ypFLA5SZlEpqsSiwnIwF3r1Sqf8UEUf7U=;
        b=J2Uvaa3Ee587YVwNwCDLGsHhiSYPHkeOkhFgFgRrR1bAJBbZOw2/OqPjwxbHUAbyCe
         NycfZ2j+uHVb8g7sBvpFTOp9Bo3+oL8oNSgdubT4rj8tVw0VsZPVziKr95sbUSCGjwSf
         FC0TRo73NSEKCJVCowFhxo8oBtIrclcP74EsEWZq7+f9rr7OuJovbL9rDpuJX2K/3GJV
         OvJEpfWKDp3sL2tV4OCR72t+wOLfewbBQM0CTZ9dpgMed7FG9tLQ7DCgYJ80hkf+6Ecj
         /eDk+6uGWO/XsHMNUsfa+NEigQHA8AjVORGbvclP8wqONPHd2kOckYY6A4eG/5obyElj
         b70Q==
X-Gm-Message-State: AFq9FYL1rOSEux0L6et76/7i0C5T/i4Wp5CBMz95DPmnZAQDsiSkgn+w
	0T8601rTB87VD2TjaFPy/+GSktAY7INrJ0v5k46AceWeRiUYUIQ7yVGjJbFkGsdCbQ==
X-Gm-Gg: AYBFou3aSihXqyVBSqZHEWtuVOcvEBBkULTBNY1POBh+UORCqpeO0c90dY+MdMCyuIM
	o3dHzkKZHxQ4uBg9kXIiG9jUPP/tuo3PKi39M5DMkyBPbhijw/zIT+B+y4SD/bAu6msKVjtE9/V
	emcQAPuQ9KuS8byB3DCt/NNYdgR858NDPv5SCuT78gYrRA7uCyB2miPn3D7McJXpRJxoj4FaLUl
	SPu6cIqLTYUMfPm2EA+sg+4ByqSEc53qYSMNp5aNT1DeqQf/BzixU3Xy39V1eKPik79Qedm1dEn
	ejd7kI7Xg02CZ/sy7xiBxN+cPeXDIyCkzciShrkoZ7xNEIpv+VHeDmwQmZn9BOL473rLL03MFA0
	fTp6VDREneMdcjkRz2OIbc+26kYR1buAAwbmDRLRaXCrbU/6YpPGONf7/sDGz0pmivhh/5M5jSI
	FCuRVbcVkiUWgDKFcfgrK9K+4v+UCpG28N6OdConnpZOAuAVpDZDqyyeXa9jDi9wAkHjXFr78ch
	7qaYb/1PX0/ceqnw2n0sW2U+nqEr3sV/gVKoFDz3/ZAOVWtibZGCF/TEX+fo2YNi9pmoL/ePF3b
	cGPIXvjhSEC2NVHq5v3NtBALK2IM6Y8mylx+B4mB61TYvCoICkfxdGVigkmFYg==
X-Received: by 2002:a17:902:f686:b0:2e9:87e8:71c8 with SMTP id d9443c01a7336-2eb36395e36mr51829245ad.4.1793442751062;
        Sat, 31 Oct 2026 03:32:31 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a13:a5c6:1ff1:280f:be24:11ff:feb0:8690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928104asm14817275ad.53.2026.10.31.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:32:29 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	miguel.ojeda.sandonis@gmail.com,
	tomo@flapping.org,
	georgeandrout13@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 1/3] rust: time: rename the rem_nanos() divisor
Date: Sat, 31 Oct 2026 18:32:04 +0800
Message-Id: <20261031103206.24051-2-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031103206.24051-1-chenhan0017.work@gmail.com>
References: <20261031103206.24051-1-chenhan0017.work@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The argument to rem_nanos() is the divisor, while self holds the
dividend. Rename the argument and correct the documentation. Drop the
architecture-specific implementation explanation from the public API
documentation; the argument type already states the divisor's width.

This does not change the function's type or behavior. It is a preparation
for documenting and checking the invalid divisors in the next patch.

Cc: stable@vger.kernel.org # prerequisite for the Delta division/remainder fix
Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
Changes since v4: none.

 rust/kernel/time.rs | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 5ae377e70dd8..16b44e82d2ac 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -614,16 +614,13 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
         Delta::<Jiffy>::from_jiffies(jiffies)
     }
 
-    /// Return `self % dividend` where `dividend` is in nanoseconds.
-    ///
-    /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-    /// limited to 32 bit dividends.
+    /// Return `self % divisor` where `divisor` is in nanoseconds.
     #[inline]
-    pub fn rem_nanos(self, dividend: i32) -> Self {
+    pub fn rem_nanos(self, divisor: i32) -> Self {
         #[cfg(CONFIG_64BIT)]
         {
             Self {
-                value: self.as_nanos() % i64::from(dividend),
+                value: self.as_nanos() % i64::from(divisor),
             }
         }
 
@@ -632,7 +629,7 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
             let mut rem = 0;
 
             // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
-            unsafe { bindings::div_s64_rem(self.as_nanos(), dividend, &mut rem) };
+            unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
 
             Self {
                 value: i64::from(rem),
-- 
2.34.1

