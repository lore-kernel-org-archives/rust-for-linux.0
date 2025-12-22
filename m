Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E4A169AD2;
	Mon, 22 Dec 2025 06:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766385270; cv=none; b=a2xWwZNYJWCfImqMMlnA2NxpWDZxFBvyu/NjStUNZHZKTOwI5FN9RBONFpo1cXSWIiE6e10c37ew8ILx5cNu3y/2CLt1+e+lLZvLW5+dhiH44K1SeBkSCBBiceiz2nKfd3mDyVera2IC5YLaESkc7UmkIsKNhEuiLzQZrqKFZNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766385270; c=relaxed/simple;
	bh=DEaHfqHAH+00nPps05nWYQNEzU59QLYjyzdT04Ty50c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=O7g/BB8/mLb8on4HM+wIZqWGM4W2SJ00YWNmgyl9YtE8W9qc9g+/hyvkCTNzGfYF1qQLAAl4Xj6l1KVYgeMO84XnZ7sAdNNhfbI1sfOERUdlAdvNETGCU8nxIsuo/P1UsdyAT7AXpBldYkGgZ4w0oFsE7ceLrWue5ObcYOrUGcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1wPPfAr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1wPPfAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8E1C4CEF1;
	Mon, 22 Dec 2025 06:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766385269;
	bh=DEaHfqHAH+00nPps05nWYQNEzU59QLYjyzdT04Ty50c=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=F1wPPfArHzY9gfDPtjbtF/CMQAAFuIbajrEU1t2wxx/YMDkhrR2qHhv2JHopyKu3v
	 zi1BNKkosp+AB269YSPiLN08LdwnXqwbJSDK9Vea6op9Jm+uf0/x6vYngZgJaC6uNJ
	 JCwyY30loDScUcSDkDj9DWoyCDpHPjsWyojoHw1+sZ8XrLH+WYe+C7gGXQYe5i1dsq
	 EoJhEmre8CuwVyKvR7StQfwiwWD3JLtvyhQcTUVDfX2yZ/yvrDVMzptD/2xfR7gRBW
	 TBF2ACx5TdFj4cLt03GkFOhAe6r7CUU/x5g/i64wh17CPvMQkbAAU3+i08YSo5dd0E
	 6Pt6R6adXLteA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:34:24 +0100
Message-Id: <DF4JBGAGVKYW.367WAXDU2B0B1@kernel.org>
Subject: Re: [PATCH 07/11] rust: macros: convert `concat_idents!` to use
 `syn`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Guilherme Giacomo Simoes" <trintaeoitogc@gmail.com>,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, "Tamir
 Duberstein" <tamird@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, "David Gow" <davidgow@google.com>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20251211185805.2835633-1-gary@kernel.org>
 <20251211185805.2835633-8-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-8-gary@kernel.org>

On Thu Dec 11, 2025 at 7:56 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> This eliminates the need for `expect_punct` helper.

This commit message could use some more details :)

> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/macros/concat_idents.rs | 39 ++++++++++++++++++++++++------------
>  rust/macros/helpers.rs       | 14 +------------
>  rust/macros/lib.rs           |  4 ++--
>  3 files changed, 29 insertions(+), 28 deletions(-)

> -pub(crate) fn concat_idents(ts: TokenStream) -> TokenStream {
> -    let mut it =3D ts.into_iter();
> -    let a =3D expect_ident(&mut it);
> -    assert_eq!(expect_punct(&mut it), ',');
> -    let b =3D expect_ident(&mut it);
> -    assert!(it.next().is_none(), "only two idents can be concatenated");
> +pub(crate) fn concat_idents(Input { a, b, .. }: Input) -> TokenStream {
>      let res =3D Ident::new(&format!("{a}{b}"), b.span());

There is `quote::format_ident!`, which directly returns an identifier,
but with the span of the first of the two. Not sure if that is better.

Cheers,
Benno

>      TokenStream::from_iter([TokenTree::Ident(res)])
>  }
