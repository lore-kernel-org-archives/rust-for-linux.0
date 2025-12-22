Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43CD299952;
	Mon, 22 Dec 2025 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406944; cv=none; b=hGleR43xRM/oZuysF/UyI4aGw3ciVGFXGXCUh4L4DH15GxwJvJhe7lI+RERAquR2m+k8K39+RFGAGTv1EbMtcfZptBZzSIsHl+6cRIafupE/M5JSqARZDd7BAzyitUYd+5yLpxkDprj2Q4rsNlCV0fsjr/j/FKrXTTuQ4w+f6EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406944; c=relaxed/simple;
	bh=Ld5AMvq8OJucAYk0l6FmF7jpWtheRCiDax246Pt3bCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qerilF67eebKc+BAHErf1N2wUcwDJ4KLog50C/7VC4t9W1LLVPB22xhtJIEEiP81u51FhkUusDeuDJhnMLY+G1NGrnEz4RvOO9RVxqe8AgMHoaEaeigI3Xw1Lv0YcNBOCHgZvlgDOoHk3rH3vZsYa42ximf4pLAN2sSSWxmKtP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqNTTB7J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqNTTB7J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7D5C113D0;
	Mon, 22 Dec 2025 12:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406943;
	bh=Ld5AMvq8OJucAYk0l6FmF7jpWtheRCiDax246Pt3bCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oqNTTB7JuixL7DC5vuaVEcIZ6xQOPwyrT20UVZzmGeL41Qn060eP7hErSU9oQvsyV
	 EIPUU79xHPwHUwZbEB8OdJtwmwjHGKOua4DFVZpVGLWD8ohNgZ8jsuHBOaS+fYqzpe
	 ZS9gZAVQJP2kAbv65RoR4D/qnFRGUFfpNxVds9Jsd7aj7gc39alXmMMXlxOb7CU3b3
	 ss4pHYL+Z0slxwxOAxw5LeTu6u6ltlYsM1xbZJXQXrVvGcWIUIChnIu4qNUI395mKz
	 NAIU4UBwe1xIKrHuFG496a3GYoy9Ptu2aqGPIUFnRc/z5zKP8l+r+dtG3AuF78K4NX
	 jeRX6wJrZWZnQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:35:28 +0100
Subject: [PATCH 2/7] rust: device: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-driver-core-v1-2-1142a177d0fd@gmail.com>
References: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
In-Reply-To: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406930; l=2310;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=nWAn8MY6906Q4EishesDMMvYRfPHt+KKPvTZXz4jgBk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDRTJNH8AXR+X+JXg/Z19XhYiMYJrRpyN43mwAJfW138EgM52X9zYujTw3znehfTfGtpPCnt5Hj
 ea768GFgJNAQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/device.rs          | 4 +---
 rust/kernel/device/property.rs | 6 +++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c79be2e2bfe3..d4edceaf3020 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -12,8 +12,6 @@
 };
 use core::{any::TypeId, marker::PhantomData, ptr};
 
-#[cfg(CONFIG_PRINTK)]
-use crate::c_str;
 use crate::str::CStrExt as _;
 
 pub mod property;
@@ -463,7 +461,7 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             bindings::_dev_printk(
                 klevel.as_ptr().cast::<crate::ffi::c_char>(),
                 self.as_raw(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&msg).cast::<crate::ffi::c_void>(),
             )
         };
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 3a332a8c53a9..3eb3f36d66d0 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -178,11 +178,11 @@ pub fn property_count_elem<T: PropertyInt>(&self, name: &CStr) -> Result<usize>
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{c_str, device::{Device, property::FwNode}, str::CString};
+    /// # use kernel::{device::{Device, property::FwNode}, str::CString};
     /// fn examples(dev: &Device) -> Result {
     ///     let fwnode = dev.fwnode().ok_or(ENOENT)?;
-    ///     let b: u32 = fwnode.property_read(c_str!("some-number")).required_by(dev)?;
-    ///     if let Some(s) = fwnode.property_read::<CString>(c_str!("some-str")).optional() {
+    ///     let b: u32 = fwnode.property_read(c"some-number").required_by(dev)?;
+    ///     if let Some(s) = fwnode.property_read::<CString>(c"some-str").optional() {
     ///         // ...
     ///     }
     ///     Ok(())

-- 
2.52.0

