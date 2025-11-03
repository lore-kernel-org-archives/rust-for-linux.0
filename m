Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EF7223710
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 17:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762192105; cv=none; b=HihGGaEkf3UC7vyYQQsUANCJ5LDzK6X46PcPkmSP5KfFvxS7cUqi1toJkTZoopSkyBEfhOYmVegYdA2TwaEn8/v8yPTDFgY//dEN6ix9xLe0l6qjtnOZYkFGDTRXZC0HS18nqfM/ytF2FVPbkNTk9vQi6UeZU3wzgvrNT67c5RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762192105; c=relaxed/simple;
	bh=DZohdGmwhvfS7Y62yh/IEXkOppV7V3lqoMgTejWulFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T31D/EZyG45De5w7eHmNtadpIOYQnqecogvhsG2bp6glOXGwWW+GJK1Wue/SdH7cXEWE0jWuICn1r5STl0rpQ1VShEqyXtxi7rLwASfTnqqie75WkWbB/dcg1cNGxHiYrhgzW/ThtOMLC9k+pkkrhMaAYchuzs636BGtOuuwMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtx.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=cJWdBVyN; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="cJWdBVyN"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-433100c59dcso13114525ab.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 09:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1762192102; x=1762796902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWkOe5YDiqYERha5LD7zMqeSoJ/N7fJr/JJ2cnjXNyg=;
        b=cJWdBVyNjyE3Aw9dE+j0LOcjW5FSF9EToC1B/Qw3CMZ9GBRHHQKgsalbLZ210NbiCO
         uX4tUtmZuoMLvAcYmv3ylMjRSckVoqGXPobGXyutbnY0IyD+PiC8i0XbXm5ohL0oe2GP
         yTGvsVzqXiEJWTPL1pe26AytPqwza9Ho7dpO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762192102; x=1762796902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWkOe5YDiqYERha5LD7zMqeSoJ/N7fJr/JJ2cnjXNyg=;
        b=DUrGdImE3Ztxp+NRGKhkZTNPpUQkVZ/Ca7eoAngIQASqdxwRo/KiiZyNGXysTWLCE8
         D+C0fMWBuaCx8qa1lwtTBAf3Lrcioi++DgPx2cQ+wDpYusZ4Hgl08zPADty/M28mTxVZ
         Nrzl+i/XY6aQsJ1/7x8CGMvbb6BZGGlbXHhjItYhQEReaKU7ykKbvD8CvzxmRG8WbOIH
         rIgtqdgyOjTqkR4iQBdf+/Bd/C+OII+73O0KOZCn+bSLPUpoCWKvDkdW+G4nE9Gkua3D
         6TeEHa7y1flz+situfT33mJ3jDTRSjU4XEPub2nn1sALNpYnffhcEDT5amVz1DG70rpA
         q7cg==
X-Forwarded-Encrypted: i=1; AJvYcCWeoYpQTsLkYgktZ6OrCJ2EmOPbX/K3wrIcm4sgc2kzG35PI8bK7S3RDQCITnOII1oBIqXICoUEaXDuYbibVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFyF+T9XWm3e7pTqmubt3er7CMzkJuoT3mgqpRYaXP1jSVOY0l
	FGHViLxs/XSr0g4PC21jGkhCx9MSSQzNH3rWVVwgfrvLs13lgPcmNN5MFyaEpu0vIMQxtUHkAhV
	oLvB3xomvhP7ylXtYgEiZo6Gs39EmaquJkIRXkGhp
X-Gm-Gg: ASbGnct9yM6MhZqYwRz3CieG6ORhV2FjrDZuBNEWVnQT+9/wyBxqt4pXnnnjm0d1kpT
	QVgvfKO976Xx91EaPFhtVIzEkc8BaOpwm8x4exzK0A4oNtEPSMcmreC2aZuFI0L4sdWDYZF+JYI
	PFEqsDg3f6deLAK9qHQGM7nC/jNs1iE6gLg1tPtMwngvZPCj+TpxDswVq66mVefAckExvO2TV97
	m8u2n9kJMKZSh+ko3Q0OUESjv8Q95qm/nJ8R9u1xkycrXieCo00p/c1G/pIUA==
