Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA714326924;
	Sun, 13 Sep 2026 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311506; cv=none; b=Gp0fxhIuhgSUUMJr8yrGyR/nGtZuTSu6vNwWf8RP6Co7CrokEwKDqAZlwKIFBAChXjQ4X3GLCVZQ9buQmlyf94zVgcsj9Keyz4YLG817UniA5omnspjxCO9Z1qnyTY1k0QbjJ6sWtlIN72esPs97sefpOswE2DOOtyG5UtrT0zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311506; c=relaxed/simple;
	bh=kDc/e76ePF5PsxonlfBmEtXhWoctQj8Q2BP/Zw86+G4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D2CPDRiYko/ePdSXi8kn46gIZdDLDu0+l20/6NY1cj7GsbjdDzyIPHibXb8qalbX+yjjBaLSmDJHtWjgtmvXdvrOHU5HwZcOAspshH3kaazI72w1VIkVspCMcSxV+DpBZy9MD/xa/IhP5QEIOu5FHukLFnfO5frpmX7YhxgKaXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tavf8WB2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tavf8WB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185CE1F000FF;
	Sun, 13 Sep 2026 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789311505;
	bh=G0U/yrKqs9C3NLRrdkhjlkft4ZZy0R8NVYB37IZiL+A=;
	h=From:To:Cc:Subject:Date;
	b=Tavf8WB2U6Qqo4y1n+W4YNbj5Bg14q0ZlpP39dPIHjBqglDQ7viuRuuW2r0atCOS9
	 gA2AY+jUjt6iN/Wh9gN8CZrl4rLDc+WtPNCkoXXoxWbD7xuI4ZFrdJ5HKlqPyyyXh5
	 x28U2wKVMwGsc4EdvmkBXOivmNZx+GDMY3/UA/mqChDEsdt2uL2oS9EPGyT0J4TvHJ
	 wr4/avN+a7XP6ruefxTA/J0QAKdhbloopHu9jYN7n5WIPgLyID1XpSMjUkB9I/KYQE
	 HbKz8+H+DdkCeOfKoFIbPvDGduHVHv3o+Sz+oavkrNKvW8LbJxz3sahsm4CkaWSCq5
	 uE56nyVh0sq2A==
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
Subject: [GIT PULL] Rust fixes for 7.3 (2nd)
Date: Sun, 13 Sep 2026 16:58:08 +0200
Message-ID: <20260913145808.28006-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

They have been in linux-next for at least 3 rounds (most for more).

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.3-2

for you to fetch changes up to f4c3e38111fd84c2c7ae5785755f4a4d476e1cba:

  rust: allow `unknown_lints` in generated bindings for Rust < 1.88 (2026-09-08 23:29:18 +0200)

----------------------------------------------------------------
Rust fixes for v7.3 (2nd)

Toolchain and infrastructure:

 - Work around a 'bindgen' 0.73.2 bug that emits an 'allow' attribute
   for 'unnecessary_transmutes', which is unknown in older compilers.

 - Clean 'clippy::as_underscore' lints in generated code by the new
   'bindgen' 0.73.0+ releases.

 - Clean new 'clippy::needless_range_loop' lint for the upcoming Rust
   1.100.0 (expected 2026-11-12).

'kernel' crate:

 - 'num' module: fix soundness issue in 'Bounded' by sealing the
   'Integer' trait.

'pin-init' crate:

 - Fix unreachable warning for the upcoming Rust 1.100.0 (expected
   2026-11-12) due to 'Infallible' becoming an alias of '!'.

Samples:

 - Add missing newlines in 'pr_*!'s macro calls.

----------------------------------------------------------------
Gary Guo (1):
      rust: pin-init: use irrefutable pattern for `stack_pin_init`

John Hubbard (1):
      rust: allow `clippy::as_underscore` in the generated bindings

Mehmet Koseoglu (1):
      rust: samples: add missing newlines in rust_print_main

Miguel Ojeda (2):
      drm/panic: clean new `clippy::needless_range_loop` lint for Rust 1.100.0
      rust: allow `unknown_lints` in generated bindings for Rust < 1.88

Younes Akhouayri (1):
      rust: num: seal Integer

 drivers/gpu/drm/drm_panic_qr.rs | 4 ++--
 rust/bindings/lib.rs            | 4 +++-
 rust/kernel/num.rs              | 9 ++++++++-
 rust/pin-init/src/lib.rs        | 8 +-------
 rust/uapi/lib.rs                | 4 +++-
 samples/rust/rust_print_main.rs | 8 ++++----
 6 files changed, 21 insertions(+), 16 deletions(-)
