Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575EB14AD20
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823298; cv=none; b=jVO6N264NLNVzLXpyvnsKsehc5ktjfwIvyLE6enxgBGRYf93T3Qby+XXu1EjRo/L5HNYV2v9wsmf/ECK2EWPS4DwJh0JgdFd+3fXqvzCOzczi693zV5Huspaa8qSuGfxuoE8iWjybhKHUcoC9y20SPqTWF2IZDIQGtoYjKiDAqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823298; c=relaxed/simple;
	bh=+62640ndgmB0fxa4E8/v1FxPgm+qfLhMw4xeTHEgCIw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F7h1g78WE3kv8dam9eFFf3B0Fko4pmxNOi7sRWxmx14X56gBs6oaLCwdh4ua2ioOJDnu3j4YRxcIV/JMl1sahRhygVw7YXC4k25PRiw9xpMImgFjTS484/F5gEoPWN2dIiKRr8NkyBGLS4DgEx+xKX5ujAC8sHJiXyIOYUwxi/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z80NK9BB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z80NK9BB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E5EC19421;
	Wed, 18 Mar 2026 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773823298;
	bh=+62640ndgmB0fxa4E8/v1FxPgm+qfLhMw4xeTHEgCIw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Z80NK9BBHxfWwqonBX+UXpIKUsLR2L71IFFtubmXx0yLtd458fdbShLLNggVK3K3x
	 VwABdaYitfQoL6OsaJ0mqN/4ISj9wuSp+28+CIjm1Je6orxxGGGD7AYNRH8yjoBSEy
	 x35MOCyRNws37gm9xejnrkF2UQiHAOsoMbTB3Dr9YqUEbtfYulgCckkP/BGIML5glt
	 +YOU1u/DYUW9AK3qi92TxX913oFeBlgC1TvjO/M1TLWlnCoYhd5RR5PuXq4Le4fMwI
	 RGx8NngYq5yRlPTa4SAZSOlx7jigqbZr7K3KTLGhlI95PZuIJAfe7amC4lIhOcPHa2
	 GJckLKDvSSjrw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 09:41:33 +0100
Message-Id: <DH5RVNK0TCQG.3E2K1WC03CBXM@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 "Guo Ren" <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>
X-Mailer: aerc 0.21.0
References: <20260121183719.71659-1-ojeda@kernel.org>
In-Reply-To: <20260121183719.71659-1-ojeda@kernel.org>

On Wed Jan 21, 2026 at 7:37 PM CET, Miguel Ojeda wrote:
> The Rust kernel code should be kept `CLIPPY=3D1`-clean [1].
>
> Clippy reports:
>
>     error: this pattern reimplements `Option::unwrap_or`
>       --> drivers/pwm/pwm_th1520.rs:64:5
>        |
>     64 | /     (match ns.checked_mul(rate_hz) {
>     65 | |         Some(product) =3D> product,
>     66 | |         None =3D> u64::MAX,
>     67 | |     }) / NSEC_PER_SEC_U64
>        | |______^ help: replace with: `ns.checked_mul(rate_hz).unwrap_or(=
u64::MAX)`
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/rust-1.92.0/index.html#manual_unwrap_or
>        =3D note: `-D clippy::manual-unwrap-or` implied by `-D warnings`
>        =3D help: to override `-D warnings` add `#[allow(clippy::manual_un=
wrap_or)]`
>
> Applying the suggestion then triggers:
>
>     error: manual saturating arithmetic
>       --> drivers/pwm/pwm_th1520.rs:64:5
>        |
>     64 |     ns.checked_mul(rate_hz).unwrap_or(u64::MAX) / NSEC_PER_SEC_U=
64
>        |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider u=
sing `saturating_mul`: `ns.saturating_mul(rate_hz)`
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/rust-1.92.0/index.html#manual_saturating_arithmetic
>        =3D note: `-D clippy::manual-saturating-arithmetic` implied by `-D=
 warnings`
>        =3D help: to override `-D warnings` add `#[allow(clippy::manual_sa=
turating_arithmetic)]`
>
> Thus fix it by using saturating arithmatic, which simplifies the code
> as well.
>
> Link: https://rust-for-linux.com/contributing#submit-checklist-addendum [=
1]
> Fixes: e03724aac758 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Just encountered this during my testing, could we get this picked up please=
?

Cheers,
Benno

> ---
> It would be nice to clean this up, so that Mark may start enforcing it
> in linux-next -- thanks!
>
> Completely untested, so please beware. Also, I am not sure if I am
> missing something here, since saturation arithmetic is already used
> a few lines below already.
>
> Cc: Mark Brown <broonie@kernel.org>
>
>  drivers/pwm/pwm_th1520.rs | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
