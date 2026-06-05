Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F2F3CFF6C;
	Fri,  5 Jun 2026 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663780; cv=none; b=trrrWaoOe3oJmrpSt+lRgkuuhfCy/VJpqAdnHq75X5UFHpIFUSsGvVN+PDBZ3knjqpKICknxsTv04rfq0SWYED8iinVmXqzUw/taPncDnLDMS+gMgqBMcvy0w1nQrMFSX19H1nDfCcr5To4WkAFhBqtlRQVPhqqri5bb+RJakA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663780; c=relaxed/simple;
	bh=dzp6cOSqfyflttG0MeQMpzGj5B+SlllJR/JvQBXauF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwAzd3bBB82dRJbnlDaT/Jp6AjtlKO5poSUExB0tDc4sJ7WsgGw/UJ3TqkKiXB7du36ymPtBzYbfV0Xz6Fkc/NDVOx497BBZCLkUdaonf9HPuP3hGJlk4DHPpjanrxyLDnxYeILXn5hLfhMzaFUC3aUNb5+ttQAkywlXOmsAw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCC93ulo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCC93ulo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10051F00899;
	Fri,  5 Jun 2026 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780663779;
	bh=j747jOREbIkvFsg/aHzSYOHlVF+tB6wBTmNCEvHgfnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lCC93uloqOF6Saw4qFLkFpI/H4rGKgYjI51PNWwxmotH8za1SoVm56NPQqTXeY7/2
	 ne0HYAGSfgKUAraTPThkkiJKcsyK3eo90LhQ1idfdBtxgA9hwA7Ji3DP4YuNjpiie4
	 D7ULucSlvem2NtX+aAdW1OjdvVQdykCaoRtvFVpEs04KRc1WGTN189VhaU6XwitOSU
	 mgUT+o8ojnPwq5ye5vLfi0/Xb2wSlyTf2rqQRGVHbUT+dutEWrRKtvILXIZEg7hNFd
	 AajWgDpq40hmDymOTPaj4r0qs36S6g059nwsqXKvxUxfmBlt0XrdccdVv4E9Hfml4W
	 +HVn+kYY9ONcA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 14:49:15 +0200
Subject: [PATCH v2 2/2] rust: page: add method to copy data between safe
 pages
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-page-additions-v2-2-03f04c8fdbbf@kernel.org>
References: <20260605-page-additions-v2-0-03f04c8fdbbf@kernel.org>
In-Reply-To: <20260605-page-additions-v2-0-03f04c8fdbbf@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3310; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=dzp6cOSqfyflttG0MeQMpzGj5B+SlllJR/JvQBXauF8=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIsXPwpB4FTMvmdQ+DkEJMq1tlEwRJQ/YlCbJg
 EfQD8YbWNOJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLFzwAKCRD6UCkIqsW9
 0IwqD/9kbmi0nAXUhpyZgyZPFjcP242UtyBBoopaXPnPhF7rf8pCj6WUmqGhbm4Q1qUYj3KueeY
 82yfgiSPhEWM2JNNVDwfBAN4e98UQDMRKw6Kv7IgXnk0XLh93TYmUKl/gxJBvJuDmqfJ8it63r4
 jBmNdGkw608QaFXnUloqPKJ9TB7LLo55kQzeSqwexJ1eNRj38rt3Hnh6+ziOF08KuCHjxrJ2vGq
 zDd7l36PLd139G7vEbvWwfjDgu+mXs9CktjRuoC4xyjf/qirnfi64PFHsRLPDb8LaKvcQSpMZJm
 wp4IZCWZmllxSEj9QvAlbup+7aLjUQFhF3nr/UepEikqdXbHWddCNWrYvtUcytaZHh8nSw5oeVF
 z02cvlo67msFQ1ten/H5E/OxB7imEn41OEU5EWs7NsK78baW7sskoqlEhGwwEZOVE5ZB18Sjbdb
 aGDReVZgJsoOqzVwPBooFvJOm/QUpgGYUE+wuscrF28+y7jU57zWD/W9Up7pclit3ObfWbDMsT9
 hsDUaqK884CSWo46BzaeOZQoeptZ1DwSIjwINW0ts5LGFBlTt8U9FZAA1DYThGaSm2k6ctusbL8
 SHVS0JSxHWDUvQNqB/JGVAnQBsa8/TavOFKCWiYqQbUS2cFlRu97C0YUa97wVnFffojf08mCu7D
 ubZxxW+0Krag5bw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add `SafePage::copy_to_page` to copy data from one page to another at a
given offset. Because `SafePage` cannot be mapped to user space or shared
with devices, there are no data races and the copy can be performed using
the existing `with_pointer_into_page` and `write_raw` methods.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index f143b42d1bd6..2307e1f06360 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -23,6 +23,7 @@
     marker::PhantomData,
     mem::ManuallyDrop,
     ops::{Deref, DerefMut},
+    pin::Pin,
     ptr::{
         self,
         NonNull, //
@@ -427,6 +428,53 @@ pub fn alloc_page(flags: Flags) -> Result<Owned<Self>, AllocError> {
         // `Page` and `SafePage` are transparent, we can cast to the raw page pointer directly.
         Ok(unsafe { Owned::from_raw(page.cast()) })
     }
+
+    /// Copies `len` bytes from this page to `dst` at the specified byte offset.
+    ///
+    /// Copying starts within both pages at the same offset.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::error::code::EINVAL;
+    /// use kernel::page::{SafePage, PAGE_SIZE};
+    ///
+    /// let mut src_page = SafePage::alloc_page(GFP_KERNEL)?;
+    /// let mut dst_page = SafePage::alloc_page(GFP_KERNEL)?;
+    ///
+    /// let data = [0xdeu8, 0xad, 0xbe, 0xef];
+    /// // SAFETY: `data` is valid for reading `data.len()` bytes, and `src_page` is exclusively
+    /// // owned, so there is no concurrent access to its data.
+    /// unsafe { src_page.write_raw(data.as_ptr(), 0, data.len())? };
+    ///
+    /// assert!(src_page.copy_to_page(dst_page.as_pin_mut(), 0, data.len()).is_ok());
+    ///
+    /// let mut buf = [0u8; 4];
+    /// // SAFETY: `buf` is valid for writing `buf.len()` bytes, and `dst_page` is exclusively
+    /// // owned, so there is no concurrent access to its data.
+    /// unsafe { dst_page.read_raw(buf.as_mut_ptr(), 0, buf.len())? };
+    /// assert_eq!(buf, data);
+    ///
+    /// // A copy that would extend past the end of the page fails with `EINVAL`.
+    /// assert_eq!(
+    ///     src_page.copy_to_page(dst_page.as_pin_mut(), 0, PAGE_SIZE + 1),
+    ///     Err(EINVAL),
+    /// );
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn copy_to_page(&self, dst: Pin<&mut Self>, offset: usize, len: usize) -> Result {
+        // INVARIANT: The following code makes sure to not cause data races.
+        self.with_pointer_into_page(offset, len, |src| {
+            // SAFETY:
+            // - If `with_pointer_into_page` calls into this closure, then it has performed a
+            //   bounds check and guarantees that `src` is valid for `len` bytes.
+            // - By type invariant and existence of shared reference, there are no writes to
+            //   `src` during this call.
+            // - By exclusive ownership of `dst`, there are no other writes to `dst` during this
+            //   call.
+            unsafe { dst.write_raw(src, offset, len) }
+        })
+    }
 }
 
 impl Ownable for SafePage {

-- 
2.51.2


