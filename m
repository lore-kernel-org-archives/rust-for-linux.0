Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EE03B5848
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913210; cv=none; b=EqzmiIjlTZ25/YkDYEWI1kquftsDYQl+teGXmGrWqL8YwnEOi8iujl6OaglJ4L2x94s/Swn7sZp2DiHP6/nVG/q5iYW0yJQ40UZ4QPnL9tw+F/MYNi1ZLeGRl+qbzrozWVuAFL7SGb8fFPe/n11BZ/ngfUjnpkFfFAudCZKNs8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913210; c=relaxed/simple;
	bh=SoDuP5FRTxVqy+IbFg03kyWXTlbx/B0YmCQ0Uw9ejlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LhUp0Fe6UadlCEuImNp1Fo5RWNmcRV5mjtGYTKiZEqKrPWSmMQIq830XBxLnvCdtyku5ABOS2hH5AhZ0Uh1Kn5vvcZ4lc2q6ID4ZfHva/3Aj0D9C0vnCOpsaFhRuky6WErkdBs2X2opMjmMPXtkfBcgWhjH0LTPy0nUH94foEKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDIwFTd6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDIwFTd6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3DBC2BC87;
	Thu, 19 Mar 2026 09:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913209;
	bh=SoDuP5FRTxVqy+IbFg03kyWXTlbx/B0YmCQ0Uw9ejlY=;
	h=From:To:Cc:Subject:Date:From;
	b=oDIwFTd6cUd4hr3QqaYL10eaGQVRg0h7+mG1qB0Wc+tLuSged4b4Qt6UEkE+devc1
	 XNHIb5TkVJbOJ8L1mD/bz9Sj7kN86OsTXLp63zBzeIOGE0QsxdqzFlNfGXZ/fIqjoY
	 zoloxgUbhcD9AWXht5aiDWRo2mL7Lw32AJSltOOUTz9w8ija9rOYeyBuyXndz/wX3i
	 Uwei9XDNMw7OVYLuWtIWks3HYu1SuoihSmNFHXRH9+3eWClg4aL8xmMTGjTHpVaq5f
	 qIjdXpyY4PxxTkDH/JafdMRukmbNdanoS9vNi/9p8LqvhRLfQTPCOaN3BnppFuDOSE
	 cVWdgcxij5sdA==
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
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH 0/5] pin-init upstream sync for v7.0
Date: Thu, 19 Mar 2026 10:35:23 +0100
Message-ID: <20260319093542.3756606-1-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This cycle we have no big changes in pin-init. This series is a
collection of smaller improvements already merged upstream:

- https://github.com/Rust-for-Linux/pin-init/pull/105
- https://github.com/Rust-for-Linux/pin-init/pull/110
- https://github.com/Rust-for-Linux/pin-init/pull/101
- https://github.com/Rust-for-Linux/pin-init/pull/102
- https://github.com/Rust-for-Linux/pin-init/pull/108

Next cycle might contain bigger changes, mainly support for tuple
structs. And I'm also thinking of already starting with integrating
zerocopy.

While testing for the kernel, I noticed the following issue (already
fixed in the patch in this series):

- https://github.com/Rust-for-Linux/pin-init/pull/123

This cycle we also had some unsoundness fixes that are already in rc4:

- https://github.com/Rust-for-Linux/pin-init/pull/111
- https://github.com/Rust-for-Linux/pin-init/pull/117

Lastly, there were some upstream-only changes:

- https://github.com/Rust-for-Linux/pin-init/pull/114
- https://github.com/Rust-for-Linux/pin-init/pull/109

Cheers,
Benno


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
 rust/pin-init/examples/big_struct_in_place.rs |  3 +
 rust/pin-init/examples/linked_list.rs         |  3 +-
 rust/pin-init/examples/mutex.rs               |  3 +-
 rust/pin-init/examples/pthread_mutex.rs       |  3 +-
 rust/pin-init/examples/static_init.rs         |  3 +-
 rust/pin-init/internal/src/init.rs            | 14 +++-
 rust/pin-init/internal/src/lib.rs             |  2 +-
 rust/pin-init/src/lib.rs                      | 73 +++++++++++++------
 10 files changed, 75 insertions(+), 36 deletions(-)


base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
-- 
2.53.0

