Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A4F158D89;
	Tue, 23 Jul 2024 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721758270; cv=none; b=OMiMUkIxs0H5qXv4VC+dUzZhqmnJOzMVbkD9/kPu5eLrgXlwcVzj4l/JCQD4jo2Y4aoQQeDuMFyCdKPeKqMik6a+vzkbBnmSQXjfIU+ZeKOrAOHUxrLgH6D/RPwRn89Vu7BmELXrG1fWs3oQynKVkJPLdsqCAPpisvDQuvVf8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721758270; c=relaxed/simple;
	bh=aW/HcnaSGCL2MNKjQfZpCrQAc7Fxs7Kovj68XjWpzPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrCerJ4bjHyY1yTDUxNVEZUkW+PcMruupOxdy31LHtl729TP329xwiEkjf2lGAwTopxaURffAnJarBiD2vTd+AlKK53CdTcmY+rVyuqJerkAxelbwFuOkJ7k0oAtKAQT4XgDTzqyTAyAa/WrwS/0FG2gtNMjksTiR2RWVrENUII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pV5PaiY/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pV5PaiY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC38C4AF11;
	Tue, 23 Jul 2024 18:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721758270;
	bh=aW/HcnaSGCL2MNKjQfZpCrQAc7Fxs7Kovj68XjWpzPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pV5PaiY/63emituIHzEnCO4VEz5GBfDbCAwoMiSL7V6F2fKJYGO3Ayta7xK+BINIo
	 ++51BxK7YS8+MqjyMdAiqWw3C4CHDV03TvVfp/djhbhMXimXjwKUXgKvBCG6+vMcuh
	 XO7IrMkvHarKPe7FVVOdV5+epZ2974/DV75/rf/HBqBO2RI9Hz32cijHnkVlOwiSyB
	 z68SncMnBkPvYgKFP4ymd9QDQlI/2EmevlcqVdqHThKTi/TFFqVYchGFtSOaPUtEcV
	 /o7P6GDKwKWe1fIh1d5nMfeArdPSUAS6sp5sDmSLHHCykw5l8SEQNHk4Rz22zrF4+A
	 jtX5QvdKRjr9A==
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
Subject: [PATCH v2 03/23] rust: alloc: rename `KernelAllocator` to `Kmalloc`
Date: Tue, 23 Jul 2024 20:09:52 +0200
Message-ID: <20240723181024.21168-4-dakr@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723181024.21168-1-dakr@kernel.org>
References: <20240723181024.21168-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subsequent patches implement `Vmalloc` and `KVmalloc` allocators, hence
align `KernelAllocator` to this naming scheme.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/allocator.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 6e133780a4a1..10774c51ae26 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -6,7 +6,7 @@
 use core::alloc::{GlobalAlloc, Layout};
 use core::ptr;
 
-struct KernelAllocator;
+struct Kmalloc;
 
 fn aligned_size(new_layout: Layout) -> usize {
     // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
@@ -39,7 +39,7 @@ pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: F
     }
 }
 
-unsafe impl GlobalAlloc for KernelAllocator {
+unsafe impl GlobalAlloc for Kmalloc {
     unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
         // SAFETY: `ptr::null_mut()` is null and `layout` has a non-zero size by the function safety
         // requirement.
@@ -75,7 +75,7 @@ unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
 }
 
 #[global_allocator]
-static ALLOCATOR: KernelAllocator = KernelAllocator;
+static ALLOCATOR: Kmalloc = Kmalloc;
 
 // See <https://github.com/rust-lang/rust/pull/86844>.
 #[no_mangle]
-- 
2.45.2

