Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E836EAA7;
	Tue, 17 Feb 2026 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346401; cv=none; b=GeN8PkCo/OwbTI71A6pH83AhNabenTjeqXItBfWxg2JGFmFRVmWI3XDCc/v67PMPFIyAwEmkR7dL22j7SYQel21UBwLA9OWB1oq3HF8nX80f05z2JxscIFxhHKoawoGGweVBIS47e7vfozliNB0Q+D6a/wwA7U3nADc/6P/4JnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346401; c=relaxed/simple;
	bh=m6umUwBBv9/auyVPuVMCugum+ga3ss3G/aSJmQ9nxf0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Cr0Pu9TvjXT/HOD0aYpAIv0w5lUDoY+QQhkN2vGdf6OEQjBe+hNts7+6rrT0JWX0byrm1ovXgN0f9RznXO4Dv1VQJueUxxGza9kNU+YTd6RReW/u+LYv74cVvoXNzsP0DR9+JhzZINJsuGAz5YStniJ8HwyPfw+Y47HQ8I67roU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6Nu6Gb4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6Nu6Gb4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA83EC4CEF7;
	Tue, 17 Feb 2026 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771346400;
	bh=m6umUwBBv9/auyVPuVMCugum+ga3ss3G/aSJmQ9nxf0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=X6Nu6Gb4dhdhxYaZ6UOoYs311hIKIgyk1hBpt3rnHu/9ML1Q+PjRKRj+Ms2PAL61t
	 VpQnN2kMAU7/3TPUu9S2BF8yvNEP9JX9NpQENfDs6DVnNadPhyLJttjSNgqP09DXlo
	 A1Rd8kYkRRxjEWre7miuzb0m0WRhiW2IHI1dae0K1oQYUL8AJIOPb7nwgByuvfg9Cj
	 m4WMakmA0HhuRQBXc8TLp8VrzJKGr0Ul5UIyIdtuVCe/Zxj7mh3clPiuCPlwLP8Bt4
	 YdSqpPwjy8VNdFmFIWzhF+SNHvUQZdG/3x0w4OuXNs2ViFIg0L0nP9uGmREA0ACZRY
	 wAlxv80AeSAxA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 17:39:54 +0100
Message-Id: <DGHDW3YKM7L7.C75AZ8DY9K51@kernel.org>
Subject: Re: [PATCH v4 19/33] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-20-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-20-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
> index c952a834e662..f068722c5bdf 100644
> --- a/drivers/gpu/nova-core/num.rs
> +++ b/drivers/gpu/nova-core/num.rs
> @@ -215,3 +215,13 @@ pub(crate) const fn [<$from _into_ $into>]<const N: =
$from>() -> $into {
>  impl_const_into!(u64 =3D> { u8, u16, u32 });
>  impl_const_into!(u32 =3D> { u8, u16 });
>  impl_const_into!(u16 =3D> { u8 });
> +
> +/// Aligns `value` up to `ALIGN` at compile time.
> +///
> +/// This is the const-compatible equivalent of [`kernel::ptr::Alignable:=
:align_up`].
> +/// `ALIGN` must be a power of two (enforced at compile time).
> +#[inline(always)]
> +pub(crate) const fn const_align_up<const ALIGN: usize>(value: usize) -> =
usize {

We should probably just add this as a function to Alignable.

> +    build_assert!(ALIGN.is_power_of_two());

ALIGN is a const generic, hence this should be:

	const { core::assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of t=
wo") };

> +    (value + (ALIGN - 1)) & !(ALIGN - 1)
> +}
