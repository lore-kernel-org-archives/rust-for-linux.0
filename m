Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39117C099
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Feb 2024 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707406926; cv=none; b=k6GLzosP+YQLm2/3B1SiMytN7PKjBrNBNvTlTxDgJwecEHFQ6++qVbE4aRVNTitFfhzX/syvu2vMqGGyQ2beCPfFfjXIcKL2uUOnQcgwnDn8WullvNRNeeoruZi04PrMlioQA/Cv911oD6j9ty4a1qZu9uReO9TueKQ+HlCNcKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707406926; c=relaxed/simple;
	bh=v6RY+HoEygcidTXsOrNnjWIcKG3qK9XPgGRFowXNBO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UK1I1iRGiRyDu1Dak6SXLVOGdx0QP8DbeFnp+mX4++c6C+ng7IDkrfznYsB4hKBDINcPAftP+rmPtMDNdCD5HaaFNMAD8Heua0/7pf2cyPvPI9ZqWK4oplGETMtnuWllqJtPxbr3mRtnCdmABF6L84CLYL9iTwEt7Rp3eKVIMe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xj7Fog8K; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xj7Fog8K"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d5bbbe592dso886742241.0
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Feb 2024 07:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707406923; x=1708011723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKbb7p+kOEnvs7kyPggNgED1EnVbkGfw9/eZmIaWcyE=;
        b=Xj7Fog8KLhAkpp4/Wc0oFlzrFGiLSRpvC2L/Qe6bPM6ziqFhO7ZUPgIMdKTMkHD22q
         meEcowHCsedGQRnNLzcTCQl0e1Iqu6O2fmeWikOTxnTqo//rRMpaA7F9D3lvoxPn6ENH
         M5YnbTQH1fzwtWayIaG4W6znLb1h5KRLrMLyFQASLVN4ubmpGIStkDi0rYoyNPR+jHXM
         AOTvQcw/lR2TKGjkbOQShpuBHjRMunSSVII356dXolVKu3/YcC9zUGfpUYFl6sEI9c6O
         wAZa9mmR5IbNJd3ytw7BUhmqicN+tleXvmcSInJfCuD7/B1DldCA5WTgS1MMvTzpNcEd
         ZY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707406923; x=1708011723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKbb7p+kOEnvs7kyPggNgED1EnVbkGfw9/eZmIaWcyE=;
        b=sTsZbzqbQbJ5nGXMZlsqkv6DkJ4I9JYn1Zi+mSJA+k2UZrev2SDoVkqKokoDOPk4K7
         yJ0V6r4oX0B0idlYlGfbXyFfkMk+c5asco0juEPGccj0PYsCbfi6RiXtfyXFy0EP2Gsc
         yoDiI1X3Tbzxp0Bt3+hp2soi8itO7xv7e4D1NJ67ZyMMe3NRhD//YuhXIwNM6Kk+aiPX
         nMgDO1Zv3zZNoC2bSWoDMuRRZNOr5vahOIA7+cofP5ue73vxktjyPyunNFTAv6PfQ2Fb
         s6FyW6DEAuYrNjzHPrIV1o21ew/c9gZXiJlulKIE3ZEd57mWLd72pVDa8qqU4mpJbfJH
         XdjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwy3Kjja6s4vaDMh7SmJIWwO2PmuWQw57p+IcKdVrPZwNGAfXQPxkY5dib6LrRWjzNeiYcSk5Y1LnSFRwKQaMWDcvW9ENl2EMLljK7Ubo=
X-Gm-Message-State: AOJu0YxftiU/m3bdMM/L7Az0xVBSPn62msrFjoIEZGhY1MSG9DiBobuk
	FIzJSBLgDN93H/GdcbrfS+645v13ZXOqBzAneu8uuMaqGFZcI6YapP6hyAuF719DYgtd1qcn/6K
	JY9ffk1XzQ7nw13yUKgoj5PlbcGA05Pp4vpJC
X-Google-Smtp-Source: AGHT+IFDyVSM20AAZOqwIyb4b9dBSIPLnDvdeUdFq1ivHCsKm3z9RezCwd1Tr99hv7eVqI+4NfGUBzCublWFJ7MsYRg=
X-Received: by 2002:a67:bd07:0:b0:46d:20a8:cb4e with SMTP id
 y7-20020a67bd07000000b0046d20a8cb4emr5871603vsq.26.1707406923533; Thu, 08 Feb
 2024 07:42:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124-alice-mm-v1-0-d1abcec83c44@google.com>
 <20240124-alice-mm-v1-1-d1abcec83c44@google.com> <CALNs47uDaD05oD8TtZoSqUBc4SaRig80u2_1P0qMCXtE3H9_Vw@mail.gmail.com>
 <CAH5fLggdwWoq4wKv7VxZ-_VbWMV_Ui03rGOCMPbWn8=ewznmvA@mail.gmail.com> <2024020859-lusty-ladylike-29d4@gregkh>
In-Reply-To: <2024020859-lusty-ladylike-29d4@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Feb 2024 16:41:52 +0100
Message-ID: <CAH5fLgikdGGdjEUxyMWjkfHbRmvtMavwHFDwRC+4GVt46qmHWw@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add userspace pointers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Kees Cook <keescook@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 4:35=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 08, 2024 at 01:53:20PM +0100, Alice Ryhl wrote:
> > > Is some sort of `Debug` implementation useful?
> >
> > Leaking pointer addresses in logs is frowned upon in the kernel, so I
> > don't think we should include that.
>
> s/frowned upon/forbidden/ :)

:)

> Along those lines, you all are tieing in the "I want to print a pointer,
> so hash it properly before I do so" logic from rust like we have in c,
> right?  Ideally you'd use the same logic if at all possible.
>
> If not, that probably needs to be done so that you don't accidentally
> start leaking things.

I don't know what the status of this is. For anything I've added, I've
just made it entirely impossible to print addresses, hashed or not.

Alice
