Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DF41A238F
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126309; cv=none; b=Ra+QulWBFBNF5LpnqGPuBEJOY5e8nREYkxdIenDZw6v4ZWtR50PDPhYdhmlFWtw9vtbeYs/q9hViCurucSWXwE2r3ohRUK0j5huyYIpYz7UPBe1HwmVgSt2dSBOHaDmNixwyzqeztPp7I8Sty3FWqgFMQl0QmDixsmQizDlW7hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126309; c=relaxed/simple;
	bh=IORVI3U9Mau+jHI9tACoPuqKEBH1SLnxM0o6c8BfTrc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Hmg8UJPC98ynl4pQ5cL7HQ3I8+lODJ3ZuJbR9yKfw+840LM44XJmWsXXb0BIphtPHatvcQuAK5/hpdwhPg8OrfKNaeCnnlKPqHT3geIu4ahpCZLMQTSldXN/BEIWTZOkuSnxuKK2PoTa+J1VY31fVT46GQcxumaE6xhBSI8H9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKBkkJRj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKBkkJRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1450D1F000E9;
	Fri,  7 Aug 2026 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786126308;
	bh=Iuu8CTfmyvW4mOZPSBJvHQ5eAUXm+YVdu9qWa7f9fA8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=mKBkkJRjKCIJIAtT1wD/7ZMpkGG/iuv/QzkmE8u2cVCPHT5Qp1sbLKG4y4A+/Gmg2
	 UkWlbHn5jaL2eW9P8rh02NWXZHEMLBPZfZvSFtQ4kAqt0nbqA1N5fyQHpQsAa6D1i6
	 1x9O2TUq4uKo09xasB+ftIO1GLttJKjjyd2irOM28P2wx8jneXdFTHvUhgSgoAJ/lc
	 HM4ap1aDzKjbz7ns4yHhduu4C7raLkm/w2B9vjUeakbq4H45PhXByUvqCBmNoxk5OM
	 XxrCE6FZZTmg1t85DkX1NGk1OYjLmEscGf2HdKMFnHWOLYkNJUWFf8LUfNWtp9fVUK
	 A7Vt39PfbscnQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 20:11:43 +0200
Message-Id: <DKIWXK4YSI1Z.3O2QSQ04538XI@kernel.org>
Subject: Re: [PATCH] rust: bitfield: always inline test conversions
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, <rust-for-linux@vger.kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Antoni Boucher" <bouanto@zoho.com>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260807175012.142083-1-ojeda@kernel.org>
In-Reply-To: <20260807175012.142083-1-ojeda@kernel.org>

On Fri Aug 7, 2026 at 7:50 PM CEST, Miguel Ojeda wrote:
> From: Antoni Boucher <bouanto@zoho.com>
>
> When using the Rust GCC backend (i.e. `rustc_codegen_gcc`), GCC does not
> inline enough these `Bounded::from_expr` calls:
>
>     /usr/bin/x86_64-linux-gnu-ld.bfd: rust/kernel.o: in function `<kernel=
::num::bounded::Bounded<u16, 2> as core::convert::From<kernel::bitfield::te=
sts::Priority>>::from':
>     fake.c:(.text.unlikely+0x7be): undefined reference to `rust_build_err=
or'
>
>     /usr/bin/x86_64-linux-gnu-ld.bfd: rust/kernel.o: in function `<kernel=
::num::bounded::Bounded<u64, 4> as core::convert::From<kernel::bitfield::te=
sts::MemoryType>>::from':
>     fake.c:(.text.unlikely+0x90d): undefined reference to `rust_build_err=
or'
>
> Thus, similar to commit bc197e24a3ac ("rust: num: bounded: Always inline
> fits_within and from_expr"), mark them as `#[inline(always)]`.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Antoni Boucher <bouanto@zoho.com>
> [ Reworded to add the error and to follow our usual style and sent on
>   behalf of Antoni, who found this during his work to support Rust for
>   Linux with the GCC backend, i.e. with `rustc_codegen_gcc`.- Miguel ]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
