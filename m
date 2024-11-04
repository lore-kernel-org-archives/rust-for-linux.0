Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9118A6B8
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714458; cv=none; b=ijRmLyBOFB18ZoLpEv90u2YtyGKn7ls98ZA7qp+u94w/Z7ZRe8D4aRY/zcjoJt7K6CuynxpSsQkF9+OR39v+tkZPSrIecJkz7/RmvOYCdgmHsLO37/SVjnxO/VLGePFIJJ9N+FpabkSl70Bn5//giCKHdLmx6He3fwDH1EZYfrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714458; c=relaxed/simple;
	bh=vlGQoK40Pe4Xgq408cAyMPIYAteoi6N6t6C7WUJDxSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLSBH134o4WhRQuTGskooU7oygs6ghWYHvP+I866lOay/DW7+wvSKHbJLtGez4ZQ6cdUyO31sXvGzR3YJZUKY1wUgL4LZ02sAP1HhozxNC425bjgnaVjOYu0llOWHpXhhwipyIBkLRFa/m8w4nYhqCLc4O53c3tiQMVLcTA+e7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yElVZdUf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yElVZdUf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d533b5412so2316753f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Nov 2024 02:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730714455; x=1731319255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDag3PaAeqUzZC0f2Lfe29ejFGb9q3oeg6DZ2pnEkZc=;
        b=yElVZdUfCviszWdd0xfjmAjklM1eB2jorLXzXt37K7A7/eUJBvMou8Y4HwKYStXpfE
         Epi5rpKjxczM1FRamjQhqu9WeTSynfoC3ZRtGULUphskLuOdwYZaX8ukEHoBDPd7Wbjt
         zPamGSpwisRvQ2d9LmvlZWT/ilFbAH8HXwi1MCz71p5mSAYO4cgL7zQPLIzxhb7z9UPy
         thkFZlM0rG1qu9Hlkt4c/y9dMO+0qnw9sPr1PJeVCDQlNy0rq8myNBaOIm4nwO7SzCNC
         13FqBg2yfP9BjeQ4bv3E1C0is3oxnRQBt3/RjTABGwy3GPVZ9y7vAGLOdRBwBLudadfX
         FAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714455; x=1731319255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDag3PaAeqUzZC0f2Lfe29ejFGb9q3oeg6DZ2pnEkZc=;
        b=NIFQidYmwTDMCOmqYLcXohwTdPy1N22eZK6e2wKCbcXU3NNXKIu2LuBIKlVGfWZzBg
         6aAF1JIv3y+O4avdWVD2+hI4dWaD7nEITpp3PZVLU1tvPyohye9DtgAWNsq22BYjOpet
         J5LgpzhVOVkRtQmtxICniEl35L4FVK6rJ5XY7BgFM2yojy0YmqUZ2dKOoFyV2Z7wRmzc
         NIs2coNpmqur4aC7qtCM2Xt4okujPMbwIxdmimlD9jLvYW0b3DHbG84ATSFtxVEh18a/
         +2vAr3coCQ2KInvFiacj0Yshez7UZ1VNb/pmDy4Lbl+xVa/eeYAj6Zgw11RBiKN6yx6M
         VvKg==
X-Gm-Message-State: AOJu0YyFTcB02Xr55P8L0VBnjT9dBGfA5ytwjTO16Gr2VDcPYcfzYBWk
	Rqo/GEJJmQiPQZCswPqEO5/9NfL9+MEkHK3ooaO+RGSNVA6Tstv/0ZuXemtLnglU98vM6iie98k
	ZS6TxLlSB7KbklvZjs7W51X1qEXZrQVAinvqb
X-Google-Smtp-Source: AGHT+IEBeFoa+PT4a++mpLtZr5eKShcDSGLxn9K3aagNUJJYzjyFbsfMaE/+MB3nPDpPVqL5MT5lOKSsGO2hv34X6MI=
X-Received: by 2002:adf:f784:0:b0:37d:4aa5:eae5 with SMTP id
 ffacd0b85a97d-38061221e2cmr20821534f8f.55.1730714455433; Mon, 04 Nov 2024
 02:00:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104090711.3000818-1-abdiel.janulgue@gmail.com>
 <20241104090711.3000818-3-abdiel.janulgue@gmail.com> <CAH5fLgisLyW-d9rsHJ8Vp8HpWh7PZxtkXooVQyMTxs445Ah4GQ@mail.gmail.com>
 <f6889ce1-f1e0-438d-a9e6-4340a92cb6ef@gmail.com>
In-Reply-To: <f6889ce1-f1e0-438d-a9e6-4340a92cb6ef@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 4 Nov 2024 11:00:43 +0100
Message-ID: <CAH5fLggDqXiyXLbmGQfUcgx3nCv+uhsqwWBwk2j522v8jOp9aw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add dma coherent allocator abstraction.
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	a.hindborg@kernel.org, linux-kernel@vger.kernel.org, dakr@redhat.com, 
	airlied@redhat.com, miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com, 
	Andreas Hindborg <a.hindborg@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
>
>
> On 04/11/2024 11:31, Alice Ryhl wrote:
> > On Mon, Nov 4, 2024 at 10:07=E2=80=AFAM Abdiel Janulgue
> > <abdiel.janulgue@gmail.com> wrote:
> >> +/// Abstraction of dma_alloc_coherent
> >> +///
> >> +/// # Invariants
> >> +///
> >> +/// For the lifetime of an instance of CoherentAllocation, the cpu ad=
dress is a valid pointer
> >> +/// to an allocated region of consistent memory and we hold a referen=
ce to the device.
> >> +pub struct CoherentAllocation<T: Add> {
> >
> > Requiring `T: Add` is very unusual. Why?
> >
> > I don't even see any additions anywhere.
> >
> > Alice
>
> Background here:
> https://lore.kernel.org/all/ee45ae5f-133d-4d38-bb4a-d3515790feb4@gmail.co=
m/
>
> Basically this aims to restrict the abstraction to non-ZST types. Are
> there better (clever) ways to do this?

That doesn't work:

struct MyZST {}

impl Add for MyZST {
    type Output =3D MyZST;
    fn add(&self, rhs: MyZST) -> MyZST {
        MyZST
    }
}

You'll need your own trait, or you can build_assert! that the size is
non-zero in the constructor. Also, you'll need to require the
FromBytes/AsBytes traits because you're converting the values to/from
bytes, which is not safe to do for all types.

Alice
