Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9538F22A4EB
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 02:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767149235; cv=none; b=W9VuXG0VeIW1qlup++RiHlDqwbiPihWUUhVev3hIIYdwT9fItIHN3gOpLGOggEewi3dOR/j0XX5ZN+Cv+4KWEtIJA0n4SToVQOjsIkbe74nenezZEFn8ElmSekkI14ynLKYD2J+8KKk+IVO8bv7NwLGXADBpgIJj2qSVCrhOj6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767149235; c=relaxed/simple;
	bh=0fVXX+voIpql0I8fCStsqTetGeAiX/bzr8XzjM7IF/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afSfQKsGZjuC4l6O7b4oIyaw60ecZShEJF5V5nO0Rilpdkojo2O5pxoK4B2ar66Z7KW8THsC11EFyRNNUrjjP0EFxEoDrCfDzhCaBp9bqE5SQN0643Uk0o69Kbi3KVcdwUlNJ/bjsMUdgTKR678C5WOMHrLVq+KUd3PragFBEVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f9238646e5f211f0a38c85956e01ac42-20251231
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:63550717-5d66-4b77-b165-1d6a7ea3a299,IP:10,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-INFO: VERSION:1.3.6,REQID:63550717-5d66-4b77-b165-1d6a7ea3a299,IP:10,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:5
X-CID-META: VersionHash:a9d874c,CLOUDID:27860da8b105feac730c1764eb2c38ea,BulkI
	D:251229184428R5P54LA6,BulkQuantity:35,Recheck:0,SF:17|19|38|64|66|78|80|8
	1|82|83|102|841|898,TC:nil,Content:0|15|50,EDM:-3,IP:1,URL:0,File:nil,RT:n
	il,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,
	BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_OBB,
	TF_CID_SPAM_IBB
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f9238646e5f211f0a38c85956e01ac42-20251231
X-User: sunke@kylinos.cn
Received: from mail-lf1-f47.google.com [(209.85.167.47)] by mailgw.kylinos.cn
	(envelope-from <sunke@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 171215156; Wed, 31 Dec 2025 10:46:57 +0800
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b25acdffbso5713122e87.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 18:46:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+LYABv35pnTCVZvZi2XUKsjlxEDUovMd3y+IZBioDBxbCee1pvLc11YaCAGjcD1qWGJIDsjzljAWeuurBCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZArluAaoI5DLgkyEv3xlW0Ja9W9/Geo+zGgaSW8Ko4VdNGGdp
	ET2Mcms8ZI9yyEAVM2aC4E9MMxLbmzjGRlmuXasJN0JhKO51wSRorcAV8BHapHJnTOK7gDiVhIG
	6iPMQE4KuaB+/ZobnuzvLP1HtJnoWG4Y=
X-Google-Smtp-Source: AGHT+IH3wrdobX0/xCUCUxfH/FiqCOvhf8qMGoGUQsAuehn/B7xPFUfGbeGqGzHjq7MxexJCbZ9DCrtvNc7xUQym0i8=
X-Received: by 2002:a2e:a7ca:0:b0:37b:9b58:dcf7 with SMTP id
 38308e7fff4ca-3812162164fmr103283931fa.23.1767149208934; Tue, 30 Dec 2025
 18:46:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229072157.3857053-1-sunke@kylinos.cn> <20251229072157.3857053-2-sunke@kylinos.cn>
 <a8a08f6f-dd3b-4498-8fb2-f91934683288@gmail.com>
In-Reply-To: <a8a08f6f-dd3b-4498-8fb2-f91934683288@gmail.com>
Reply-To: sunke@kylinos.cn
From: Ke Sun <sunke@kylinos.cn>
Date: Wed, 31 Dec 2025 10:46:37 +0800
X-Gmail-Original-Message-ID: <CALpAb9MoT20Ch4pe-oMz8kpqaZsvmgNwPk1XSC+faZi7huwQKg@mail.gmail.com>
X-Gm-Features: AQt7F2pLj8lCGS6GviyIg30WTcnQVaX539gcIYs5itckHgC5Y0RUp29T8MFnqBY
Message-ID: <CALpAb9MoT20Ch4pe-oMz8kpqaZsvmgNwPk1XSC+faZi7huwQKg@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] lib/vsprintf: Export functions for Rust pointer
 formatting support
