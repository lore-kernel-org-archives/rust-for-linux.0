Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A97038B9B1;
	Tue, 20 Jan 2026 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768939275; cv=none; b=ME1DKhuNNJ23FxE3cxwn8kUbrueqlQQxLOP3eKiJYvTS1j+79O6m6fix9YS5GhU0M0gOYZDvSGvMninKy7JTs1Ktubr8v0hIpRS49wEO+ZolqFFlfeI+ZN+FXI3Q1FM4Oxq3GeUBYu3/fkW1OGr0AjcysiDpyY0WT1aRm/bLg8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768939275; c=relaxed/simple;
	bh=lkTluKCAapJ+mOA8/RM/9/2OushMrLGsjtZNjHwCrtg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=hJnKpEONuKPbKYT8uiz/G23zZMpohOQgmMqsyvPailrBDxAP52J7iH41st1uKda8GJQujJOg1XmKwcgq55gzBIiIH2iKJybKvC+uxszMhwkfO4pW3nUzELTz0/C2V43uxbUF4y0l/zL4i/Nt0+g2OmRpi6Rlv6Ba/LDUyesJv68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2PfdtSR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2PfdtSR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F46C19421;
	Tue, 20 Jan 2026 20:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768939274;
	bh=lkTluKCAapJ+mOA8/RM/9/2OushMrLGsjtZNjHwCrtg=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=n2PfdtSRp42v+cqlXZKoHTEXV14ixBA/2XCnDiMMdYTyLGUA4+n0cTXz7JvpdwihO
	 +MIcf3oU5c+avADtYrpKM6/tTV03GkGFoMcLmalPdPz6Hi1oOfrE8lmJqaGwCD1yWS
	 E8DjsPFUSXsXkflSRu9Q64LvvtmyiaiwVq8B567tu1k/mDvtP5zmg35FH4niOIrPbx
	 x0ts3BbOEZAiW3iUw9l43Bspce4tV2c9QNt6H4/xyXKTMx08CGXrUBFElRnDFtJs9B
	 o2sQkZ6wf1JYrEXk/dPfLoEKOPHs/9v7BJa1JgI6zxBX5K9pry8dVxY+hhDpiJ1DI6
	 8i/9GdEqhLXIA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 21:01:08 +0100
Message-Id: <DFTOMX7KEFXK.3A9467KZ5GGAG@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com>
 <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org>
 <CANiq72=PWw6MW8NiHtFPmQ5C8xjzVJf2OOpVP2YQbsFqrB4XMA@mail.gmail.com>
 <DFTHCJYQHUHD.24MJ2SUFZDLTJ@kernel.org>
 <CANiq72m2tU-Zuv_MjLdjfK0qjE45YnuMmTTtrbzmrQ3=84ei=Q@mail.gmail.com>
 <DFTITPLFU1HB.3VCKBVLW2VCPI@kernel.org>
 <CANiq72ny=huNUmM7_1XjFyXZ_zvTFiAGwx4UB_dOxSaUx5VwOg@mail.gmail.com>
In-Reply-To: <CANiq72ny=huNUmM7_1XjFyXZ_zvTFiAGwx4UB_dOxSaUx5VwOg@mail.gmail.com>

On Tue Jan 20, 2026 at 4:48 PM CET, Miguel Ojeda wrote:
> On Tue, Jan 20, 2026 at 4:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> I think it's just about pasting the current bitfield work into register.=
rs, such
>> that it can only be used from there. In a follow up we can work out how =
it
>> should turn out finally and have to patches: 1. introduce bitfield.rs an=
d 2.
>> move register!() to use the code from bitfield.rs.
>
> Hmm... I am generally not a fan of putting local code. I know you did
> it for the DRM `register!` itself, which is fine given the constraints
> you have, but here perhaps we could put it in the right file but as
> private/hidden as possible just to be used by the other file?
>
> i.e. that way we can debate improvements on top of what we have,
> rather than having a move or new code and a drop of the old one?

I'm fine either way; the reason I proposed it the way I did was that I thin=
k it
sets the least precedence for how bitfields should turn out eventually.

> I mention this since you say "pasting", i.e. I guess it is still
> smaller, but it sounds like you would essentially use it more or less
> as-is?

I left this to Alex, he knows best what makes sense.

>> The register!() macro code is worked on by Alex for about 10 month in no=
va-core,
>> the first RFC for general I/O infrastructure is from March 2025 and the =
current
>> series has been discussed on the list for about two cycles.
>
> I meant the `bitfield!` one, i.e. landing the patches as they are here
> if we get very fast agreement etc. etc. I can see that possibility,
> especially if private/hidden.

I think it's rather unlikely to land bitfields this cycle. I think Yury
explicitly requested more discussion on bitfields and also encouraged the "=
two
stage" approach [1] moving register!() first and then extract bitfields
subsequently.

[1] https://lore.kernel.org/lkml/aOaIIV8KDA0GjF6E@yury/
