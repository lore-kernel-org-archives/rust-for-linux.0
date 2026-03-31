Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2585C3A4508
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983948; cv=none; b=GqqLWFBFX6XddwqIS/HfFIpuoisSrF5xNKES9bWbDKvKdUtMMFCGOsb/HAj7hhDnQbPRbItJUPgIGro2d/ocofnOSsZbdki7jUzODb1/mI/iOQK10CAimFdbJ3Y9DNkFeL3CgrEWOit6b9O+dw1Hd6ioIm36krA2jHM6offP7u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983948; c=relaxed/simple;
	bh=ZX+/LsC+Lp/DEuRDEROysd6gbxaOz0IUwRkSiddOmtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cg6S2GuU7SnZJa3KAspow64BnRCETMVstNP448mhu/Euo8i7LSpHOOsbgLblKua2IqiHVQBuJUhZ+MozNl6MsPphzRZxE1m/cJkMuj4e3nM/fUjHrV4fVSZWTNs91fLzoAdjNwFZjXK8frzxHdNX0eau/OBYZMu4txgpvdN5KMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=H/Chynj1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ux68beUG; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="H/Chynj1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ux68beUG"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7F3607A01CB;
	Tue, 31 Mar 2026 15:05:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 31 Mar 2026 15:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983946; x=
	1775070346; bh=dgY+Le8qa/tgWroy2xZXTvDkOkD9vho7cRR1FzwxB6c=; b=H
	/Chynj1daovDNv8L4tZLMxJvQS2jlyI1rOWGMetjMvJXNqfIHFuyo+bZFHExZGI3
	LjbNpe6Qy1F0ilgpfY6sQmRGEPhz0D/LjDDl4OF1Iz2iHIHvxfbIOy0HBWxbvBuB
	FewITvH9iwonN1jtUKWyJ25LJ+osKQ+KCZS3xnCOhNNw/BaOvqlV9N8CE0PuC7BO
	6/oIOf2z58CUzu3Tv45qm5Nm9XsAvpwz4OzxZ7rWHbZTmTwNGcmIG2EPpgby1Fld
	UrIcrVRZQMxmh1k2PKKXfK1F45yDH+Vg9mendE/xIvTOosJhRmTKg7trcKDRapFP
	ckbF0tUbuBfGWS3Ot+1Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983946; x=1775070346; bh=d
	gY+Le8qa/tgWroy2xZXTvDkOkD9vho7cRR1FzwxB6c=; b=ux68beUG0Fodf5KEw
	gU/7ifaAQLeQ3gK2knlHSkAhC9BxhDVuq1SG9eL9HB20jt2BQtscs2UZrtSsblE1
	5QUlf7MsXzddgOj/J7S/7KIk0fLyb+dh29XGD5LITtxE2aoAz4cqlA6A1iyg2zx5
	zlec0Focg2CTglJT+b7JKoq6WrjEjtdvCfZNH60sBz4s2EBbsG12IpUMI/0FBnQE
	M0Rc9V9Sb5shsJSO6utDcngekwT1ptk5UHrga/qSMry4+a68GGAXAOkq5dRrVmvK
	4TqdWrp7EsHjsV/w0X6H5gzE9FeRcpopT7JU4Qon95jSqW7APv7aesDpyUMc8XYo
	bauKQ==
X-ME-Sender: <xms:ChvMaYLrZA0jYbu8KwRp7bqsVUAnAfa0EzeAsYLuiRWW7at2Tou8Dw>
    <xme:ChvMafLSlZqi8YOOqX0Eis20-bBwOy15p2g7t6WFjGYQUkixzGhryz85dlTifsj23
    yudlQ9YlVBR8DHidDlur7GbDn6jzB136VDoiTN3WeG-wIRP3BT40Lk>
X-ME-Received: <xmr:ChvMadtKUi77xJX-PR7X7I8QLGv28S8aW_NZzUDidrfGM1j13nd6IFuIPOa7EnrB7t-kKSXAbf_VWxFWU5UkwPym91S0x2iXn2N2HXbiDRDPgmKd1P8DK3wTI8Q4bkgcTKUzEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgv
    ihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrth
    htvghrnhepueffveetfeehkedufeekjeeutdffkefgtdfgfeehffeikeefuedtkedtvdet
    ieelnecuffhomhgrihhnpehruhhsthdqlhgrnhhgrdhorhhgpdhlvghnrdhmrghpnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrvhhiuges
    rhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehtvghgsehjkhhlmhdrnhhopdhrtghpthhtohepohhjvg
    gurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesrhgvrggurghhvggr
    ugdrvghu
