Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4622E1FE451;
	Sat,  6 Dec 2025 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765009394; cv=none; b=Bf/BweT8vxdwpt8ahstc6Z0fYAOrQ6Y85BoYRDmIfgDuNmyIsZHsMAa/ddSLg22k8GTejGyF6eZBUkpMb4VJ7JI1vNwkrPNc/QZGIi484vXc+woAW2O+qe/nl1ah6OqPnbx87+oGAkYCsaq9C1UpQu33Oft3Luw11C7Pxv+zWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765009394; c=relaxed/simple;
	bh=bCOUiLOBA5QGxKLPhvgUTgxDu5ez8iANK4wFcS4IVdw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Gy3E8egNHyw+z2gKtWHANKhFIMreTETEMgSgMLIqIEskAqv13tRo9PNaEVHXcXVzFe/Evh6jhq7izsl8tOnOUhpTQKk886YgTYrokJ4nyWyfuuPB0vup5sMjvxRf21n8nVyt8wheSo/Wug7erWHcYNmzKuOt5U6liZGbXMOP+wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNV0bxyW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNV0bxyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BFDC4CEF5;
	Sat,  6 Dec 2025 08:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765009392;
	bh=bCOUiLOBA5QGxKLPhvgUTgxDu5ez8iANK4wFcS4IVdw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=TNV0bxyWd5ruo6A89bzXOaE53J4PHcb4s+NxtywMWQ71+4qFrzFReNfQsjsuv90BM
	 24johLh53BU98RW7pzWrx4iwnCk5sjDUzxmHwDG2PkG4RU6V21sAKtXvnlEe0SScwV
	 5bGp2LkO8Ksu5ALBV/dp1qYMDAGUuGPVZ/E2ZzGoVykqLhiWhrRG0irF6XBUK3XQ8M
	 UpPSApkBq48KbgMh76Q3qlGPwiXWhZwuiFQpoC3p6rRXdXYWRvRavgDZMoRHSVffRW
	 gbpM+KDltDvPb8I8fuyF3b8jFHZOEaCbiof4eLID3VtfD8McXaVnA8kI1Cza+D889k
	 nwXBxEnuwLc4Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Dec 2025 09:23:08 +0100
Message-Id: <DEQZLZ9AVCZE.380X3OF521Y5L@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Alban Kurti" <kurti@invicto.ai>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.de>
Subject: Re: [PATCH] rust: pin-init: add references to previously
 initialized fields
From: "Benno Lossin" <lossin@kernel.org>
To: "Janne Grunau" <j@jannau.net>
X-Mailer: aerc 0.21.0
References: <20250905140047.3325945-1-lossin@kernel.org>
 <20251203220516.GA592465@robin.jannau.net>
In-Reply-To: <20251203220516.GA592465@robin.jannau.net>

On Wed Dec 3, 2025 at 11:05 PM CET, Janne Grunau wrote:
> On Fri, Sep 05, 2025 at 04:00:46PM +0200, Benno Lossin wrote:
>> After initializing a field in an initializer macro, create a variable
>> holding a reference that points at that field. The type is either
>> `Pin<&mut T>` or `&mut T` depending on the field's structural pinning
>> kind.
>
> just as a heads up: creating references broke part of the agx firmware
> init structs which uses a `#[repr(C, packed)]` struct as field in
> another struct. This fails with
>
> | error[E0793]: reference to packed field is unaligned
> |    --> ../drivers/gpu/drm/asahi/initdata.rs:722:28
> |     |
> | 722 |                       sub <- try_init!(raw::GlobalsSub::ver {
> |     |  ____________________________^
> | 723 | |                         unk_54: cfg.global_unk_54,
> | 724 | |                         unk_56: 40,
> | 725 | |                         unk_58: 0xffff,
> | ...   |
> | 731 | |                         ..Zeroable::init_zeroed()
> | 732 | |                     }),
> |     | |______________________^
> |     |
> |     =3D note: packed structs are only aligned by one byte, and many mod=
ern architectures penalize unaligned field accesses
> |     =3D note: creating a misaligned reference is undefined behavior (ev=
en if that reference is never dereferenced)
> |     =3D help: copy the field contents to a local variable, or replace t=
he reference with a raw pointer and use `read_unaligned`/`write_unaligned` =
(loads and stores via `*p` must be properly aligned even when using raw poi=
nters)
> |     =3D note: this error originates in the macro `$crate::__init_intern=
al` which comes from the expansion of the macro `try_init` (in Nightly buil=
ds, run with -Z macro-backtrace for more info)
>
> This was easy enough to work around, I don't see how this embedding of a
> `#[repr(C, packed)]` struct was necessary or at least helpful. The code
> is not expected to be included in the upstream driver so it no worth
> spending effort on this.
>
> I don't think it's likely that anyone else will run into this but I
> thought I mention it at least.
>
> The asahi driver also ran into the discussed variable shadowing issue (a
> variable was used to initialize a field of the same name and was later
> used to initialize another field). This was trivially fixed by renaming
> the variable.

Thanks for the report, I expected the latter kind of error, but was not
aware of the packed struct issue. If anyone needs a proper workaround
from pin-init, let me know.

Cheers,
Benno
