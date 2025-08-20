Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B503203B5
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701685; cv=none; b=OheC/+OO3uWlkIBKk8YF/ddSb4JukDhiiMzE9YcqCOcqJXA7xpyT76zWPDC0SQBWweEj9Idx3Yoiix5Rxn2UY8wwlpYibAnegkw4KeoiF09qd59tY11EVDr4TIVQ3xEE+H78euGRclDhUdhVRkFr+RPa+ltGiirODkGs32qhxN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701685; c=relaxed/simple;
	bh=CmaXhcClyXaHryH353w70ckYW/lIC/QWJ7meZuU37B0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ggXDJXbjYfsmaG2xqd+6mx+t24VKqJBpXhJZTSdyqz6eWFO3O5JdLSEj3bNDHtDDBki/B/flw6oeUJ24b4SZNfIJl3M1yqR2owziZ/cU9XTpP2ZyTsST74E+CrV4w3wLTuuqs2OYWnvEnRH9en8IdvL28TpBA4XEiywRsptmANY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyW/7Sz0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyW/7Sz0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09DDC4CEEB;
	Wed, 20 Aug 2025 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755701685;
	bh=CmaXhcClyXaHryH353w70ckYW/lIC/QWJ7meZuU37B0=;
	h=From:To:Cc:Subject:Date:From;
	b=UyW/7Sz0m7jRCv7NKWhFEdjvWo7+6XRJ/e2a4gTrAK99/xl1u1uho9QqcP9cMP6Ld
	 mJS3QzBvcV4ae6KPcxqczKkledALhbcbt6RRNziWoxtcTCNafSo4JjXHb9Cs0quVTV
	 7/ma1cqE5WwHakY3rNGjNR+O6cbE+xEmSdi39zng0WDl1aAvSUPzueUqqBJQOuxc9V
	 FdgYAxT8BU8CIbtLACTqEhP5fJ9pif/dafbSLsIjQQOFZ5PaiRPbp8ZpWetB18fdrk
	 uKEeII0juOZGhstq80Bd9kRBdggUO6vkbpxagUiKGtiON5oxLmCo4i6kRb6r/XKjt/
	 d+kdnLOb1Mtog==
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
Subject: [PATCH v5 0/7] BorrowedPage, AsPageIter and VmallocPageIter
Date: Wed, 20 Aug 2025 16:53:36 +0200
Message-ID: <20250820145434.94745-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series implements the BorrowedPage type, the AsPageIter trait and
VmallocPageIter type.

AsPageIter can be implemented by any type that owns pages to allow users to
borrow them through a generic interface.

For instance, this is useful to access and borrow the backing pages of
allocation primitives, such as Box and Vec, backing a scatterlist.

Hence, implement AsPageIter for VBox and VVec.

Additionally, implement Vmalloc::to_page() and ArrayLayout::size(), which are
dependencies of the above.

Changes in v5:
  - Avoid repetition in commit message of "rust: alloc: implement
    VmallocPageIter".
  - Change invariants of VmallocPageIter to:
    - `buf` is a valid and [`page::PAGE_SIZE`] aligned pointer into a
      [`Vmalloc`] allocation.
    - `size` is the number of bytes from `buf` until the end of the [`Vmalloc`]
      allocation `buf` points to.
  - Inline some methods of VmallocPageIter.

Changes in v4:
  - Rename IntoPageIter into AsPageIter.
  - Put lifetime on AsPageIter::Iter instead of AsPageIter itself.
  - Implement size_hint() for VmallocPageIter.
  - Use PhantomData<page::BorrowedPage<'a>> instead of PhantomData<&'a u8>.

Changes in v3:
  - Generalize the previous PageOwner impl of VBox and VVec in VmallocPageIter.
  - Correspondingly, replace PageOwner with IntoPageIter.

Changes in v2:
  - BorrowedPage
    - Add link to Ownable
    - Use borrow_page() in the example
  - Add PageOwner, Vmalloc::to_page(), ArrayLayout, VBox, VVec patches.

Danilo Krummrich (7):
  rust: page: implement BorrowedPage
  rust: alloc: vmalloc: implement Vmalloc::to_page()
  rust: alloc: implement VmallocPageIter
  rust: page: define trait AsPageIter
  rust: alloc: kbox: implement AsPageIter for VBox
  rust: alloc: layout: implement ArrayLayout::size()
  rust: alloc: kvec: implement AsPageIter for VVec

 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/alloc/allocator.rs  | 152 ++++++++++++++++++++++++++++++++
 rust/kernel/alloc/kbox.rs       |  40 ++++++++-
 rust/kernel/alloc/kvec.rs       |  40 ++++++++-
 rust/kernel/alloc/layout.rs     |   5 ++
 rust/kernel/page.rs             |  87 +++++++++++++++++-
 6 files changed, 322 insertions(+), 3 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.50.1

