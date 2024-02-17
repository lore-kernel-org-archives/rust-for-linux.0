Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376F6D1D3
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Feb 2024 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708184059; cv=none; b=pkhtuBPFf8jZ3U3e+O5hd+41cQeTrN1zbA15h9iyYsot+FaPveZgmVgHIXPTVKoVKPfjm8NJP/VfwH8CZAOVSOIuYz+ibDYMOe9NNXj4sgjFqe6yhxus4qJ+H6VPVUfW7X8yR/gMopXCemtxLzRRZQKKZW/g3+zSvPSjUlb34e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708184059; c=relaxed/simple;
	bh=bDC5SvjOx6o8++izTWb9dXil+mnMOezLcAPrKcvHKH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f10JV3K1/lGtpE1pDMOg5ZxUgr4hnZYr1FITfHnT6mmXJGgePHpZLALay5LLqxyORJZ36DE7nQs6dfw9hSa9m3VnOJQvqADiz+EvaSEzF0Puv6QGcQh2EEtQt3x1ztBBRvwjSMs3O2MyzG1OdailFBhcZ6IOf/psXTnvK/sJ45c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=MPjzJ7p6; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="MPjzJ7p6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GINLV2hJoViSJcX3WBFYciFg20kJyIfge8+sSA6Rwh8=; b=MPjzJ7p6NDRnkQfnEoCekbED1A
	YwZtf/zgwcbqiTnKipTB//IHmTt2jSA6ETyInLazal5fjnmZZIzmGFyJnxqgIa76s8+i1RZpDdUYz
	s8Ali5WdiaZ8ZxU6Z/7EmQYzw70c2jpnAI59PMtX3NdF0zMvthZa8x36VpLUYqRRub3uW1Nq8kiqm
	Ttdj9WrHlmKtY7PYqiKFu9uOcbDOmn7R8hpKQt7/7y1r11o64rGwIB2CrYSN8eZu4GC/1KVO5Bsqa
	b0IvrEfsNOHMRXluE8q9Kvev8raUgV/84NBLpIfKlM3IxsBxyYnrnnYKc7hVd9Fy9t8UCjLV8PR6j
	ltzsT0Og==;
Received: from [179.234.233.159] (helo=morissey..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1rbMh2-000m2M-Uo; Sat, 17 Feb 2024 16:33:33 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matt Gilbride <mattgilbride@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>
Cc: rust-for-linux@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?L=C3=A9o=20Lanteri=20Thauvin?= <leseulartichaut@gmail.com>,
	Wedson Almeida Filho <wedsonaf@google.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] rust: Add `container_of` and `offset_of` macros
Date: Sat, 17 Feb 2024 12:32:30 -0300
Message-ID: <20240217153315.56128-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Asahi Lina <lina@asahilina.net>

Add Rust counterparts to these C macros. `container_of` is useful for C
struct subtyping, to recover the original pointer to the container
structure. `offset_of` is useful for struct-relative addressing.

Co-authored-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Co-authored:by: Léo Lanteri Thauvin <leseulartichaut@gmail.com>
Signed-off-by: Léo Lanteri Thauvin <leseulartichaut@gmail.com>
Co-authored-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

Hi,

`container_of` is a essential macro to build any sort of driver in the
Linux Kernel. Therefore, we need a good and reliable implementation of
this macro for the Rust abstractions.

Although I checked the version sent by Matt [1], I don't really like the
fact that such an essential part of the foundation of any driver would
be an unsafe macro. Therefore, I propose this alternative to Matt's
implementation, which is Lina's implementation that it is actually safe.

`container_of` is a dependency for the rustgem driver and this is part
of my current efforts to upstream the driver.

[1] https://lore.kernel.org/rust-for-linux/20240205-b4-rbtree-v1-1-995e3eee38c0@google.com/

Best Regards,
- Maíra

 rust/kernel/lib.rs | 69 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 5a8594d2f5db..7ae89c676800 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -103,3 +103,72 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
     // SAFETY: FFI call.
     unsafe { bindings::BUG() };
 }
+
+/// Calculates the offset of a field from the beginning of the struct it belongs to.
+///
+/// # Examples
+///
+/// ```rust
+/// use kernel::prelude::*;
+/// use kernel::offset_of;
+/// struct Test {
+///     a: u64,
+///     b: u32,
+/// }
+///
+/// assert_eq!(offset_of!(Test, b), 8);
+/// ```
+#[macro_export]
+macro_rules! offset_of {
+    ($type:ty, $($f:tt)*) => {{
+        let tmp = core::mem::MaybeUninit::<$type>::uninit();
+        let outer = tmp.as_ptr();
+        // To avoid warnings when nesting `unsafe` blocks.
+        #[allow(unused_unsafe)]
+        // SAFETY: The pointer is valid and aligned, just not initialised; `addr_of` ensures that
+        // we don't actually read from `outer` (which would be UB) nor create an intermediate
+        // reference.
+        let inner = unsafe { core::ptr::addr_of!((*outer).$($f)*) } as *const u8;
+        // To avoid warnings when nesting `unsafe` blocks.
+        #[allow(unused_unsafe)]
+        // SAFETY: The two pointers are within the same allocation block.
+        unsafe { inner.offset_from(outer as *const u8) }
+    }}
+}
+
+/// Produces a pointer to an object from a pointer to one of its fields.
+///
+/// # Safety
+///
+/// Callers must ensure that the pointer to the field is in fact a pointer to the specified field,
+/// as opposed to a pointer to another object of the same type. If this condition is not met,
+/// any dereference of the resulting pointer is UB.
+///
+/// # Examples
+///
+/// ```rust
+/// use kernel::container_of;
+/// struct Test {
+///     a: u64,
+///     b: u32,
+/// }
+///
+/// let test = Test { a: 10, b: 20 };
+/// let b_ptr = &test.b;
+/// let test_alias = container_of!(b_ptr, Test, b);
+/// assert!(core::ptr::eq(&test, test_alias));
+/// ```
+#[macro_export]
+macro_rules! container_of {
+    ($ptr:expr, $type:ty, $($f:tt)*) => {{
+        let ptr = $ptr as *const _ as *const u8;
+        let offset = $crate::offset_of!($type, $($f)*);
+        let outer = ptr.wrapping_offset(-offset) as *const $type;
+        // SAFETY: The pointer is valid and aligned, just not initialised; `addr_of` ensures that
+        // we don't actually read from `outer` (which would be UB) nor create an intermediate
+        // reference. The two pointers are within the same allocation block.
+        let inner = unsafe { core::ptr::addr_of!((*outer).$($f)*) };
+        build_assert!(inner == $ptr);
+        outer
+    }}
+}
--
2.43.0

