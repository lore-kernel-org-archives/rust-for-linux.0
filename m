Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6443203B7
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701700; cv=none; b=M286GQCTF8CwjBkN2qkhq0rUrqpRbbo9C+CTh8lNiYDkb+b0OCoGQNcw4HngdEVy6vEkPZKexEY99nnT5FRU6da6PoQtBkqqVF/JggKMSzWSlpnOU2VZhSMJii9M5I79788nyAm6yWhhaEYXvyRrD1uDcwf+1GTFKQCtYPWEsRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701700; c=relaxed/simple;
	bh=sue36pE+CqYYo58Lb83BNtLDKuqbKL3Mc+bZnC3ZFvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLFevlYaQM6idsjdZ8BIMKL4gbmdLV+XdBEwPPW2/LKbLx4Elk7f9YbaPx3K7pFRdOII9fFKlFcAHMi/YnIHTGGuUqqKt8FmjAmOBH2T+teZ+ToagRaFZs9DwG1D5tRgvzNTh2JUJxUwbh9MkneXXMo2JmwXKdeF8MgJ9mORGxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rugya7T3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rugya7T3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC228C113CF;
	Wed, 20 Aug 2025 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755701700;
	bh=sue36pE+CqYYo58Lb83BNtLDKuqbKL3Mc+bZnC3ZFvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rugya7T3pVD1iDaoeT5IgZdrBdyha+e7CiXUNJCeqVfU3e8/FgF6oKnDKJIIjhrio
	 QmLbqsS40Gname+ofKatwqQXkCQjWKPFYT9IR/bxB7RePdPykRGAXk1nHrUoA2/4IG
	 MXPo918IHMQbnQMDmGZQCTOs4bO23DBxnlAZpQcbBC+RLKGOJ2wOE8GoDjEH8aQnfQ
	 f/0cnx7oz9g8anpmIn47kg/63+U7PflnxZJl7pUPLpCTyyE2p3ArHTB+jTe1eAzVjA
	 0E6ExHed93hvUcCuyBW52LJlD1Dipre9+r0xGsZct6NeplSn+u6b3fz3snRKt2RTrJ
	 JgL5pM35K1K/w==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v5 4/7] rust: page: define trait AsPageIter
Date: Wed, 20 Aug 2025 16:53:40 +0200
Message-ID: <20250820145434.94745-5-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820145434.94745-1-dakr@kernel.org>
References: <20250820145434.94745-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AsPageIter trait provides a common interface for types that
provide a page iterator, such as VmallocPageIter.

Subsequent patches will leverage this to let VBox and VVec provide a
VmallocPageIter though this trait.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/page.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 631718a6ad7d..75ef096075cb 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -103,6 +103,18 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+/// Trait to be implemented by types which provide an [`Iterator`] implementation of
+/// [`BorrowedPage`] items, such as [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
+pub trait AsPageIter {
+    /// The [`Iterator`] type, e.g. [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
+    type Iter<'a>: Iterator<Item = BorrowedPage<'a>>
+    where
+        Self: 'a;
+
+    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all pages owned by `self`.
+    fn page_iter(&mut self) -> Self::Iter<'_>;
+}
+
 /// A pointer to a page that owns the page allocation.
 ///
 /// # Invariants
-- 
2.50.1

