Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2A71B0100
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720105149; cv=none; b=njxVPOI/PV12eGxZQXlFg1CwPNgtHHQ1RHEzwCx3njNRg/PZaO9Ool0LrwdtGLNOyjqmN/NXHhY32j42XOHWnCZ/lhoPCMlCY19tcQWqlPG/jL77OezfnI2o0nsqxB4125ALcbgf2CfmAp9kH4GkOv7YfXMi75/DxIySxoPwjFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720105149; c=relaxed/simple;
	bh=WATt3D7J/IVmxltuxLMBwEcE4iWsmNPb4qKThKSzr2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpAufE3a66d7brynWTsVisPNhHbXozRSIjpkP1rNDFDR1ZPJ0Y0Rzowzz7OhNPRsZRvvWSuwk/fZTS0wwhMx4g4cvCIjy+wcVDmxUElOy73Dzkhd35eejUYSwwvHYtMWGWMugakTeATG5SnXVFbA/B/+hRwJtF6HPYLG9+28CzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bxYldRAv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bxYldRAv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3678f36f154so399343f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720105147; x=1720709947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipW5yF2l0h3JDASUEZRIOOwGfpjoQU4vCS+os4NDlfs=;
        b=bxYldRAv6Vt7ItneTQy/pcQsdJnrYyv84EsKjlQ4hQ5MAyTeYijtBAH/9poltQhBJy
         VBKsJ/BAQw5xjfs7l4eHRrTyDY66lcy0uMxrg2fgs8MubeHfhrGJIM3SzhG1His+MR+A
         7FOn5Vhu/qUNpg6pvT7vUq9ZvpbEkiTDAKxmz7OqgthD/m0cE0V70Imr3x+DO/hdvPsi
         N8SrxTOzILTerHWrsVWWZGpg1rxrxzzgkmpdOgYZMtUhWWX3ac3xYeBDDWKrOjlI5Qms
         5Si9KRPy8rJGxabwZXAd/YogktxyD/6aXwirJdxd4OO4IJiSSgpBm8WBOf47s2uc/YoZ
         q3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720105147; x=1720709947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipW5yF2l0h3JDASUEZRIOOwGfpjoQU4vCS+os4NDlfs=;
        b=watkzo7YUvbIXtm8JY9Qn76oDrKxs40TrGsVhA6oOVbLM/ljUlXSmC7IPcLBottpgY
         emcJP8qUP3SpYg/S4wW6l+uPbciRLspCfkPOLdVbdLLfCnIcyW/IGkrtOqSscGJviVVO
         WVR9nxuzNh76cR7zjOz2OFO1G/w89qsVBcPSCwj48ZUb3ANFufZUwcQiFWKJ3MQkjn4M
         GjKy6Se6MWDUBTOTbYtqq89i1RiPRhIZICHmcW5rIhXSocSEgUu2vV4Eqwr7DxmL4ucl
         kc4fjcdTOabXZ7KVSTEE75XMRPx10Pe6Z+yAvF48G2ywwHusFe9sNdzDUJZSn2yLm50g
         PmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOypGHu4LZam4FOAkICEqqJwaK/lYNT+rcut1U+qN6UI5JDOSmIeXfqO3zILkBGm7dFX2XilBV/al+1Hmg8lY3PbraEMqX2o9HYAKcDic=
X-Gm-Message-State: AOJu0YxIHaCzuWStwnJK0Tgo6O9zvhzQ6Hp3ZmwyrTDvnEKS5UFP4MOt
	u/MhQNv4C34bgW0cD/JZ6q7fu4XUSmw7+tkmehWoDLbW+baJMPvBu4T7ye//MJmGgw15Pr6vvNC
	bNS5DfsFstliOfmKW8w0u1qHVHPbxCEofVl4E
X-Google-Smtp-Source: AGHT+IHiGxLMhUSTF5OSbTLNnCaVI7g8cxF0kLlNGQwwQL9PZ17CqMlQ4bzjGShedrKKcdwCCgJYMl/YYBc5f5VGRgE=
X-Received: by 2002:adf:ff83:0:b0:367:4d9d:568b with SMTP id
 ffacd0b85a97d-3679de96b24mr1510125f8f.68.1720105146546; Thu, 04 Jul 2024
 07:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701112448.28638-1-ethan.twardy@gmail.com>
 <20240701112448.28638-5-ethan.twardy@gmail.com> <CAH5fLgi5HdoPzJHZUrS7r3wdQ6GheJDbzGRGKZpk9oC=U6SdHA@mail.gmail.com>
 <D2GU6M1F3QN4.31TYYGTCNHJ9F@gmail.com>
In-Reply-To: <D2GU6M1F3QN4.31TYYGTCNHJ9F@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jul 2024 16:58:53 +0200
Message-ID: <CAH5fLgi=PPX5aUiN7=kh+z8KHRmbFLLtwGw+XK1Qmf4_-Ye+_g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: macros: Enable the rest of the tests
To: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Aswin Unnikrishnan <aswinunni01@gmail.com>, "open list:RUST" <rust-for-linux@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 4:49=E2=80=AFPM Ethan D. Twardy <ethan.twardy@gmail.=
com> wrote:
>
> On Thu Jul 4, 2024 at 4:43 AM CDT, Alice Ryhl wrote:
> > On Mon, Jul 1, 2024 at 1:28=E2=80=AFPM Ethan D. Twardy <ethan.twardy@gm=
ail.com> wrote:
> > >
> > > Now that the rusttest target for the macros crate is compiled with th=
e
> > > kernel crate as a dependency, the rest of the rustdoc tests can be
> > > enabled.
> > >
> > > Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>
> >
> > I would drop the newline before `fn main()` here:
> >
> > > @@ -221,6 +248,8 @@ pub fn concat_idents(ts: TokenStream) -> TokenStr=
eam {
> > >  ///         unsafe { bindings::destroy_info(self.raw_info) };
> > >  ///     }
> > >  /// }
> > > +///
> > > +/// # fn main() {}
> > >  /// ```
>
> So close! v3 incoming :). Thank you for your review!

You're welcome :)

Unfortunately, I'm not really able to review the first patch in this series=
.

Alice