X-ME-Proxy: <xmx:ChvMaUSvTm2Mfmn7gVh5r7HT6zCTh11XrKerKq_nut__l1CR5u73Tg>
    <xmx:ChvMabPt6HPwcjiT1fIiMYWZf3-n9X1ZNJstrXv-L6SSeNnyjpCFoA>
    <xmx:ChvMaRZVVklKVCDjU_S9uWpakORTYyv8bpnqCW7n-LsMYkdG_QcMkw>
    <xmx:ChvMadwRZ9YYVScDMZpdYrpaLpFceXAqa4FK_yKoUcyH2VFKTVi8Ag>
    <xmx:ChvMae6YAMO641JhthdfS2_dEpdD-eETI6LtlLoCbhVtVMVKc-PMRsI6>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:44 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 03/16] rust/alloc: add Vec::into_boxed_slice()
Date: Tue, 31 Mar 2026 21:02:55 +0200
Message-ID: <20260331190308.141622-4-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331190308.141622-1-david@readahead.eu>
References: <20260331190308.141622-1-david@readahead.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add `Vec::into_boxed_slice()` similar to
`std::vec::Vec::into_boxed_slice()` [1].

There is currently no way to easily consume the allocation of a vector.
However, it is very convenient to use `Vec` to initialize a dynamically
sized array and then "seal" it, so it can be passed along as a Box:

    fn create_from(src: &[T]) -> Result<KBox<[U]>, AllocError> {
        let v = Vec::with_capacity(n, GFP_KERNEL)?;

        for i in src {
            v.push(foo(i)?, GFP_KERNEL)?;
        }

        Ok(v.into_boxed_slice())
    }

A valid alternative is to use `Box::new_uninit()` rather than
`Vec::with_capacity()`, and eventually convert the box via
`Box::assume_init()`. This works but needlessly requires unsafe code,
awkward drop handling, etc. Using `Vec` is the much simpler solution.

[1] https://doc.rust-lang.org/std/vec/struct.Vec.html#method.into_boxed_slice

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 rust/kernel/alloc/kvec.rs | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae8..b8b0fa1a7505 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -733,6 +733,73 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
         }
         self.truncate(num_kept);
     }
+
+    fn shrink_to_fit(&mut self) -> Result<(), AllocError>  {
+        if Self::is_zst() {
+            // ZSTs always use maximum capacity.
+            return Ok(());
+        }
+
+        let layout = ArrayLayout::new(self.len()).map_err(|_| AllocError)?;
+
+        // SAFETY:
+        // - `ptr` is valid because it's either `None` or comes from a previous
+        //   call to `A::realloc`.
+        // - `self.layout` matches the `ArrayLayout` of the preceding
+        //   allocation.
+        let ptr = unsafe {
+            A::realloc(
+                Some(self.ptr.cast()),
+                layout.into(),
+                self.layout.into(),
+                crate::alloc::flags::GFP_NOWAIT,
+                NumaNode::NO_NODE,
+            )?
+        };
+
+        // INVARIANT:
+        // - `layout` is some `ArrayLayout::<T>`,
+        // - `ptr` has been created by `A::realloc` from `layout`.
+        self.ptr = ptr.cast();
+        self.layout = layout;
+        Ok(())
+    }
+
+    /// Converts the vector into [`Box<[T], A>`].
+    ///
+    /// Excess capacity is retained in the allocation, but lost until the box
+    /// is dropped.
+    ///
+    /// This function is fallible, because kernel allocators do not guarantee
+    /// that shrinking reallocations are infallible, yet the Rust abstractions
+    /// strictly require that layouts are correct. Hence, the caller must be
+    /// ready to deal with reallocation failures.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::<u16>::with_capacity(4, GFP_KERNEL)?;
+    /// for i in 0..4 {
+    ///     v.push(i, GFP_KERNEL);
+    /// }
+    /// let s: KBox<[u16]> = v.into_boxed_slice()?;
+    /// assert_eq!(s.len(), 4);
+    /// # Ok::<(), kernel::alloc::AllocError>(())
+    /// ```
+    pub fn into_boxed_slice(mut self) -> Result<Box<[T], A>, AllocError> {
+        self.shrink_to_fit()?;
+        let (buf, len, _cap) = self.into_raw_parts();
+        let slice = ptr::slice_from_raw_parts_mut(buf, len);
+
+        // SAFETY:
+        // - `slice` has been allocated with `A`
+        // - `slice` is suitably aligned
+        // - `slice` has an exact length of `len`
+        // - all elements within `slice` are initialized values of `T`
+        // - `len` does not exceed `isize::MAX`
+        // - `slice` was allocated for `Layout::for_value::<[T]>()`
+        Ok(unsafe { Box::from_raw(slice) })
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
-- 
2.53.0

