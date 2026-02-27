Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2BC34EEFD;
	Fri, 27 Feb 2026 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216195; cv=none; b=EgfMfZGMI75/wdLee0bSFY+L659it5FLi6+byYm7NfwTfOA/ZKSY1hXi3ie1T8RtyfyxWdEi4tXRwjwM6xda9KaUI4Qybqti+jZOZoANx53BwZpeojagfVDaCibLwe1WV4EifPXZnw6J7k/c4wHnLa3DGBrJAYVBVXfp4gUU0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216195; c=relaxed/simple;
	bh=fxHuM2+xnuP3GyFcKti685XXztZ+iK8eAtUyADVTLIc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aw+8WRvReEATSSsShJoOBP4B4VDOkB5KsoSxG7LdXGSqoWVzj2+oEshJn88UghOnL3IY3LcPXLlMDok/IlqK8gfQB06Eo48W805ozXUQbxV2puno8qLZxuLPChHaX1IU7yOTMdTIZ/drObLC3aKBmzFwXRUE6TpzMrUXdB514zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSwwUL5F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSwwUL5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D46C116C6;
	Fri, 27 Feb 2026 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772216195;
	bh=fxHuM2+xnuP3GyFcKti685XXztZ+iK8eAtUyADVTLIc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=jSwwUL5FIgamzzaqeki9SOIHKrcdmdJlguwn5LGJdfpoXYlQrxCeroXkFLjoXUoab
	 HtgIElag2gEW/lQvj83KpqCvkKrz2M5Ng2qFRgoEUvZYe5+zVucUJS2DamlZkEhzCd
	 dZC8n2YQ3eT8qzag3N+vRjk9E04PEZemb+RzKb/MuthDxwkuTISAgUVwCH6PgxXfrV
	 2Zy2EgK+PuSUf2QFgPE7u1S7G7e8EVZl4gWVZ/2Xg/RdYfOlofRV+0fmlP+cySqQ9O
	 /NKjjkrQVmw59OeQPKBwOnTbtNjVmVB2SZjix8qYwsqlxxjsCM95+Upx9qaSDXb+Cp
	 jNfW7yarqquaw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 19:16:29 +0100
Message-Id: <DGPY7I5NGGJS.3DSWVLH5YA1Y4@kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
In-Reply-To: <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>

On Fri Feb 27, 2026 at 7:02 PM CET, Gary Guo wrote:
> Thinking about this again, I think we might still want to write
>
>     io.write(REGISTER, value)

I'm not convinced about this; it feels like optimizing for the less common =
case.

> Granted, this does mean that we will write `REGISTER` twice in some cases=
:

I'd rather say in most cases, i.e. most registers do consist out of multipl=
e
fields.

>     io.write(REGISTER, REGISTER::default().with_field(foo));
>
> But, we have no redundancy for the update case:
>
>     io.update(REGISTER, |v| v.with_field(foo));
>
> The reason for this thought is that conceptually, the type of a register =
is not
> necessarily coupled with the register itself. This is the case currently =
for
> register arrays, but also the case when we think in the long term where
> bitfields become decoupled from `register!`. People also might just want =
to
> define a register of u32 without any bitfields at all, and in this case w=
riting
>
>     io.write(REGISTER, u32_value)

It could also be written as

	io.write(Register(u32_value))

but I also think that the below is acceptable.

> looks nicer than
>
>     io.write(REGISTER.set(u32_value))
