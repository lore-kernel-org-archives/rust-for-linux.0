Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CF91459EA
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164079; cv=none; b=aOE8Nhf0oeRPOZFXZ2xCZp+txmxi16NDhuzWytRuWCoTuGzknBWkwlyT+4kjDJN8H++cya/lJrZea4614XA12f3arq/4SQPVmz890V9uR0ijKcIWVvf42V/UwHnhkwH/1xWP9JuatiCGnIyrVAKviZvXWPQ81n7y8Cvnue2Zaiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164079; c=relaxed/simple;
	bh=9YfRZ70uA2wqntNJ6ClXC12LLq6YZ5kV9UeTtcV85CA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YUWg0akqkCymuzdOZDQFchnxFQaic7iz6i5k5I6kplLsXjdE0HRio6wPRjg+KiK6k6kk6l6Tn8L0Wa3uJmrIcespD/YG+qNBMQM3umB9ldN303VEZfNfMH9Ofku8sfl+ZEBhxZAqowaeEIx0ReA6ZRwmxtzwgm/rAJUtlIg2xbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYkH1jey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYkH1jey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86771C4CEED;
	Thu, 14 Aug 2025 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755164077;
	bh=9YfRZ70uA2wqntNJ6ClXC12LLq6YZ5kV9UeTtcV85CA=;
	h=From:To:Cc:Subject:Date:From;
	b=ZYkH1jeyGSmX0vsDKUYArAScqqc4CAskoYskdGWnRQJcrGoT4xtZblLsBNT7CJkaZ
	 rh7maUbUf3yfUTafWATK+7XS80clWIfsK5c+utDdGtu6MoLNdEt54aZQfehjSRl5U2
	 a4vMGS9ApJK4Gu9Vu2H/X/f7SJByL7qkAAJHuURSAd8vdc0dFDyJYrkhouFUzWrURb
	 lVsG/vnHvP+44luEIvxr35ummoFO4ezY4Cr8fJA0INDIl5pFPDlcdUqBG9gPMyCXUr
	 Xd/SOkRAUxNJEmXoR/Ps4h7cQ+py7QDVvzGvaMV3udMDYYTh8Fu/H5IktWWH9ehNba
	 MCx8E5NNDSwcQ==
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
Subject: [PATCH v4 0/7] BorrowedPage, AsPageIter and VmallocPageIter
Date: Thu, 14 Aug 2025 11:33:39 +0200
Message-ID: <20250814093427.19629-1-dakr@kernel.org>
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
 rust/kernel/alloc/allocator.rs  | 147 ++++++++++++++++++++++++++++++++
 rust/kernel/alloc/kbox.rs       |  40 ++++++++-
 rust/kernel/alloc/kvec.rs       |  40 ++++++++-
 rust/kernel/alloc/layout.rs     |   5 ++
 rust/kernel/page.rs             |  87 ++++++++++++++++++-
 6 files changed, 317 insertions(+), 3 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.50.1

