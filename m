Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966CC194123
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Nov 2024 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731008421; cv=none; b=KbIx7DJRKsxobolo4pR0G9hJ13D3kW9RH6eAcmeHRdrW2VKSZb7kkT2XQvD1Tkr77fkxK/a3lwmAyKqLCUOmolmZpom4wwAmdqL6KMn4wkRySrWd6G2c9JbzuPbucwqiZB0dFwC//qqN3rvInCQrLYiypwrdOkNjpUJPjQy+WQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731008421; c=relaxed/simple;
	bh=Hqpenv6p1LWFDwIjrHP2BsQXKPVjR2b5HZRJ4ZqChTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tB2wJSO9KCATwRvm3mVe28tJTuHIfX05xtgYfZZc/gigj9mx1cc6wblfxusdNgMZ/0HHlSumJIUKHWFVa1PkZcvqGjoU17Du/IW8z10lrVK76d/dK9NA3Y+2w0reQg5yVeKRrPm6lTCaTeiSJYEJLSlNkC6oqg46UQg15WxzFOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zhgwGXl3; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zhgwGXl3"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so3755a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Nov 2024 11:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731008417; x=1731613217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nd/75cbpPjgH2M9LbK7DZEh2TDCTCcgqhG32wv/Y+KM=;
        b=zhgwGXl3wArw+w/R+l2xwrB7BtISB3OVqwvwQb25nE3DEQQIzxXLJAeaXnBIey8KEm
         QGhhbyxjo7IFQqdJsmCPANVISzFCfdy/I4FKQq5PF8Hp5zl7BtPb7CC/vekWhkIMj2zg
         D/bFPg/XZzFy+MXHR+ERBnN4gzFH4VWYfMEG7Otcl4p67K08Mm9tusAY+PPnDthmNoRA
         P9kyYFgFkzTO2y8yQa6Xy7ikMrKqZvAbvVftR6SDSyCcqP8Fmo1R1ehIlNnMNDy+EODS
         qzuHEwueFO+yBz6cxzUoDlpWPxo79ZjCFP27QRsyDckDofFAGrQeeIlKwD9VkPvXDCKS
         Cluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731008417; x=1731613217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nd/75cbpPjgH2M9LbK7DZEh2TDCTCcgqhG32wv/Y+KM=;
        b=d51T4o7VW1aTmMHP6sxIWCe8SVel2bKhpt1VTE2cEpCnacmlDeS0t8V144rXJj5fnm
         JfAd+aqcgLtDWDccu1/G49jkU/6DlTrJKjuuu9HeYHOTuZ0stGVB7wP5EjrBHw60tWjM
         UqTbuNJxBI84NxeTXINKiTSy+k88TH4rpMy/AhWGIMvvkYn0inifWdo3ALLeQKqekQoO
         JBBp4t4+lY9GUWwwKQw9LBev7o107GjhlfAehJk21U4h08Ll/ycMrlxl+H6vXx1ksKLP
         AMlGPQdkS0GPPGYZaJdYUdURw7cG3qO2OWel1fzQoPvHaKenghXLa6R1pvojSJsszN5z
         mqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXCSQDc/ES4BwK+G+zZG+Guj1i5PtlRjXmHTg7xl2pc67lbmlzuoPCTVEke+t+zuFYE00p7PuaW9xJUBB26Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkl2L6CKogyURMCs0jjE/Sqi/TstVYBfKcPA36ME8EyMPJYP2l
	qdiXRtkKJQ5gLpFzQqh/E8EJcwyUDMiU5kG88J5dFvIvg1RWL7yv5tlT1u/7TMHg3Y87z0Oh/yG
	MBg7XELq06tMEAV9/m2yC5CpJ+w7iYNDbXotg
X-Gm-Gg: ASbGncuQ1clJtT9bX9JUMyE6RNgBC/ZmmIStqlz67mYHEgNa7ws+ORzIa+hkdv96obq
	UEvsXXsswvwEvC8w7FYHWBFGc3j0gm5Qt7WQn8lt3NDKtRnmtgeGoTVACDlOLRg==
X-Google-Smtp-Source: AGHT+IEBiwFNQfuoAxFiltxJ2hrjOfio8RnmCYl6hN2gWLInsahzd3pu0ISjskuePHQ29yF2SOFAso1eK087KsDFWnI=
X-Received: by 2002:aa7:c846:0:b0:5ce:b7c5:4b3c with SMTP id
 4fb4d7f45d1cf-5cefbcb8d85mr748450a12.5.1731008416865; Thu, 07 Nov 2024
 11:40:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
 <874j4tcbhf.fsf@mpe.ellerman.id.au> <ZyMJaFcF4dTTzNgK@bombadil.infradead.org>
 <CAGSQo02H_RwtLpdt4E_LWKjzGvryY_7s20e4QhhA5B7N0LPxVA@mail.gmail.com> <ZyM2cHGaIT9vFOGq@bombadil.infradead.org>
In-Reply-To: <ZyM2cHGaIT9vFOGq@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 7 Nov 2024 11:40:05 -0800
Message-ID: <CAGSQo00=H8iUAP9FwSxgT3kdBmBrzsdWqA0kh5f_5FsBLxyBUQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Lucas DeMarchi to the thread after voicing an interest in the
modpost patch.

On Thu, Oct 31, 2024 at 12:49=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
>
> On Wed, Oct 30, 2024 at 10:06:12PM -0700, Matthew Maurer wrote:
> > On Wed, Oct 30, 2024 at 9:37=E2=80=AFPM Luis Chamberlain <mcgrof@kernel=
.org> wrote:
> > >
> > > On Thu, Oct 31, 2024 at 12:22:36PM +1100, Michael Ellerman wrote:
> > > > Matthew Maurer <mmaurer@google.com> writes:
> > > > > Adds a new format for MODVERSIONS which stores each field in a se=
parate
> > > > > ELF section. This initially adds support for variable length name=
s, but
> > > > > could later be used to add additional fields to MODVERSIONS in a
> > > > > backwards compatible way if needed. Any new fields will be ignore=
d by
> > > > > old user tooling, unlike the current format where user tooling ca=
nnot
> > > > > tolerate adjustments to the format (for example making the name f=
ield
> > > > > longer).
> > > > >
> > > > > Since PPC munges its version records to strip leading dots, we re=
produce
> > > > > the munging for the new format. Other architectures do not appear=
 to
> > > > > have architecture-specific usage of this information.
> > > > >
> > > > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > > > ---
> > > > >  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
> > > >
> > > > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> > >
> > > Michael, Matthew, why make everyone deal with this instead of just
> > > making this an arch thing and ppc would be the only one doing it?
> > >
> > >   Luis
> > >
> >
> > I'm not sure I understand - the PPC changes are in an arch-specific
> > directory, and triggered through the arch-implemented callback
> > mod_frob_arch_sections. What would you like done to make it more of an
> > arch-thing?
>
> Sorry, yes, I see that now, that's what I get for late night patch
> review. Nevermidn, this all looks good to me now.
>
>   Luis