To: Dirk Behme <dirk.behme@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 6:44=E2=80=AFPM Dirk Behme <dirk.behme@gmail.com> w=
rote:
>
> On 29.12.25 08:21, Ke Sun wrote:
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
> >
> > Signed-off-by: Ke Sun <sunke@kylinos.cn>
> > Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> >  include/linux/printk.h | 10 ++++++++
> >  lib/vsprintf.c         | 55 ++++++++++++++++++++++++++++++++----------
> >  2 files changed, 52 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > index 45c663124c9bd..91380b1eff1a1 100644
> > --- a/include/linux/printk.h
> > +++ b/include/linux/printk.h
> > @@ -385,6 +385,16 @@ extern void __printk_cpu_sync_put(void);
> >
> >  extern int kptr_restrict;
> >
> > +/**
> > + * kptr_restrict_value - Determine what pointer value should be used f=
or %pK
> > + * @pptr: Pointer to the pointer value (may be modified)
> > + *
> > + * Returns:
> > + *   - 0, 1, or 2: The kptr_restrict value if pointer should be used
> > + *   - -1: Error case (IRQ context with kptr_restrict=3D=3D1), *pptr u=
nchanged
> > + */
> > +int kptr_restrict_value(const void **pptr);
> > +
> >  /**
> >   * pr_fmt - used by the pr_*() macros to generate the printk format st=
ring
> >   * @fmt: format string passed from a pr_*() macro
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index a3790c43a0aba..29d2e681c6e73 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -811,6 +811,7 @@ int ptr_to_hashval(const void *ptr, unsigned long *=
hashval_out)
> >  {
> >       return __ptr_to_hashval(ptr, hashval_out);
> >  }
> > +EXPORT_SYMBOL_GPL(ptr_to_hashval);
> >
> >  static char *ptr_to_id(char *buf, char *end, const void *ptr,
> >                      struct printf_spec spec)
> > @@ -857,14 +858,28 @@ static char *default_pointer(char *buf, char *end=
, const void *ptr,
> >
> >  int kptr_restrict __read_mostly;
> >
> > -static noinline_for_stack
> > -char *restricted_pointer(char *buf, char *end, const void *ptr,
> > -                      struct printf_spec spec)
> > +/**
> > + * kptr_restrict_value - Determine what pointer value should be used f=
or %pK
> > + * @pptr: Pointer to the pointer value (may be modified)
> > + *
> > + * This function determines what pointer value should be printed based=
 on the
> > + * kptr_restrict sysctl setting:
> > + *
> > + * - kptr_restrict =3D=3D 0: Return 0 (use original pointer, will be h=
ashed)
> > + * - kptr_restrict =3D=3D 1: Return 1 if current process has CAP_SYSLO=
G and same
> > + *                       euid/egid, otherwise set *pptr to NULL and re=
turn 1
> > + * - kptr_restrict >=3D 2: Set *pptr to NULL and return 2
> > + *
> > + * Returns:
> > + *   - 0, 1, or 2: The kptr_restrict value if pointer should be used
> > + *   - -1: Error case (IRQ context with kptr_restrict=3D=3D1), *pptr u=
nchanged
> > + */
> > +int kptr_restrict_value(const void **pptr)
>
> Would it be an improvment to not modify the pptr itself? But instead
> to work with some kind of in ptr (not modified) and out_ptr (returned
> to the caller then)?
>
> kptr_restrict_value(const void *ptr, const void **out_ptr)
>
> And an enum for the result? With something like
>
> enum kptr_restict_result {
>   KPTR_RESTICT_ERROR =3D -1,
>   KPTR_RESTICT_NONE =3D 0,
>   KPTR_RESTICT_PARTIAL =3D 1,
>   KPTR_RESTICT_FULL =3D 2,
> }
>
> What would result in something like
>
> enum kptr_restict_result kptr_restrict_value(const void *ptr, const
> void **out_ptr)
>
> Opinions?

Given that fully implementing all %p format specifier extensions would
require substantial code changes, we're considering converting Rust's
Formatter to C format strings at the Rust layer and directly calling
snprintf. This would allow us to reuse the existing C implementations
without modifying vsprintf.c.

What do you think of this approach?

>
> Dirk
