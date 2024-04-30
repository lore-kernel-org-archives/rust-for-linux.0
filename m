Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E47B168A9
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714479210; cv=none; b=Zn1XBjDIVJLX+W6Tg9FCfxpKOxkyJIM9jQPyRQxGtGi5T7QktOlWYbhL6BWYi1/vo3t5uR2TDedonfGv2OyA71w09MRFZc/2+O7ww7EaMNSwJSqwCt5CYS3uC/n8UCBei7dA4nYyQ9XjCn4qwXAGb8crwaA2zqVimgEgQJT1dCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714479210; c=relaxed/simple;
	bh=FxkUexggzKBEN24J/YkuMf53ut0MQEXtdNWvDXecgEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uuclZpNOXRZBMWDD+D7q2mQmYBYmCC9HLYzGxj4k5oahAQip5hUAE9wqOjbP1aFrWhuZDfZFcZUWgf8XN7B84/FxXsGHmybbPptGSlF5Va2H5TbViEYb2YP24Z4S3wKHzxli8Jur6lUAUL7tiqvB21VRnU51GD/LrQre6JnoOBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IwY6yK0c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IwY6yK0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714479208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gbBPn6rBO8OH3tWroDy1ByU/1fIKt9E9wmU0gzZ3mb0=;
	b=IwY6yK0cmSntpNVBKs++O5c/A3tleE8rXqvv1CDLUMQrUMSLfuGQtaqJ95pm7xusKWfbCo
	xo7VgRuaWROJAJblPqIDkBaPzTXgCmp/kPFh0YS8BIYqzdr4ezoQLB+2Zu53REv1I5GiFA
	4ny+s/JgEOLXyJB8AhSmqbt8ciQJU4s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-4-KUiNbQNiarixfPIRNsPw-1; Tue, 30 Apr 2024 08:13:26 -0400
X-MC-Unique: 4-KUiNbQNiarixfPIRNsPw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a5190b1453fso357172266b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 05:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714479205; x=1715084005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbBPn6rBO8OH3tWroDy1ByU/1fIKt9E9wmU0gzZ3mb0=;
        b=h2lMbY0EHkgkzCSSfzmILITRMe0eq10YtLMqeegVpibN2EBNNV3b/AYq1DJXFXccjP
         7HtHC2Y7soNgW8HhxFYfyaGQydstV/Hp+mi56rs8ZawX0E27f9FBN3pUCaxtKjJWkbS0
         15VKJW+/sFIN9Eud6hYNvbMZFN6PKEP1vGDDxHC0zEXmOB01LjKWsiU4lmoqHHZSao2u
         ILATFTLEIz01yTDCEtUi9gkQzl9JSSRLMoaxgeckbvISrMEzoIpMW6wKqyuIm2QLvy/I
         TA797Sh3322E4H6xsqAV9i7QwKqCvMRmyTVvUeLSF2tOIRLxsPZofvGbRiw8yknoBXdZ
         1m8Q==
X-Gm-Message-State: AOJu0YzSdwlItGW97CV5lgGK9yAuq9dB6BQttrMjjqdKFlUMfctwjXaT
	x6N13iDwusoeSCw311MbIY74He0u/DiCgUiaMAufuwTrx1dUv9UEBJSl/gLMIznQezAQPcEBaHm
	3GW4cjsjcAQ0QshMilkYtUj3xAjFzgcsrb0szqP6HstvEz1A++1gzP2+wjilNgwIS
X-Received: by 2002:a17:906:2e86:b0:a55:b272:4052 with SMTP id o6-20020a1709062e8600b00a55b2724052mr1405402eji.66.1714479205680;
        Tue, 30 Apr 2024 05:13:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMgcv0K9bntjDIL3zJhYfAoiLStHeGvkh56hcCGBhA+YVM50cpJHw1Xbgeo7SSaCs9rmRybQ==
X-Received: by 2002:a17:906:2e86:b0:a55:b272:4052 with SMTP id o6-20020a1709062e8600b00a55b2724052mr1405376eji.66.1714479205254;
        Tue, 30 Apr 2024 05:13:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id a4-20020a1709062b0400b00a58bf7c8de8sm5746354ejg.201.2024.04.30.05.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:13:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Date: Tue, 30 Apr 2024 14:13:19 +0200
Message-ID: <20240430121322.2660-1-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
passing a dangling pointer (instead of NULL) to krealloc() whenever a
new Vec<T> is created through VecExt<T> extension functions.

This only works as long as align_of::<T>(), used by Unique::dangling() to
derive the dangling pointer, resolves to a value between 0x0 and
ZERO_SIZE_PTR (0x10) and krealloc() hence treats it the same as a NULL
pointer however.

This isn't a case we should rely on, since there may be types whose
alignment may exceed the range still covered by krealloc(), plus other
kernel allocators are not as tolerant either.

Instead, pass a real NULL pointer to krealloc_aligned() if Vec<T>'s
capacity is zero.

Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
Changes in v2:
  - correct the description of the pointer value produced by
    Unique::dangling() (Alice)
  - add RB tags (Alice, Boqun)
---
 rust/kernel/alloc/vec_ext.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/alloc/vec_ext.rs b/rust/kernel/alloc/vec_ext.rs
index 6a916fcf8bf1..ffcf8a19f715 100644
--- a/rust/kernel/alloc/vec_ext.rs
+++ b/rust/kernel/alloc/vec_ext.rs
@@ -4,6 +4,7 @@
 
 use super::{AllocError, Flags};
 use alloc::vec::Vec;
+use core::ptr;
 use core::result::Result;
 
 /// Extensions to [`Vec`].
@@ -137,6 +138,15 @@ fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError>
 
         let (ptr, len, cap) = destructure(self);
 
+        // We need to make sure that ptr is either NULL or comes from a previous call to
+        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
+        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>'s capacity
+        // to be zero if no memory has been allocated yet.
+        let ptr = match cap {
+            0 => ptr::null_mut(),
+            _ => ptr,
+        };
+
         // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
         // `krealloc_aligned`. We also verified that the type is not a ZST.
         let new_ptr = unsafe { super::allocator::krealloc_aligned(ptr.cast(), layout, flags) };

base-commit: 2c1092853f163762ef0aabc551a630ef233e1be3
-- 
2.44.0

