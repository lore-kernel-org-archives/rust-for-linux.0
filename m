Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493592D0298
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349157; cv=none; b=GlSrRBmxyD3CNhXO5AJ+jxtmLS9xZc7+EusQ4rlz4rLNOgQrcCeZJgesmL6i3E3//rPT3A/kt3psCynZHNI3rv1pCuV+aNXb19SzA4OxA2f8xuGql9cl5HrcWdqUIuFWkLRRoR77dFwEyDz9vR9Gyt+M66DTWIOeiEqCexkhSlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349157; c=relaxed/simple;
	bh=CdaYOnb1fT0dOSjxWvCijusOmY1anMO+IiPPIZ2HYKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Laim6i3dPHGGgFaf5ap5jjruPlB+Tl8gGJKV49brEibCSiItMadrZ8JUmAR56fQj4A2GDLEJMoshWEyaBJxxRzvvXBsMhWKbHT3b+nydbpCqLiNJYHLMP8WteO0+utsouQSufE2NK408krnk+85H3D0iunWEvoB2CIiOX2gEeTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=afGEQALB; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="afGEQALB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753349152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aclP+/7iJas2ebXPYU6OTuB0cYx+hB/y7RGCUOBq25M=;
	b=afGEQALBgX7XgFeC04pt3kJPDmJBrS2iDh7FMqMppO0s8lscq5Ad8msLEDQKIc3HKxTWZC
	Soidzmh0eHwpz9CUwcnRbRFZ4x0wReHnfKLTN0W13FUPo4EiJo0HO4KH5AQmj0RkdLGRNi
	nlpzErsaCjd3FqAA8YL4U/LfdGs32oo=
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
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>,
	Geliang Tang <geliang@kernel.org>
Subject: [PATCH v4 1/2] rust: allocator: add unit tests of kmalloc, vmalloc and kvmalloc
Date: Thu, 24 Jul 2025 17:25:34 +0800
Message-Id: <32d7663b7d07d13564bdfb6a1ec4cde1be8b8f80.1753348867.git.zhuhui@kylinos.cn>
In-Reply-To: <cover.1753348867.git.zhuhui@kylinos.cn>
References: <cover.1753348867.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hui Zhu <zhuhui@kylinos.cn>

Add KUnit test cases to validate the functionality of Rust allocation
wrappers (kmalloc, vmalloc, kvmalloc).

The tests include:
Basic allocation tests for each allocator using a 1024-byte Blob
structure initialized with a 0xfe pattern.
Large alignment (> PAGE_SIZE) allocation testing using an 8192-byte
aligned LargeAlignBlob structure.
Verification of allocation constraints:
- kmalloc successfully handles large alignments.
- vmalloc and kvmalloc correctly fail for unsupported large alignments.
Content verification through byte-by-byte pattern checking.

Co-developed-by: Geliang Tang <geliang@kernel.org>
Signed-off-by: Geliang Tang <geliang@kernel.org>
Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
 rust/kernel/alloc/allocator.rs | 57 ++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index aa2dfa9dca4c..430d1f664fdf 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -187,3 +187,60 @@ unsafe fn realloc(
         unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
     }
 }
+
+#[macros::kunit_tests(rust_allocator_kunit)]
+mod tests {
+    use super::*;
+    use kernel::prelude::*;
+
+    const TEST_SIZE: usize = 1024;
+    const LARGE_ALIGN_TEST_SIZE: usize = kernel::page::PAGE_SIZE * 4;
+    #[repr(align(128))]
+    struct Blob([u8; TEST_SIZE]);
+    // This structure is used to test the allocation of alignments larger
+    // than PAGE_SIZE.
+    // Since this is not yet supported, avoid accessing the contents of
+    // the structure for now.
+    #[allow(dead_code)]
+    #[repr(align(8192))]
+    struct LargeAlignBlob([u8; LARGE_ALIGN_TEST_SIZE]);
+
+    #[test]
+    fn test_kmalloc() -> Result<(), AllocError> {
+        let blob = KBox::new(Blob([0xfeu8; TEST_SIZE]), GFP_KERNEL)?;
+        for b in blob.0.as_slice().iter() {
+            assert_eq!(*b, 0xfeu8);
+        }
+
+        let blob = KBox::new(LargeAlignBlob([0xfdu8; LARGE_ALIGN_TEST_SIZE]), GFP_KERNEL)?;
+        for b in blob.0.as_slice().iter() {
+            assert_eq!(*b, 0xfdu8);
+        }
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_vmalloc() -> Result<(), AllocError> {
+        let blob = VBox::new(Blob([0xfeu8; TEST_SIZE]), GFP_KERNEL)?;
+        for b in blob.0.as_slice().iter() {
+            assert_eq!(*b, 0xfeu8);
+        }
+
+        assert!(VBox::<LargeAlignBlob>::new_uninit(GFP_KERNEL).is_err());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvmalloc() -> Result<(), AllocError> {
+        let blob = KVBox::new(Blob([0xfeu8; TEST_SIZE]), GFP_KERNEL)?;
+        for b in blob.0.as_slice().iter() {
+            assert_eq!(*b, 0xfeu8);
+        }
+
+        assert!(KVBox::<LargeAlignBlob>::new_uninit(GFP_KERNEL).is_err());
+
+        Ok(())
+    }
+}
-- 
2.43.0

