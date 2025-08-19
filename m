Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA922D248A
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 20:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755634001; cv=none; b=OU/ArS6IlRnpJsh/80ApbH7iyS0+Ps34wmiTsHxL37RDKMKhmGtxjTZqy9RHutm4UvMr8i2+UL2VGlNfTqpRWWThie3rzQgrVHSe5hLzT2LCwQqHgevviZXkwpxc42uXzfaeo0yx9ElxvDT78OeQNomMageD8KzE+BMvxL1tovY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755634001; c=relaxed/simple;
	bh=6C7QObJMPTFtgGJIId7CRBPWyV4FKO1/eq+Hnu6qUCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcHGU0gVoYyLhcNIQ1+qG/LZcruvaFaat6k91s1C1wVoeHPplkf2zpDXekM5PU2ous5Fpze/Zjn0KKynuNEzMuqkvaOsrBUt5/CO6GFZpC2O4naUfWpIut90b9KrbHdcSMUhbfdhharWfm4tWPDSmH4/+InlwGhuEsggfpZomSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fiK6RmiL; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fiK6RmiL"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32326bd4f4dso251375a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 13:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1755633999; x=1756238799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dbnrRYjA6r8sWlA78GZUM/iB+0DcVA0eZZwoGwYzm0=;
        b=fiK6RmiLIW/OQJti9UmZuPb4gSwF4/uL4Ffk2VnyLkbxVn4nn9yb0X1TkjjqikdETb
         ym/D/DKZU+BJOkadeNJQ9ifxO2ME0zf4T8QgxOybCiMWQilovEJfSETyZejIztir56oK
         EQC+ZCw1G2Zs1VVGMYWxI62lm3rDCU2xOd+dCM6cx/l7OwpI6eRRm9Ic9eQfi34bZNXb
         ffFNCdwgqq+FdHzal9/a4ZuFPOhz2lwADYPVS/ASEWesAKS/76Isoq8hd8c+s/L9LYey
         cSXlnPJMIQsJwTzqBYMu5252h5DnVuVV3ooXEIftOQSgFaUDX9oW1egSc8X2ayNcjkEU
         2ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755633999; x=1756238799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dbnrRYjA6r8sWlA78GZUM/iB+0DcVA0eZZwoGwYzm0=;
        b=j+jO3wLAXba0QgS+00AZKg6IjmfCTcB3dfb36aFdbL9mLcp1PRWkxEA02NDr9hlzLD
         Oc6b+AZjoAxJJYJbeFG4OtB75tuuw5jNAkwdiI+uXdWzjG2rGKFeDRPoAAw8T90jnZu5
         BjvmpYhaIQz8xGXLhg84dJZHCpG/ClFkP8tWj8sVWCwlx7U8AenWjWsWbCtdhg34PyLO
         +SVPuaoLRyuQ1I9jZodLCdK6+1zItjkQ208CTMWq2VmGHbTWuSjdAz6e3au9l3Jrwjvy
         3gT8fbDmx8mJzHnPhEik0K2CTKkwgnXgi6MVcjVc/YP699gM3qOqXK3aVBWYCKNQlwbt
         EXog==
X-Forwarded-Encrypted: i=1; AJvYcCWc8pRt4HlRw1ak25D7JXYG1evpxmAYM+MIzDHpRXZ8pkV5F8sLFdIp9hOUV78BIsTXlFf3XAO3c+59cT/JdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuEwmDWpHyr1LSdOruOHm8LS8TXCqVL5yewPTZqC6/PHu3+Apu
	T/6korD9jpE0GOpeLcT9XFTeU5u45nlg+TjJswN7E8F9UYHHYGteL7WxtYrE1nGYkPr28BGFG3x
	mb0KSR6TtmpjH/sVSB98635pxZSHkbL8wZx2d2Kvh
