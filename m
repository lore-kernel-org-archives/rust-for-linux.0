Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3F35965
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020476; cv=none; b=qZUTGU2jyHjtuN5d454OgDTrVtlGlod5EygO85ErOuM1T3n+IUgOAMXfAngixBk25Lr2VaF6xwuGGTQNQcH7YVIF5P+ZtNfsXyYtCWaOIt5hr4jsyAFz7Jy6G0BtNECz0jrXkv40FYDC5ve4kQLUglcjeZRNaxdq5v2R5QdTs8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020476; c=relaxed/simple;
	bh=WewOCoj1WXl1tu0coF8mA4fOh4L4rtniBQBh4BAbsN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4XLe+EXADZpOGcLJYHmpUUa1LINf5jSQKBTn+0zVVptiKG7HpuJrDiHb/56ZRPWwn9/XYv6TeKxRIzsUNq50txWocZJAm3rpQzAHbK5KE9EI/ZtJnF0fMWypbJD374v3Fsgb7zp/011H9Q9OZ7jGprMrRK10O9LAp+4YCrBPAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 32f4db7ce4c711f0a38c85956e01ac42-20251229
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f87409ab-c3b6-48b8-92c3-b871da5086c4,IP:10,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-INFO: VERSION:1.3.6,REQID:f87409ab-c3b6-48b8-92c3-b871da5086c4,IP:10,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:9881a1641ee756b0a58f841a1f711fea,BulkI
	D:251229184428R5P54LA6,BulkQuantity:4,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|841|898,TC:nil,Content:0|15|52,EDM:-3,IP:1,URL:0,File:nil,RT:nil,B
	ulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:
	0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_IBB
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 32f4db7ce4c711f0a38c85956e01ac42-20251229
X-User: sunke@kylinos.cn
Received: from mail-lf1-f44.google.com [(209.85.167.44)] by mailgw.kylinos.cn
	(envelope-from <sunke@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1806020635; Mon, 29 Dec 2025 23:01:05 +0800
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-595825c8eb3so9299270e87.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:01:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpqvdr7L3aeKdUQXJeyplu0poEuCbkt9Xf1jmCbU1wU8td6xrrBuTqJd8DUQlCPKVJnO7S6V42tXJ86TfzhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBWElv4BW92ua74Cl1xhMjWGgZu96dP9F1TTyYWernOCxsaacz
	eB/ze92tPQnl8TfPLL4fkYXDsohsa0cgzn3rpUFZlaOO3f0ifSiP2aDFVU46dWCDHgHdVtY4qUD
	2MQQzZV3utMawxv5smdTfGOW2TQh2blA=
X-Google-Smtp-Source: AGHT+IFs8m4RqCiDzl9PI0ykRN7lDNH6Ku//ANGIDC2wpwoZSS1AN43bZDaOrk7/l0ZgsUiMQkFKMpsVEdNd+iozPg4=
X-Received: by 2002:a05:6512:304d:b0:598:f1a1:9611 with SMTP id
 2adb3069b0e04-59a17d46307mr9964354e87.32.1767020457445; Mon, 29 Dec 2025
 07:00:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229072157.3857053-1-sunke@kylinos.cn> <20251229072157.3857053-2-sunke@kylinos.cn>
 <aVKN0Q-6bsHGq_Gy@smile.fi.intel.com>
In-Reply-To: <aVKN0Q-6bsHGq_Gy@smile.fi.intel.com>
Reply-To: sunke@kylinos.cn
From: Ke Sun <sunke@kylinos.cn>
Date: Mon, 29 Dec 2025 23:00:45 +0800
X-Gmail-Original-Message-ID: <CALpAb9MNaacKELazWczGJhLmhsNSKNnrVzTVZoMdex+Am5nAoQ@mail.gmail.com>
X-Gm-Features: AQt7F2onrejNln4d3bKD9k6MtXU02JqkLXNrKdtz_IrCJ4zZTFdMtMzOD069bg8
Message-ID: <CALpAb9MNaacKELazWczGJhLmhsNSKNnrVzTVZoMdex+Am5nAoQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] lib/vsprintf: Export functions for Rust pointer
 formatting support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the detailed review! I'll work on addressing all your suggestion=
