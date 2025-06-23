Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2D81ADFFE
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721163; cv=none; b=pHnKWae+4utMoa1ClDy8+Y+bpfK3EA3+QVVW7dqtoDdYKbhqX8SmO0+u5GbiBEMF75f1wimf6Am96UJI2QFljUTg2UkFMMJ4WeRZdz9uToZxRuIWpEGRNe0incz75J25l/Uc9J+BAEXP5yp0l2O3nhzXySPPYkbt3n2sRfrTfSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721163; c=relaxed/simple;
	bh=lR/BztWCQJZ/IxQD2zGS4bK8NM91WP71Q9t8zPKLZgI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BYH9lWfIqrOkAzYJSVBXhghf764HH2MgcxOhQVxQEkZcPsiHUD9aSEJs91IjUCXR+r/H0EC7Vr3cEP8ax5sNzu7H5TdmYJGhM94W6Ad5Z8XbGW7aHtan8p6GOr6N/w98a8T8hk3OqKZ5ZBM5zmtAtOrkq+pG0xpA6SKx3d2s37Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sR4eEZd9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sR4eEZd9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E98FC4CEEA;
	Mon, 23 Jun 2025 23:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750721163;
	bh=lR/BztWCQJZ/IxQD2zGS4bK8NM91WP71Q9t8zPKLZgI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=sR4eEZd962RxEtnO9M09EnY1K6Z/FDpmClH1ZHwxxYx8W/GsWk2ZHRVsnsi6BLbC4
	 ew6r/1+xJMMvFuGfDRgJO6laBZdoABNx1iIoO3ZobR3QULwsoHDhYSePmv4L0aSWmv
	 WtyVGLiXzgIArZglem8wVIk8RQdsDP/ce9dJy119fG0PLZfIECwytdOAhwstAC2r0J
	 D6lu95B47X/r8h7jU0SAbSdXGuAxFgSOmISQRi8Urs9mLiTGuzHkSnNa5ctHdKk9nY
	 OCteJokzaFIFsRMCEMKs6y5Sb5btIr6/1atw90khaV9rsBatjifCzKYzYpiwGvACm9
	 xk1BfupvlVHxw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 01:25:59 +0200
Message-Id: <DAUAUTGMKB4Y.2NS5D54LX5JIA@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: move ARef and AlwaysRefCounted to sync::aref
From: "Benno Lossin" <lossin@kernel.org>
To: "Shankari Anand" <shankari.ak0208@gmail.com>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250623192530.266103-1-shankari.ak0208@gmail.com>
In-Reply-To: <20250623192530.266103-1-shankari.ak0208@gmail.com>

On Mon Jun 23, 2025 at 9:25 PM CEST, Shankari Anand wrote:
> Move the definitions of `ARef` and `AlwaysRefCounted` from `types.rs`
> to a new file `sync/aref.rs`.
> Define the corresponding `aref` module under `rust/kernel/sync.rs`.
> These types are better grouped in `sync` with other synchronization primi=
tives.
>
> To avoid breaking existing imports, they are re-exported from `types.rs`.
> Drop unused imports `mem::ManuallyDrop`, `ptr::NonNull` from `types.rs`,
> they are now only used in `sync/aref.rs`, where they are already imported=
.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>
> The moving patch and updating patch are split as discussed in https://git=
hub.com/Rust-for-Linux/linux/issues/1173
> A follow-up patch will update all the call sites to import `ARef` and `Al=
waysRefCounted`
> directly from `sync::aref` instead of `types`.

Ah, I meant that you can just send the two patches in a single series.
No need to wait for anything (it's easier to review the two distinct
changes, that's why I thought it's a good idea to split them).

> Fixes were also made to intra-doc links: unresolved references to `inc_re=
f` and `dec_ref`
> were updated to use `AlwaysRefCounted::inc_ref` and `AlwaysRefCounted::de=
c_ref`.
>
> ---
>  rust/kernel/sync.rs      |   1 +
>  rust/kernel/sync/aref.rs | 170 +++++++++++++++++++++++++++++++++++++++
>  rust/kernel/types.rs     | 156 ++---------------------------------
>  3 files changed, 176 insertions(+), 151 deletions(-)
>  create mode 100644 rust/kernel/sync/aref.rs

This doesn't apply to `rust-next` or `v6.16-rc3`, what base did you use?
When creating `.patch` files for sending, please use `--base` to make
git add your base at the bottom.

---
Cheers,
Benno