X-Gm-Gg: ASbGncu5zcveGhBYZPW5DVhuSFAP43gVMoqabuqHg6u60obATzovtkuFQI2vlXx8yua
	dF/aiRsQnEjXWLzqyGb1oRYVRvlbRPUuooui5mxYS5bpJBs23sVRGGNFIGJxcRGbmh4z7NlMBNr
	QMbO+Al9zGnj1BHGXJL0F0LvdEG1TjeHSfOUsb7kEKvfwJr5iRJK5fI944RRuTYWYF21RK7GhVV
	HYtpbo=
X-Google-Smtp-Source: AGHT+IE57Vpn4Z/uLflLQmdS1WKySyLuxyfc5IrS7pgY9y0NqhnygvL19NrSeye7I82eCLBPuD+9tEQKPBa1kQf69dE=
X-Received: by 2002:a17:90b:1dca:b0:31e:7417:9e86 with SMTP id
 98e67ed59e1d1-324d34f0608mr5508407a91.9.1755633998729; Tue, 19 Aug 2025
 13:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816114409.10107-1-shankari.ak0208@gmail.com>
 <aKKdULYbLFRMS9qe@mail.hallyn.com> <CAHC9VhRwpYx0jVybcAnGdm4AGDno-GwyCzZCS7U+56Fwu2tuCg@mail.gmail.com>
 <CAH5fLgin9OhTmf52i2hQKztYLcHTxE+n1gMPXDFN83atE+u_oA@mail.gmail.com>
In-Reply-To: <CAH5fLgin9OhTmf52i2hQKztYLcHTxE+n1gMPXDFN83atE+u_oA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 19 Aug 2025 16:06:26 -0400
X-Gm-Features: Ac12FXx10lJQLGyCNfT5IQBtbILTFmhFyVz6sTMSaLCEXVmUXNmYmvs8TLi8yIM
Message-ID: <CAHC9VhSoyh3EqFqYD7tXDmPXsao8FLQo2PMAKEmJVJ6khPA51Q@mail.gmail.com>
Subject: Re: [PATCH] rust: cred: update AlwaysRefCounted import to sync::aref
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Shankari Anand <shankari.ak0208@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 6:06=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Mon, Aug 18, 2025 at 11:22=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> >
> > On Sun, Aug 17, 2025 at 11:26=E2=80=AFPM Serge E. Hallyn <serge@hallyn.=
com> wrote:
> > > On Sat, Aug 16, 2025 at 05:14:09PM +0530, Shankari Anand wrote:
> > > > Update the import of `AlwaysRefCounted` in `cred.rs` to use `sync::=
aref`
> > > > instead of `types`.
> > >
> > > Thank you for forwarding, Miguel.
> > >
> > > As far as I can see from the included links, this looks good.
> > >
> > > > This is part of the ongoing effort to move `ARef` and
> > > > `AlwaysRefCounted` to the `sync` module for better modularity.
> > > >
> > > > Suggested-by: Benno Lossin <lossin@kernel.org>
> > > > Link: https://github.com/Rust-for-Linux/linux/issues/1173
> > > > Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> > > Acked-by: Serge Hallyn <serge@hallyn.com>
> >
> > As mentioned previously, I'm still not well versed in Rust so as long
> > as Serge is happy with it, I'm good with it too :)
> >
> > I'm guessing it probably makes sense to include rust/kernel/cred.rs in
> > the creds MAINTAINERS section just as we did (or will do) with the LSM
> > Rust shim?
>
> That would make sense to me.

Okay, patch sent.

https://lore.kernel.org/linux-security-module/20250819195841.238246-2-paul@=
paul-moore.com

> My understanding is that this patch, unlike the pin-init one, is
> intended to go through the LSM / CRED tree rather than taking
> everything through a shared tree with Acked-bys.

In that case, I've gone ahead and merged Shankari's patch into lsm/dev
and will plan to send it up to Linus during the next merge window.  If
something changes and the Rust folks want to send this up via a Rust
tree just let me know and I'll drop the patch.

--=20
paul-moore.com
