Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DB2426D29
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120847; cv=none; b=ieIwWIiIZ36DCqV1/8OcoxW3a9442OY2KSAqs6EMBFS21n0IwAVRpZ/X0E+TzwtTCoXjA3lg1hSFElS84eGKCy4K6WJUfTRo3BecUr3fZQwrSmrezfQP4AHHWv2j1+/y/HPPo2K0HYnfK2JBLwd7k0esRPNbFd3iisrTS5+aQkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120847; c=relaxed/simple;
	bh=POieRA0+2oYrn5Rmge7jE6gPVMEFTqib8dgNDVlAPpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P6/TqqlXzQxRHOWHrpWnsUW/mXlLUd+vR2XXnVQ/n1aWVe6ggK+EFehO1XSv7qs6DJK9LSR4KDJ1kPNFo34KBpyNQmWxs/i6/85UIeAEBzNyMe540/paoM4h2AxrVaApKjHDtI40Puob1JU0INXZc6N7PhtEs2E5fEshipQNygI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHxzh77s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHxzh77s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3469C2BC86;
	Thu, 26 Feb 2026 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772120846;
	bh=POieRA0+2oYrn5Rmge7jE6gPVMEFTqib8dgNDVlAPpM=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=FHxzh77sTobp/u75zxMFOWdNZfKHziq4yZZQh9uSrwCXUoqmihkUlp7JALk+4G0C4
	 aDUr+ySZNOYFvKusx+tYs6HBJvPYBCYnoJJIqXu9ddS82cPFEvH2OybIQ7t0+UADZd
	 ph7JdIFBCH1PPYThtX+Ua7th2D1LQVf45EXdRwH/SOySkUj876Ftljh/GxEiuOrRZ4
	 o5QfoVPPXRFIQx23trKxMSL2Rvz3Ket1Vbj0dh8sJaa4vkDIVO5gU+pmYLgK/siHLF
	 haaeIPS+JE8Nsl7joI6RRHJUPxga1uKy1DYyVWv46r8W72/7gari7kXqO3+JzjNpWk
	 9sG92sLylo8cw==
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
Subject: [PATCH v2 0/2] rust: add pointer projection infrastructure and convert DMA
Date: Thu, 26 Feb 2026 15:46:52 +0000
Message-ID: <20260226154656.3241736-1-gary@kernel.org>
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
Gary Guo (2):
  rust: add projection infrastructure
  rust: dma: use pointer projection infra for `dma_{read,write}` macro

 drivers/gpu/nova-core/gsp.rs      |  14 +-
 drivers/gpu/nova-core/gsp/boot.rs |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  10 +-
 rust/kernel/dma.rs                | 114 ++++++------
 rust/kernel/lib.rs                |   5 +
 rust/kernel/projection.rs         | 284 ++++++++++++++++++++++++++++++
 samples/rust/rust_dma.rs          |  30 ++--
 scripts/Makefile.build            |   4 +-
 8 files changed, 373 insertions(+), 90 deletions(-)
 create mode 100644 rust/kernel/projection.rs


base-commit: 877552aa875839314afad7154b5a561889e87ea9
-- 
2.51.2

