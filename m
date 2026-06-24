Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165413CBE7E;
	Wed, 24 Jun 2026 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312414; cv=none; b=jOvgqCl+wqrKGje3dy12YXZElVwTLA1Dw41Uv2cnWBZgM1UG33G0yZB5gdLTYgwgATyGRwDw9EPZv4eObosOY2uTtK3M/X7z4PXwbt0iOpgw7htl6QcO+Z5/dBgtMhuvWRL1wzNb25sdh0qfYw9A0XgRvWoUYbE0f8tYVNbVoHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312414; c=relaxed/simple;
	bh=MR+gwR2P1PNjxaYBzlK+kF3MMOvH87OkGOsVb1Yc+r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fVIaPdpLr20Fwq0nrwB9PvfEU+EqWT8eS/N3TaG93r0bisHla6IkNxGx+QaVePiGKQLFdQMco8wrz27+eGA8Md4aWfbMK7bHJ7zjAGfsdzoIvzM3nVaxvjtGJcBxPnuSbW/dLhZKP67VNrKNgqwV+W5k+h6T8pU7OfdJ9anG9xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxHjQ0D+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxHjQ0D+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8CD1F000E9;
	Wed, 24 Jun 2026 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782312411;
	bh=XlvwlYx2ewXx2v0IQzNF1hFUUrg8x9v/7/vdvjs4WRs=;
	h=From:To:Cc:Subject:Date;
	b=DxHjQ0D+MdO5HvWKeID3Vj0Zy7UP9Gcz3eFT7yo5QBl7sl0KuQLFsQjaf4I2ARbFi
	 c85gd3GXVFYkND8qkti4KsEbK/0qV10wwH2iMWr7Sy9DLpcioE+9ANj8BMVkWj+vKR
	 Bmc+k4DEv8jZsTkazyWBr7evZUcQYBy90Ku15gk0KXWSgTQqDMyC/J5a+jxqUhhWb3
	 U4EkFcD6TkN4qilWPBhuZ20Q0ofUV3NEFCCaihByrpXx/fUB2pS/o0n1f2l7YidnlI
	 BSojTpbEVj5ObNHJ0uP3K4AMcrPfpkVRwCLSIVol9WDoiInlbOIhzl+U/IbcpQpxf2
	 esurqLFcrUTqA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 7.2
Date: Wed, 24 Jun 2026 16:46:30 +0200
Message-ID: <20260624144630.585128-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

They have been in linux-next for a few rounds.

No conflicts expected.

I will likely send another fixes PR later in the cycle.

Thanks!

Cheers,
Miguel

The following changes since commit 6b5a2b7d9bc156e505f09e698d85d6a1547c1206:

  Merge tag 'trace-tools-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace (2026-06-16 17:50:34 +0530)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.2

for you to fetch changes up to 191f49f1e38b1c10eb44b0f967c6175c884ef7db:

  rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER (2026-06-19 10:00:06 +0200)

----------------------------------------------------------------
Rust fixes for v7.2

Toolchain and infrastructure:

 - Work around a 'rustc' bug by setting the 'frame-pointer' LLVM module
   flag under 'CONFIG_FRAME_POINTER'. The upcoming Rust 1.98.0 is fixed.

 - Doctests: fix incorrect replacement pattern.

'kernel' crate:

 - Mark 'Debug' impl as '#[inline]'.

----------------------------------------------------------------
Alice Ryhl (1):
      rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER

Gary Guo (2):
      rust: bitfield: mark `Debug` impl as `#[inline]`
      rust: doctest: fix incorrect pattern in replacement

 Makefile                        |  3 +++
 rust/kernel/bitfield.rs         |  1 +
 scripts/rustdoc_test_builder.rs | 16 ++++++++++------
 3 files changed, 14 insertions(+), 6 deletions(-)
