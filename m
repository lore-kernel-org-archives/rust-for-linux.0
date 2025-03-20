Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37047224229
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 13:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742478811; cv=none; b=B7jx7IqnkdALiqcXXaSvTyzraIjEX4IR1TuxZa3S00Vfdnr8nSHPt0KV5Oy8RVFQDFNI28GwW47MlEvsVaW4J12VAC72mEjqK4hZBxVBtzEiV7wQDgWO4OGV4AfVzmM8ZmvLM9xlvcU9sOHliUY4C98psGc1v/YCTdwCu9GskeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742478811; c=relaxed/simple;
	bh=oq9udGuCcSsMEvbqP89aogF1VgUZC37t/ErsD/OVHrw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qJSzKmmwW/QN5OEDz1QLgfyZEDmE7fp0nqtHwgpjNds/P8L4nLWhDZZZuMLrldOdq3ul4ZjYUptMNBN2gs0SugyMDVzzf1TRjGET823rvpB1XwmmNniEz9rM6xzp5EYYdMmE/ZmQP9uFXu95rUJcHqQAriXYaYCDJBmW0N8qZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KtQg/PjO; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KtQg/PjO"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43947979ce8so3699115e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 06:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742478808; x=1743083608; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7M2VtU5PPRczkAaCd/oYdvo4gCCR2tO6CUbKZTZQCTA=;
        b=KtQg/PjODm+GRQCjBwAyblXK0jChVnfFTEo1CJE+6lZZDL+HojJGzaQ59d9s9ENrBI
         vh8zgDZJwRDRVZAb5JMnVfruog3k8/k6bGt75MwT7UWpmkXKhth0HPFO8g4BJtpLmQT8
         1NHi1Y00IYHOA2sUU6CuQl2oWTdZ4uBrMJaT3CGzwrSHhVsflPClezI0IwpTaaFATwdv
         eFw77TleLkznXvQ+I2GITSrka3g1+bWNSbNifseUlUkaBAgdmMWokgf0a4MYf2bhrg5U
         pOBNVHFEHpB0fL4ZTqCx/wcuKJoMzzrQh/7WWxzAWz7pmuZGXPVynaqdFlAkDYyXEuIu
         0Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478808; x=1743083608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7M2VtU5PPRczkAaCd/oYdvo4gCCR2tO6CUbKZTZQCTA=;
        b=XYfrtqZC585Ygm/GpbC4A3dh+wKjmw4wUN+B+gw/jjcMLdWERJbgekP/ao30ySTc6f
         w+kMOB2Be7suSvaUoylwwoxZNVUD9idP7o2t9AC6EIkerbaSZf1hgW4reMpEICcAbPKp
         n5LthgDRDb5BB2ezOhBy6GmyoC7CI4mudcn77kuSE5JVRbyGrSFXQB/eaI2XNQJ76Upu
         kTP3joz0I7LbBD4REvDyTB79oNiixS9WOBmbpm4W+ng+stAT0/7EhxY8OUDpZyhDHPTY
         9A7QOg4zYqgtN3LxP2wNFqW5Wpw0kwS10sPXCz/QOpY9CQE/cZYfPBYjeuAcfId6Wv6/
         EMoQ==
X-Gm-Message-State: AOJu0YxE+I+DDQ80ogAluLeWYdewKcFwxR0qywR5JfWULaLE/qomipXG
	4tz8RnBj3jQC5srnN7xI24080a8QLjs0mfWIhI+ynxonvW14lFM0uX92ah5ea5eayTH38BAPwoc
	XHm9SpmiPGmvblQ==
