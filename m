Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA3334720
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525644; cv=none; b=NxwBfzluaEUvk4d3LiC45oI87fr2WexOoD7DpeF1pmE59pIeZ8EMpOsoy84VUQosoltFVTy/AKQLOliKndoqhvvXbCI1eFwF4Y316fyeKUrQ0xdKBqSPphNE1QQXU+QFoB8I5cZHEtdkUt4vWe4pL5LpvUgTonkTRmNZpcvSQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525644; c=relaxed/simple;
	bh=j4dxZvMIsnu96pdNWhEO71lMIgFAwiyiGxghEdpT/Zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAd4UYd3g63TZk2zuBVDXj55pCoadHGhgRXx108XwhhJoS5ycMqWOvuPWd0DWUeZL6MUukdn6vE56u+pZ3YytnS0m8gv08r0fcag8DP5D96aJEt3AWJjXh/Yu1OxgO9AW5mpXlVGUDPdJgoL48fvIibtQLj1YeYi3i0hmEy/fB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dTNBT+M9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dTNBT+M9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b00e4a1so27592265e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 07:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755525641; x=1756130441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LERH+4S6MKDV2FjiZGpbA7HIp9naO0TKoXGRD11W5PI=;
        b=dTNBT+M9K312JN42sf5sobs3RP90Iy4/NNZ9bGfqVxVyvsgnuS4LxlzOkNKtAuEba1
         /wOs/j0Zl1nfT+A2X9YbyemRcx4PI/J0MnDIttQx4cJVtV4L56gPfPfRXwLhd3iMTkbn
         o2CzriNzdU4UudJjKdPFliySxu8a/QI2WzGmiITv5uibToNOhCaifXO53RykUNRHTWB2
         GiS7jDrzmAaZRfneFS7QHSM4n78pXFmuiv8P+hr7PNiZmwnP5lwiSDzLGpllK/28Qnt4
         dc3x69ktW9++gjlggFwWv3I299oogYziJI9XN0qdmp1mSrmm7uJ0F5Okp83tF4Pk5Exi
         dbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525641; x=1756130441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LERH+4S6MKDV2FjiZGpbA7HIp9naO0TKoXGRD11W5PI=;
        b=R4oglKmW0jWMdugxI0FqRnWUFHSIWLm4ledQDKz43PhEJoXjKoikLa3Fs76S91V6yT
         UZGwOABDZkYnLcjOBL8zZ//YE2Rq1HtWRPvpnQJW1PVcQWw4MvoxQ4gxeuoeDaPQK5Pf
         rEG8X/31cV3Ry3vM7eqURJsufxzDm3m/vNDMLYURe9sjD+OvgF7+op8KtmI7anB72zUT
         8sh7FeTaUiATVc9A+EC180WVJHAZhqsRh74Qkg/avyTIeEoZvBB0oTQlNGFqMiGGMynk
         f+0kkx7SxPAYslPKExSPwjktBXFplAiGXy4WxgbGDsln/VQCeg0HzwGIPpeExhsLdMWJ
         QdYA==
X-Forwarded-Encrypted: i=1; AJvYcCXybFywbz4Re3vKjyA0poLueS11/D3sTOjixeJ0dOuY9mioFhxtvX+PBavEuIstKUnk3uhsnFXYz5XsTl0ByQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5fD9LkKKYiL68qerTRwPAAaf2Olx4rODjmuNo8vX36SuPltk
	NynIGwOurZhg5Jbu5zvouzo9Vs1JBerLLEGf93n5b2lApZzmH3I8rrmtAlYQ9IFnzkOl/bJYqzE
	ypR4jO+mLH5r2Ajqc3zgEnph2u8B3jxnlfKSUHg+C
X-Gm-Gg: ASbGnctp8cHRHA9qmQLDCle05buuGGz3fBGHUmTYbn/mHXgjWwgMPS24h5H9JLOzqeQ
	YxPCFVQ0SeNJFZeajJWiUfbgSobYcl5pB8gKLFnrrgLace/OUz/Wewc3JC+jk7lUORqusigMSov
	mwSia91Z/eINDz2pjdqylKqnid6DCuBtU0MQU07Tkb+43L1vbQhY0GsCs1lWfiOptN/YPZP8C88
	CUBh0JboLBsx6aw1TBQUEQSonoW4cKOEpmKW1Oi6SvkK6Tu
X-Google-Smtp-Source: AGHT+IHx7KsKVi01XWbXuzwGL6RWiwHgwWOoLF/CZ/s4xxyQzI7mYIcDAffbw55tV9bAS1QQIs4V2clOdwTtPOHB+mU=
X-Received: by 2002:a05:600c:b8d:b0:459:dfde:3324 with SMTP id
 5b1f17b1804b1-45a21857f09mr100132795e9.29.1755525640601; Mon, 18 Aug 2025
 07:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815171058.299270-1-dakr@kernel.org> <20250815171058.299270-2-dakr@kernel.org>
 <aKLzrp0m00J6CCYz@google.com> <DC5INEG2DXU5.DM4JIICEQ2PC@kernel.org>
 <aKMa7YzO-PwEv9AT@google.com> <DC5KK67M752R.N9PX4LUG2F68@kernel.org>
