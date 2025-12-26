Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A606165F1A
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766752884; cv=none; b=Fe1dYno02KYP7kgbx0Zg5DxueU00DN+VmWKNgSwuhFzyV1SicN/8NiJr7n0oXsG++IcvsJKrUJ1T/tkczw0P8VcXfwF2iHUBgMtn5zzBJJswnARjqFRVyxV7zo75IK8rCX1hk4V6TvT5AqicCrkoPY+umH/YgvMgWr3ku2DV9yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766752884; c=relaxed/simple;
	bh=MjuKwlipGTw2lfubUVIBlshUsoUY8Lsl0p1nrQtaNcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIayhy6Owh/wQmMFwBMpWbOQbJpGA5ugT3XiruaAaNzIObSjs9iSXCnPFLyp5RZq9DJ2mMSYaNds4vrhvOAUx7XT6HEsnjj1gaL5JPEyFsOq1jgF5YgEua14zVR+vtRsf4mqy2HQfcPMjcsGThgdk3ly3QUI3x0aXXFbODVAynY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 25b903dce25811f0a38c85956e01ac42-20251226
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:36e5874f-e085-424b-b557-ecbfa51408e4,IP:10,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-INFO: VERSION:1.3.6,REQID:36e5874f-e085-424b-b557-ecbfa51408e4,IP:10,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:720d186cf762abacb00e287613cf7b62,BulkI
	D:251226204109B3UD52X8,BulkQuantity:5,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|841|898,TC:nil,Content:0|15|52,EDM:-3,IP:1,URL:99|1,File:nil,RT:ni
	l,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,B
	RR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,
	TF_CID_SPAM_IBB
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 25b903dce25811f0a38c85956e01ac42-20251226
X-User: sunke@kylinos.cn
Received: from mail-lf1-f50.google.com [(209.85.167.50)] by mailgw.kylinos.cn
	(envelope-from <sunke@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 688674544; Fri, 26 Dec 2025 20:41:06 +0800
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5958187fa55so5482668e87.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 04:41:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7dg9YlmDXPY1MQnguOJXCSgpw6fvlrL6KoRC2SuzCyJ+bDQjalMixB4VL+eKBrSe3/qkZnxZS3dtxe61WNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye30ud4dYDAClGpzHYbSQ4Ykn2gixTOzTMk7ZosyUS8dHC5hPS
	NWQoYOo8Idb753shYSJmEDGisCqEIugYjmE+UERsEHBIwMG1X1A4V++SIuxPOaHS+Ch79ygSl3D
	kKRVHyK15ZM/IJThB9Lvby7948nP/qR0=
X-Google-Smtp-Source: AGHT+IGDsLUyYnnK11fkHhauiusT+Q1HRgn+qnn+KJ/0mTdRiViR8ZzDIWj6sL5HEFNoQRPjIhe7CnOeO0oRQ467UT0=
X-Received: by 2002:a05:6512:3ba2:b0:594:347e:e679 with SMTP id
 2adb3069b0e04-59a17d5dd55mr7148839e87.43.1766752856623; Fri, 26 Dec 2025
 04:40:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251225225709.3944255-1-sunke@kylinos.cn> <20251225225709.3944255-4-sunke@kylinos.cn>
 <69954d20-cd40-42bf-8fc4-843e1738d562@gmail.com>
In-Reply-To: <69954d20-cd40-42bf-8fc4-843e1738d562@gmail.com>
Reply-To: sunke@kylinos.cn
From: Ke Sun <sunke@kylinos.cn>
Date: Fri, 26 Dec 2025 20:40:45 +0800
X-Gmail-Original-Message-ID: <CALpAb9M=-oqxyO2XNSNcdxYhXm5CYDUR+7vqbuHnZ7swxW_-_A@mail.gmail.com>
X-Gm-Features: AQt7F2rppd_nTsfs0q8XGHLXunNnsTNsC5yjr23-MZYHOTudx2AgORqYTPHUUrM
Message-ID: <CALpAb9M=-oqxyO2XNSNcdxYhXm5CYDUR+7vqbuHnZ7swxW_-_A@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dirk Behme <dirk.behme@gmail.com> =E4=BA=8E2025=E5=B9=B412=E6=9C=8826=E6=97=
=A5=E5=91=A8=E4=BA=94 16:17=E5=86=99=E9=81=93=EF=BC=9A
>
> On 25.12.25 23:57, Ke Sun wrote:
> > Make raw pointers (*const T, *mut T) automatically use HashedPtr when
> > formatted with {:p}, providing safe default behavior for kernel pointer=
s.
> >
> > This allows users to format raw pointers directly:
> >     pr_info!("{:p}\n", ptr);  // Automatically hashed
> >
> > While still allowing explicit use of wrapper types when needed:
> >     pr_info!("{:p}\n", RestrictedPtr::from(ptr));
> >     pr_info!("{:p}\n", RawPtr::from(ptr));
> >
> > Signed-off-by: Ke Sun <sunke@kylinos.cn>
> > ---
> >  rust/kernel/fmt.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 59 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> > index 84d634201d90a..fe4097de441f4 100644
> > --- a/rust/kernel/fmt.rs
> > +++ b/rust/kernel/fmt.rs
> > @@ -28,7 +28,65 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> >  }
> >
> >  use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, =
UpperHex};
> > -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Po=
inter, LowerExp, UpperExp);
> > +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Lo=
werExp, UpperExp);
> > +
> > +use crate::ptr::{HashedPtr, RawPtr, RestrictedPtr};
> > +// Special handling for Pointer: default to HashedPtr for raw pointers=
.
> > +// This overrides the default Pointer implementation for raw pointers =
to use hashing,
> > +// which is the safe default behavior for kernel pointers.
> > +impl<T> Pointer for Adapter<*const T> {
> > +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> > +        let Self(ptr) =3D self;
> > +        Pointer::fmt(&HashedPtr::from(*ptr), f)
> > +    }
> > +}
> > +
> > +impl<T> Pointer for Adapter<*mut T> {
> > +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> > +        let Self(ptr) =3D self;
> > +        Pointer::fmt(&HashedPtr::from_mut(*ptr), f)
> > +    }
> > +}
> > +
> > +// Handle references to raw pointers (needed when pointers are passed =
by reference in macros).
> > +impl<T> Pointer for Adapter<&*const T> {
> > +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> > +        let Self(ptr) =3D self;
> > +        Pointer::fmt(&HashedPtr::from(**ptr), f)
> > +    }
> > +}
> > +
> > +impl<T> Pointer for Adapter<&*mut T> {
> > +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> > +        let Self(ptr) =3D self;
> > +        Pointer::fmt(&HashedPtr::from_mut(**ptr), f)
> > +    }
> > +}
> > +
> > +// For wrapper types that implement Pointer (like HashedPtr, Restricte=
dPtr, RawPtr),
> > +// forward to their implementation. This allows explicit wrapper types=
 to use their
