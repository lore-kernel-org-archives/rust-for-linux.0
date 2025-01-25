Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048551DDA34
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Jan 2025 20:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737838323; cv=none; b=KJ92B6El5zwCKzoyd4aV5rw/jcBCmqupphX8c9f3ro9bsnB7O6JVz7DKUxDZh+yddSFhdUIjxq4rPxvNTHO83Dz2ec5Lt924ngQZdoFD+racQLcuj8IUW4eKld//tPbngDIFo4wouUPt+mij0glyXrIEK0H7ju+jAhkcA5iSLCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737838323; c=relaxed/simple;
	bh=cgHYLl5iOCN5/FEOS3cJAe0JHBDGFR+ad6quvGPNi3g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuCrACDWEp1aKsPPkeQ3E3/gH2q3Emd8qy537DGOTZGKWTLKQEN91+NGxjDkWUYN2ENLYG4lLJe9jooCnzJ4i0zKdobRzluQGOJDTfEAvAuKH4OcUWzeDlpGTfMeezyLCZkXmNBEoZgzRT5PLf9tOhvCyMg72hiyKcFczY/oMOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=IGCx3Osb; arc=none smtp.client-ip=79.135.106.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="IGCx3Osb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1737838313; x=1738097513;
	bh=cgHYLl5iOCN5/FEOS3cJAe0JHBDGFR+ad6quvGPNi3g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=IGCx3Osb4wSG4/uL+0pIPnJkj2cMrQ/MQyZZEhgXBL+YLOz5VaZGIPmj37mm1PvqV
	 QHdPnFSS0gU8jPZo3a9AL5kZqhyoHYKVlKNvUv99zjNcO3HhVj7mtV6xYzh+ORfCaI
	 6JfBGtVS2tbg7G2YGhTXy8wIQVshC5O0L8ikJS+TgYbMTSe3ou86Jaq6i40TQVO+wu
	 aqp2fJVw2CXua/zsx28N95OiOuBplzxDAQOhtlCbFVlNLMNAAqNJEiAkykEXZ+It+O
	 ffvxEIvihiyxTu+vlBlNbqzHsy/mpwksi8Tr8bBFicsUptTtsNIj61HMWojSJ7gHDF
	 NGpXk+MthStMA==
Date: Sat, 25 Jan 2025 20:51:48 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Timothy Garwood <gtimothy-dev@protonmail.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC WIP] bitflag_options macro_rules implementation
Message-ID: <6oVxMKpDaaUC17bi8K0ukcOwrwjvJ2_4c8LenjG7xMSJLSkAXWdU6VlCxpT8Ek1TA7veX_AShL_DRZIv2eGv66PSWTCz0S88o9gZprU0ooo=@protonmail.com>
In-Reply-To: <CANiq72=zMKKBTXmePj69=fq8qUSOFRNknW=teAdE9M1GxYuAVg@mail.gmail.com>
References: <20250125-add-bitfield-options-macro-v1-1-af6ae93686cb@protonmail.com> <CANiq72=zMKKBTXmePj69=fq8qUSOFRNknW=teAdE9M1GxYuAVg@mail.gmail.com>
Feedback-ID: 126901959:user:proton
X-Pm-Message-ID: efe401d395077bbb8447c87f8f98cdee3c816273
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

> The kernel requires a "known identity" for signatures. For instance,
> the name you use to sign documents in real life.

Will do. I value anonymity, but its not hard to figure out who I am with th=
e
info I have already given, so not really anonymous :) I'll update my name.

> The docs/examples you wrote are very nice, but typically you also want
> to showcase an actual use case within the kernel. You can do that, for
> instance, in a separate patch that does it for hrtimer or something
> else (even if it may not be intended for merge).
>
> This can also allow reviewers and potential users to give suggestions
> and to guide the design.

Ok, I already have hrtimer somewhere (or I'll remake it quickly), I'll make
another patch. which will depend on this one.

> > + /// The bitfield type, usually [u8] or [u32]
>
>
> There are some nits with formatting which are non-important at this
> stage, but please try to follow a consistent style with other files.
> For instance, we try to use intra-doc links and code spans where
> possible, avoid double blank lines, etc.

Ok. I will check the other files and be extra attentive inside any macro si=
nce
the formatter usually doesn't work there.

> I also noticed a couple typos -- I usually recommend using at least
> `--codespell` in `scripts/checkpatch.pl`.

Will do. Just fixed my codespell (did not find the dictionary), I see I ind=
eed
misspelled a few things.

> For macros, it can be a good idea to showcase how the generated code
> for a simple case would look like. It is painful sometimes to maintain
> that over time, but it can really help others understand what the
> macro does from another perspective.
>
> This one can also help reviewers and to guide the design, similar to
> the doc suggestion above.

Makes sense. I will expand the macro in the example.

> Cheers,
> Miguel

Thank you for your feedback,
Timothy

