Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7CA325737
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 16:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769358255; cv=none; b=cd3xow/dJnMo8P+t9bR79wqrGntbOsVn8RjEmIbmcZRUrREAnQktcJM07GCBjt+rBRznH5Zokygjtyw1XCM4HHdOHum4i21qFlb+e/iZXeyRV2Wm4TtGsusvmZoEfzWxYRWlKiARQV6WFb9uL4nkr108rGemoQocVQVEXeHIbN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769358255; c=relaxed/simple;
	bh=ycA5EltIhnabz00h9MF8AHHKTe8fgalYZeTr/jXsIec=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hJN8q4vHfZGdX1sl+asdx8nbQ4c2IBhz2C5pgLoWKeNFL9J8OW/gWDdk8vfigDgmtmLOvWbkT6HCRjQY0xg9o/7wIfwOwgCHhDcfT+gTfNt7BenSgRG5ug7kfw1x6YWXkT02W0Zpzji/Ry1Q74PATyfqOWN3S8JKRIaqYAyDzgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNLDxMUl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNLDxMUl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CFCC19421;
	Sun, 25 Jan 2026 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769358254;
	bh=ycA5EltIhnabz00h9MF8AHHKTe8fgalYZeTr/jXsIec=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=SNLDxMUlqpIuN+Y2dp1BrLMk1hPp86Kd+FhnDVnheZYQ09yWxjXjEP747u7oTjdfh
	 ml5QylurT0nieKUjTS4eX73bUtPYC7EIEU6FwywXlmE4x1ujT4hu09COCec3EiEV6k
	 6peALI3FQ+vVbwmCyfR4Dn5/FmD8xtRSjKqPh8EsXR6XyY7WKc3u8lvbrDM3/NLZJU
	 3qAvaDH4acQustGCr7awDz87O+8ipqVllzstJj3fOrQ4uhTDLYgiwi8REmnRY8j4PR
	 t552p4hqvDO1Haj4oyleoNrA0OiM1Q8ng0ygz8nl1tAycCvf2XUexYt8qcKgrC7gv5
	 IwdOmIdGrTwQw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 17:24:10 +0100
Message-Id: <DFXT5IV4DC34.1EQKKD6KP56H@kernel.org>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
Cc: "Drew Fustini" <fustini@kernel.org>, "Guo Ren" <guoren@kernel.org>, "Fu
 Wei" <wefu@redhat.com>, <linux-riscv@lists.infradead.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "Mark Brown" <broonie@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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
> ---
> It would be nice to clean this up, so that Mark may start enforcing it
> in linux-next -- thanks!

Indeed, the patch itself LGTM.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
