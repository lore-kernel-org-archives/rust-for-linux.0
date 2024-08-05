Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8735A13CFAA;
	Mon,  5 Aug 2024 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722871231; cv=none; b=TXhBDtl6NqO04+8A/L4hbF6QSt3hPBOI61TTBxqeV8TikOPqVTz6smzkMXxhckAzOkvKOi59296AkiMKOW4NOEp798gkYA/ZHfuruhYj+ACyIta6reIjmrDPEPdwIYWmxyowA8a1ArK+N7lxNfNouDt/KHyON0f+2DYJYAkQUac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722871231; c=relaxed/simple;
	bh=OtT50VkQ4IhBDfNNG3JPXaxsaB7mAc0R/AyuRkhis70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GFghPahH0bfg846IIP0UUE0ZDTIQ6U2sApd4XFyAclQT2bqRfXFsQCW1wbShKzIQI4KxyAQDkLhXMELwH+04fcMngvGQw3mVSXknR0GIdH7n6P84A1X6Vvjl/NnhdBG4ljfFx9U4H4U5HB46axVX2suKkXHyX7Z77Dxle/vG+4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAEFhR9a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAEFhR9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AE8C4AF10;
	Mon,  5 Aug 2024 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722871229;
	bh=OtT50VkQ4IhBDfNNG3JPXaxsaB7mAc0R/AyuRkhis70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DAEFhR9aVevAgqQ6ElgV7Cw56P/HwNiDuiiitRoBj9UULByi45M7SLaTEVX68yLmV
	 cjn4/P0ycimIRj27eLfZXkyB/YZuTg2IiwHFXQYw2pc02ImwN2/hwReybehcWo5NQm
	 Nk1muDVH1Iey7GlX6fYVgMS55urQaTDSBArGzS5Xws58PEdKZFHHS4+7e88i2wfgU5
	 vCGS0oDPXlR3Bzx/VKH7n16V/KuUiVLF+GS2ldj6mdojwW5fa5Wz/hhvYcyOHnlrw7
	 q8jpo71RaebkuQPg8UrUT6y6eJEL+jwkelqbO27EsFg5UIXz5QZPEWviuJgkEctN5M
	 RtGhnHltjm3Iw==
From: Danilo Krummrich <dakr@kernel.org>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	akpm@linux-foundation.org
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
	linux-mm@kvack.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 03/28] rust: alloc: rename `KernelAllocator` to `Kmalloc`
Date: Mon,  5 Aug 2024 17:19:22 +0200
Message-ID: <20240805152004.5039-4-dakr@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805152004.5039-1-dakr@kernel.org>
References: <20240805152004.5039-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subsequent patches implement `Vmalloc` and `KVmalloc` allocators, hence
align `KernelAllocator` to this naming scheme.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/allocator.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index e7b7eba84acb..2c1eae25da84 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -6,7 +6,7 @@
 use core::alloc::{GlobalAlloc, Layout};
 use core::ptr;
 
-struct KernelAllocator;
+struct Kmalloc;
 
 /// Returns a proper size to alloc a new object aligned to `new_layout`'s alignment.
 fn aligned_size(new_layout: Layout) -> usize {
@@ -40,7 +40,7 @@ pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: F
     }
 }
 
-unsafe impl GlobalAlloc for KernelAllocator {
+unsafe impl GlobalAlloc for Kmalloc {
     unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
         // SAFETY: `ptr::null_mut()` is null and `layout` has a non-zero size by the function safety
         // requirement.
@@ -76,7 +76,7 @@ unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
 }
 
 #[global_allocator]
-static ALLOCATOR: KernelAllocator = KernelAllocator;
+static ALLOCATOR: Kmalloc = Kmalloc;
 
 // See <https://github.com/rust-lang/rust/pull/86844>.
 #[no_mangle]
-- 
2.45.2

