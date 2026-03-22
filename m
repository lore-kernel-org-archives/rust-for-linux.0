Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F6A2D0C79
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774160957; cv=pass; b=raxmXwBsJrB6xzFhOsGLPSKUuIClsyrwysBjlRC7o3J4fTF5EQXOg14li7MLomLoEzjbltJ3xmchGVj6hsCEHSMNptyf5Qx61uxjbGvQ9GkhnSJMoxqy/+6FVzMg0+VMDAMroyDSSlF1k/OpitTuS1meLi3T3K/KItYfK3y8iPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774160957; c=relaxed/simple;
	bh=8C0z/WcaHx5aT6ZnWjQ1ZundlEptSBvoUKc9zibSRvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rkMmW0eaMPvPI4p4Zu2haGvMIl7x7SwwHdqHbwaFmwUCxyuG7GME+Du2k+cKlJxXWfaH31vIsbhsDMIx+VoZLt2fwV4xSpmr2qaahIBYx7sbkSGSTSflJNCl8Y/U7f5T3t92BCDOBIdbqYqcpziZYOY0RBUT4EmrE+Qm8FkDOgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KG7a3PDz; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KG7a3PDz"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-67c22b05346so1192859eaf.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 23:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774160955; cv=none;
        d=google.com; s=arc-20240605;
        b=XKVLvr92tDsgjYF5bIrk5gCL3oCNcMq2W/odM4YUTYoiUC58p+XqM2IdwwxAbotS/c
         Leuvx2kT3Y6+OvnfaQ3IIbyIyuhdM0uVTNpMzAft9d5Y4rROrI70XE/GFBVrr0+zbcLI
         4/v/JhNURp/XSCSRWt1f3E7EyxAvIEoVFAfv1gRl1e+O41xkYlCU3TnmMbZiSP/lqPJ4
         mkcLhMvdlh/IR9wcJsmpKipTPctMSvi0qwBPVHcUNh6tsa+TLsN7YrgFOCZnLhOAn9oB
         iu6ZGmNb3Nspb8JwGZsiwnHqpeU09rYFcDh9vPvPrgw59P5zgUSZG9CUFRa4zvw3tgLA
         0x0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J8MFy3RrF45uDIP4x2IMSRb0O8rkwQhDRSKFUKdvYcY=;
        fh=56fn3H2CyddqTMO03H7Fgin+P1iR/maRIfRLAZ8H+i8=;
        b=Hldzvkniqk2TvsYRH3mfbgHLrV10t5A2TbIeXbyPo2TiDHbIf+JX4Lc0ZeKKIRPYW9
         BZ0TdyRLRYFT3ZD8TFj3k0ZlekDfKvpfOfXocTmkESVDEwnvPShcza1ltiFrWpWXp+GD
         X11tb4aKvGItZWBI8zjLLGRp2Lu97Hx1tnusre3LAlYNKuhAnkmfc//zuMvjNu4N01pC
         Mc6Jb2eRbsQAjqvVjfcSaPdvva4Fy8Bs6Qpkux4nnaTwIO2c0rJAOfQHZrlgpmRQwbTC
         2Th+ynk2XvXLuYUtp3a2IL6kZZZ7N/15qsYPLIZvL1SI7EBwxBkk8fTZLeaoCY6Eg1OE
         R66w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774160955; x=1774765755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8MFy3RrF45uDIP4x2IMSRb0O8rkwQhDRSKFUKdvYcY=;
        b=KG7a3PDzUm1KCABpsZiUoMGA2JusAMlspF5rlyPAGYPowcLVdjZ1MvgSwYFT0bUQT1
         xxJquoQ6jHezBA2VAYnBAdIby6GruEexnXzwWzvFvqnsGAP5AaK2NMcnWjS4il/91Xzq
         YuB2QjjPHe08jGGpJp/JfJD9g42PGlNIoo021El5BZYlSh9yq4jiagTtmBSrEczEQv3p
         VBR+eCMjgwq6NLGTRRqvqJ0LDoqrc1XRSnNCvT3dDRSRVXXhtrYgyCBTb4WkTwkLCdjT
         383hzLFEzmrG+TCZ5m2JPOo81r0hX4vJBZiLz3Z2T0eCUBYbVDhnTf4r9zudIIZndH04
         7xUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774160955; x=1774765755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J8MFy3RrF45uDIP4x2IMSRb0O8rkwQhDRSKFUKdvYcY=;
        b=kRmC1PJkBP1x5NOCDOEEbvWd6UvHx/Zzz10rwRmlcDMjJO70r9wR8poFTwkKfOkZ42
         pb5RNqKcb2ogaV0F59CnkOcyYut/XHSzSkuMC9Qe9DBvEpUORcG0tDCRBY8J0NX0Sscl
         WjNH8jdfuAW96bvYU0llsXugIrjlr1/LV3UZNXW1Vq838vSj+gPDnNtPmZ9HmNeqUq/H
         k9IwHoxeKe+0vSZNp1hUP3NcA79lmd88O3Rt47DrMvi1pgIv7YSjdjqqj9yWb4fJ9MlQ
         us9c1vtAlomk6ouUFqcSwABjt+7lc3wkR6moxWrjcWKaZvCfIETfZ7GT2HgoIz3wE6/5
         mvGA==
