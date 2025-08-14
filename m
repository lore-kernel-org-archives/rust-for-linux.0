Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419B52ECE9E
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164093; cv=none; b=mcfWDgobc3ZXpM5ojBfj1gWz+Y5ghxvsegpqwxWxGbY/KCElTGeTOwA2NGSMP87T6vHvrzNCEeE2o8Wj+pXH3K4JeA3MJNM/J0EZsimHA4hk85GCTH9NPG06yI6GZZ4XodPp8gcsYVju6WQfsyczgHvg2BxwsOjEY7H0gTsriNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164093; c=relaxed/simple;
	bh=A3zVtoXD0mZSTiO0IBZ8OVeQEuOavPeDWy0lpJR6enM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaKmDinF49M9G7Yl72Km+hhFBq2ze5OVB1wsteyeAnWzvU72V8kgsNm+gZPLlj9TecsTfRdzJ+5xdzgCrLyyFXQD4aPwvc3vV2p8qc2pEr5xdoioM01dT2omHR90LJqf0s6so3IOho869CpVRAKr2lw4cumLCRWNjMMh5/5hbB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4DGPpll; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4DGPpll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6FAC4CEED;
	Thu, 14 Aug 2025 09:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755164092;
	bh=A3zVtoXD0mZSTiO0IBZ8OVeQEuOavPeDWy0lpJR6enM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J4DGPpllsXEcJzhOJqKgqYgkArURawyWkzhu/FoykVkxBwnBCxYlC2yyYsI1l6J4S
	 sNDj03lGEbZ9aBtViqtzhVLSBbfEEfEXagZ9RdbnWWK11fDlp1Zc65rnSSe4+MvnYN
	 zppNf5rcMMhAZXV0Pphxso/NrtPhBoIMGGlfxgDm/a9yKp3DHqrTUGk3Hk6mqtXRHw
	 nLt0QtBhoWwAghsPWkoLrnKR+cq0jb+sSho7l+4rhddMnUow+CRIkKDflOi+tExsXY
	 1HBj60zTtZ6sl0hVh4LurwoaqEMxZRQLvs2z4LdVdlO9X0AylM8MN1b+soIYgJxj3u
	 2lLB/VLzS2rgg==
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
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 4/7] rust: page: define trait AsPageIter
Date: Thu, 14 Aug 2025 11:33:43 +0200
Message-ID: <20250814093427.19629-5-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814093427.19629-1-dakr@kernel.org>
References: <20250814093427.19629-1-dakr@kernel.org>
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

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/page.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 631718a6ad7d..8c5022c20472 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -103,6 +103,18 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+/// Trait to be implemented by types, which provide an [`Iterator`] implementation of
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

