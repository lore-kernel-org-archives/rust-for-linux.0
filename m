Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205181E0E06;
	Mon, 20 Jan 2025 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737377669; cv=none; b=rIlK92LHpypZMQXfxPbILq/ql4hXKWraqlMdUO53E7Qe8AVN71JtUMD3yZ6MQ+MVtXVqoxJPypRSxfylrN2R0t8F340NABVT/ldcL1RxwUuWuxnPqUGXMdTKZntftfEF3RptJq7lLSMLSjawU9ANTqn3CIXcWjDMhrgYLM3aQ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737377669; c=relaxed/simple;
	bh=cmN/niqzZ1rpA0iq67EMmiOeK/W9CBL7sCeaGl/jz/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jcIjvnjqZdU4BU5dHS4CYY5h7o7riE0nsBg+fP6zMehGnaj8FCdjPudKXnTVfPwGeu74z7QkC5dVaLaXEvpoHTdRW2X/Yo4EsW7LRnByaEq4AWEN2Hx9syX2VTXesaRvoaCubiTRwUheOSuIdTjHKYegm6waGDDTPdXo9M/R9KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id F00ED230B083; Mon, 20 Jan 2025 13:45:34 +0100 (CET)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: [PATCH] drm/panic: fix compilation issue on ARM
Date: Mon, 20 Jan 2025 13:45:29 +0100
Message-ID: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In C, the char type is specified with “The implementation shall define char to
have the same range, representation, and behavior as either signed char or
unsigned char.”

On x86 it defaults to signed char, and on ARM it defaults to unsigned char.
This carries over to Rust’s FFI, which aliases its c_char type to i8 on x86,
and to u8 on ARM.

We can fix this error by using the *const c_char type wherever it is needed,
rather than assuming we are on x86 by passing *const i8.

The only other place which uses the CStr::from_char_ptr() function is
errname(), which already uses c_char correctly thanks to bindgen.

Here is the error I encountered, building latest master:
```
error[E0308]: mismatched types
   --> drivers/gpu/drm/drm_panic_qr.rs:961:60
    |
961 |         let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
    |                                        ------------------- ^^^ expected `*const u8`, found `*const i8`
    |                                        |
    |                                        arguments to this function are incorrect
    |
    = note: expected raw pointer `*const u8`
               found raw pointer `*const i8`
note: associated function defined here
   --> rust/kernel/str.rs:187:19
    |
187 |     pub unsafe fn from_char_ptr<'a>(ptr: *const crate::ffi::c_char) -> &'a Self {
    |                   ^^^^^^^^^^^^^

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0308`.
```
---
 drivers/gpu/drm/drm_panic_qr.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index ef2d490965ba..39ddb431b361 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -27,6 +27,7 @@
 //! * <https://github.com/bjguillot/qr>
 
 use core::cmp;
+use kernel::ffi::c_char;
 use kernel::str::CStr;
 
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
@@ -931,7 +932,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
 /// They must remain valid for the duration of the function call.
 #[no_mangle]
 pub unsafe extern "C" fn drm_panic_qr_generate(
-    url: *const i8,
+    url: *const c_char,
     data: *mut u8,
     data_len: usize,
     data_size: usize,
-- 
2.48.1

