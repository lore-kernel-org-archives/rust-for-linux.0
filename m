Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6D1DA3D
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754676727; cv=none; b=OPom9R2pj6tkKuLnnkhPesmLR2SvptO+PVNjbZ9nvcf3HJ3btljkOz9tyiKbc+Yd/3CnP7AMQwNtuHdWPv3Ci194GWsbuBaoUDCtfvKBeMHr/VWLTuezVnyPQzTuBFPsWuL7qmxTKZCk/sUV3xYnfXTx7ALqIED9Zi+zmIghEa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754676727; c=relaxed/simple;
	bh=47UYXif7DU1n0/l8NHmB4V8pM3TczVqprUchbcRqd4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s+YslPf8Jjt/5fFyWdnzJ2iWHQDS80HAYOET+up8ZEKEialD2X1rXStmhp12G5JO5KiWmWez3CzJhVACnV7Lwfp2uG32ZNuCWF3lWUbfwQmnYkIhqkRteeT8UWenoW4IPOQuRcuUc8glpAWPqg+mhHXHsg0Ke43l1iUJTEkGqyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVR7a/Cy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVR7a/Cy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E875BC4CEED;
	Fri,  8 Aug 2025 18:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754676727;
	bh=47UYXif7DU1n0/l8NHmB4V8pM3TczVqprUchbcRqd4k=;
	h=From:To:Cc:Subject:Date:From;
	b=HVR7a/CyaK6k1ucqFNxJGamNBLphoG0ss7DqCu7pabCkDzUa4MoWxz7TyPYoTYmOX
	 rKuUn2UaxnKJZ/qlonrzkkRV++W2uWJNoxnZqVKgkgUkpo9UgTqVCQJxAcrUGZtc+t
	 Kdmk7FMXjhm7eSC0OMzDbEaHEwyCg7NFylvVodekyvbX7oWY0p14RdFiqeRggmUQGH
	 nPak/o/mRqwDYfe55pwGzTs7SigYyP2GkZ5AE7hiJbDQxeGvxL68+cTneBXCmF7oOu
	 qXVcKc35N4VU/eICh9UnLEl0roRfUwPQrwtFycEhIQxFrWJNkcMZkiG2GT7e4ykTHk
	 2kVayXU9xb4cQ==
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
Subject: [PATCH v3 0/7] BorrowedPage, IntoPageIter and VmallocPageIter
Date: Fri,  8 Aug 2025 20:10:14 +0200
Message-ID: <20250808181155.223504-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series implements the BorrowedPage type, the IntoPageIter trait and
VmallocPageIter type.

IntoPageIter can be implemented by any type that owns pages to allow users to
borrow them through a generic interface.

For instance, this is useful to access and borrow the backing pages of
allocation primitives, such as Box and Vec, backing a scatterlist.

Hence, implement IntoPageIter for VBox and VVec.

Additionally, implement Vmalloc::to_page() and ArrayLayout::size(), which are
dependencies of the above.

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
  rust: page: define trait IntoPageIter
  rust: alloc: kbox: implement IntoPageIter for VBox
  rust: alloc: layout: implement ArrayLayout::size()
  rust: alloc: kvec: implement IntoPageIter for VVec

 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/alloc/allocator.rs  | 141 ++++++++++++++++++++++++++++++++
 rust/kernel/alloc/kbox.rs       |  37 ++++++++-
 rust/kernel/alloc/kvec.rs       |  37 ++++++++-
 rust/kernel/alloc/layout.rs     |   5 ++
 rust/kernel/page.rs             |  85 ++++++++++++++++++-
 6 files changed, 303 insertions(+), 3 deletions(-)


base-commit: d2eedaa3909be9102d648a4a0a50ccf64f96c54f
-- 
2.50.1