X-Google-Smtp-Source: AGHT+IF9g9cwwuNwEQElfAQDhH0pHEpQX+9ymSaDZSx7wt1xXs7tDoLgwlfGaAsR869GJ5w28gauCBpymwrx1MG7HaA=
X-Received: by 2002:a05:6e02:470e:b0:433:22fc:bb9a with SMTP id
 e9e14a558f8ab-43322fcc5d4mr112236115ab.13.1762192102332; Mon, 03 Nov 2025
 09:48:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102212853.1505384-1-ojeda@kernel.org> <20251102212853.1505384-2-ojeda@kernel.org>
 <aQiDdZvRNrBkrB-U@google.com>
In-Reply-To: <aQiDdZvRNrBkrB-U@google.com>
From: Justin Forbes <jmforbes@linuxtx.org>
Date: Mon, 3 Nov 2025 10:48:11 -0700
X-Gm-Features: AWmQ_blfBw9zTFrICe8pc1ZBkE8gZV528mb4K6Tu6zlEDetF0EtgCfFYO7hVTdg
Message-ID: <CAFxkdArACiepmcjk7GFH313db4cpXDcWouVy4a6zQTMR1aDmPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kbuild: workaround `rustdoc` doctests modifier bug
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 3:28=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Sun, Nov 02, 2025 at 10:28:53PM +0100, Miguel Ojeda wrote:
> > The `rustdoc` modifiers bug [1] was fixed in Rust 1.90.0 [2], for which
> > we added a workaround in commit abbf9a449441 ("rust: workaround `rustdo=
c`
> > target modifiers bug").
> >
> > However, `rustdoc`'s doctest generation still has a similar issue [3],
> > being fixed at [4], which does not affect us because we apply the
> > workaround to both, and now, starting with Rust 1.91.0 (released
> > 2025-10-30), `-Zsanitizer` is a target modifier too [5], which means we
> > fail with:
> >
> >       RUSTDOC TK rust/kernel/lib.rs
> >     error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `ke=
rnel`
> >      --> rust/kernel/lib.rs:3:1
> >       |
> >     3 | //! The `kernel` crate.
> >       | ^
> >       |
> >       =3D help: the `-Zsanitizer` flag modifies the ABI so Rust crates =
compiled with different values of this flag cannot be used together safely
> >       =3D note: unset `-Zsanitizer` in this crate is incompatible with =
`-Zsanitizer=3Dkernel-address` in dependency `core`
> >       =3D help: set `-Zsanitizer=3Dkernel-address` in this crate or uns=
et `-Zsanitizer` in `core`
> >       =3D help: if you are sure this will not cause problems, you may u=
se `-Cunsafe-allow-abi-mismatch=3Dsanitizer` to silence this error
> >
> > A simple way around is to add the sanitizer to the list in the existing
> > workaround (especially if we had not started to pass the sanitizer
> > flags in the previous commit, since in that case that would not be
> > necessary). However, that still applies the workaround in more cases
> > than necessary.
> >
> > Instead, only modify the doctests flags to ignore the check for
> > sanitizers, so that it is more local (and thus the compiler keeps check=
ing
> > it for us in the normal `rustdoc` calls). Since the previous commit
> > already treated the `rustdoc` calls as kernel objects, this should allo=
w
> > us in the future to easily remove this workaround when the time comes.
> >
> > By the way, the `-Cunsafe-allow-abi-mismatch` flag overwrites previous
> > ones rather than appending, so it needs to be all done in the same flag=
.
> > Moreover, unknown modifiers are rejected, and thus we have to gate base=
d
> > on the version too.
>
> Ah .. we may want to file a bug for that.
>
> > Finally, `-Zsanitizer-cfi-normalize-integers` is not affected, so it is
> > not needed in the workaround.
> >
> > Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned=
 in older LTSs).
> > Link: https://github.com/rust-lang/rust/issues/144521 [1]
> > Link: https://github.com/rust-lang/rust/pull/144523 [2]
> > Link: https://github.com/rust-lang/rust/issues/146465 [3]
> > Link: https://github.com/rust-lang/rust/pull/148068 [4]
> > Link: https://github.com/rust-lang/rust/pull/138736 [5]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

I can verify that this fixes kernel builds with rust 1.91 in Fedora.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