> > +// own formatting logic instead of being converted to HashedPtr.
> > +macro_rules! impl_pointer_adapter_forward {
> > +    ($($ty:ty),* $(,)?) =3D> {
> > +        $(
> > +            impl Pointer for Adapter<$ty> {
> > +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> > +                    let Self(t) =3D self;
> > +                    Pointer::fmt(t, f)
> > +                }
> > +            }
> > +
> > +            impl Pointer for Adapter<&$ty> {
> > +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> > +                    let Self(t) =3D self;
> > +                    Pointer::fmt(*t, f)
>
> Would it be an option to just use
>
> Pointer::fmt(t, f)

I tried changing Pointer::fmt(*t, f) to Pointer::fmt(t, f), but it
causes the doctest to fail:

[    3.751846][  T505]     # rust_doctest_kernel_ptr_rs_8: ASSERTION
FAILED at rust/kernel/ptr.rs:423
[    3.751846][  T505]     Expected formatted =3D=3D "0x12345678" to be
true, but is false

Test code=EF=BC=9A

/// let ptr =3D RawPtr::from(0x12345678 as *const u8);
///
/// // Basic formatting
/// let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr))?;
/// let formatted =3D cstr.to_str()?;
/// assert_eq!(formatted, "0x12345678");

This is also why I submitted the v1 patch:

https://lore.kernel.org/rust-for-linux/20251218032709.2184890-1-sunke@kylin=
os.cn/

Best regards,

Ke Sun

>
> here?
>
> Dirk
>
