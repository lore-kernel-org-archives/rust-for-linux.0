Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA401B6A7A
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112918; cv=none; b=g+dK3N3+FBOMLfZswcXqdCw0nuK7eyC5abU+dN0UiZMh+DMAhbqC2yaYm5TZ4jjhWvyewA/+g9DEZlMxd0b4xzKU6wXM1/2qp41fF7RilqSa6w4hK3jNA+OgWMnTUPTmS3aTiEvk4WWd9VphoyBxL5HqPPofGIggiiH9Ovf1k00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112918; c=relaxed/simple;
	bh=DCq3JdKHMv1BQsHzkac2p/ZW/zPdLP0o1nouh+/SEUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p4Ih6HwkpzoeFU+NpOWH+WwzackXE99eLmIi35ZFP86pkK57aO4+4Bh+xTZBTPHEFEsZf6f06QmQ94wcT48b0wCTYoiHAnpx7IHfwO9Yq5Szx651KDqIUbdrmXSrED6Wqgf5sRYUAbm09pz2FDJ2qeWQroMqgjHxmBHcJFsPTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gG8nnRWu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gG8nnRWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DNNJhnlE4FEesPjTYaQmJVB4plwJ5MVZycKMsnB4Uog=;
	b=gG8nnRWurzfLDjVIvcziShGRbxBcJwtTcNZBlr+9I0ArcWxTlnrNBfHboQd1k+uLofRB1V
	e4IL5av/q4QjXmekBGoqSFW8jsUqdnyCXvqnaOwbTZA8xTVjyJCUKlW1GveggWgEGdVYvf
	IaDp+MkCSgLlcTF/2azm0UmfK7UFa6o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-fwfxqXaUMkCqF4NhH1nLDw-1; Thu, 04 Jul 2024 13:08:34 -0400
X-MC-Unique: fwfxqXaUMkCqF4NhH1nLDw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4257f95fe85so6078225e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112914; x=1720717714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNNJhnlE4FEesPjTYaQmJVB4plwJ5MVZycKMsnB4Uog=;
        b=GDCRIVKKzkucYbPqLPchdW9OCFozUwTXxkXF1Rq0Blo8MMcQc1coZ90pI+RtMTHB4f
         6X4QTnyCpmMKtyvq/8OW7qa/PkD6THVh7yZH8ODyxePcU6zT96QMqoZsWM1At0vHUh+Q
         bfJGxmD19lwJ7QBcEVWwY5ce7bybk2qLQ5IJV8JxPdpiQN8e8i+swlGlv7EQ4BblTGiD
         KDjEMVbn4XI5fjkazndx7xRaSBCUWEiRfo+E1i6Sw5DPYnj/8/gZZHTnFFqKJ79jbW+W
         vXn0RKQQJf5JzDaKnXfa/TQzgAG2ViIH9EEsc5pC77QqLi5r+twfWoZSmIYVE5ogxrbH
         3xbw==
X-Forwarded-Encrypted: i=1; AJvYcCX2qRZGnWpz5Mh2qKDdFT6ZCpT9cz101kv9jTZu4foNqAgRZzYghTOzmUVylwAI3ZeqZUEzaETrrzESYRbeMEWFpKocGFYyMz1/Kcqta1o=
X-Gm-Message-State: AOJu0YyQ990Lf8cShHDZQAzMf+3aKtAmbpQQuXvJWR2Q5JlRgbvGYUt+
	3pr/9/IjSozdG/BhY9tKMt5ehAcDbEFa5wzQfDnZoIvmsyUYbm1Xy8AW8/RyNTkTYjdArcMuE7A
	RD9NSGDjSZVR/L6UqlaI8irvSOnxeIpcW0lJXDyiImjJxpL5igj5G3F9DvniwgSQP
X-Received: by 2002:a05:600c:47ca:b0:425:7853:e2db with SMTP id 5b1f17b1804b1-4264a468ab2mr16629525e9.29.1720112913773;
        Thu, 04 Jul 2024 10:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1lCENdfe+k6G48i1rTSjNdqGggpx5cLlnXPcGT3EGfuFdPEzBXdckhXeQIDSmC2fNB/1RDA==
X-Received: by 2002:a05:600c:47ca:b0:425:7853:e2db with SMTP id 5b1f17b1804b1-4264a468ab2mr16629445e9.29.1720112913503;
        Thu, 04 Jul 2024 10:08:33 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a283577sm31163725e9.44.2024.07.04.10.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:08:33 -0700 (PDT)
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
Cc: daniel.almeida@collabora.com,
	faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com,
	lina@asahilina.net,
	mcanal@igalia.com,
	zhiw@nvidia.com,
	acurrid@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	airlied@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 05/20] rust: alloc: add module `allocator_test`
Date: Thu,  4 Jul 2024 19:06:33 +0200
Message-ID: <20240704170738.3621-6-dakr@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704170738.3621-1-dakr@redhat.com>
References: <20240704170738.3621-1-dakr@redhat.com>
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

`Allocator`s, such as `Kmalloc`, will be used by e.g. `KBox` and `KVec`
in subsequent patches, and hence this dependency propagates throughout
the whole kernel.

Add the `allocator_test` module that provides an empty implementation
for all `Allocator`s in the kernel, such that we don't break the
`rusttest` make target in subsequent patches.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc.rs                |  9 +++++++--
 rust/kernel/alloc/allocator_test.rs | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/alloc/allocator_test.rs

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 8d79cc95dc1e..46ebdd059c92 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -2,12 +2,17 @@
 
 //! Extensions to the [`alloc`] crate.
 
-#[cfg(not(test))]
-#[cfg(not(testlib))]
+#[cfg(not(any(test, testlib)))]
 pub mod allocator;
 pub mod box_ext;
 pub mod vec_ext;
 
+#[cfg(any(test, testlib))]
+pub mod allocator_test;
+
+#[cfg(any(test, testlib))]
+pub use self::allocator_test as allocator;
+
 /// Indicates an allocation error.
 #[derive(Copy, Clone, PartialEq, Eq, Debug)]
 pub struct AllocError;
diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
new file mode 100644
index 000000000000..3a0abe65491d
--- /dev/null
+++ b/rust/kernel/alloc/allocator_test.rs
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#![allow(missing_docs)]
+
+use super::{AllocError, Allocator, Flags};
+use core::alloc::Layout;
+use core::ptr::NonNull;
+
+pub struct Kmalloc;
+
+unsafe impl Allocator for Kmalloc {
+    unsafe fn realloc(
+        &self,
+        _old_ptr: *mut u8,
+        _old_size: usize,
+        _layout: Layout,
+        _flags: Flags,
+    ) -> Result<NonNull<[u8]>, AllocError> {
+        panic!();
+    }
+}
-- 
2.45.2

