Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96694426ECA
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469780; cv=none; b=GPSW0RyrtdLFZJOfcY0MeOxYQ7751N6ONAfHUrnZZbIpNQFTdSVCC0DvHMVXD82iaAYj55Gy7iamEVV8bQoytp7Loo1Ufp9MV1Pjy+iwBn7mMM5F+mH8CzdyA+MJadrY/Ueo+0wgSwsLJ2zDOqAZ0X7xD7OpkH/YLXDpnHm3HSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469780; c=relaxed/simple;
	bh=Ecm8sW/ajGRGpitfTpaQ6B3z1Bzh0EPq2chZUpkDP78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MpqOLLC4yVcqVeK/FZjfFAiZFFWRrjgbjrrtLyyMsMmSZbCRZ+O+CUYnIDKWkK4RBfwLhmF9VD7v8NeQgndk+gOg3XZAI99OhF6yWLZwdq4aolDWD5QlCHt6WQLA2kRYm5LAVpMM3YOjrZRClfWidfnMBcB5BaQESrDzzXSxDcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrvAeI8d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrvAeI8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DC3C2BC86;
	Mon,  2 Mar 2026 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772469780;
	bh=Ecm8sW/ajGRGpitfTpaQ6B3z1Bzh0EPq2chZUpkDP78=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=hrvAeI8d6XOToDLtz+POUpirVb8rwryjwhac6OY5omkg/GShe9JKlujufikVo0DxY
	 WgvpvCL2hPlHpCxsYh5kYP04iBVhVx26RfA+S10Itp9ALq2rU71rz/lDIJEQrcIIEA
	 dCYP8QRlgIlTe/tOh4b9nvc98Ql9CYQx9Z6FMHEASY7JWHFH1GI7SZbVVYUrcMgdl4
	 YXFUUCuhHTHSvnZ4oO6EkrQhBv+GxrvetT5/G8Ujem3C0Lkctd7lc31S/2eZcsow02
	 lAvTGQETEY67HYgDoRQbgXmtAINEjQW8xUnmBxxVVgscPdjXIE8/EVWVf6MjNGqkD0
	 5mVseT+rnZpzw==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH v4 0/3] rust: add pointer projection infrastructure and convert DMA
Date: Mon,  2 Mar 2026 16:42:33 +0000
Message-ID: <20260302164239.284084-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

This adds a general pointer projection infrastructure which is intended to
serve as the basis for generic I/O projections. The idea is that we will
have a unified way of reading/writing MMIO or DMA allocation, creating
typed subviews into them, and able to read/write subfields safely.

This is the first step towards that direction, where an infra for
projecting arbitrary pointers are added. This takes care to not assume
pointers are part of a valid allocation, so it can be used to project I/O
pointers, too. `dma_read!` and `dma_write!` is converted to use this infra,
as they currently have soundness issues [1] and users have already
encountered limitation of it [2].

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Soundness.20of.20.60dma_read!.28.29.60/with/573645610 [1]
Link: https://lore.kernel.org/rust-for-linux/DGE9DBH7X8CO.2EES6EX8UA5ZF@kernel.org/T/#mc17b9c0309ac10346b3d6c6bd8461488e7c73161 [2]

---
Changes since v3:
- Add `KnownSize` trait for documenting safety requirement of
  `ProjectIndex` and updated safety comments accordingly (Benno)
- Some comment rewording (Benno)
- Move code to be under `ptr` module.
- Link to v3: https://lore.kernel.org/rust-for-linux/20260302130223.134058-1-gary@kernel.org/

Changes since v2:
- Fix off-by-one issue (Aditya)
- Fix comment (Aditya)
- Link to v2: https://lore.kernel.org/rust-for-linux/20260226154656.3241736-1-gary@kernel.org/

Changes since v1:
- Squashed patch 2,3,4 so that all users are converted in single commit
  (Danilo)
- I discovered an additional soundness bug in dma_read/write macros
  where it can create misaligned access. This is addressed in this new
  version.
- Updated sample driver to have a function that does check instead use a
  budget-try block (Benno)
- Improved diagnostics when index projection is used on types that are
  not slices.
- Link to v1: https://lore.kernel.org/rust-for-linux/20260214053344.1994776-1-gary@garyguo.net/

---
Gary Guo (3):
  rust: ptr: add `KnownSize` trait to support DST size info extraction
  rust: ptr: add projection infrastructure
  rust: dma: use pointer projection infra for `dma_{read,write}` macro

 drivers/gpu/nova-core/gsp.rs      |  14 +-
 drivers/gpu/nova-core/gsp/boot.rs |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  10 +-
 rust/kernel/dma.rs                | 114 +++++-------
 rust/kernel/lib.rs                |   4 +
 rust/kernel/ptr.rs                |  30 ++-
 rust/kernel/ptr/projection.rs     | 294 ++++++++++++++++++++++++++++++
 samples/rust/rust_dma.rs          |  30 +--
 scripts/Makefile.build            |   4 +-
 9 files changed, 411 insertions(+), 91 deletions(-)
 create mode 100644 rust/kernel/ptr/projection.rs


base-commit: 877552aa875839314afad7154b5a561889e87ea9
-- 
2.51.2

