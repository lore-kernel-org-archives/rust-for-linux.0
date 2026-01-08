Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3F4221FB6;
	Thu,  8 Jan 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862575; cv=none; b=s5PebUIwPaUuVhiP3bx7ni70ibN6CsaMFHdTSq/wtrqXau6lCeKH8YaL3AzcTzZrkZdrUWH3MaOduyQbcYG97DNPpptvRRfjnHsLmF+sgofKXKkY06TR8NQbEciyIXzCygj9tzkpxmaWCgellFVYZhxnRKmeuu6QiEZNopI8VN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862575; c=relaxed/simple;
	bh=LAD+KjQVDizpR5mpji1WobxOmSXC3yNM18v5cucJgrc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Syg0WaeXYGDY+kjadrDxry2qifVppXSayoSl1gPcxZwWltDfg9lvfsvAoyhK+tKtiB6rOkLNVgYMNK28HmtGW9MxvJEl8HLDxsjNtiA5AsVU4spkDZ/zWUrnZuU5/E8xODewrRxvKPxKEsHIWT/MF9HaKbDycs8u3dVkwLu4Alw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d5916260ec6f11f0a38c85956e01ac42-20260108
X-CID-CACHE: Type:Local,Time:202601081637+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e608a6de-1576-4896-afba-8b8749583c82,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:8d41c026c25dfd072c169121304c10ac,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d5916260ec6f11f0a38c85956e01ac42-20260108
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengfuyuan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 38822126; Thu, 08 Jan 2026 16:55:51 +0800
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
Subject: [PATCH] rust: device: add platdata accessors
Date: Thu,  8 Jan 2026 16:55:45 +0800
Message-Id: <20260108085545.333676-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement generic accessors for the platform data of a device.

Platform data is typically set by platform code when creating the device
and points to platform-specific data structures. The accessor provides
type-safe access to this data without requiring unsafe code at the call
site.

The accessor is implemented for Device<Bound>, allowing drivers to access
platform data during probe() and other device lifecycle callbacks. Unlike
drvdata, platform data is managed by platform code and has a lifetime
tied to the device itself.

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 rust/kernel/device.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c79be2e2bfe3..e16f8eaa52e0 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -325,6 +325,31 @@ pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>> {
         // - We've just checked that the type of the driver's private data is in fact `T`.
         Ok(unsafe { self.drvdata_unchecked() })
     }
+
+    /// Access the platform data for this device.
+    ///
+    /// The lifetime of the platform data is tied to the device's lifetime.
+    /// Returns a reference to the platform data of type `T`, or [`ENOENT`] if no platform data
+    /// is set.
+    ///
+    /// # Type Safety
+    ///
+    /// This function does not perform runtime type checking. The caller must ensure that the
+    /// platform data structure actually matches the type `T` for the specific platform device.
+    /// Incorrect type usage will result in undefined behavior.
+    pub fn platdata<T>(&self) -> Result<&T> {
+        // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
+        let ptr = unsafe { (*self.as_raw()).platform_data };
+
+        if ptr.is_null() {
+            return Err(ENOENT);
+        }
+
+        // SAFETY:
+        // - `ptr` is not null, so it points to valid memory.
+        // - The caller must ensure that the platform data structure matches type `T`.
+        Ok(unsafe { &*ptr.cast::<T>() })
+    }
 }
 
 impl<Ctx: DeviceContext> Device<Ctx> {
-- 
2.25.1