In-Reply-To: <DC5KK67M752R.N9PX4LUG2F68@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 Aug 2025 16:00:27 +0200
X-Gm-Features: Ac12FXw71lT-sa08Sow1dkhfN1gjNRFkyLNRIW7cb0GpdCcOBD3KYCaUW0zEc7Q
Message-ID: <CAH5fLgi6OZaqjnDScDrJ3YjN2a8mJuPiO5MLPUqUWo62WkvvrA@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: dma: implement DataDirection
To: Danilo Krummrich <dakr@kernel.org>
Cc: akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, jgg@ziepe.ca, 
	lyude@redhat.com, robin.murphy@arm.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 2:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Aug 18, 2025 at 2:22 PM CEST, Alice Ryhl wrote:
> > On Mon, Aug 18, 2025 at 01:27:44PM +0200, Danilo Krummrich wrote:
> >> On Mon Aug 18, 2025 at 11:34 AM CEST, Alice Ryhl wrote:
> >> > On Fri, Aug 15, 2025 at 07:10:02PM +0200, Danilo Krummrich wrote:
> >> >> Add the `DataDirection` struct, a newtype wrapper around the C
> >> >> `enum dma_data_direction`.
> >> >>
> >> >> This provides a type-safe Rust interface for specifying the directi=
on of
> >> >> DMA transfers.
> >> >>
> >> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >> >
> >> >> +/// DMA data direction.
> >> >> +///
> >> >> +/// Corresponds to the C [`enum dma_data_direction`].
> >> >> +///
> >> >> +/// [`enum dma_data_direction`]: srctree/include/linux/dma-directi=
on.h
> >> >> +#[derive(Copy, Clone, PartialEq, Eq)]
> >> >> +pub struct DataDirection(bindings::dma_data_direction);
> >> >
> >> > Perhaps this should be a real Rust enum so that you can do an exhaus=
tive
> >> > match?
> >>
> >>      /// DMA data direction.
> >>      ///
> >>      /// Corresponds to the C [`enum dma_data_direction`].
> >>      ///
> >>      /// [`enum dma_data_direction`]: srctree/include/linux/dma-direct=
ion.h
> >>      #[derive(Copy, Clone, PartialEq, Eq, Debug)]
> >>      #[repr(i32)]
> >>
> >> Does bindgen ever pick another type than i32 for C enums? If so, it'd =
be a
> >> downside that we'd have to mess with the type either in the `repr` or =
by casting
> >> the variants.
> >>
> >>      pub enum DataDirection {
> >>          /// The DMA mapping is for bidirectional data transfer.
> >>          ///
> >>          /// This is used when the buffer can be both read from and wr=
itten to by the device.
> >>          /// The cache for the corresponding memory region is both flu=
shed and invalidated.
> >>          Bidirectional =3D bindings::dma_data_direction_DMA_BIDIRECTIO=
NAL,
> >>
> >>          /// The DMA mapping is for data transfer from memory to the d=
evice (write).
> >>          ///
> >>          /// The CPU has prepared data in the buffer, and the device w=
ill read it.
> >>          /// The cache for the corresponding memory region is flushed.
> >>          ToDevice =3D bindings::dma_data_direction_DMA_TO_DEVICE,
> >>
> >>          /// The DMA mapping is for data transfer from the device to m=
emory (read).
> >>          ///
> >>          /// The device will write data into the buffer for the CPU to=
 read.
> >>          /// The cache for the corresponding memory region is invalida=
ted before CPU access.
> >>          FromDevice =3D bindings::dma_data_direction_DMA_FROM_DEVICE,
> >>
> >>          /// The DMA mapping is not for data transfer.
> >>          ///
> >>          /// This is primarily for debugging purposes. With this direc=
tion, the DMA mapping API
> >>          /// will not perform any cache coherency operations.
> >>          None =3D bindings::dma_data_direction_DMA_NONE,
> >>      }
> >>
> >>      impl From<DataDirection> for bindings::dma_data_direction {
> >>          /// Returns the raw representation of [`enum dma_data_directi=
on`].
> >>          fn from(direction: DataDirection) -> Self {
> >>              direction as Self
> >>          }
> >>      }
> >
> > My suggestion is to cast on the Rust-side.
> >
> > #[repr(whateveryouwant)]
>
> What's your suggestion for whateveryouwant?
>
> And I mean this in general, not only for this case of dma::DataDirection.=
 If we
> pick u32 than things break if a negative enum variant is added on the C s=
ide. If
> we pick i32, it can happen that we overflow.
>
> > enum DataDirection {
> >     Bidirectional =3D bindings::dma_data_direction_DMA_BIDIRECTIONAL as=
 _,
>
> We have a clippy lint that warns about `as _` casts, but I guess you mean=
t
> `as whateveryouwant`. However, if bindgen picks whateveryouwant too, we a=
lso get
> a warning.
>
> Ultimately, we'd need to suppress a warning.

In general, I think we want some sort of helper function to cast
between arbitrary integer types in const-evaluation that panics if the
cast is out of bounds. Both here and many other places.

Alice
