Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1824012B73
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 19:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714418684; cv=none; b=jOJlwAkqIZShcGCFLaepLe/I+CKSmogfJKdw2eSQYxIJSL0vFwncx78IifLlCmg8/SIZmLOlWkmoPtlWuC8xVXRO9+WxpCeVYoqWeo/AEZt2NULaaGOppaClyK1KpExggNNxglwHy+AbfbJzSC18xkrKZc5dPmp/1xf8fHHESO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714418684; c=relaxed/simple;
	bh=m9JSqTpsJPtrP2bH8Rn0Ggu6tJy+0wr6nhT9ABzQfg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W4mfCWC9HpZmIHjbLv9hwPmYAHDNtJf5bTJknxZ1KrYJbmj6MG2TyX9svib2RAi0MJg+5UqKJg56jNZzyPXrtL66IvHx0xxQs5J460JsO19CemmnSNmAYb0qPN38IgulSPfXLZUL1jx4AsWG0L0llk385ZDyDgkQNLpFxE1Ynng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xrb1WMNN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xrb1WMNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714418682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ziLkRLjfSHNVSmUHBqTEPxIDQCuJZFBq2ZOYE/paJ94=;
	b=Xrb1WMNNF5ZtluhmFBF5ga2NW+CEfQ+uoqyu9mjhYmkaJqgYwjHYJPzMm0ttkVXtVm12CT
	e6FcUysxjItHfWgrtL8+W8C2gPYJwE2Ey1KkgcsLc7J6KP3bdiHALG4rakWM4Xb2iTxTq8
	Fl/c+Tk4mrkZa/buOrOCgix7t6y9wLA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-RYsiKwifOq627RCe6mcbcQ-1; Mon, 29 Apr 2024 15:24:40 -0400
X-MC-Unique: RYsiKwifOq627RCe6mcbcQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-41bfb8c1ecaso9266535e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 12:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714418679; x=1715023479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziLkRLjfSHNVSmUHBqTEPxIDQCuJZFBq2ZOYE/paJ94=;
        b=diwFHIMNltwV+SJnN8itFvxia8LZgVdciZPHBOjcMl+iizxq8/YWvSQCbKHDpGlXPG
         AEOLa1Kb6A+5GDo0eM0M2TmH0o+lUHIgLV6ljUsSXXw3BdniNuZAcr7C/f/M4XX0QUFN
         Q7RmxMcTy/s0aJeVcPXuv9xc6PWxiPcl9xlzMWZDr474sm08RcodewA4KeN4B74qpWkf
         sJWvV2a8DaOTPWgcnj2WLrVgL7jq7Y/Xna4waVK2Hv4C+7/1e1wQ3YQC1m+NLjKcZ2Em
         R4rzU2BG3XKi78F5BIBWG2rufNu9W/k2lJQObHcAk3oghp4007AsHJdreQWq0mCBacAu
         iiTg==
X-Gm-Message-State: AOJu0YzT+eR2YBuiyOx2Pro9iJiBxiYWAgtRqZIOr2FF9D+S8nZngxbB
	QYtqGWsyWeGIurhoT5ralXuQOeQhK20lMe+bk/VMn2jaD204b9BlTGy4mee0bM0NgBnLynCccRe
	zWONu+F5Uj24frSNOU3ezkwdM7zGgnTlWS6THnT/dWgZ9GgYqpArgLJu8yP4nbRXX
X-Received: by 2002:a05:600c:354b:b0:419:f241:633c with SMTP id i11-20020a05600c354b00b00419f241633cmr524011wmq.4.1714418679459;
        Mon, 29 Apr 2024 12:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWTMD4XaH1lI/4UmU5PS6euY/1XGi3ggOgjWfYDnxH9omiyGknfnAbO1DPiULUUtetGGpGaQ==
X-Received: by 2002:a05:600c:354b:b0:419:f241:633c with SMTP id i11-20020a05600c354b00b00419f241633cmr523995wmq.4.1714418679072;
        Mon, 29 Apr 2024 12:24:39 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id bi24-20020a05600c3d9800b0041be4065adasm9691927wmb.22.2024.04.29.12.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 12:24:38 -0700 (PDT)
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
Subject: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Date: Mon, 29 Apr 2024 21:24:04 +0200
Message-ID: <20240429192435.2235-1-dakr@redhat.com>
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

This only works since it happens that Unique::dangling()'s value (0x1)
falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
krealloc() hence treats it the same as a NULL pointer however.

This isn't a case we should rely on, especially since other kernel
allocators are not as tolerant. Instead, pass a real NULL pointer to
krealloc_aligned() if Vec<T>'s capacity is zero.

Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
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

