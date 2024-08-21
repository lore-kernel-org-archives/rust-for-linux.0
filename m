Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656DD16EC1B
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Aug 2024 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724270366; cv=none; b=UlGLbHH6OAOxepbO6ChJyyos1lnLHf2gnCS9pc81MAQiYNbBjRimh9oh5Gy9lu+yrFpY7xUAPo9Ah+MHkAj/9bGYu82Ie3MrHqllbb3rAibYQ0HJq+9ZeTOqSvEPHF1hjmDHH7gPoJEcs7dLEU5hgii41XoMnQhgzY1SN9KCcRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724270366; c=relaxed/simple;
	bh=rRUyQp6SqgqIrIH5sHd1N/M+82q6xEb5aLXq05EJ7zE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HOu42fjNDVsnNaSeT80EbqcKlBtiiSpmI/JXEAnGSPu+gLdfeWaUyT/Gw15KQ3LosaP0EcyjEus5Q9xRekaotF31WkzEovXqO7anBwBuFtLgqVU/EEBxl420iNa7nqO2UyoT53KailZIalKqLvPVbRw4kLxAMOsNAW2gDAfQUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DLgv/kM/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DLgv/kM/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-42817980766so176905e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Aug 2024 12:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724270363; x=1724875163; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y8RoeL6EWUdnN80iwzlSkgz19tRYLmIcf4aR/4JykoU=;
        b=DLgv/kM/JqlvrlmQPE/+dTcU6IzvhPlD1GLWNZk5WZzWIlC9XJn22xRaBvKuvXi2H2
         WKQ7HHJCID3jsIN9XiPix84Z3u4owiGWUG+DYfwjiM5aAwIuG5sXaCEWKE/UZkUwrgqD
         48D2ddSwfJnRNZ4DWkv+HFLU7s49p8ON9Nf03cY3NLATQe9/MlUNYyod5Lw0qPPYTnpe
         P/KPDj3C9gyggZRI8NUptLarInCI9XuCkhvnwl3fKSyExcVbbJByUzzxwM3Axbje60M5
         5O1WwtP+g371vwk/JRQO/fen5xRE9XQvMXUrti4Efcpvq3133lFEf3pUDiFL9ZWvzA45
         PqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724270363; x=1724875163;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8RoeL6EWUdnN80iwzlSkgz19tRYLmIcf4aR/4JykoU=;
        b=Eej8GXGjsUAwiiPF9GBoZlIdXPOqt/px1c9RPEkpdlOPRrr8O+5GgXYrBGVRL5aUeH
         +cx8kRlUeU/2I2ULnhmCa3OYkczGqCmTsCG+9lIISbNd0zgOElfs2dQl3Tm9gGUJvjon
         9Ys2isGYVBQGjOFf5yOmNp5S+kCb2h7KpoYcnWMwWrBhivb5V6WYWSufxgDODNGsf7wJ
         68LUAqTsVABzNNt9WYIQlmi5PYsP9Qod8ntlkwEinMPTKirwjNhVavISilS4z9tePSJc
         zy54rw+wj8vvaTg+teUWf+bh9y8dv2E9pS6VCbwTDFNkWTZLAOF7hTwmUMnF/H1aup1G
         GYKA==
X-Forwarded-Encrypted: i=1; AJvYcCXGn73iGTHau2kn4pp6P9ZaknllrwGKIYGBE7oZzJmsbAuZwc6gCXsHCBBw35l/EVks/a59fg8k2fyrGTSmzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7/g2ZBK/37yUy2/j5ojT0lwQjx0fJiMiOMbJTcBRTt/39p+eA
	AWY2KzW7Fgb2V3RnPbIwOtQY6m1gHNuzYzmkn2l5vsQMllnaHoUEyDGPVWkUN9oMfDCXc2jhai2
	/0hN9Vv1wmDXz4g==
X-Google-Smtp-Source: AGHT+IEX5eMdWfY9gqOP+M4R1WGx7QFLY/tYPbvDUuQwEBazA1DezJ8YUv4UA61HCArmMDXTkcWeIlZkwvGgG5M=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:adf:e650:0:b0:368:4615:76e0 with SMTP id
 ffacd0b85a97d-372fd585bf4mr4885f8f.4.1724270362491; Wed, 21 Aug 2024 12:59:22
 -0700 (PDT)
