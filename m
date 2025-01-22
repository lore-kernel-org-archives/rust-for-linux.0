Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0674A1CAA94
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 23:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737590068; cv=none; b=GxgfA801eg2YQfWebIWyuBJ/9RNqEl2QrBuHri7DbKwe8PdjApO3EUycO+I+DHmbQF21G35Y/e/1lQcrmUISOgZJ4948SC2RqBK1MjQH5SN/baBEXN/egstOImaBEMSNcRXhH+tU31GeYGmSBQz84lmG3Gcg8q31fqCvH9dR3Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737590068; c=relaxed/simple;
	bh=vrMMe0TwCa98LQG10gdjY1GBoqp21ch4jKAdf5KwETg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XiUT1VHIE4/5eg1BZj4ZGNtTqBXpRjmP53ECgmDqvf8d/0h3wN8cDoAibSPKSJxr8csvjRuLDqh2fs/5T7ldgSHK21IQIXDZR4bFTlZTR5Zq3FoFOgJt/uo0/NLoQ6Unz31W6w+PUB57VtbdjPa7o8Lw3jjK2OI4Bjn+QpnZ+dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jb0qiOfa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jb0qiOfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737590065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKmlxv8pQ8qN6v+5ZFghyPhLccDSs9SACVr9wKUj6jg=;
	b=Jb0qiOfafi4qMsSc4umE/HpdGwXVLfxNEHOyk1EYsg9KsrB5Z9T07Q5v9pAehQpA4qSXSr
	Y9dUsiGl/O51aUBfGvwRM8sAE67seEI/p3DlqKo4iZBZ6bJU1SPNCkJFbz+vEvsjM/Yfdt
	pK6JIVv/lbkjVX8c/dd6e4ewTrejHpA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-seYCpLFNMvSf3yza-MtG0Q-1; Wed,
 22 Jan 2025 18:54:23 -0500
X-MC-Unique: seYCpLFNMvSf3yza-MtG0Q-1
X-Mimecast-MFC-AGG-ID: seYCpLFNMvSf3yza-MtG0Q
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4ED7A19560B7;
	Wed, 22 Jan 2025 23:54:20 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.57])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABC2419560AD;
	Wed, 22 Jan 2025 23:54:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 1/2] rust/kernel: Add platform::Device::from_raw()
Date: Wed, 22 Jan 2025 18:49:21 -0500
Message-ID: <20250122235340.2145383-2-lyude@redhat.com>
In-Reply-To: <20250122235340.2145383-1-lyude@redhat.com>
References: <20250122235340.2145383-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Just a convenience method to convert from a raw struct platform_device
pointer into a platform::Device object, which we'll be using in the next
commit.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/platform.rs | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 50e6b04218132..75dc7824eccf4 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -14,7 +14,7 @@
     ThisModule,
 };
 
-use core::ptr::addr_of_mut;
+use core::ptr::{NonNull, addr_of_mut};
 
 /// An adapter for the registration of platform drivers.
 pub struct Adapter<T: Driver>(T);
@@ -186,6 +186,21 @@ unsafe fn from_dev(dev: ARef<device::Device>) -> Self {
         Self(dev)
     }
 
+    /// Convert a raw pointer to a `struct platform_device` into a `Device`.
+    ///
+    /// # Safety
+    ///
+    /// * `pdev` must be a valid pointer to a `bindings::platform_device`.
+    /// * The caller must be guaranteed to hold at least one reference to `pdev`.
+    unsafe fn from_raw(pdev: *mut bindings::platform_device) -> Self {
+        // SAFETY:
+        // * Our safety contract ensures `pdev` is a valid pointer which we hold at least one
+        //   reference to.
+        // * struct device and `device::Device` have equivalent data layouts via the
+        //   `device::Device` type invariants.
+        Self(unsafe { ARef::from_raw(NonNull::new_unchecked(addr_of_mut!((*pdev).dev).cast())) })
+    }
+
     fn as_raw(&self) -> *mut bindings::platform_device {
         // SAFETY: By the type invariant `self.0.as_raw` is a pointer to the `struct device`
         // embedded in `struct platform_device`.
-- 
2.47.1