s.

Ke Sun

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E4=BA=8E2025=E5=B9=B41=
2=E6=9C=8829=E6=97=A5=E5=91=A8=E4=B8=80 22:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Dec 29, 2025 at 03:21:19PM +0800, Ke Sun wrote:
> > Export ptr_to_hashval() and extract kptr_restrict_value() to enable
> > Rust code to use kernel pointer formatting functionality.
> >
> > - Export ptr_to_hashval() with EXPORT_SYMBOL_GPL for pointer hashing.
> >   This function is used to hash kernel pointers before printing them,
> >   preventing information leaks about kernel memory layout.
> >
> > - Extract kptr_restrict handling logic from restricted_pointer() into
> >   a separate exported function kptr_restrict_value() that can be
> >   reused by both restricted_pointer() (for %pK format specifier) and
> >   Rust code.
> >
> > The kptr_restrict_value() function:
> > - Returns 0, 1, or 2 to indicate the kptr_restrict sysctl value
> > - Returns -1 for error case (IRQ context with kptr_restrict=3D=3D1)
> > - Modifies the pointer value through @pptr parameter when needed
> >   (sets to NULL when access should be restricted)
> >
> > These functions are needed for the HashedPtr and RestrictedPtr wrapper
> > types in rust/kernel/ptr.rs to provide safe pointer formatting that
> > matches C kernel patterns.
> >
> > This refactoring:
> > - Allows restricted_pointer() to reuse the common logic while
> >   maintaining the same behavior
> > - Enables Rust code to use the same kptr_restrict handling logic
> > - Reduces code duplication
>
> ...
>
> > +EXPORT_SYMBOL_GPL(ptr_to_hashval);
>
> I do not like this. At bare minimum we should make sure it's namespaced, =
so the
> author of the code deliberately needs to import it (I'm talking about C s=
ide).
>
> Ideally we should have something which is Rust specific, like
>
> EXPORT_SYMBOL_FOR_RUST_ONLY(foo);
>
> Can we do that first?
>
> ...
>
> > +/**
> > + * kptr_restrict_value - Determine what pointer value should be used f=
or %pK
> > + * @pptr: Pointer to the pointer value (may be modified)
> > + *
> > + * This function determines what pointer value should be printed based=
 on the
> > + * kptr_restrict sysctl setting:
>
> > + * - kptr_restrict =3D=3D 0: Return 0 (use original pointer, will be h=
ashed)
> > + * - kptr_restrict =3D=3D 1: Return 1 if current process has CAP_SYSLO=
G and same
> > + *                       euid/egid, otherwise set *pptr to NULL and re=
turn 1
> > + * - kptr_restrict >=3D 2: Set *pptr to NULL and return 2
>
> It's the usual practice to give a enum with self-explained definitions an=
d use
> them. plain numbers are prone to mistakes during the evolution of the cod=
e.
> Also it's hard to read inside the code their semantic.
>
> > + * Returns:
> > + *   - 0, 1, or 2: The kptr_restrict value if pointer should be used
> > + *   - -1: Error case (IRQ context with kptr_restrict=3D=3D1), *pptr u=
nchanged
> > + */
>
> ...
>
> > +             if (in_hardirq() || in_serving_softirq() || in_nmi())
> > +                     return -1;
>
> Give a meaningful Linux error code for this.
>
> ...
>
> > +static noinline_for_stack
> > +char *restricted_pointer(char *buf, char *end, const void *ptr,
> > +                      struct printf_spec spec)
> > +{
>
> > +     int ret =3D kptr_restrict_value(&ptr);
> > +
> > +     if (ret < 0) {
> > +             if (spec.field_width =3D=3D -1)
> > +                     spec.field_width =3D 2 * sizeof(ptr);
> > +             return error_string(buf, end, "pK-error", spec);
> > +     }
>
> This pattern is harder to maintain, decouple definition and assignment to=
 make
> it better.
>
>         int ret;
>
>         ret =3D kptr_restrict_value(&ptr);
>         if (ret < 0) {
>
> > +     if (ret =3D=3D 0)
> > +             return default_pointer(buf, end, ptr, spec);
> >
> >       return pointer_string(buf, end, ptr, spec);
> >  }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