Date: Wed, 21 Aug 2024 19:58:58 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAFHxmYC/3WMQQ7CIBBFr9LM2jEMYNK48h6mC8ShnUSLgYZqG
 u4udu/y/Z/3NsichDOcuw0SF8kS5wb60IGf3Dwyyr0xaKWt6hWhSxxQ5iViciuyOlFPhqzVAZr zaq+89951aDxJXmL67PlCv/VfqRASGmMVsQ435/vLGOP44KOPTxhqrV96NdilqwAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3495; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=BDlfYKs73irWpae6tJQ/1w+umICBRvbzPQLTelJNbgk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmxkcNWkTW2im3pV5vFid66zftiPLd5oim5CExs
 v72yYkewniJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZsZHDQAKCRAEWL7uWMY5
 Rjy8D/912wvmVyQONKG/gYoIm76EBjvd/N2DWngHCnHlxF3eTlMIhP32xJJ4S/fyhTimYGw7Pjr
 VcujlCBAhvSUPTEXqFJF7jv3j4UUW3Jr+8zCbp/jpPlFI10zao+qSWPknRseHw2BOVuNnvt5wn1
 iwGQdiZAXsrKi0B4SJ1zIHROgYUW3sczY1OH/uYYtuC5B+NDA6Ow6IPENk6KpvETwDUEWlAg/JT
 OnmrPyO1+N4dz+QgypG+lzC0EAx/btP8xSoNdES+SaIbqZgErKGz7tWM2ElZEigRdTOuM+RjTWU
 U7/onknhQPqdbHGim3oyYpcNrusCetfFlTJpOuqp2WV6wecNR8xayTzD4+bcl8kh41BO6WnKIfA
 lwyfyhkia6orP44s02ZFq2/QT+DBLj66/Gdh8R3q+RzP7bZfH87RZ8qe936hrd5D3JzXc2Q/n9m
 kQ0WsXAVajpcijfDW7O/U8ZNOpcnQ/+R5wFEI6ENNdjYHv5NNWbwUQW3+FJZVCmgY0WUykRF+Ce
 pPjjnd9E/j8RGut9UM18hZVzHj1afw3pz6fI2exgiEd5HLD49wE98qKa48mVKBydXs67LlG1tWX
 /CI4qGS8UtwhyD/Z4qLudai22vMOwzNARTYIYFcwEEF+q9iXNXh+yXShCptJeRI8Ug86aemCRbb VDhkQ2Fz0oiWk4Q==
X-Mailer: b4 0.13.0
Message-ID: <20240821-aref-into-raw-v2-1-9215bbca5720@google.com>
Subject: [PATCH v2] rust: add `ARef::into_raw`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kartik Prajapati <kartikprajapati987@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Kartik Prajapati <kartikprajapati987@gmail.com>

Add a method for `ARef` that is analogous to `Arc::into_raw`. It is the
inverse operation of `ARef::from_raw`, and allows you to convert the
`ARef` back into a raw pointer while retaining ownership of the
refcount.

This new function will be used by [1] for converting the type in an
`ARef` using `ARef::from_raw(ARef::into_raw(me).cast())`. The author has
also needed the same function for other use-cases in the past, but [1]
is the first to go upstream.

This was implemented independently by Kartik and Alice. The two versions
were merged by Alice, so all mistakes are Alice's.

Link: https://lore.kernel.org/r/20240801-vma-v3-1-db6c1c0afda9@google.com [1]
Closes: https://github.com/Rust-for-Linux/linux/issues/1044
Signed-off-by: Kartik Prajapati <kartikprajapati987@gmail.com>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Sending a v2 that is merged with [1]. I didn't realize that I was
duplicating work, sorry! I'll update the author information to list
Kartik as the primary author. I kept my function body so that it returns
NonNull to mirror the type used by `ARef::from_raw`.

This change was previously included in
https://lore.kernel.org/all/20240801-vma-v3-1-db6c1c0afda9@google.com/
but is being split out in its own commit at Danilo's suggestion.

Link: https://github.com/Rust-for-Linux/linux/pull/1056 [1]
---
Changes in v2:
- Add example from [1], and fix the imports in the example so it compiles.
- Update author information to reflect merge with [1].
- Link to v1: https://lore.kernel.org/r/20240801-aref-into-raw-v1-1-33401e2fbac8@google.com
---
 rust/kernel/types.rs | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index ee7dd1f963ef..9e7ca066355c 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -7,7 +7,7 @@
 use core::{
     cell::UnsafeCell,
     marker::{PhantomData, PhantomPinned},
-    mem::MaybeUninit,
+    mem::{ManuallyDrop, MaybeUninit},
     ops::{Deref, DerefMut},
     pin::Pin,
     ptr::NonNull,
@@ -396,6 +396,35 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
             _p: PhantomData,
         }
     }
+
+    /// Consumes the `ARef`, returning a raw pointer.
+    ///
+    /// This function does not change the refcount. After calling this function, the caller is
+    /// responsible for the refcount previously managed by the `ARef`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use core::ptr::NonNull;
+    /// use kernel::types::{ARef, AlwaysRefCounted};
+    ///
+    /// struct Empty {}
+    ///
+    /// unsafe impl AlwaysRefCounted for Empty {
+    ///     fn inc_ref(&self) {}
+    ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
+    /// }
+    ///
+    /// let mut data = Empty {};
+    /// let ptr = NonNull::<Empty>::new(&mut data as *mut _).unwrap();
+    /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
+    /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
+    ///
+    /// assert_eq!(ptr, raw_ptr);
+    /// ```
+    pub fn into_raw(me: Self) -> NonNull<T> {
+        ManuallyDrop::new(me).ptr
+    }
 }
 
 impl<T: AlwaysRefCounted> Clone for ARef<T> {

---
base-commit: e26fa546042add70944d018b930530d16b3cf626
change-id: 20240801-aref-into-raw-e0518131442f

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

