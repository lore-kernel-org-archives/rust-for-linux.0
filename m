Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F82610D
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Feb 2025 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920751; cv=none; b=MVnigfPiMECydKFz5QM9UHFcV6WrWXyOZt1JAZWZjt87QvSO/kzMl4TtP2aXY4goSH1h9keA45waA2tzYadPuuCQ3WUqKuk9cEW0VtqvzdJjdc5Y8Ha03IQwrBEIZbckRH9DPgkgCNnQCTjNxrUo27G85U5IvFmbltfmmCutEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920751; c=relaxed/simple;
	bh=yOJ134mbLY6z3cyo5sh6OViUF0CPPUVNFJuqk4yunHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRRJjIkVG1rqIo064AXt7aO5pSR05AlG5SxdQ2+RVJVUeq9zeAlTJAoJqYm/1z25JDzGdvHHlEZSvqNxPBvYNb0Mll+/ogEZI9Q6qiZgV0KIiEB1/TqehRv+tEGI79ecjsLR3LXXA1cCm0Ty3Qi4Gx4KEqLvjJKgPwm6g/AYJGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aRVCZafp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aRVCZafp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso940642f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Feb 2025 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738920748; x=1739525548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zSVrIrWUdmAiWFTc5k/o0pGtWSNU1TlVuXxG8iRrpc=;
        b=aRVCZafpGzbY0Ej3gVTWx8XL1XdxgMrGWFaWBrz7CZqWFfHs3xPMQnqMpfZ4hiB4in
         Xn3/xBlDlTUiBdl8HzmUqkjjTn3Sk+RQvDY2LtQcnQ98B36aV7d5HkUTDJ6l/kYZ8QCK
         exiUmrx2rHyE4YNAN5ySgg7rAJl9IAsE52PT/TPFoOrWWkEt2skiOodHUlkWFrxlTTq4
         NbVSbdCpJh6lMdWKa6UMJOjpGyA92upt9fWUL/oiQDCG+AgFcoGlquljG66tB+fRtrSJ
         p89uhUafz/KhlF0FY/RnGTe0fpxMtAcZlAi9MqgGbEJLNd25XMXTNp2+lYneZGdojLP2
         +lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920748; x=1739525548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zSVrIrWUdmAiWFTc5k/o0pGtWSNU1TlVuXxG8iRrpc=;
        b=KMBUF6CeYFlSZJCZwwivjcKaQnGUxFVAfxB1iDjMkZSY15kuS9FijV6a5dQC/YnuNH
         pRsYOOLtUYqLPgyHjHgKYmgZ/HLgpFzGZ+ltPTaVSc8Qu81iMStp13X8q+aawAnsEWBd
         LAs1H4FquwyiPoHLLVCiXkCSmmmv6yiZdh8Wo4/LlsjhKLd7jvORwLM7t73X1Q089ySp
         Gq4P9H+axb98yT00wt+8tIViC7v+RDqEP1P5UJBegDZr910yQaECDAkxxpuXatkrS2wq
         8ZtL9qeslIF/Iv2VQ/A0sElVj/fFyeE+Sign0Ruhhd1c4eIczG0+Bs++gbHqQA2IVesA
         xRDw==
X-Forwarded-Encrypted: i=1; AJvYcCX80m1D6VuA3cqJOgZVU50oQ0ZV4rNDCrjpPMQzfyAEVtIVcrmGGPJw/MvJAlq3foyD3NHSfI+jyl8SCBnRGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRgesQV15yRR7EgxNvArNGR1qlc7WOykgE++8QpguHA8vELyDl
	YzzeuEJ+fXh1VZ4PcYJOzQYo9YP5T944bKId3s4Fp9L7G8zy9m0eKCbk2gh4OCiAWpRjUNubm+K
	o6Ov+z35TTQ2i9+fuMxryCytNDpq/YgJFinYU
X-Gm-Gg: ASbGncs1P5kd7ilqrn1s1rygi4roB3jc3WmB9NqjlChqIalD3d3soDTu7QKk6YRs9Z1
	VHNu1jWc7MTvkwmkME5zMNea03gAuLAlWTVrtfg63SmAkYMoaC/ZCVvFta2+cviW4ZkIlqGGLfq
	NJSlttkOAxOoGRffkUg2/Hs7OksKQ=
X-Google-Smtp-Source: AGHT+IG+Q7x8v5hu5r2ifN7Rqyw4qGtgoCj9DaHe5IDHAo5PkpaolJPoXt15hLt1LXvrYSWpGMuE3glJvEvPs6RQZmk=
X-Received: by 2002:a5d:6da2:0:b0:382:49f9:74bb with SMTP id
 ffacd0b85a97d-38dc933468bmr1711155f8f.35.1738920748435; Fri, 07 Feb 2025
 01:32:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207004049.178049-1-lyude@redhat.com> <2025020702-garlic-kindly-8377@gregkh>
In-Reply-To: <2025020702-garlic-kindly-8377@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 7 Feb 2025 10:32:16 +0100
X-Gm-Features: AWEUYZkYb2NS_HzU9qPCFPkbmughlQwvhf6yXzIrmDwPZY9iaK6Q3Eh7MuDigK8
Message-ID: <CAH5fLgixWd862P_mma0BObtT=gm9fTzQOZot62aet1qx4mai+g@mail.gmail.com>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 10:25=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 06, 2025 at 07:40:45PM -0500, Lyude Paul wrote:
> > This introduces a crate for working with faux devices in rust, along wi=
th
> > adding sample code to show how the API is used. Unlike other types of
> > devices, we don't provide any hooks for device probe/removal - since th=
ese
> > are optional for the faux API and are unnecessary in rust.
> >
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Ma=C3=ADra Canal <mairacanal@riseup.net>

> > +impl AsRef<device::Device> for Registration {
> > +    fn as_ref(&self) -> &device::Device {
> > +        // SAFETY: The underlying `device` in `faux_device` is guarant=
eed by the C API to be
> > +        // a valid initialized `device`.
> > +        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).=
dev)) }
>
> Just curious, this is returning an incremented "struct device" to the
> caller, right?  And then when it goes out of scope it will have the
> reference decremented?  And do you need a wrapper in C to get to ".dev"
> of the faux_device structure or are you ok doing it like this?

This uses the &_ pointer type which does not involve any refcount
increments or decrements. What you describe only happens if the
ARef<_> pointer type is used instead.

Safety is ensured by the borrow checker that fails compilation if the
returned reference is used after the Registration object is destroyed
- i.e. it's assumed that the value is safe to access without refcount
increments as long as the Registration is still alive.

Alice
