Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3331B0F11
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Aug 2025 20:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754513458; cv=none; b=DwVSXjZcvRddnjwHfWuWCe+Oq8BkWxULXVmcGc1KDmyGGS7VJCsJ212NHz96UqScm0orEn1YLFgvCXm2zKnSG3R6s/EN4yNZ00ZIHK3q6WUg4Bw4j20eUnMrS0kYBszOYiFGH9N4QWVLd6t0Ey4GZLhvU8zfkJkSroRWK0jFEIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754513458; c=relaxed/simple;
	bh=cpTKPFhRI0LQHKByLqYkeJV0c9bPHR4FeZJAzIbLJUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=behD7otRxqQQ0GR8HwOBVFKjaimRW0d0peQx8+he+eYtveGU4/5ocvlBrloJrpiVYzcbmYZMqOqIJDZ03VDbwCnUmbPaYQPv0FpBwTSI6NAfvbjtC/aKhnQTzZ++UgYizy6TuY8zDJ1k+B+PDV4hsmVnmZ8Omy2o8pn8AJzwM8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bo9lFXOo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bo9lFXOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A99C4CEED;
	Wed,  6 Aug 2025 20:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754513455;
	bh=cpTKPFhRI0LQHKByLqYkeJV0c9bPHR4FeZJAzIbLJUQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Bo9lFXOo+OJYlWw1BbkRHEESmrr83t8GOzKHrO0UAoWGPQBAKZd+xL0VBGzOw8ILO
	 9NBPV0uIXIBE6Wufl/xoMwaakN2lUxqa9mVM4+TssHqoW9jIpGPu6RJGbETBBa80un
	 T7nYRtuRyb64U+GYdplkckpouX2la9NmJD5gZwjNmans/0MJv8jSDReKiTHsaGf52m
	 VPFyf8t8bMgCRnOG03RV+wCRI3GBurBqXLHxyxkjI51dmIngExIj4KBTxIdZzqTNeZ
	 DnFzc9ZE5w78EzkrXZHCF0BOdsKbjJNbyrtCJ6bu5Nnd9fDzfht1mmXH8hL/6aFFaU
	 LptFxq1YGB8OA==
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
Subject: [PATCH v2 0/6] BorrowedPage and PageOwner
Date: Wed,  6 Aug 2025 22:50:09 +0200
Message-ID: <20250806205044.85085-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series implements the BorrowedPage type and the PageOwner trait.

The latter can be implemented by any entity that potentially owns one or
multiple pages and allow users to borrow them.

For instance, this is useful to access and borrow the backing pages of
allocation primitives, such as Box and Vec, backing a scatterlist.

Hence, implement PageOwner for VBox and VVec.

Additionally, implement Vmalloc::to_page() and ArrayLayout::size(), which are
dependencies of the above.

Changes in v2:
  - BorrowedPage
    - Add link to Ownable
    - Use borrow_page() in the example
  - Add PageOwner, Vmalloc::to_page(), ArrayLayout, VBox, VVec patches.

Danilo Krummrich (6):
  rust: page: implement BorrowedPage
  rust: page: define PageOwner trait
  rust: alloc: vmalloc: implement Vmalloc::to_page()
  rust: alloc: layout: implement ArrayLayout::size()
  rust: alloc: kbox: implement PageOwner for VBox
  rust: alloc: kvec: implement PageOwner for VVec

 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/alloc/allocator.rs  | 49 +++++++++++++++++++
 rust/kernel/alloc/kbox.rs       | 42 ++++++++++++++++
 rust/kernel/alloc/kvec.rs       | 40 +++++++++++++++
 rust/kernel/alloc/layout.rs     |  5 ++
 rust/kernel/page.rs             | 87 ++++++++++++++++++++++++++++++++-
 6 files changed, 223 insertions(+), 1 deletion(-)


base-commit: d2eedaa3909be9102d648a4a0a50ccf64f96c54f
-- 
2.50.1

