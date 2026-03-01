Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7E220F38
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 20:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772395563; cv=none; b=sboMz1kYejkheRHREQ1rRKgt/aK7V+QwFX1NspQXkrn+rwWiVObtIojUzZ/KxVCxEa5lkZ+wA2Tzv+Ux4y2X/R2EUeFoWfO+ss1+1ZYivRmE3IgFNRWcr76gs5No8oSVCQ20csoHgYEl0VM2sxga9fJx7ETYot8AzA7Tb2lrqmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772395563; c=relaxed/simple;
	bh=lwwsbpwj+l/59YwN4kXURbhgW+7CjqohLwrYYD1esr8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LZpUaApRoV3Aiq+kh5CzjhtKWX5jvf/4yO/uoalcTlBaACM/9DDSRkZoRBjKg+khbX5B6SXPjTuwXE0K5JaOo835xALD+CxQ/MhOlySvx6kUpeSFq5Jb+6E5RPToGsk9xzjU82JcC2mKD8D0vyZ27zXjFK1A1D+ouf4BETl8ONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyPTemtj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyPTemtj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA78C116C6;
	Sun,  1 Mar 2026 20:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772395562;
	bh=lwwsbpwj+l/59YwN4kXURbhgW+7CjqohLwrYYD1esr8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=uyPTemtjsoyee1awOyLaA9SoVMU8cZzttdGd2H3dMYUO9wz0BY2KNnsdG1qHFM8KM
	 1f/iAQ8FNcJitTwQ4tr9Yxu8hLPI2aeXl+tYjZ0hI9MSXptfLOESdAQkXGXmO5leWz
	 i1P3I/Pism4e6zyi2KlgA/ccqJ11j+wajhkN/YiRnmY4pubiIc/tU9yzWxf9SVnSug
	 AmVQoEVaE6txaSfJqp/fJi3EDGceih9bLZ7+8CuzP15zyFxE8mKqJOAnasXfHBUah9
	 8loJ6iGVDONTYDjt1KwnwYW+Naox0sVi4/NK/aWINgL78WEOTKbOch7zwT/DCooP7l
	 EyhgKoVxSpiUg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 21:06:00 +0100
Message-Id: <DGRPSFTQAMBT.3CWVCXXAVET3X@kernel.org>
Cc: "rust-for-linux" <rust-for-linux@vger.kernel.org>
Subject: Re: pin-init Clippy nightly trivial warning in 6.18.y
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <CANiq72nWYJna_hdFxjQCQZK6yJBrr1Mb86iKavivV0U0BgufeA@mail.gmail.com>
In-Reply-To: <CANiq72nWYJna_hdFxjQCQZK6yJBrr1Mb86iKavivV0U0BgufeA@mail.gmail.com>

On Sun Mar 1, 2026 at 7:30 PM CET, Miguel Ojeda wrote:
> Hi Benno, Gary,
>
> With nightly Clippy in 6.18.y, I am seeing a trivial warning, which I
> am wondering if we would want to keep enabled or not, i.e. I can see
> you may want to keep the `nesting` value check inside like you do in
> the nested `match nesting` below that one:
>
>       CLIPPY P rust/libmacros.so - due to command line change
>     warning: this `if` can be collapsed into the outer `match`
>       --> rust/pin-init/internal/src/helpers.rs:91:17
>        |
>     91 | /                 if nesting =3D=3D 1 {
>     92 | |                     impl_generics.push(tt.clone());
>     93 | |                     impl_generics.push(tt);
>     94 | |                     skip_until_comma =3D false;
>     95 | |                 }
>        | |_________________^
>        |
>        =3D help: for further information visit
> https://rust-lang.github.io/rust-clippy/master/index.html#collapsible_mat=
ch
>        =3D note: `-W clippy::collapsible-match` implied by `-W clippy::al=
l`
>        =3D help: to override `-W clippy::all` add
> `#[allow(clippy::collapsible_match)]`
>     help: collapse nested if block
>        |
>     90 ~             TokenTree::Punct(p) if skip_until_comma &&
> p.as_char() =3D=3D ','
>     91 ~                 && nesting =3D=3D 1 =3D> {
>     92 |                     impl_generics.push(tt.clone());
>     93 |                     impl_generics.push(tt);
>     94 |                     skip_until_comma =3D false;
>     95 ~                 }
>        |
>
> Anyway, it is just in 6.18.y given the `syn` rewrite and not urgent
> since it is nightly.
>
> Please let me know what you think about the warning overall and for
> 6.18.y we can backport a targeted clean up.

I think we should just allow that lint here. I don't see the need to
shuffle around stable-tree code just to appease a clippy lint. Further,
I agree with Gary that if we were to do the fold, the code would become
harder to read. If we moved the condition into the guard, the pattern
could still "conceptually" match on the blanket arm below (it logically
can't because of the `!skip_until_comma`), but that's a thing that a
human has to parse. So even if we still had this code in mainline, I
would allow the lint there too.

Thanks for keeping the look out for pin-init on the stable trees & Rust
nightly!

Cheers,
Benno
