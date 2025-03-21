Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DB5227EBE
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 12:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742559032; cv=none; b=Q/19E8d62jvd3w+mYLs2ZxaGFyT8FOfqoSvA7AGrCTo544szmL5UjCYVDLasi0elPkdOF7Wve/hXwz6yxjxbhWJZmF9E4XaRZrU7o8/uXr4Jc3+Szwn+PDbs04YiWiJBJRTOyguHKbXkNcDGmy/xwMd0aBJKLD36i70oZeb4tMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742559032; c=relaxed/simple;
	bh=CenZwVOD+GrhyGqXr7eT4mqrBBg+m3/fOxMffAwc6YE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cm5VZrW+dqb0OluQ2WXIwWWksAkjBxUiLVNh3X5WZ/OMU8MhDOmr6p0nJry28xipP5mjURM+6qHbhwP8YCM04PQMMMVffjLGz54xIhwf/wokcrKIaCb01eAW2iatbMrTJcDmXw6nRvafBkDyeOu1UubVQuSVd6ZNI1qdix14ylU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gfJAZYv+; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gfJAZYv+"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so10625275e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742559028; x=1743163828; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8p9XCS80u4SekshtxVRT2AVnFTXfb9fXAjsyjCLRaEc=;
        b=gfJAZYv+MnsfkYXV1rggzulbF8oUiZ6A4iZ3BJr2qz/+2Td5UveGOe7PqeUI3DtYZw
         dfkn8zPXrDds/W/UDD2NS6kmUQY0xP8E1orrn9vsGemqA0eMY+RXdB0QibVM0z5HE3/H
         GiyDC1MR+O4KNoXahz0MMVTIQdYSjmzPq0V8Lz0kwslmJAdiwuY32qJ/5LqeMposcl/e
         6dlj8X/pNVTFXMH/rgVpYLViH8/G8m0TCxgahq2eKf+UbGMvyDEOzdHzxzLRkUtLf+a5
         SYpC7jwASOkdb3ShAityRq4Y6gOgDx6gmw3pYpwDU+PfA20DPMjrtbHMc/AFSh74VhEa
         Ctww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742559028; x=1743163828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8p9XCS80u4SekshtxVRT2AVnFTXfb9fXAjsyjCLRaEc=;
        b=bBUgr+jqul7hlYprVl1Vphhl2+eF9Ijnh8NVk2ftsEdiI7g0rwGpTf3WTvlZFUZM8Y
         7Q8ZgIgsam1bx1HgLoJJnXXkt37tiRsGutFKcPQRr0AEpHb/gBquQA/sboBBO2JZl8oV
         vKD3NqwdXvMtRpekJ2kLC8QJ0nAdlf7TV6mpLy46efrkKpj34rk+/pQ9l7HNXFkn8ure
         W4ElQJ/WA8fhgs3Y/kyheQH4ecX+0RPQjt0+ByqBYsfupiS7gh/OoSXYlaC4o4Xdsee4
         U5FYS5mxEvtXyjIz1QTD9zXXTiuPsoV/Olx8Ntr2pBkmbNwjaqnvl/avsdTJZf7nw/tM
         w7rw==
X-Forwarded-Encrypted: i=1; AJvYcCVAjsXbLvDN69hOpl8hGBayyKWkhA7qEMTTctmxfrGz7p3dTOV9R2Y/d0b5Y7v4ZCIb48sjDzrJzbFkLwb8Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJ7W3XSb/Ahu4JBtm7J6nkq4eF7wBBqtNRuXrmcax5rUlatY5
	rI5ldaGALqQ5wCHg2IUkjqWrdSECqeDGv4RnlIgQGq2umheuGb+HRywh9ZgXNOvVrbmtKUPUSF9
	izrZ46VWbWVtoUA==
X-Google-Smtp-Source: AGHT+IE0JzqCo4hT9QhFZy6HGmQmE5baL1LKwOCenfRXCBC0aZnS95NxOjoqopt/ytWRBePpcJcn2995SwMi5dQ=
X-Received: from wmbbe9.prod.google.com ([2002:a05:600c:1e89:b0:43d:1c63:a630])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:ac7:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43d52a8fa06mr14331465e9.18.1742559028756;
 Fri, 21 Mar 2025 05:10:28 -0700 (PDT)
Date: Fri, 21 Mar 2025 12:09:58 +0000
In-Reply-To: <20250321-vec-methods-v2-0-6d9c8a4634cb@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250321-vec-methods-v2-0-6d9c8a4634cb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1965; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=CenZwVOD+GrhyGqXr7eT4mqrBBg+m3/fOxMffAwc6YE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn3VcnRUiLDyS+/y9aPym1UGxnWYuFowsPTBhvo
 eunLeIjeqCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ91XJwAKCRAEWL7uWMY5
 RuMrD/48ZEWJt7SecaUIQ6dxxdUbGuIINRB33Cj7n9VFJ0LeTrdZwvaKHenGsqt0DUe0ISCphQ9
 NxRzT3Og/mJkCXL+V76PUg7g82LwLG4HqI+KcyS47ytPTozohC/jnT0k0aNzpyEDVV9G+MzOE2q
 woYoD8+NGDVlbb/BqP1jSGT+vMoCXCkaWRJn2yCbKd49GEqpYpI/1hRpRwhvC6PcaeS5+7IpcZ8
 yG036eNtsM72oJTCUAo28fEffERRcXp5yqwq/zn/XSsUPXETtRFsJgIMwDFEQBF2xT9qHzN2sAM
 oJit/chN4q19jYRBylKecR79zYABtDFZO/qCzrbYM0c+5U4bll9TIFbQ8zut9jQMiNxEMYEgNgG
 7r808ZAetZ/6jrRqqGq6iUeXlv9a/Mzzrvnj1nzgAReWK//J7RQxKsyJRxlIIj7hFXy5cGm1aa+
 rP0qJoIqM9EF+fB7lBbJ6UiQLA/JVzZV2Xpp/XYtOvz/AfiTYIUWLEsI53Ozgoo6lhMlidDf9/V
 E7rsKXbeC8SAOcLF6KoFqqsg0/itVkNT1i976l0Kc+rUTPvNz13QuenjDK42MAl/8oLIbNb0NQV
 +mKm9+IuO3kaBGmmezdYbaAIg91j9QP2Y2U5GOPOcdeCZ2FJFN/g3pzDMX6fDZPyLCOQu1whnaM r384qMqhlA7u49A==
X-Mailer: b4 0.14.2
Message-ID: <20250321-vec-methods-v2-3-6d9c8a4634cb@google.com>
Subject: [PATCH v2 3/7] rust: alloc: add Vec::push_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <benno.lossin@proton.me>
Content-Type: text/plain; charset="utf-8"

This introduces a new method called `push_within_capacity` for appending
to a vector without attempting to allocate if the capacity is full. Rust
Binder will use this in various places to safely push to a vector while
holding a spinlock.

The existing Vec::push method is reimplemented in terms of the new
method.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index e42c5c40c992c796409505da70975f970524fc24..c9de619466eed1590fda039a291207100729a96a 100644
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
+    /// assert!(v.push_within_capacity(10).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn push_within_capacity(&mut self, v: T) -> Result<(), T> {
+        if self.len() >= self.capacity() {
+            return Err(v);
+        }
 
         // SAFETY:
         // - `self.len` is smaller than `self.capacity` and hence, the resulting pointer is

-- 
2.49.0.395.g12beb8f557-goog

