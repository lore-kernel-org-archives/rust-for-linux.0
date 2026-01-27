Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8B82E8E12
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 17:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534629; cv=none; b=SSrTLpTadImMQ4LYokCrUk/cmyukeDHokzx+4h6qlUVAx3vBEkPy1jU16NOKy1eN4yQav8NHn/g/D45wxZQ2TrPJUFl0m/Y3jx30xwnTbdrVFh7itXSmicswWpLMBUH52scth7Q5S2kWjkv+3nY9mykLA3TzMF+E27eq+Q+EQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534629; c=relaxed/simple;
	bh=YHWewBX3CoD41Gy6hLSn67zujrgtUzLmoX49zV9vocM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oVC8AVTby1Vz2FEBtc0VSwchW5ZWfrAuYx68+1DZxl2toWFW4spkMZ328lT5TRNQ750eubZ1sBAjZhSrjhq/zlTg06EyAS9tykjDCSR6EmbyYUvFMW2ak1pwmsfHMKxv9CpAmLrRkMrw3LlPteT4ZmesLwbxFFRnDFF7RaE6ujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmf3Svt6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmf3Svt6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A820C116C6;
	Tue, 27 Jan 2026 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769534629;
	bh=YHWewBX3CoD41Gy6hLSn67zujrgtUzLmoX49zV9vocM=;
	h=From:To:Cc:Subject:Date:From;
	b=pmf3Svt6meI4BxCtEYMKIGhee7LQgO/M5ZaM4TGwJEMmOExjAkPcZ1xZ/L99Z6CKg
	 mwxQZxKlJnFAzTiW9ai2i6USmfE8vlk/d0JqjrIhasLSAKqzlWxB3DkDp1oZ6VIRlK
	 81n5+LsWktR7EKSW9xrcLjpTCFHIzaYO3oHw6gwZuuMZ2OSsg2rGKFHFSIQEHbTB9a
	 9hJ5JR+lWjaHZn9spYnaB6JyHIGl55fC+OFDKsAPv1m59XKVVkkWzKQF93l+DbiOmm
	 PAlvos1/9jg2ZVlwna0PF/Cl8TSH2iReZwMzgHUVSeThazuV7G9dk0xLpY1yBdjpuL
	 GxCeRW0LGjV4g==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Subject: [RFC PATCH 0/2] Initial klint integration
Date: Tue, 27 Jan 2026 17:11:02 +0000
Message-ID: <20260127172330.1492107-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

This RFC series introduce klint integration into the kernel.

Klint is a linting tool (in the form of a custom Rust compiler driver,
similar to how Clippy works) that I have been working on since 2022.
It was initially created to help lint on code that can trigger panics on
allocation failure; this feature has been long obsolete after we started
vendoring alloc crate and subsequently replacing it with a custom
implementation, but over time it also gains some other useful lints.

Lints that are considered ready currently:
* Items available via kernel prelude but imported via other means
* build_error/build_assert calls not being optimized out (klint will
  provide you a backtrace to ease analysis, as opposed to just a linker
  error).
* Stack frames larger than desired (configured via CONFIG_FRAME_WARN).

The kernel is not currently lint clean. I've already sent out a series
to fix the prelude imports; there is a true-positive with Nova-core's
Cmdq::new method's excessive stack usage which needs fixing.

Many of you may have also heard about klint's ability to perform locking
rule checks, however I did not consider it ready (due to false positives
and inability to analysis some code patterns), so it is not enabled in
the series.

The source code is available at https://github.com/Rust-for-Linux/klint.
It is licensed in "MIT OR Apache-2.0", the same license as the Rust
compiler, as the tool is heavy dependant on the Rust compiler internals.
Currently, there's no pre-compiled binary available; it should be easy
to build for rustup and Nix users; if there are enough demands I can
also consider providing pre-built binaries.

Gary Guo (2):
  kbuild: rust: register "klint" as a tool
  kbuild: rust: use klint to provide CONFIG_FRAME_WARN

 rust/Makefile          | 5 ++++-
 scripts/Makefile.build | 6 ++++--
 scripts/Makefile.warn  | 1 +
 3 files changed, 9 insertions(+), 3 deletions(-)


base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
-- 
2.51.2

