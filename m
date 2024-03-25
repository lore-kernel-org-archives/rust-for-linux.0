Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6F9224FB
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388983; cv=none; b=QB2XVcgqh4UD9civWme1rolL9XjkQmxduwR0PN9aofMsuOOQcvV2exxCYSpqql4ptsF9wIvs8PhYAJZuhoy7diaDjbUGh2Szw9sOnkI9Ua6x7Y5XpmFqTsa4XvIa0LgSjwY4X1rEI6UhLUr0n+03YYeh4rkt90MXg3TcpHmMxtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388983; c=relaxed/simple;
	bh=qzQglqQbeQ/J+/+67aWIH+cjLV4Nj9yIDOAZgCzU7hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Al0zmbQr9G6i82bJ9mElyyn8WAVTH2QldFkBKM+vV+LYK1JkVy4nEpp7u90IBZH4Ot5dzLGIISeH2ulw5Lq4j/kL1kQn1+Mre8zLPQYGvSjJHpdO455A67ZGELZk5cqtAZgzR1FpINHIl1RGofu+XaJ0tsNhHcFI60HdhqXOvHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PrG0EYCg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PrG0EYCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711388980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mAvbqG5mxvM27xlS22BA8nvfV3QgokAJvbSodDa6MM=;
	b=PrG0EYCgj54dmlbdnqrpA4xQhonIeuANT//OA0RBL3gEOxucTquIGj2NMqOXIvPrwKoBRL
	U5GirpFZ59oLOKRWyOJa+f5MY2zg3ISo9Qyjy0o0t70ptOvaEG+WiDYID0hT5+dq1p9XgW
	wb0wQ9KtlSItOWp5bKMGJLv/v/5oXwM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-gDRU-OP_NCmKeauZstbYag-1; Mon, 25 Mar 2024 13:49:39 -0400
X-MC-Unique: gDRU-OP_NCmKeauZstbYag-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40e4478a3afso23775335e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388978; x=1711993778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mAvbqG5mxvM27xlS22BA8nvfV3QgokAJvbSodDa6MM=;
        b=c+7BRvjVYgXPWj33biHfvpZK0B0IisAjaYFg64aXRniXSHeTFUCHW84d5IV2zaU5TY
         kZs6iLr5IUNSLdq1ULUAfOPvKO5JMNKu/c/7WAbh5w7U7Ff+4MDMkIrDRDTQRHqhuimd
         eqf5TRD8tuIxd45J8T/WuVxdKczkpM21yIb+xFDYiTfTtFidQjuYvOU+ClX6sYUJX5dm
         SgqmdXdf/uVKqTV1/7e14taLYJtOEzQX/EZL8NlupMwcYVn2vwocvkH0ZNkiIbkK7BRq
         JV5jgzc2WoXQ+wLNUR8nsT6bWiFD71yoVsKExh1Nn/MCD16kNEGCW1xtuhylk811Rn4c
         3Tcg==
X-Gm-Message-State: AOJu0YzTywBjNGMJVK6o2Y7Dit8tHXIJ9LptTsjcbQqKezzzNRiKrcVA
	rBFVNm4qKLyLIuKLvBJoeH4sfsTJMGLTm9bEn2zhZQUzlaPo2uPuTPh/qSA/ulvquzGS4N/t2K5
	XvBcLVYZ30QFbPR7s02stsFPpauovAg3y9Qt1DBW0Az8Gm6ONBqffQmz+KjBegJiB
X-Received: by 2002:a05:600c:3113:b0:414:7bf0:973f with SMTP id g19-20020a05600c311300b004147bf0973fmr5968176wmo.9.1711388978364;
        Mon, 25 Mar 2024 10:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl65rjm8BEL0ezw6ba1IRwQpsl9l/q6uDJTLiAhfY01dt3znpyQIaWuUE3bNh39zO8lqjxXQ==
X-Received: by 2002:a05:600c:3113:b0:414:7bf0:973f with SMTP id g19-20020a05600c311300b004147bf0973fmr5968151wmo.9.1711388978054;
        Mon, 25 Mar 2024 10:49:38 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id p10-20020a05600c358a00b0041488691eb1sm5143245wmq.17.2024.03.25.10.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:49:37 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: rust-for-linux@vger.kernel.org,
	x86@kernel.org,
	lyude@redhat.com,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	airlied@redhat.com,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 2/8] rust: device: Add a minimal RawDevice trait
Date: Mon, 25 Mar 2024 18:49:06 +0100
Message-ID: <20240325174924.95899-3-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325174924.95899-1-dakr@redhat.com>
References: <20240325174924.95899-1-dakr@redhat.com>
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

From: Wedson Almeida Filho <wedsonaf@gmail.com>

Add a RawDevice trait which can be implemented by any type representing
a device class (such as a PlatformDevice). This is the minimum amount of
Device support code required to unblock abstractions that need to take
device pointers.

Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/device.rs           | 23 +++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 3 files changed, 25 insertions(+)
 create mode 100644 rust/kernel/device.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index c0cb4b05b918..cb88b429da3d 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -7,6 +7,7 @@
  */
 
 #include <kunit/test.h>
+#include <linux/device.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/mdio.h>
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
new file mode 100644
index 000000000000..9be021e393ca
--- /dev/null
+++ b/rust/kernel/device.rs
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic devices that are part of the kernel's driver model.
+//!
+//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
+
+use crate::bindings;
+
+/// A raw device.
+///
+/// # Safety
+///
+/// Implementers must ensure that the `*mut device` returned by [`RawDevice::raw_device`] is
+/// related to `self`, that is, actions on it will affect `self`. For example, if one calls
+/// `get_device`, then the refcount on the device represented by `self` will be incremented.
+///
+/// Additionally, implementers must ensure that the device is never renamed. Commit a5462516aa99
+/// ("driver-core: document restrictions on device_rename()") has details on why `device_rename`
+/// should not be used.
+pub unsafe trait RawDevice {
+    /// Returns the raw `struct device` related to `self`.
+    fn raw_device(&self) -> *mut bindings::device;
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7ac39874aeac..155c4b32f5c9 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -34,6 +34,7 @@
 #[cfg(not(testlib))]
 mod allocator;
 mod build_assert;
+pub mod device;
 pub mod error;
 pub mod init;
 pub mod ioctl;
-- 
2.44.0

