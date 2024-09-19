Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC07199FCD
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Sep 2024 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726756777; cv=none; b=RibqIu9laiaeqfsBuwNRD35YVWgbwbGvaQxlzy50CpbMFYUveJt0v5f+coMF9GmfRRCHk1LdsSX16cJloxhy1ZkMc+Mz/dD+8DXK+D95M4rxNLUk/Mho8dr5XlodCLXlIcj+Jl6sEtuPoh6sm64geqE1iG7hc0PMSPYTOjkjBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726756777; c=relaxed/simple;
	bh=EryF5YqktQ3SPT/Dmxdolqn78TmPB/O2/v4OPwCrblc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q7AlvyunF/ruvx6mAxjSpYe9xD/YXRFHNOQaFMBvOre3tsRwXnSW/8HyA4I6hR0RAalxjI9u7aILKrg6dlg+dlj8FIpr2b3p7Y29neMrfbOF+mUuszaEKNkD6W8opOgdMqz/u+znNkINoYDWru8tY59QwQnmNJvxgcvPLiezvyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=M79JP4sB; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="M79JP4sB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ifjonnftjrconnobp4ui4h7ebe.protonmail; t=1726756773; x=1727015973;
	bh=esIlMI/pIgzv2rJY0m9Ak0cS4TT0PmAgojSN33cwCE8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=M79JP4sBT7LJcOfinUOe3DnOzXJj7C0+qCMYawjUa/vScU9oyx6IjBoRbkp2VYJj1
	 qfpImY/aCz2/nBa6r0xDeyU35iKkGZfbFknWr5cJVTwsdNhgA0N9oxHR0abBSDf+DG
	 cRXH4pdVMMM3+j8a4p38tvz84RlUGZd+wDchN4QAOlMgNX4ti0zZEpjudkuwz7eABr
	 rGQDSyqIg61sLjp6WfC3TvfqUWFDBeGfdmhWC8VN7UbQq0S6V3K8Al12C2eP76nype
	 pEccSdpN5wZP3c5Vu2WVnzXa/xJQiMnaPCNg4shSrKQsctaOQs+KiJIl0lVTPH5v/e
	 KPZ3QMeXKYVsQ==
Date: Thu, 19 Sep 2024 14:39:26 +0000
To: Aliet Exposito Garcia <aliet.exposito@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: Move `FromBytes` and `AsBytes` traits to a new `transmute` module
Message-ID: <2ff059f9-2cb7-4d45-9412-648f2e795017@proton.me>
In-Reply-To: <20240918225115.2309224-2-aliet.exposito@gmail.com>
References: <20240918225115.2309224-1-aliet.exposito@gmail.com> <20240918225115.2309224-2-aliet.exposito@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a718470a68d4fccac835be50118d79c32cda6511
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19.09.24 00:51, Aliet Exposito Garcia wrote:
> This patch refactors the `FromBytes` and `AsBytes` traits from `types.rs`
> into a new `transmute.rs` module.
> The traits and their implementations remain unchanged.
>  - Adds `rust/kernel/transmute.rs` with the definitions of `FromBytes`
>     and `AsBytes`
>  - Removes the same trait definitions from `rust/kernel/types.rs`
>  - Updates `rust/kernel/uaccess.rs` to import `AsBytes` and `FromBytes`
>     from `transmute.rs`
>=20
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1117
> Signed-off-by: Aliet Exposito Garcia <aliet.exposito@gmail.com>
> ---
>  rust/kernel/lib.rs       |  1 +
>  rust/kernel/transmute.rs | 67 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/types.rs     | 64 --------------------------------------
>  rust/kernel/uaccess.rs   |  2 +-
>  4 files changed, 69 insertions(+), 65 deletions(-)
>  create mode 100644 rust/kernel/transmute.rs

Thanks for the patch!

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

