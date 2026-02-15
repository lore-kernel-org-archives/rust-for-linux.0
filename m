Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A859A1548C;
	Sun, 15 Feb 2026 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771185841; cv=none; b=q1gGpYDQ5UQviQIgBq3W0G+bN2GyXBcDRBfvTCaUp6IBMVsDXA9SzcmPIrHlbq7W56TuZRkYHItlwonz2ao3MNEQ2laDOKrjZoahvaqLKSZbJKhlJRm7VXLX29gH7hE3lP/HNr4wFnjuh9gCTjuxu+LXe1fm55vMBBEQv6Hh8F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771185841; c=relaxed/simple;
	bh=keDSI8hUCY4PU4tsUid9Cm310OHD3rGoQ1qvgeBe3jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cclCoPEaWMziZiqzhskISpiiRVIjYpMVIzjHEqaObagInpWP8oBhyRTNmNKlRaoXDCyv809lbWbBRm0t9hRclnxyAqv/f6MtqolpfP7iTej/Wdo88qp/kOV2Yuj+fUIoTeTaEwi15upeQdMuJD3nqtTDXHcj9dbn0WQ0+W64NXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMXvGZMq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMXvGZMq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADC8C4CEF7;
	Sun, 15 Feb 2026 20:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771185841;
	bh=keDSI8hUCY4PU4tsUid9Cm310OHD3rGoQ1qvgeBe3jw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cMXvGZMqSbb3H1E1orqeKhIgGNemexD7tvGuuZGM6d+budX3QTZ/xHWrKHL+RicO1
	 O/GZwyAX+T2YeaoB6D/AUd6p01xZvXX9algQaaDiTxsjN2BaWVEuD1Odh38HjZoOVw
	 eZAsR+QTUxH7WTw6L+kfRg+LsCO+E0QBAqbt9Btu/ASWzi0iBHW5dHv2EVq1A1/FAh
	 iP3e5TG54b4MULbXWpEqjP8P9zUjLmSLXoFqvjwkhleD3sJ0h8xzC07Iz6okFdGfjw
	 oLPezNnaa2PQvDqRnMWNhuxtmzMtgAFnes/BBG/C6OwCmDjmxgNZKJGLeWfYIK9xPa
	 4O1FM220wvstg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:03:31 +0100
Subject: [PATCH 2/2] rust: page: add method to copy data between safe pages
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-page-additions-v1-2-4827790a9bc4@kernel.org>
References: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org>
In-Reply-To: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=keDSI8hUCY4PU4tsUid9Cm310OHD3rGoQ1qvgeBe3jw=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkiaeYS+HXhpLqK9Z0/QglR/jmX30qpmQQfnyp
 vTsEPxB4tmJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZImngAKCRDhuBo+eShj
 d8HtD/9Gy/trD4chBL3hhYL8hoXvK2+y1y5jO15NehAmZ+QMXdKTXcrtBwBpZLK1Uu71LrEn6sw
 iE0/RqKrzqpqgeVNLOw0JXsOvsZf/opVCS/eTeQguZtLnjhLahQuLHn80309GLeznizxoINX36Z
 gjgKn6OAw5baj0c4zNNP7TR4SIxxDXv0xlOyThEhC7B7ZUPKuAe01KvcHd+nXWkZoWJB4V+GRuW
 fd1Kpia6RPKfas9rC0WNGPJowp3dFDVHkCoIOcVgmBt1YiH0wt3yAiQl96p8ffjbhQPjlU9GUCG
 R+NxYB7M5Flch05oZ30GPYKUQPTbHuW6QHcehx09ZGN1Nu+v7RDpdCEEXqly0jxNfKoAiZ1DQix
 zJxGXGgU758LgUj2UsJ7Nbx/bdkqMqvKidRs2FofEg1EotVC6jRHw/+cfr5DeDOzK0fwrN4SpVL
 BOR6Abn/ojSIktoitVLefg7AJjC/hxyrKlvgBm3gp+WPnFxznw1kgNLRnSr4RJHb9WES6TLcOiE
 Sl9JG5v/pOSLI6UDrYGV9f0kct2QrZcjzxqvvjMuaCjgy5/mRs7u3AVQab31oanPen77jZIQqn+
 n5O7cK6y5a77TtT/QxHKBEVmnwGIbt5he2YU82WgCxAuKx26StqhYeUyxcuXN+//f1mP0zpeBGI
 DAchxpdo3t49o0A==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add `SafePage::copy_to_page` to copy data from one page to another at a
given offset. Because `SafePage` cannot be mapped to user space or shared
with devices, there are no data races and the copy can be performed using
the existing `with_pointer_into_page` and `write_raw` methods.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index af6d2ad408ed7..c780d10bcf909 100644
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
@@ -407,6 +408,38 @@ pub fn alloc_page(flags: Flags) -> Result<Owned<Self>, AllocError> {
         // Since `Page` and `SafePage` is transparent, we can cast the pointer directly.
         Ok(unsafe { Owned::from_raw(page.cast()) })
     }
+
+    /// Copies data from this page to another page at the specified offset.
+    ///
+    /// # Arguments
+    ///
+    /// - `dst` - The destination page to copy data to.
+    /// - `offset` - The byte offset within both pages where copying starts.
+    /// - `len` - The number of bytes to copy.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::page::SafePage;
+    /// # use kernel::alloc::flags::GFP_KERNEL;
+    /// let mut src_page = SafePage::alloc_page(GFP_KERNEL)?;
+    /// let mut dst_page = SafePage::alloc_page(GFP_KERNEL)?;
+    /// src_page.copy_to_page(dst_page.get_pin_mut(), 0, 1024)?;
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn copy_to_page(&self, dst: Pin<&mut Self>, offset: usize, len: usize) -> Result {
+        // INVARIANT: The following code makes sure to not cause data races.
+        self.with_pointer_into_page(offset, len, |src| {
+            // SAFETY:
+            // - If `with_pointer_into_page` calls into this closure, then it has performed a
+            //   bounds check and guarantees that `src` is valid for `len` bytes.
+            // - By type invariant and existence of shared reference, there are no other writes to
+            //   `src` during this call.
+            // - By exclusive ownership of `dst`, there are no other writes to `dst` during this
+            //   call.
+            unsafe { dst.write_raw(src, offset, len) }
+        })
+    }
 }
 
 // SAFETY: `Owned<SafePage>` objects returned by SafePage::alloc_page() follow the requirements of

-- 
2.51.2


