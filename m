Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D30B47D94A;
	Fri, 22 May 2026 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779469991; cv=none; b=HcIV7jr9GNqvB7UeUUTqD8sgalq1pXOSHjSVuaAcKYRbbihHbvDuVpvjSOx+q5p3MQTJF0fT8Rle3QoG+6ZgwmgLLjdA8hgEx9rOuKsgbg/pbDmvNmw2YKzSogq6lfrNSWKbn8ZJ75UVwr5IUFVEfjIh2PwAOb7CCo6YQp02Uds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779469991; c=relaxed/simple;
	bh=lsyeDqYSyaT5bG8s0HcH1cJvBeqvRiaZFyFUfLKGcEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKyNYH6id2642G+DoqYKT6eGhmZHjlxZ9F37tb6JgJa9RSyl2TQ8MlgD0ERQzimMf9hukiulO+Ru6rn/S1z+IFbM/jVIVMzdjs8gzsSiZBqUcDWsfhx+QL97RnsmCwKnmIj1hizQat3xJbcGZco35IN2AhHj1sMEhge9aE08epQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXY86dA+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXY86dA+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFB31F00A3D;
	Fri, 22 May 2026 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779469989;
	bh=c8oUAd0hKy3lN8xx7yxBMID+XbMnJ0Ef4G0D6URmye0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UXY86dA+j+W9A5+pmqFTUqkXGDLBJd2dsQLT66tB3nZhUq2Ey9wYu3kQQuhBnOxqI
	 4jyCr6DxewJPzjz+nJh0QIHw2jigckyWTZBGVeZMKDXzStVJtJg+3SBEoNjJBsgpHm
	 1n3V/mRbVY2ZGHQ0BZQXC0tMd3Fpo+Y1VN8KAWcExcC8jTlBRr/oK6tyPyp6zKijXF
	 KA/OKktJ3lwJ99PkjRRZHSlEV5MsdG4XntIVpSq2lskB9ZPdlr2XVyaL8Vo1TqD1Br
	 yNchQH8Q+ZSR4YLxdbeAEtFfHAoVqzhhAqFd8327qvmKIY3VneHSSqRFA1XHo0TSY4
	 DT3FJPkGCworQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 22 May 2026 19:12:48 +0200
Subject: [PATCH 3/6] rust: binder: enable `clippy::ptr_as_ptr` lint
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-binder-strict-provenance-v1-3-3d6e9406e864@kernel.org>
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
In-Reply-To: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3183; i=tamird@kernel.org;
 h=from:subject:message-id; bh=lsyeDqYSyaT5bG8s0HcH1cJvBeqvRiaZFyFUfLKGcEU=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFkCfdPv3ls1zbP2u52UWcfiPa6sTVfsnn9e8Uc/IjDt8
 NnejTbRHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKbacwHD/8qPLWqfJk/czssu5vz+nGGuY9kSr6Ak2UNv1edeOb3zUjXDX9mp7Nt
 9fs3kO/Kt2s2vtqVj1fusU5tV32kvufF3muXdQgYA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

In Rust 1.51.0, Clippy introduced the `ptr_as_ptr` lint [1]:

> Though `as` casts between raw pointers are not terrible,
> `pointer::cast` is safer because it cannot accidentally change pointer
> mutability or cast the pointer to other types like `usize`.

Apply the required changes and enable the lint in the Binder Rust driver
-- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr [1]
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 drivers/android/binder/page_range.rs       | 6 +++---
 drivers/android/binder/rust_binder_main.rs | 7 +------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index e54a90e62402..927b0802e80d 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -571,7 +571,7 @@ pub(crate) unsafe fn read<T: FromBytes>(&self, offset: usize) -> Result<T> {
         unsafe {
             self.iterate(offset, size_of::<T>(), |page, offset, to_copy| {
                 // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
-                let obj_ptr = (out.as_mut_ptr() as *mut u8).add(out_offset);
+                let obj_ptr = out.as_mut_ptr().cast::<u8>().add(out_offset);
                 // SAFETY: The pointer points is in-bounds of the `out` variable, so it is valid.
                 page.read_raw(obj_ptr, offset, to_copy)?;
                 out_offset += to_copy;
@@ -593,7 +593,7 @@ pub(crate) unsafe fn write<T: ?Sized>(&self, offset: usize, obj: &T) -> Result {
         unsafe {
             self.iterate(offset, size_of_val(obj), |page, offset, to_copy| {
                 // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
-                let obj_ptr = (obj as *const T as *const u8).add(obj_offset);
+                let obj_ptr = (obj as *const T).cast::<u8>().add(obj_offset);
                 // SAFETY: We have a reference to the object, so the pointer is valid.
                 page.write_raw(obj_ptr, offset, to_copy)?;
                 obj_offset += to_copy;
@@ -712,7 +712,7 @@ fn drop(self: Pin<&mut Self>) {
 
     {
         // CAST: The `list_head` field is first in `PageInfo`.
-        let info = item as *mut PageInfo;
+        let info = item.cast::<PageInfo>();
         // SAFETY: The `range` field of `PageInfo` is immutable.
         range_ptr = unsafe { (*info).range };
         // SAFETY: The `range` outlives its `PageInfo` values.
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index d487638266e3..fa28697982d3 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -6,12 +6,7 @@
 
 #![crate_name = "rust_binder"]
 #![recursion_limit = "256"]
-#![allow(
-    clippy::as_underscore,
-    clippy::ref_as_ptr,
-    clippy::ptr_as_ptr,
-    clippy::cast_lossless
-)]
+#![allow(clippy::as_underscore, clippy::ref_as_ptr, clippy::cast_lossless)]
 
 use kernel::{
     bindings::{self, seq_file},

-- 
2.54.0