X-Forwarded-Encrypted: i=1; AJvYcCWl45nAljmbFNVrQBXpt/RDQHk8kE6gxw0wS36C9JFdsdSF27inL4P/Xk28ao93XUsD3rGY4whHzRKwwuks7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZiLl95/oVmL1iGWusECq/0BoQqlHXjAli5j5AM/U6DpMAcCc
	R5WYRPojW1rORVXMN5vTQ8noQUNn/xCJbqat54hc0KcrHDxyTAtRD3OkkS/EgA107ac7eR60Tgn
	ZCgu8UALgp9dJUoP/cHsPMAOkuvf6+nA=
X-Gm-Gg: ATEYQzz6KyUZ+3ZvCKU5pgo3ce+RF4To1XOLmaE4DttWDb+SHrhWasOz2VSzII4AoJv
	WTAcdz4ZqeTBXDRQju5jBaA9g3xHvl3NyhCON1s85EhFcFt+vbaQEe4sKc5idyIn9HktTwelmUp
	gJQ3oPz03p9abOyEgaPXEZWPqd5JzylML3JrtkudSh8+Yxg6wHV0I8lrGMMdeks0Wz9W4mRp/xO
	q4tP+E30+0oCCwm8tUHq2+kxg9drC0hR0P/Hefkq/Fci/SA6HWJcAr0A9mDJ/Qld7TjHvEyz9EK
	TnePwS7X
X-Received: by 2002:a05:6820:310a:b0:67b:baae:3339 with SMTP id
 006d021491bc7-67c22f4eed2mr6332953eaf.45.1774160954800; Sat, 21 Mar 2026
 23:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321143406.67066-1-albabhasan276@gmail.com>
 <CANiq72=w0HcWi7z1wL+R1wa6jS_+P=L8Zp7pvZtUG+C51ETzng@mail.gmail.com> <CAM9eepVx-ZR74CPEk3kup3nMrBb7=FVXsrW+ZC957h2618K5zw@mail.gmail.com>
In-Reply-To: <CAM9eepVx-ZR74CPEk3kup3nMrBb7=FVXsrW+ZC957h2618K5zw@mail.gmail.com>
From: Shivendra Sharma <shivendra02467@gmail.com>
Date: Sun, 22 Mar 2026 11:59:03 +0530
X-Gm-Features: AaiRm52PiSYIG32e9rRCG9AzbSTK7cxCG98fXZt6ld_b_x7jBsandQ-b36OqzyY
Message-ID: <CABLcDQC-8RT697aj=mUi_N+yEHc4oGcf_cUAQsC_K41Bn0v6Lw@mail.gmail.com>
Subject: Re: [PATCH] rust: print: add SAFETY comments to unsafe blocks
To: Albab Hasan <albabhasan276@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Ali Zain <alizainuimx@gmail.com>, 
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2026 at 8:40=E2=80=AFAM Albab Hasan <albabhasan276@gmail.co=
m> wrote:
>
> Thanks for pointing these out Miguel. I wasn't aware of the prior
> patches. Sorry for the
> duplicate. Happy to drop mine in favor of whichever version you prefer.
>
> Thanks,
> Albab
>
> On Sun, 22 Mar 2026 at 05:14, Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Sat, Mar 21, 2026 at 3:34=E2=80=AFPM Albab Hasan <albabhasan276@gmai=
l.com> wrote:
> > >
> > > Replace the placeholder // SAFETY: TODO. comments with proper safety
> > > descriptions for the two unsafe blocks in rust_fmt_argument and
> > > call_printk.
> > >
> > > For rust_fmt_argument the ptr parameter is provided by the %pA
> > > format specifier handler in vsprintf that guarantees it points to a
> > > valid properly aligned fmt::Arguments<'_> value. since
> > > fmt::Arguments implements Copy the dereference is a bitwise
> > > copy with no side effects.
> > >
> > > For call_printk the safety depends on the functions documented
> > > preconditions the format string is one of the fixed compile time
> > > constants from format_strings and the module name is null terminated.
> > > the arguments match the format specifiers (%s for module name %pA
> > > for the fmt::Arguments pointer).
> > >
> > > Signed-off-by: Albab Hasan <albabhasan276@gmail.com>
> >
> > Did you see the following ones?
> >
> >   https://lore.kernel.org/rust-for-linux/20260212125427.122362-1-alizai=
nuimx@gmail.com/
> >   https://lore.kernel.org/rust-for-linux/20260211182755.82220-1-shivend=
ra02467@gmail.com/
> >
> > What is the relation with them? (Cc'ing their authors)
> >
> > Thanks!
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/351
> >
> > Cheers,
> > Miguel

Hi Albab,

Thank you for the kind response! It is incredibly easy to miss older
threads on the mailing list. I really appreciate you taking the time
to look into this and write up these safety requirements.

Hi Miguel,

Regarding the relation: the v2 patch I linked earlier targets the
exact same two TODOs in print.rs.

The v2 implements the generic wording Alice Ryhl suggested to ensure
the %pA guarantee covers all users. I also believe that v2 cleanly
resolves all the lints related to Issue #351 in print.rs.

That said, Albab did provide some great extra detail regarding the
call_printk invariants. If you prefer their more detailed wording for
that specific block over the v2 version, just let me know and I am
fully open to incorporating it!

Best regards,

Shivendra
