Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599862FFDD8
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175473; cv=none; b=OFjM+wqhnPQriGEKWfDwn37F2AJ2octvYbSEi8G8MuwCUBZJ7IJIIzSPjQUhIQpkCEE3my9fiG0V+hZ70+qnMgn73Y3xdiS5t/AXepTYxgjnRAftNHL2K7AqLdevChkCP8sF0tjewennak3HJvKmP1NcmMm6I0r5u7nfshNn+kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175473; c=relaxed/simple;
	bh=m1pGRUaLDhpgDfx3ot/8+Lli8VHWBOOh07LJXIErHFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pqjZg4DQaA6lRwSORWlPZh22eU+t0YfHk4qVT4I73oFk/Tsp54d8yjeo4hyI/GtDbKy79bGB5zdXD50kwGZonW2hMGwmabKoZGp5D+BEeUnCfgY3DEKB5nK8yblKt/Yjtx1fm8/TJXp/TjQS16m2v3PPUyidjmUkLwPPnLYwLT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dfmy7o6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dfmy7o6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA78C4CEF1;
	Thu, 14 Aug 2025 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755175473;
	bh=m1pGRUaLDhpgDfx3ot/8+Lli8VHWBOOh07LJXIErHFU=;
	h=From:To:Cc:Subject:Date:From;
	b=Dfmy7o6HLABMQwv+T3Ij6SDZEGMW6zSLoTif2yiqwvhCJSh64UQx/vVjxWX5wLaDO
	 FZUO5yZQ9S0KCtjjGF2aGaQItIi3yUUPloy9RLoDV6PqLSoZtJTW3NRY4Ym5qKO2Ui
	 oLFAc7bnSRCPUFPnBk4rNn1eqG+ilehZ9NBNpcDAXZ8mNxRqNGpWzo72w5QoRu6ji4
	 y76V57rekQ+iIZ3xhrsN43m7szczvtWpQvvIs4J4W+8dWQVSPQBt/CSOtofQyiDG2/
	 jE14AugrIttErg0yho7+U7SBKo8Hx8maZMeD5DH7Vh2BFLPYpILkNp3DwTtMU8Af9A
	 43ky+IBc9yJTA==
From: Benno Lossin <lossin@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH v4 0/4] Untrusted Data API
Date: Thu, 14 Aug 2025 14:44:12 +0200
Message-ID: <20250814124424.516191-1-lossin@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I didn't have too much time to spend on this API, so this is mostly a
resend of v3. There are some changes in the last commit, updating to the
latest version of Alice's iov_iter patche series [1] & rebasing on top
of v6.17-rc1.

I think we should just merge the first two patches this cycle in order
to get the initial, bare-bones API into the kernel and have people
experiment with it. The validation logic in the third patch still needs
some work and I'd need to find some time to work on that (no idea when I
find it though).

I also think that field projections are necessary to make `Untrusted`
reasonably useful, but I'm open to adding a stop gap solution in the
meantime. There has been some movement at upstream rust on field
projections. I submitted a project goal for 2025H2 [2] and it most
likely will be accpeted. I also opened a tracking issue [3] for the
language experiment that will drive the design of the feature.

---
Cheers,
Benno

[1]: https://lore.kernel.org/all/20250813-iov-iter-v4-0-c4f1932b05ef@google.com
[2]: https://rust-lang.github.io/rust-project-goals/2025h2/field-projections.html
[3]: https://github.com/rust-lang/rust/issues/145383

Changelog
=========
* v3: https://lore.kernel.org/all/20250421134909.464405-1-benno.lossin@proton.me
  - properly mark RFC patches
  - fix doctests
  - rebase onto v6.17-rc1
  - use Alice's latest iov_iter patch series: https://lore.kernel.org/all/20250813-iov-iter-v4-0-c4f1932b05ef@google.com
* v2: https://lore.kernel.org/all/20240925205244.873020-1-benno.lossin@proton.me
  - split introduction patch into the minimum API needed + the
    validation API
* v1: https://lore.kernel.org/rust-for-linux/20240913112643.542914-1-benno.lossin@proton.me/
  - split `Untrusted` into `Untrusted` and `Unvalidated` (great suggestion
    by Simona Vetter)
  - remove `validate_bytes`, `untrusted*` (Simona Vetter)
  - rename `Validator` -> `Validate`
  - change `Validator::Input` to an generic parameter (Fiona Behrens)
  - remove `Validator::Output` and change return type to
    `Result<Self, Self::Err>` (Simona Vetter)
  - use the new API on the `uaccess` module (Simona Vetter)
  - add support for in-place validation (Simona Vetter)

Benno Lossin (4):
  rust: transmute: add `cast_slice[_mut]` functions
  rust: create basic untrusted data API
  rust: validate: add `Validate` trait
  rust: iov: use untrusted data API

 rust/kernel/iov.rs               |  30 +++--
 rust/kernel/lib.rs               |   1 +
 rust/kernel/transmute.rs         |  60 +++++++++
 rust/kernel/validate.rs          | 210 +++++++++++++++++++++++++++++++
 samples/rust/rust_misc_device.rs |   5 +-
 5 files changed, 293 insertions(+), 13 deletions(-)
 create mode 100644 rust/kernel/validate.rs


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
prerequisite-patch-id: 9fbbd51a9c098c1e99a9c69337e0053d2ee45cc3
prerequisite-patch-id: e5b7d90b63f091fe3f250ec1f4bfac461a5a60a3
prerequisite-patch-id: 356376695c1e5bda36dd4bd08f1c1d18775f580f
prerequisite-patch-id: 4ec65ef345b03c1664af2c475e002f3fcfb59086
-- 
2.50.1

