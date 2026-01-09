Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A551925BC;
	Fri,  9 Jan 2026 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945945; cv=none; b=feLBJGnxL2WPi2cuV/dWH/KfPy7QW4sXKX23xBB1qFxhIVV+QQ3dDQWYe8beQz5o3qZLSImI00DHy1qV1At0uPoI61yzIDEStZPI/IANKZd00D8To4laRZ4ucbCFDkdARHGB9mkecxP1luBarnDFaQYYqVdudsiHk08fvAN+8dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945945; c=relaxed/simple;
	bh=sM0XtFBHZ+NGXZehlVEVA+yXE6CA8UkEg6UQXyHFkw8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qE8+Ahg4JxMGcHzxVDqkkwEOiTb+u+rRgbeGxF903p8dc5HBaBUebYVuJG/xoiSngxwWU3TKjiK3uDeWHXqnJ/tNw/XcLexu9oX7GuR+gKpoueVf2LUTYvE3sYvP97yGkqlzqQHxnCo4kbsrdqq8hrjl7AOqCBaeCRmnMPvhvE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f928cdd6ed3111f0a38c85956e01ac42-20260109
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:584b721d-6d1a-4d00-be38-c5893f11922f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:7219ff53009acc6e9798f1d84ca3be15,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f928cdd6ed3111f0a38c85956e01ac42-20260109
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengfuyuan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1671002354; Fri, 09 Jan 2026 16:05:33 +0800
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengfuyuan <pengfuyuan@kylinos.cn>
Subject: [PATCH v2 v2 1/1] rust: device: add platdata accessors
Date: Fri,  9 Jan 2026 16:05:28 +0800
Message-Id: <20260109080528.478731-2-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260109080528.478731-1-pengfuyuan@kylinos.cn>
References: <DFJ5ICRD3YFF.XCSV3CJCDORA@kernel.org>
 <20260109080528.478731-1-pengfuyuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement generic accessors for the platform data of a device.

Platform data is typically set by platform code when creating the device (e.g.
via `platform_device_add_data()`). Drivers may use it to obtain per-device,
platform-provided configuration.

The accessor is `unsafe` because the caller must ensure that the chosen `T`
matches the actual object referenced by `platform_data`.

Platform data is generally a C type, so the method returns `&Opaque<T>` to
avoid creating a Rust reference to potentially uninitialised or otherwise
invalid C data. Drivers can then perform the FFI dereference behind an explicit
`unsafe` block.

The method is implemented for `Device<Ctx>` so it is available in all device
states. If no platform data is present, `-ENOENT` is returned.

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 rust/kernel/device.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c79be2e2bfe3..90ccc433dfe7 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -483,6 +483,37 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
         // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
         Some(unsafe { &*fwnode_handle.cast() })
     }
+
+    /// Access the platform data for this device.
+    ///
+    /// Platform data is typically set by platform code when creating the device and is expected
+    /// to remain valid while the device is alive.
+    ///
+    /// Returns a reference to the opaque platform data, or [`ENOENT`] if no platform data
+    /// is set.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that:
+    /// - If platform data is set (i.e., `platform_data` is not null), the pointer points to valid,
+    ///   properly aligned storage for `T` and remains valid for the lifetime of the returned
+    ///   reference.
+    /// - The type `T` matches the type of the platform data structure set by platform code.
+    pub unsafe fn platdata<T>(&self) -> Result<&Opaque<T>> {
+        // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
+        let ptr = unsafe { (*self.as_raw()).platform_data };
+
+        if ptr.is_null() {
+            return Err(ENOENT);
+        }
+
+        // SAFETY:
+        // - `ptr` is not null (checked above).
+        // - By the safety requirements of this function, `ptr` points to valid, properly aligned
+        //   storage for `T` and remains valid for the lifetime of the returned reference.
+        // - `Opaque<T>` allows any bit pattern, so we can safely create a reference to it.
+        Ok(unsafe { &*ptr.cast::<Opaque<T>>() })
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.25.1

