Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DAD1D7E5E
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726226827; cv=none; b=lZkZfzfMH98a8RMcbadchNPH9EmzU/sAUAexFnQGh7HST9B2ZQDYYc22SbYFW4vVldZRt0vdgk3pEBeSvpYX3HljtUIuNd7Avyh+DYjEa9fGIeeW4WBqtE/azUbRhVJZHl4BbuMf3V41/KPpmhVePzWzyLPnAO/RZDGkSsAVpQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726226827; c=relaxed/simple;
	bh=K4LOTdn6dNhpb15jCxmwL1FsrDY6+3zODCqDALmcByA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qiuGdP4P+AdTSyF6EArSXY+/X7T0trhPuB9XvJUcYtBvOnhNQMOWV87RcBviexaeeG+H2jUyMGGKB/m0hWBrHqbvXzGpWCBUzv+o/YxTebB9NQYSH/ydCaBOh+qZAVCpTRZzGbc5wylfC29UkBDO4er4Zkfy6oNhexU97zX2/T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=U7V4kNxh; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="U7V4kNxh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1726226817; x=1726486017;
	bh=pEk3Kf8o2X3QmWBihlUvLvo3s9g8N/dR3ZwuyUqzjAg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=U7V4kNxhJSOBKbn5wBvtXM73iVMjbVzWqVzPoLYSSLozEI8GiqqfvJQQiUESl9AQo
	 rMSEV0DrKFtEzStwuZWa+dIZ+ia1z5VdIU+WPqwu0M+Prhqb2tYpH/x3N0gVcljik1
	 lcy2ss46CCYZlg2GRUyo5d4y5WDrePSp4wIWyF3EsMPq1wy/kcTkzf3qqhuTdPdGhw
	 +R4/1HaO3SRlaj4CTm4NS6OJ+PgEmPsozDoiZrFyXvJpQxVQe7qplrmOIfkXWnT0mN
	 36TepialemqDcgedZLJEEEwLKKp0J42abFpI1vt3QGK64yVg8zhYitJlklcXSKG6X0
	 4Zm7Jw0QxS4YA==
Date: Fri, 13 Sep 2024 11:26:54 +0000
To: Greg KH <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH 0/3] Untrusted data abstraction
Message-ID: <20240913112643.542914-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 632bc88b39e7efe5662dc4301e8f0004f7482624
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enable marking certain data as untrusted. For example data coming from
userspace, hardware or any other external data source.

This idea originates from a discussion with Greg at Kangrejos. As far as
I understand the rationale, it is to prevent accidentally reading
untrusted data and using it for *logic* within the kernel. For example
reading the length from the hardware and not validating that it isn't
too big. This is a big source for logic bugs that later turn into
vulnerabilities.

The API introduced in this series is not a silver bullet, users are
still able to access the untrusted value (otherwise how would they be
able to validate it?). But it provides additional guardrails to remind
users that they ought to validate the value before using it. As already
stated, they can access the value directly, but to do that, they need to
explicitly call one of the `untrusted_*` functions signaling to
reviewers that they are reading untrusted data without validation.

There are still some things to iron out on the Rust side:
- allow better handling of `Untrusted<T>`, for example allow comparing
  `Untrusted<[u8]>` for equality (we should do this via a trait
  extending `PartialEq`)
- rebase this on Gary's patch to enable arbitrary self types. This would
  allow me to remove one `untrusted_mut()` call in `inode.rs`. I would
  expose the `cap_len` function even if the underlying data is
  untrusted.
- get more feedback as to what `Untrusted` should make available

In addition to adding the abstraction, I also provide very experimental
RFC patches using the API in tarfs by wedson. They are based on his
vfs-v2 branch [1] and I will not aim to upstream these patches. They should
give you some idea as to how the API is intended to be used.

Open to any suggestions and improvements!

[1]: https://github.com/wedsonaf/linux/tree/vfs-v2

Benno Lossin (3):
  rust: add untrusted data abstraction
  WIP: rust: fs: mark data returned by inodes untrusted
  WIP: rust: tarfs: use untrusted data API

 fs/tarfs/defs.rs        |   1 +
 fs/tarfs/tar.rs         | 143 +++++++++++++++++++++++++++-------------
 rust/kernel/fs/inode.rs |  33 ++++++----
 rust/kernel/types.rs    | 248 ++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 367 insertions(+), 58 deletions(-)


base-commit: d077242d68a31075ef5f5da041bf8f6fc19aa231
--=20
2.46.0


