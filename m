Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409E175A6E
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 06:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777097355; cv=none; b=qEJT9FrDV0CxsFUCeRA3iOdyb8EIPNT1SMgJsvNhAVUJ5M82pYn99sG+PumOIluRH6WzGoxoHhTA0CFQ1DyA3FH/tSzPMZeUx+CNIlE8bXIxFi1SO/1glja1cYVv9E8rOuIsJOurGUZ0w5RWXuCWcPscliowyNvbiNhmEPv8+74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777097355; c=relaxed/simple;
	bh=ljMTEIO3/AgEllI5LPRQice/3Egilu6O/jk+c4mKBwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pe6Hh2j3Gtjj79wYWWK2pTcq7Bktnlubf2wrcTDSz5UiIYAFX8QTj0Pu5Ij7M3h8/SLfvuMs70mWLEeWfq3jNNOYWXf14HrAjJ2ms8qnK6MxEth8e2r+KQ+Rkl6XvUM9+sap1BjmHhdN9yi+UFiRGv15ls5wZoTvwDyftkSLzsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmyIMNBh; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmyIMNBh"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so5305816a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 23:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777097354; x=1777702154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YBejBFceX3xsO0HoJMBo34/xdAOH/+I2pIHssNjR+t4=;
        b=bmyIMNBh7VBsULTk4uAssRG/+EJhk0irimd/F9cOhN0y9W6G8D0lT74acEFEIoP7Ti
         ZHAKRJbXP412Zoq0lweJIWQRSkvM9MQnLho4gx7sAWIu6OC51U9TrdGkIUy8Elfc6O1X
         sXJLI/wk0XX9qaJkPdR0TsRE+1b50mSsdEl6+lty/xAeW5yUGPsnZShPvCQUGdKwwl0k
         YSKG3g7MCXt5MxRdXu3PmojY5fc0s3Zv/EzglUf2yiFJqCSOi7+fi7TjEU8B0A1i8VxM
         5v4HdClF71/aClNfaHxgv1raG7bq4J82uQ0cAdxqpHRdUaeldAX8Wp3UmMisVO2w9s48
         DShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777097354; x=1777702154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBejBFceX3xsO0HoJMBo34/xdAOH/+I2pIHssNjR+t4=;
        b=lc24CkzL426hQIJKs9uqU4/Vy8v8ECm3eFfdx7w93YUm5R+a++HDGyNufqy+sBifxO
         npspbx/WNgj/4B/ZPcYVckbJFTUFagSc56nCb8Uq/rdEin0lrcaKkmuF9i3HG5dMU6UE
         PRlYOdr8L0GIeGXCKZrHsJqeRBzNRLkTFJa7fMyuWRTX63HtUbPrxFzHDUkZ23men8QZ
         cB92x9CLR1VGiXRFIY2Nr7OZ5yDRnxLGwAAMpGH4J3sr6q9hNHWdSPJBAacpb3Xf1Jgu
         UxBI4qbWJY2wWFAKWDD/6LCxtZ2p80vHxqHloydu299yiiJCbG28xNkkIDEht1Z/3cD8
         FcjA==
X-Gm-Message-State: AOJu0YxesmUjbYIwk0AsrNtpGkx3V8XLJnek9og189l5pIBgGv0sptm+
	cpyCRrzFNMz//022igDdXQKLhESuLLbEJFCIxB5TdCzypjJoxli9yBq10CytaBeu
X-Gm-Gg: AeBDievheQoXGox8F8DAiK3mnY8pVWj+DNjfgRn8NVv0Fy2IEI9wwRvkf3xf18m7uT2
	Fx3cc/f1boVu4bIszHqI2UjnON2zSUPIsk5Q9opcvhouynnyBm7XXPIkWVWpXCJqBIWFeU+RHGk
	FbS7l/NGInrRJNaIaH9IHHno5WUP1E95lg7px4IECRSHFDQye6UHbomwPUmjLbp3K3i9zikvff/
	5H0ulG2nYQ1ae+4PGl9FPVjIeCY0w0ij4A6Ie0D7YmFTK8+7qU8J/frAlThzY8TFGDYOUMM7quU
	AqFoYoqwwJsqf7QSSiGk5fcx1RQGboLIyXZ5XoQixp3/vx2aF/6Al+Q9vA37GjPEsgwr/3Vqr5n
	xSfgz3YgdnpRZxAe27fw2v1goQU3vIpX90gVabHJ1aAD51ja9ghtYDAVX55HDLU4O/RddOe3p6i
	nYvtR7zr0lzlhVXMvL0oUA70BBBao9bMchSEKqO9H+haUuRG+7UV9FuEsjBg==
X-Received: by 2002:a17:90b:5845:b0:35e:58d3:3286 with SMTP id 98e67ed59e1d1-36140498567mr37661546a91.24.1777097353349;
        Fri, 24 Apr 2026 23:09:13 -0700 (PDT)
Received: from localhost.localdomain ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a8f0sm24400858a91.12.2026.04.24.23.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 23:09:12 -0700 (PDT)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rust: alloc: add doc test for `Vec::extend_with` and fix comment
Date: Sat, 25 Apr 2026 14:08:23 +0800
Message-ID: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a doc test for `Vec::extend_with` demonstrating basic usage and the
zero-length case.

Also fix an incorrect operator in the SAFETY comment, changing `<` to `<=`,
since `Vec::reserve` guarantees capacity for exactly n additional elements,
so the equal case should be included.

Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae8..fc4bf0a7934d 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -737,6 +737,24 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
     /// Extend the vector by `n` clones of `value`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::new();
+    /// v.push(1, GFP_KERNEL)?;
+    ///
+    /// v.extend_with(3, 5, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 5, 5, 5]);
+    ///
+    /// v.extend_with(2, 8, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 5, 5, 5, 8, 8]);
+    ///
+    /// v.extend_with(0, 3, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 5, 5, 5, 8, 8]);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
     pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), AllocError> {
         if n == 0 {
             return Ok(());
@@ -754,7 +772,7 @@ pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), Al
         spare[n - 1].write(value);
 
         // SAFETY:
-        // - `self.len() + n < self.capacity()` due to the call to reserve above,
+        // - `self.len() + n <= self.capacity()` due to the call to reserve above,
         // - the loop and the line above initialized the next `n` elements.
         unsafe { self.inc_len(n) };
 
-- 
2.43.0

