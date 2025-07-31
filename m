Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A9529CB4A
	for <rust-for-linux@vger.kernel.org>; Thu, 31 Jul 2025 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753951467; cv=none; b=pw8lZmX0gbdQTmZwGu3Yi/yItef7E1OAvWfz0Z2PbwXn3fthKbF57IZp1ya2JkQRbY7zj49M4lqfaloMgYkUtp3rW9/zwaROgbpKwT+QxTrfwcsBlG3d/tqRrya/mMA2Ovq8lDBbof2V2gydexBfXWxUCUAuElsWgxaDM/ZnQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753951467; c=relaxed/simple;
	bh=bFVuyYPTupTdsNR6SgfikzEy7ociTHqKK1CQUADJwLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrowZnZS3Ve/HupO5YQnmMHP8vTpGILNuM4qD4j6vUOKaNDrwGpxDW/rvIp3z2f2EwhdxJkfw3VNHsOKjHEnp2epHaNg9DoaBYGynmi043aG/fyBT9r7sUo9ey5s9Y0Yd551muNQJcbQVM2iQHzR9uEo6YsQraxswol5MnixpQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BFRxb/d6; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BFRxb/d6"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753951463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f2pCbttDSjAd5muBHT70dOAAq3W4ecZNATZh5Ils2oQ=;
	b=BFRxb/d6uhhp0WBtkrptSexcyLCClLB8Dl4HRQ7+QgUG3mwFUjWUNnkTqryq7pUnoVH6w6
	CsYqWV4qpYKgEHC25SSAzbqwStwJNeEDBBaRfpaLeTCwCIr6bGoIDdJOR8ISNGtkSuxa79
	P+wIjQ6V7jPNI48nVeciD/Nikuao1ZA=
From: Hui Zhu <hui.zhu@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	vitaly.wool@konsulko.se
Cc: Hui Zhu <zhuhui@kylinos.cn>,
	Geliang Tang <geliang@kernel.org>,
	Kunwu Chan <chentao@kylinos.cn>,
	David Gow <davidgow@google.com>
Subject: [PATCH v8 1/2] rust: alloc: add alignment tests for allocators
Date: Thu, 31 Jul 2025 16:42:37 +0800
Message-ID: <420a72447bf1947a3d0f2622fe6e22fe2fd0c776.1753950392.git.zhuhui@kylinos.cn>
In-Reply-To: <cover.1753950392.git.zhuhui@kylinos.cn>
References: <cover.1753950392.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hui Zhu <zhuhui@kylinos.cn>

Add unit tests to verify alignment guarantees of Kmalloc, Vmalloc,
and KVmallocallocators. Tests create types with explicit alignment
requirements (128B and 8192B) and validate allocations meet alignment.
Includes two test blobs with custom alignments and helper struct
TestAlignto abstract allocation and alignment checks.

Also updates kvec test macro name from rust_kvec_kunitto rust_kvec
for consistency with other test modules.

Co-developed-by: Geliang Tang <geliang@kernel.org>
Signed-off-by: Geliang Tang <geliang@kernel.org>
Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
Reviewed-by: Kunwu Chan <chentao@kylinos.cn>
Reviewed-by: David Gow <davidgow@google.com>
---
 rust/kernel/alloc/allocator.rs | 56 ++++++++++++++++++++++++++++++++++
 rust/kernel/alloc/kvec.rs      |  2 +-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 63f271624428..a20111b40529 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -184,3 +184,59 @@ unsafe fn realloc(
         unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags, nid) }
     }
 }
+
+#[macros::kunit_tests(rust_allocator)]
+mod tests {
+    use super::*;
+    use core::mem::MaybeUninit;
+    use kernel::prelude::*;
+
+    #[test]
+    fn test_alignment() -> Result {
+        const TEST_SIZE: usize = 1024;
+        const TEST_LARGE_ALIGN_SIZE: usize = kernel::page::PAGE_SIZE * 4;
+
+        // These two structs are used to test allocating aligned memory.
+        // they don't need to be accessed, so they're marked as dead_code.
+        #[expect(dead_code)]
+        #[repr(align(128))]
+        struct Blob([u8; TEST_SIZE]);
+        #[expect(dead_code)]
+        #[repr(align(8192))]
+        struct LargeAlignBlob([u8; TEST_LARGE_ALIGN_SIZE]);
+
+        struct TestAlign<T, A: Allocator>(Box<MaybeUninit<T>, A>);
+        impl<T, A: Allocator> TestAlign<T, A> {
+            fn new() -> Result<Self> {
+                Ok(Self(Box::<_, A>::new_uninit(GFP_KERNEL)?))
+            }
+
+            fn is_aligned_to(&self, align: usize) -> bool {
+                assert!(align.is_power_of_two());
+
+                let addr = self.0.as_ptr() as usize;
+                addr & (align - 1) == 0
+            }
+        }
+
+        let ta = TestAlign::<Blob, Kmalloc>::new()?;
+        assert!(ta.is_aligned_to(128));
+
+        let ta = TestAlign::<LargeAlignBlob, Kmalloc>::new()?;
+        assert!(ta.is_aligned_to(8192));
+
+        let ta = TestAlign::<Blob, Vmalloc>::new()?;
+        assert!(ta.is_aligned_to(128));
+
+        let ta = TestAlign::<LargeAlignBlob, Vmalloc>::new()?;
+        assert!(ta.is_aligned_to(8192));
+
+        let ta = TestAlign::<Blob, KVmalloc>::new()?;
+        assert!(ta.is_aligned_to(128));
+
+        let ta = TestAlign::<LargeAlignBlob, KVmalloc>::new()?;
+        assert!(ta.is_aligned_to(8192));
+
+        Ok(())
+    }
+}
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 92d0ed3f302e..f912a9642969 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1301,7 +1301,7 @@ fn drop(&mut self) {
     }
 }
 
-#[macros::kunit_tests(rust_kvec_kunit)]
+#[macros::kunit_tests(rust_kvec)]
 mod tests {
     use super::*;
     use crate::prelude::*;
-- 
2.43.0

