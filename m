Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913CA43BDB4;
	Thu, 27 Aug 2026 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824121; cv=none; b=NYL4WVjQvSyvPgEd6Su4KW7OZBgcEhvMT3puNkR2Pv4s9PndNy71/hEJ4NwbfBcghXxY52t/H3pvIz3k978P+7P8elIa/AU4EQu5Fp5WEC3QmibsS5qHnNJsqEOTy6Ogm22iXkAHfU/FVA9Huqry/GE4qKgwvRWXS2wnyPXcRI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824121; c=relaxed/simple;
	bh=nok1TFu4g+w3tBHe+ny2+kk60gpMbaISESgPnxbz4EQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RMtykkVY8XFkKB/6trqFA2Tbsl4KAM8OJAHGGzX6GaDDXuHZoZZgZnVsnmCBp7koP3ezg3SzmPgAeeRFRyEPlTpVyDuhmPrOk9h3WqzAssMffr6OEdhfLpXzBDN9lIALpbb4w4u5DkaZZTwC/4VcHAAty092eYpLI9ZX0bZ6+HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+FsKYtf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+FsKYtf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3E11F000E9;
	Thu, 27 Aug 2026 09:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787824118;
	bh=nok1TFu4g+w3tBHe+ny2+kk60gpMbaISESgPnxbz4EQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=C+FsKYtfWGQh6HjlOLXX1WiSa6SZ5jW7ybtMWLlgLblbAQI+OIQY7C7KGjGcyj1mq
	 eSrbidPdmQGLlSSpiBTzapjkU7JaMMsMerlyM2B2XP/Qd4Dsm+Aoe02v5rslSjrKQy
	 dDbnQ1QNNRyvmX+UlmZHUreo7wK+oiUuZr74sMd7x2xldKZa+iRVWv32DuBPor4Z3v
	 HfwjSp2etPvE1ksE2Sw55jj8OHR8ChVF4YpzHo4ilJg9JkYZu16OPEZVo6N2dhNCJZ
	 9+YAJWiqqp2l6NZRVSI9htRrYZUM8neD6txMjI526UzxSeEpc1e1T2zTQtLVRw0WJB
	 r8Q8HUY33NqKw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Tamir Duberstein <tamird@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry
 Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 03/11] rust: xarray: add `XArrayState`
In-Reply-To: <66630DA9-0546-4211-BF30-C99123B76E5B@collabora.com>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-3-965f6028790e@kernel.org>
 <66630DA9-0546-4211-BF30-C99123B76E5B@collabora.com>
Date: Thu, 27 Aug 2026 11:48:27 +0200
Message-ID: <87pkz328t0.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Almeida <daniel.almeida@collabora.com> writes:

> Hi Andreas,
>
> My main worry here is cursor invalidation, i.e.: what happens if someone
> mutates the tree while we have live instances of XArrayState handed out via
> patch 7? For example, what if someone writes "self.state.guard.remove(...)"
> inside the kernel crate itself while some user code has an OccupiedEntry?

The type system handles this. Obtaining `Entry` requires a mutable
reference whose lifetime is extended to the `Entry`. So while entry is
alive, it is not possible to construct `XArrayState`.

For the operations directly on `Guard` that require shared ownership,
multiple `XArrayState` instances may exist at the same time. But as
these are only used for reads and can never modify the tree,
invalidation can not occur.

>
> I think this could be solved by hiding XArrayState in its own module and
> exposing only a small set of checked helpers while its fields remain private so
> that we carefully vet against the situation above.

I did not consider safe code within the xarray module modifying the
fields of the state object. Do we really need to handle that?

> Additionally we have to ensure that, in order to get the guard, one must
> destroy the XArrayState, for the same reason. This is currently the case with
> into_guard() IIUC, but I think it's worth to spell it out in the
> invariant section.

Since users outside of the module cannot construct `Guard` safely, I
don't think this is an issue?

But, something is not right. I did not consider the safety of
`XArrayState::new`, because it is a private method. But it should be
unsafe as it is, because it allows insert operations with only a shared
reference to the guard.

I think if I just gate he modifying operations (only
`XArrayState::insert` for now) on `R` being a mutable reference to the
guard, we should be fine?


Best regards,
Andreas Hindborg


