Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744AF3DD52E;
	Tue, 31 Mar 2026 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963056; cv=none; b=CgWIftdxC+pFPUJ2XIMQpqhxKZPpysF/jxlI0XxB7zH+D/7JKfa8eng5G/ohcF6gmObqxsImgHTeNXv8NbUyoZ5lSODQAEIOPK8Panjueui+OuPxqx53hqoWfX0tD9A9UiiVl4Vq62+Ghry35j/eJCpSQI7yayj8G6iAsMKJdeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963056; c=relaxed/simple;
	bh=Hp/G7Tk2bKMvKKSaM1qNnm/epXn9tmCr4D2+x+VmzN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0c/ccq1iWW8C1f7p0cjcxCmFsBJUMYTc7Dz93aMLs+DlrtisFaBJLOo6LdNDFUFQhFYkIHNAjB3a2y/CAio0h5qggp2/XW4vqcKAWaum29DIkfkMyy/MrhfpFJhAISO9jwzVKnWh+QCZeMiC2TwvwGopWTw+L+lDzMF+4jCOvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+uGlSt4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+uGlSt4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9D6C2BCB5;
	Tue, 31 Mar 2026 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774963056;
	bh=Hp/G7Tk2bKMvKKSaM1qNnm/epXn9tmCr4D2+x+VmzN0=;
	h=From:To:Cc:Subject:Date:From;
	b=i+uGlSt4153B9yuk655LgIfSxQyr9fv4sbBJRp3P29y8q4+UsSarLyI2gff/kBRAp
	 Des3D6oq5RU+j1SvSZ6B89xBu+mAlFPrXpOkzapa7nls84W530aWStQyYRkK/03FtB
	 w7mcW7HRUPC4u7/G/kI8J4Dm72YvtmMclk4ScZqYQ6jvTtJvon77DNcXNqoWZDKlaQ
	 AS4mIkusffpvA+lQQsniMQbsMi0zM6OoD4yMZ6AvZoeGu/1A+CVIVkXyix6gBeTX06
	 LK0N/cTq0pZ36FeJB+cYMDf+ur3nl/GSF0lXctJt3MHe5qMyIo5bXlK6ZdUeGMAJds
	 3/9xKyro5I12g==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Oleksandr Babak <alexanderbabak@proton.me>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust pin-init for v7.1
Date: Tue, 31 Mar 2026 15:17:28 +0200
Message-ID: <20260331131729.1104236-1-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miguel,

This is a small one, various cleanups and small improvements with no
major changes to users of pin-init.

I summarized the changes in the my sync series [1]:

> This cycle we have no big changes in pin-init. This series is a
> collection of smaller improvements already merged upstream:
>
> - https://github.com/Rust-for-Linux/pin-init/pull/105
> - https://github.com/Rust-for-Linux/pin-init/pull/110
> - https://github.com/Rust-for-Linux/pin-init/pull/101
> - https://github.com/Rust-for-Linux/pin-init/pull/102
> - https://github.com/Rust-for-Linux/pin-init/pull/108
>
> Next cycle might contain bigger changes, mainly support for tuple
> structs. And I'm also thinking of already starting with integrating
> zerocopy.
>
> While testing for the kernel, I noticed the following issue (already
> fixed in the patch in this series):
>
> - https://github.com/Rust-for-Linux/pin-init/pull/123
>
> This cycle we also had some unsoundness fixes that are already in rc4:
>
> - https://github.com/Rust-for-Linux/pin-init/pull/111
> - https://github.com/Rust-for-Linux/pin-init/pull/117
>
> Lastly, there were some upstream-only changes:
>
> - https://github.com/Rust-for-Linux/pin-init/pull/114
> - https://github.com/Rust-for-Linux/pin-init/pull/109

All commits have been in linux-next since Thursday last week.

No conflicts expected.

Please pull for v7.1 -- thanks!

Cheers,
Benno

[1]: https://lore.kernel.org/all/20260319093542.3756606-1-lossin@kernel.org

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/pin-init-v7.1

for you to fetch changes up to 09808839c7aa6695ceff5cd822c18b0d9550184d:

  rust: pin-init: replace `addr_of_mut!` with `&raw mut` (2026-03-25 10:57:53 +0100)

----------------------------------------------------------------
pin-init changes for v7.1

Changed:

- Replace the 'Zeroable' impls for 'Option<NonZero*>' with impls of
  'ZeroableOption' for 'NonZero*'.

- Improve feature gate handling for unstable features.

- Declutter the documentation of implementations of 'Zeroable' for
  tuples.

- Replace uses of 'addr_of[_mut]!' with '&raw [mut]'.

----------------------------------------------------------------
Antonio Hickey (1):
      rust: pin-init: replace `addr_of_mut!` with `&raw mut`

Benno Lossin (1):
      rust: pin-init: properly document let binding workaround

Gary Guo (2):
      rust: pin-init: build: simplify use of nightly features
      rust: pin-init: doc: de-clutter documentation with fake-variadics

Hamdan-Khan (1):
      rust: pin-init: implement ZeroableOption for NonZero* integer types

 rust/Makefile                                 |  4 +-
 rust/pin-init/README.md                       |  3 +-
 rust/pin-init/examples/big_struct_in_place.rs |  3 ++
 rust/pin-init/examples/linked_list.rs         |  3 +-
 rust/pin-init/examples/mutex.rs               |  3 +-
 rust/pin-init/examples/pthread_mutex.rs       |  3 +-
 rust/pin-init/examples/static_init.rs         |  3 +-
 rust/pin-init/internal/src/init.rs            | 14 +++--
 rust/pin-init/internal/src/lib.rs             |  2 +-
 rust/pin-init/src/lib.rs                      | 73 ++++++++++++++++++---------
 10 files changed, 75 insertions(+), 36 deletions(-)
