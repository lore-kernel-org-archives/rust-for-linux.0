Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE21BC4D
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Feb 2024 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708892933; cv=none; b=NiRyK9Xaz0bJhSiAqcRV3Hs7+EryO431nOakvVmAFM6jcHObtZhLbUlB57logf10Ihn+Euk1nk8IqCPzBP5WD1e4gGO3EeKN4iFYmaolPnSiFUgI5n1KPMx677ZhxclU6VtSDQUIR9i6osIr2k0TrcydVKwNg6QqzoEaNjMdD4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708892933; c=relaxed/simple;
	bh=RbBPyKvG/O9IrvVRTNsRwCiOfQCSh8sRIDW38dayURM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efNQvQE1GaMXGJCfj86K7MqFJCf1nqzzVicMRIOF086zxcFnzZC5h7xX1/1OBCFO9Hjo3EFJO4ZTabahbEa48YzN7aRw6scBJC0delfiVuc5GZN0fmd7+2tR7GwHkn90W070u5Htp5x3JC78a3r42nXFnAT0gJKFvhDkgwqAszE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtlaAX3q; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtlaAX3q"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29a74c88f74so1623287a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Feb 2024 12:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708892931; x=1709497731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbBPyKvG/O9IrvVRTNsRwCiOfQCSh8sRIDW38dayURM=;
        b=gtlaAX3qodIeop8OEyzwqTuLUGBseCNJ21KN9zAnol8TZUZPiJ+jA+4YbCkIpPw6GS
         JTnO6nwUUHCZp4anw11WfAUvSnnmO/DfA0bfFu55L9LvCa5OVL4kIUUQba7k/elzAQ6e
         fqb0zeqgAlqI0nDHd8W6SChrBULbjpIQ0fF2EFSRJPHEIyWmLMOr24sK0ZNP1fzp9y5x
         yytTuAl6SdGaL3eJxPzt5YB4AiT3mT4II2LMD7IvCv+JMFi0dYjkyuDFNhMMpWpVXu7j
         4YEcGY9rb7JYx9xW/cOv5EUeeAaeIO020VPUQBilxDQ548tT4uqMBnj+yp57EAr6Y0KE
         ZTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708892931; x=1709497731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbBPyKvG/O9IrvVRTNsRwCiOfQCSh8sRIDW38dayURM=;
        b=w4M7SAO6XnSygfnNfuPwZ2c+QTHaQEOpOWpiIwKJPZyuDtFg1fG+uGcdM+m+rYKOqW
         T6Q5F1a/vla9xHBe4ew6lo8Jgaf2+f/5Tt7IFLZNzoZOAQfHFBwTiCwh2ER3zGUIgrgS
         7du5aNTaG6ElsL0DuJrrQ9YBM+OR7b8RAB0IXBDdqe544KF94dVG7Y/geOWZcB7zzyDM
         yGBxbm3rs6llYdOys3yd77eYzSv1FU6GPa0nU8Nw3n7PkhYcCRQIvEytiuDL046/1FKb
         3RFTBkxQ0YdHgZPZag+DNnEJEU8EQJMWQGve9diep+8zz3ZDgUV/vTo5lnmxJAEUrMUo
         B8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyHL7JN5FGNbrwtKs+eW9Mwl+T/2qIlEN/+oh09LFnSKHxfrQvJNN2R1zxMd5dif2wlR2uW88BHpczhz6NuzLc52LjYCXAPziz/+QVpMw=
X-Gm-Message-State: AOJu0YwZ/m1zqCJ9QMCHLVNLQwM8P/FL5art9fyziNZLeKsyqpKg2fOK
	tScJoJHf/tHr6VbtMNGL7sqMM2NrAbcokIggCF5YeUZyQkJ/FBCwK/JTYMMINA8pGOhUv1iAgtp
	nUX21DsGVejjxw16EvW2FIvPySBsnZ0c/Njg=
X-Google-Smtp-Source: AGHT+IGhrIDOjuLdBvaECsdKcStFly4KfQFA0OshA8D/xT+V0pAVyeHsKb9B8j0aWmWgXe1AxlDLUNy9peptEF2lv7U=
X-Received: by 2002:a17:90b:3712:b0:29a:c91d:8af4 with SMTP id
 mg18-20020a17090b371200b0029ac91d8af4mr292291pjb.28.1708892931047; Sun, 25
 Feb 2024 12:28:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206153806.567055-1-tahbertschinger@gmail.com>
In-Reply-To: <20240206153806.567055-1-tahbertschinger@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Feb 2024 21:28:38 +0100
Message-ID: <CANiq72=eh3a-s06EAzKZnU-_3ciYtygx4dkRf0pH10TTy4ga4Q@mail.gmail.com>
Subject: Re: [PATCH v3] rust: place generated init_module() function in .init.text
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	rust-for-linux@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 4:39=E2=80=AFPM Thomas Bertschinger
<tahbertschinger@gmail.com> wrote:
>
> Currently Rust kernel modules have their init code placed in the `.text`
> section of the .ko file. I don't think this causes any real problems
> for Rust modules as long as all code called during initialization lives
> in `.text`.
>
> However, if a Rust `init_module()` function (that lives in `.text`)
> calls a function marked with `__init` (in C) or
> `#[link_section =3D ".init.text"]` (in Rust), then a warning is
> generated by modpost because that function lives in `.init.text`.
> For example:
>
> WARNING: modpost: fs/bcachefs/bcachefs: section mismatch in reference: in=
it_module+0x6 (section: .text) -> _RNvXCsj7d3tFpT5JS_15bcachefs_moduleNtB2_=
8BcachefsNtCsjDtqRIL3JAG_6kernel6Module4init (section: .init.text)
>
> I ran into this while experimenting with converting the bcachefs kernel
> module from C to Rust. The module's `init()`, written in Rust, calls C
> functions like `bch2_vfs_init()` which are placed in `.init.text`.
>
> This patch places the macro-generated `init_module()` Rust function in
> the `.init.text` section. It also marks `init_module()` as unsafe--now
> it may not be called after module initialization completes because it
> may be freed already.
>
> Note that this is not enough on its own to actually get all the module
> initialization code in that section. The module author must still add
> the `#[link_section =3D ".init.text"]` attribute to the Rust `init()` in
> the `impl kernel::Module` block in order to then call `__init`
> functions. However, this patch enables module authors do so, when
> previously it would not be possible (without warnings).
>
> Signed-off-by: Thomas Bertschinger <tahbertschinger@gmail.com>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-next` -- thanks everyone!

[ Reworded title to add prefix. ]

Cheers,
Miguel
