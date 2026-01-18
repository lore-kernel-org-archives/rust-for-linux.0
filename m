Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB01276050
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 21:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768771618; cv=none; b=NZUw9JjVgeiz7FilNU1EBQRdfEIwYZpMN2SrsMr3/0pA5OnC0zfG7+ENZjr7PCUHKWcTQGcrpvb32YKGLy+zbSJj2x82+H4y7SGKY1jAPH2+KhnKhMSgQO9qoTKKRlMxyZJobXS1uKFT6KRi1ZFp6G1+plMHufzXM22h/pQM8JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768771618; c=relaxed/simple;
	bh=2gvCO0PAouKqcfc7nyAjanyPnBYKoxAiGLOBiQYukV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npOjTMaSq8UFvSXA7lqmfYLwsRxyVHJt+U+GQ2uFa9Mcow2avVUUvLjr5n8FuOilfg9ffraUw+NJCfkYPx+R/Kj8TjsXylnRgmlza1chfwEBX5zPIlJOfw3Jr3TCu9WbD0pTN1AjNsIDRLj605GGDnBVbMYoTfMDmw8QI67Snps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kIhSFRVl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kIhSFRVl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801bc328easo28184565e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 13:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768771615; x=1769376415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pnjSbcwTDJPyjARUCkOFovY6DECA+drGJOQrxdaQuI=;
        b=kIhSFRVljLtJYqMRs1+ugrn2U1AW1YqkAiLc0nK6kvivJoNXDH6JyB9txjS3oLB8m3
         +dJLMlSaM4g+7mC1LKRub3K7iGoLmmgwcOh7TTrFQKWxn8KyzW5ZBhxcU6Y6wR+WRRxL
         7+oeInpSd6z4Zm4mm5KaA651N2oFjMzzRgDt1k09BIqNjXz+pLGcFeHnigCxXHZnRoL9
         g8bpbNb3lEUYDMosIqULY7uqoxuB0MzRCVn3mtAKzY1eG/stDJF2qPYEMoZ8IW7CJUbg
         dfBMvCWblQl76NBW+cwuEn2y255n9VUfgJ7ThVLtkZjUT81h7Jv/ebmxF1UZo/lXX5ha
         0hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768771615; x=1769376415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pnjSbcwTDJPyjARUCkOFovY6DECA+drGJOQrxdaQuI=;
        b=DT2yPhmrHfmInFes6efjiOIVS84Bh6zgg/N3u9cPn9wznodIAOia0RaPr+hj6RKD9K
         +oG4fZua6m6Wvg5jDf3otfqrMFmNx5w2Rzj/V8gdFxgx/6yggtQA5cUg0q7at40iuYNa
         jHtIPFyise0tm1+co8/Xuw8aX/cMK5W31MV+DiHUdj/v07v5K22mxEqHmI7Ss8cTpKOM
         zmf0s1NRpxSlUs+cYZ/LwTEjMVSA9XUSQaW7t/mPbvQ11/TzzOwD54Rj4Jbfb25C/nyZ
         xcr39khL1Ulc5h2HnXJvGLNKhDXE95OtH23Dhyn07WAZNMHs2icVUZGdo9+43eAaAE+9
         Yivg==
X-Forwarded-Encrypted: i=1; AJvYcCWhV9eSi6Q0wLmLI3zM2PJtuFNOjvssFF9r7r3mWqsc/Jo59O0wndTc8H+bB62RTwT8pkhpXfBkz1wezeaEvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0bXhpCMZYLuR2ysJyhI5dLsadouhHNgox59q3r3FOba3IBOBn
	l+S/dm3DvJHOAj8tStBvb8WuT3txAsO9FTSPlymspZuBKASwfaaJ1JtK+b2vMbzG/Ip208naM//
	3J4ACftomRkdPxJOCW8NsHeJfapN5ufS5B2MFd97k
X-Gm-Gg: AY/fxX7u8GZFNKmO7+laO20PQeCaWG6VcBeLMQX1VEDPYIcQkpzppOD9hYuB8TZuFjM
	kBoaBHRwT04hLUuxMQ5n68ObIlDhx9cb9Sj3ORp16bPGksHKYxNgmjM/X/UeVkLcMm4e6cwFMoa
	37G9NYxBxpV5cNiNCCQ28+JFI3cJ/HT/e7NgEiWMx+6CK/EN0auz0+OmbJboqSmVkuss+nMHHLl
	lAIO48RPlYt0XafPamka6fmIF+tdNg4cWJl56jcgxldSP7ycX03iNaK0nwxhNcPY2XRegHzUQeX
	z/KmRT9nKDjaCyUVzVtgxjIcrQ==
X-Received: by 2002:a05:600c:4e4e:b0:47e:e5c5:f3a3 with SMTP id
 5b1f17b1804b1-4801eb03400mr115935075e9.24.1768771615269; Sun, 18 Jan 2026
 13:26:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-io-pgtable-v6-1-423846996883@google.com> <DFRU7CF0SSWN.3KMT2U5FWC2NU@garyguo.net>
In-Reply-To: <DFRU7CF0SSWN.3KMT2U5FWC2NU@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 18 Jan 2026 22:26:42 +0100
X-Gm-Features: AZwV_Qj7Ytcb-na5JqnBbBWkuBfdmD0Fjpd7nsTfSWVrZPy72RgoS5eee2IXRDQ
Message-ID: <CAH5fLgixtTyrRcHE6i5RWE3_DgeY59b4B81gF4iDEu1shT_ikw@mail.gmail.com>
Subject: Re: [PATCH v6] rust: iommu: add io_pgtable abstraction
To: Gary Guo <gary@garyguo.net>
Cc: Joerg Roedel <joro@8bytes.org>, Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org, 
	Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 4:57=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Sun Jan 18, 2026 at 10:08 AM GMT, Alice Ryhl wrote:
> > +// For the initial users of these rust bindings, the GPU FW is managin=
g the IOTLB and performs all
> > +// required invalidations using a range. There is no need for it get A=
RM style invalidation
> > +// instructions from the page table code.
> > +//
> > +// Support for flushing the TLB with ARM style invalidation instructio=
ns may be added in the
> > +// future.
> > +static NOOP_FLUSH_OPS: bindings::iommu_flush_ops =3D bindings::iommu_f=
lush_ops {
> > +    tlb_flush_all: Some(rust_tlb_flush_all_noop),
> > +    tlb_flush_walk: Some(rust_tlb_flush_walk_noop),
> > +    tlb_add_page: None,
> > +};
> > +
> > +#[no_mangle]
> > +extern "C" fn rust_tlb_flush_all_noop(_cookie: *mut core::ffi::c_void)=
 {}
>
> Any reason that these needs to be `#[no_mangle]`? Would just `extern "C"`=
 not be
> enough? If there is a good reason, I think this should be noted as such (=
note
> that `#[no_mangle]` would be unsafe in edition 2024 so we probably would =
want to
> avoid using it if possible.

No, it's not required because these are referenced only via function
pointers stored in NOOP_FLUSH_OPS. In principle #[no_mangle] may be
removed here.

However, keeping it doesn't hurt either. There's no particular risk of
overlap with other symbols of the same name. I won't send another
version just for this. Joerg may remove it if he cares, but I don't
think it's a big deal.

> The rest LGTM, so
>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Thanks for the review!

Alice
