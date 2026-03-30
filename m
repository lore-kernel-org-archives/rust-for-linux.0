Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14F33B96F
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885038; cv=none; b=sIqrLSBvVBRaGvXK1a9xe1WcoWQCOYV/7ANaY7WWW9pp1n1JNMcb6YHKeIvxS9WH00h6nd1+9jX91EOAa3ZqQ8BFz1LS7iwv6g4bz+ojp8Z9iv9LDZuUPg6nY9hAq0K9QaJo8kQDgTYZghmatNwNPEYqilPwbIc/pJo9sHmIgE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885038; c=relaxed/simple;
	bh=to+5ZSkIDDiHhg/BFZBjJrKukHpabTy+r19iLjVg+a0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aj9hcvr5sggyiVHRIvqe7NSLk6o5DQVi10G9O7HAn4wMolSmFhWVxhDkNB7bKtsTwDrbKdag0WCXtBwIx232h0pghLzhphYIJXqJrEYEXSOoGptT/lTm+OGZET3kScYwiX0K0WKlzu9N5DNqu8a89gqrXyRWBZq/f/BEEIJXLaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sv6GeqOd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sv6GeqOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A50C4CEF7
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 15:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774885038;
	bh=to+5ZSkIDDiHhg/BFZBjJrKukHpabTy+r19iLjVg+a0=;
	h=From:Date:Subject:To:Cc:From;
	b=sv6GeqOd1UDHOCqmmLUKdTAXbTpgNarFoCD2epj3QUssgL/fBPT9sujfmet8EHWoa
	 FbLwQj7iiDCXlGF+M+F8BStB77mA0r3ZBHkKMHtuFP7KcRG61I8mvJZrn2DvHKpP5S
	 CDBOpTo7eiAK/VONEEz4htnTNVCFHevI/6vrD7kZNfMi8aNdHV4nCho5S24h9k0F/u
	 HnwXG33FlQ78t9Y8mtl2wixAdkuKw0NwmRRFGpW9idDaICEOYe82dH93hENDspt0CV
	 2ZRWUbHA/211sfG7ebol2V0B5oq0MwOQudL8vudfR/doklRZxsMUS+hQosBKt7ovw6
	 k/DF5YePVqKaw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2b636b944so873841e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 08:37:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YxeqEHd5+N5EyktjZ9BptNFdmobbu2uv526lTCf1h4QVGl1trdt
	t1P6gR45WdDHjWdGYvYIrZBrw7ld2AlkTL2+cYm/UKJy2YgTNCzHKDvMvf5yVCINM2Q+UZaITUZ
	38TKQ+OxLBi9gtYP3T7aXjoOLu9IZq/w=
X-Received: by 2002:a05:6512:3b9f:b0:5a1:44d3:7601 with SMTP id
 2adb3069b0e04-5a2ab920a10mr4174706e87.20.1774885036450; Mon, 30 Mar 2026
 08:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 30 Mar 2026 08:36:40 -0700
X-Gmail-Original-Message-ID: <CAJ-ks9n4jgykD1L0kgyY6JUs8eV8w-JbuJ0K4_2PueWW5k=47A@mail.gmail.com>
X-Gm-Features: AQROBzD3HkRjDHCLz_SHpkj6iBRoiHnYHHLFlLKmrp4BM-DdHhEO1_Kxe7sk9ts
Message-ID: <CAJ-ks9n4jgykD1L0kgyY6JUs8eV8w-JbuJ0K4_2PueWW5k=47A@mail.gmail.com>
Subject: [GIT PULL] Rust Analyzer for v7.1
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Miguel,

This PR mostly consists of refactors for readability and
maintainability, as well as preparation for separate host/target
`cfg`s should we ever need them.

All commits have been in linux-next for at least 6 weeks.

Please pull for v7.1. Thank you!
Tamir

The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:

  Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/rust-analyzer-v7.1

for you to fetch changes up to 5c8d16ac49405c5b77c955684849528f7d4d6b81:

  scripts: generate_rust_analyzer.py: reduce cfg plumbing (2026-03-09
13:20:09 -0400)

----------------------------------------------------------------
rust-analyzer-v7.1: rust-analyzer changes for v7.1

- Add type annotations to generate_rust_analyzer.py.
- Add support for scripts written in Rust (generate_rust_target.rs,
  rustdoc_test_builder.rs, rustdoc_test_gen.rs).
- Refactor generate_rust_analyzer.py to explicitly identify host and
  target crates, improve readability, and reduce duplication.

----------------------------------------------------------------
Eliot Courtney (1):
      scripts: generate_rust_analyzer.py: rename cfg to generated_cfg

Tamir Duberstein (7):
      scripts: generate_rust_analyzer.py: extract `{build,register}_crate`
      scripts: generate_rust_analyzer.py: drop `"is_proc_macro": false`
      scripts: generate_rust_analyzer.py: add type hints
      scripts: generate_rust_analyzer.py: identify crates explicitly
      scripts: generate_rust_analyzer.py: define scripts
      scripts: generate_rust_analyzer.py: avoid FD leak
      scripts: generate_rust_analyzer.py: reduce cfg plumbing

 rust/Makefile                     |   2 +
 scripts/generate_rust_analyzer.py | 286 ++++++++++++++++++++++++++++----------
 2 files changed, 211 insertions(+), 77 deletions(-)
