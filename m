Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE0923B62C
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280308; cv=none; b=VjIDDCUhHMCvWFiGEDaGyQ5Z7MpYhyTLaEfRs18a8Wyqgy/0gBs4F6zJQKwI9YowroIeX1IkdZR2HTXPEPA1iAr9oy0taYj5/rvLQNLeZpRdEdvOKHaU5GVZVlYYOa5eAOneXED+G2WVPIoAl/YFXdy/voZU29zmcwMTmjYONGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280308; c=relaxed/simple;
	bh=oCZxEeUPcxEzxV07OErwc58CgwC9GuPUqV3jBcoQCyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jlV3ENjZvyEa6ko4E7BmLK2SRwBy/QztXZLAx8peJfcSN1xjRCsruWpZcj37+gcs28ucwap0vYj4T8sJyPwIBOCj73W7WJjETaQvKUm5u7j4o+WM0QqFSk8rehK/ql9vLWv7jff8Kyl6qGZ89hdtIG/Z8cWPn3c6rdppQPmPYxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeQSnGf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeQSnGf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04130C2BC9E;
	Mon, 23 Mar 2026 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774280307;
	bh=oCZxEeUPcxEzxV07OErwc58CgwC9GuPUqV3jBcoQCyc=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=WeQSnGf6WN94P33NW+HU9ABGW2dQGT5dZrLaQTnnWf5mM7Xy4R+1KPv12N4iK+OuT
	 iavyNrEPyVp3Pss6t1HPwW8CmX+sdjAmpj3/QHLl482F3tBJnOWwTTrjJnyq+bETtd
	 U/phW+NhfY/H16ZeAT2g/OeHdhei7hg8lvLFKhdZ9Qbvel0A4ufUhmxUev+H5VfOIb
	 HRaNlnFY0JWrU5bgNbo7xsbGd86AjiI5DNQ82rdHZtdc+7IUH09HoiBg/7pHXLr9ah
	 XmuWRJf1TFC6zqF94oQ3ZqI0AFQ8r0iARpwL0Am+SJOVI84y2mDwLxr//jux7gqpCH
	 ZQybVrODGEZEQ==
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
Subject: [PATCH 0/8] I/O type generalization and projection
Date: Mon, 23 Mar 2026 15:37:52 +0000
Message-ID: <20260323153807.1360705-1-gary@kernel.org>
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

This series generalize `Mmio`/`MmioRaw` type from just an untyped region
to typed representations (so `MmioRaw<T>` is `__iomem *T`). This allows
us to remove the `IoKnownSize` trait; the information is sourced from
just the pointer from the `KnownSize` trait instead.

This enables us to implement `Io` trait for `Coherent<T>`, enabling
unified handling of MMIO and DMA coherent memory. It also paves the way
to uniformly support shared system memory, which Tyr will likely need
[1].

Built on this generalization, this series also add a `io::View` type
which represents a subview of a bigger I/O region, and a `io_project!()`
macro that provides a safe way to perform this. Some Nova code has been
converted in this series to demonstrate cleanups possible with this
addition.

This series depend on the Coherent API rework series [2].

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Generic.20I.2FO.20backends/near/572377073 [1]
Link: https://lore.kernel.org/rust-for-linux/DH87CCNRR5EC.2SK3IT6N6Q8V5@nvidia.com/ [2]

Gary Guo (8):
  rust: io: generalize `MmioRaw` to pointer to arbitrary type
  rust: io: generalize `Mmio` to arbitrary type
  rust: io: use pointer types instead of address
  rust: io: add view type
  rust: dma: add methods to unsafely create reference from subview
  rust: io: add `read_val` and `write_val` function on I/O view
  gpu: nova-core: use I/O projection for cleaner encapsulation
  rust: dma: drop `dma_read!` and `dma_write!` API

 drivers/gpu/nova-core/gsp.rs      |  42 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs |  69 +++--
 drivers/gpu/nova-core/gsp/fw.rs   |  84 ++---
 rust/kernel/devres.rs             |  11 +-
 rust/kernel/dma.rs                | 217 ++++++-------
 rust/kernel/io.rs                 | 498 +++++++++++++++++++++++-------
 rust/kernel/io/mem.rs             |  10 +-
 rust/kernel/io/poll.rs            |   6 +-
 rust/kernel/io/register.rs        |  19 +-
 rust/kernel/pci/io.rs             |  88 ++++--
 rust/kernel/ptr.rs                |   7 +
 samples/rust/rust_dma.rs          |  21 +-
 12 files changed, 681 insertions(+), 391 deletions(-)


base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
prerequisite-patch-id: 07a5643b01ce7f63ca42f1a322dcbdb5fc7fa9c2
prerequisite-patch-id: abae47bddac0d45e32dd54ce2f935b0675a6ebdf
prerequisite-patch-id: 7779e87914e4be91f0ced6760299ddf603943baf
prerequisite-patch-id: 31c43ae681611b92f24cbd369fac5af5834dd80f
prerequisite-patch-id: 60d56698d6bf30f31bed11375d5dc7eaeb359a0f
prerequisite-patch-id: 013e064c8c9dc0b7b0ff558ef0d9d6e674c629ee
prerequisite-patch-id: 5c5792a0435bdbdfd2aeb8a3d2dac79aa9ae7d6b
prerequisite-patch-id: 1e8d93ee75c56eecac13859c4024ea13f3cc872c
prerequisite-patch-id: b3a3589264ec10a5c33d4cea3ce69e9c6845d3dc
-- 
2.51.2