X-Google-Smtp-Source: AGHT+IEHBEzOJAPJ5ezuipJ3siAvbyjFeXNO5sAc0d3iTiI/rmXTEivVMWgnRI+74eXAZJm34UhpBQMONlmhSYY=
X-Received: from wmbep16.prod.google.com ([2002:a05:600c:8410:b0:43c:eaf6:525e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e44:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-43d4378041cmr72309735e9.6.1742478808680;
 Thu, 20 Mar 2025 06:53:28 -0700 (PDT)
Date: Thu, 20 Mar 2025 13:52:58 +0000
In-Reply-To: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=oq9udGuCcSsMEvbqP89aogF1VgUZC37t/ErsD/OVHrw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn3B3NFeE1Ogr3RQZHN9/v7DaROFK5k4mpOMKCD
 1Bd7vq5b1SJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ9wdzQAKCRAEWL7uWMY5
 RgB6D/0WkW5RJz0jjMuXX3XTipgrz//n0nnWXy+rkrG5AGwSDuVf3M4Pio0sjmwpUUIw1uWFewq
 FCeIWWqhvI1k8xFxhXzkGXobRcV2V7agTcSuheKZwR5cIHu4zTBdu4ixma4xl+PrH9PpNptnnbx
 cjKzDQeS4Tuc6Cp2tdcsz9DG+Gpy38V0184/y2k3RFf8RCvWaFUN1FVNeSN53SI9QOVImcyL8CD
 5P6MuQkgyaVRCDU3F9gQzJ79VDNbxCRPdKTHzoAGoW+9I4LQX0Up+qUORWONQNaZ4nT0nAKnY6B
 z5JcOXwELHaNMqCoiy7xPr85LYgJ4DHuqXp+WOJP4aBgwoUlVA4bkSx9TpMf3BJmaYfrRTPpnpu
 Ji7jw+sjx+UddZ7X7J6lCfrJTYEm2QHQvAtvFh7bBTjI+aeMV9syMuii0aUXkgsxPCSP91Nh4xI
 uokdy/KAnkk1Shz4V6+Gr+870N9TQx414tLvmduVix5D9q2xYEvyxEaOgZduvIvhHBiW+8mYJ9W
 YbiX+p4ZII5fHHxZErqUrje8kXdgDeRRFIkuN8FJHWfsrRF3kCUwQphuQpbRlBCLm0MrrYD4bur
 bj7mHFHm1rNBaqvWJIwMV62lrKw4z/bsJlH1gpHzsl6uFalCYCpMKc4saFWoFaep/YQenO8dZmx v6y+Oy7M5/gyWVw==
X-Mailer: b4 0.14.2
Message-ID: <20250320-vec-methods-v1-3-7dff5cf25fe8@google.com>
Subject: [PATCH 3/5] rust: alloc: add Vec::push_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This introduces a new method called `push_within_capacity` for appending
to a vector without attempting to allocate if the capacity is full. Rust
Binder will use this in various places to safely push to a vector while
holding a spinlock.

The existing Vec::push method is reimplemented in terms of the new
method.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 9943358c70aa63f5ad7ed9782cb8879d7a80a8fb..df930ff0d0b85b8b03c9b7932a2b31dfb62612ed 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -284,6 +284,31 @@ pub fn spare_capacity_mut(&mut self) -> &mut [MaybeUninit<T>] {
     /// ```
     pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
         self.reserve(1, flags)?;
+        let err = self.push_within_capacity(v);
+        // SAFETY: The call to `reserve` was successful, so `push_within_capacity` cannot fail.
+        unsafe { err.unwrap_unchecked() };
+        Ok(())
+    }
+
+    /// Appends an element to the back of the [`Vec`] instance.
+    ///
+    /// Fails if the vector does not have capacity for the new element.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::with_capacity(10, GFP_KERNEL);
+    /// for i in 0..10 {
+    ///     v.push_within_capacity(i).unwrap();
+    /// }
+    ///
+    /// assert!(v.push_within_capacity(11).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn push_within_capacity(&mut self, v: T) -> Result<(), T> {
+        if self.len() >= self.capacity() {
+            return Err(v);
+        }
 
         // SAFETY:
         // - `self.len` is smaller than `self.capacity` and hence, the resulting pointer is

-- 
2.49.0.rc1.451.g8f38331e32-goog

