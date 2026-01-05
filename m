Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3223532ABF1
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626633; cv=none; b=axAEg5FAUwFyN+zUwx5SEKQPyHz2wDibXVqO1kaCRgJYCCzxeRuxkXYiyiup7S11Ni5XdywltcA5TlO+JlaMankthgQU7XkWBr+P+uGC6egFVN639+/BMGjCu6XmyXdQ9Y92/cllog37U53txX2Qvo1j32IhxVjTXkMlWyroR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626633; c=relaxed/simple;
	bh=i1L4XeLKczMx0NgI/tag7Lec+98akAmzo+tUT3BVsrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u593tuO5hfyEZC3q+Vnvpn9Celks4PdgUrK3En5dVmBd9WuHPvbbC/jCQCT8FhZmr+YBdogJw5vQXsLFP/J2Hff/z00Dyw0YyE3LHmHr5FbMEmvpQoEsyo3s8cXCq3UrdhpdvfAbsNceaR26MiVaiy1HccngRv4ejBMB1L6xKs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vdz7rxuk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vdz7rxuk"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5957db5bdedso16288066e87.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 07:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767626627; x=1768231427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1L4XeLKczMx0NgI/tag7Lec+98akAmzo+tUT3BVsrQ=;
        b=Vdz7rxukQMnKBlUEGjJu/cEqYCm008IIYRstqo22xZjAs0VGitNQwN9ntd3pLO8TI3
         92yOZdV3mUFe93bDrre0tRzyWlkadUEYJmSHhbyNjmd4vFwbl6OrWTbGvlC72pebglZi
         TVpNsLnebBKG0CM0cRd+S2eB5FH63WykAfT0SA+qLtx8XaZYMWCE+ciAW1tgWNgecgCs
         CO+YGmrgFjNzu58FL8wuyEd5rV+gCSxs45m26D7JYQhHIYVHpkNnUOGaNwjeKrZrnDwP
         o7gIDEWFIrdYbsIVmmsw4XRVdAvnY/E5sFK5oXk7zi0vKxMZU4TJnMMxlRM1+npUKjAq
         ZZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626627; x=1768231427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i1L4XeLKczMx0NgI/tag7Lec+98akAmzo+tUT3BVsrQ=;
        b=I6XHLjpH1UryFSNDUcFG86t3fF4kYzmf2uOFuoqdSwUIzWACwJcmmiP6ZmVUc9u2ag
         D++BiJarmBLrBgn2UL8NRYt/yuX8y/ywY27gnNru+5PN7Qz9AuHPorCQyPB69c/5BIBu
         oE95VAp7Xp/WeGGq8Jm+w2iB8LwqYolzneqVISg1G766+5nNy1tYy+Rt8l+oZaMfNbt9
         W9/CSZJy6a0m3BLPaPVekIRd3Zk81FiAHbCkiEc7Y6uqExN6k8VmIBMNFcfA2zAwT5hu
         fiNWV32CQfa9fxSaiDRmlv3cPYvCwsD86ROaoPSiHJYPBPP3vBA45qv1OpohJbkwwjcP
         VTlw==
X-Forwarded-Encrypted: i=1; AJvYcCWW5UNYVgsKJr/agewHImjT4bxyE+x5Fq9zDozjNR9/QnWIdtNbpfA0ssPcC31BTnkBNbXECn4MiLw4fdrEPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuPIw8ZV+Z8CnvC7PLBkP+4+8Q6LrQe1Ziw7dbiLjTxKoozA5/
	aZsMBqs2O0Wwd7Pe/UzTkW2bG3FKHVr4renfLxnMKAt2qB3b1QDNm7eYAf9mwLsYTNnX2R7TveJ
	YPcTRAG15/E3XyYFEBW32AAD8FkAiwR8=
X-Gm-Gg: AY/fxX5qbjegOZM7AZtrY/lVvq9Q1nr2TrZV0aXBBzh27jEnzaffO45HYdRFAWocUhy
	lIlFEsHPAJ+Q5HgZvQ98jnpLPkQ7Nu1yMZLZsfsvKI+hEKCRqETEgLtDXLe7gnpEXyF5S4vxFHR
	MJJ6vYRxGNQxG/huM1X/S5A8M4neWwXh+djCfWACybgpVUaXOwubRfEvZUzVZGDGs0rNzCnHskN
	ZdDu0jZ0Vcc8yTAtJppDbMrbtNnrOF7L+z9sjfHcsP3AMqej7Rzej9neJyst6wdF5RI0bXAG5vs
	O/tuCQqLeywiWqZO3c7rv+702FROGfwHPhxgJrap3qU/vc8JiFSr5m6/ZLZuj10Rvh8ovSQ01m1
	TmxRCW+0+S7/LJ25cmrD62fynp3oXYM4Zzg7PdCtadg==
X-Google-Smtp-Source: AGHT+IE1gWlaZrKxVHu1SzbvPfcMfYTREWCi8L5i4KHpNNNm9q2fjTz1BKgSb5mtBqLGFh8CgncboPd8/OBWZCFVuwM=
X-Received: by 2002:a05:6512:401d:b0:57c:2474:371f with SMTP id
 2adb3069b0e04-59b65263f74mr31051e87.45.1767626626662; Mon, 05 Jan 2026
 07:23:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
 <cef76fc1105481d219953c8552eb5eb07dac707a.1764062688.git.y.j3ms.n@gmail.com>
 <CAJ-ks9nWbu53Fhmz0Wcb4jHxwr3D-sc=BqW=gHLjw34dAxRKYQ@mail.gmail.com>
 <CA+tqQ4L1j=oy87e0DC-m9YA9wJ6fR+PKtVBcnWH9iitNsVqG0A@mail.gmail.com> <CANiq72kezzBVKUyqGwSuJ5ct86a1ZoGJdh7xt3=3TG4+B+Vq4Q@mail.gmail.com>
In-Reply-To: <CANiq72kezzBVKUyqGwSuJ5ct86a1ZoGJdh7xt3=3TG4+B+Vq4Q@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 5 Jan 2026 10:23:10 -0500
X-Gm-Features: AQt7F2pIlV_dIbND3AEXjrm6W3GEUcSUJEyy_xvFEHXopqlr2WEVIwOJ9Nx-xhc
Message-ID: <CAJ-ks9mxJ8Vtpg=6YEqoygfB243-KJxd7XvM3cVO69P7uTC-pg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: quote: make rust-analyzer treat `core` and
 `std` as dependencies
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 9:06=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jan 5, 2026 at 1:12=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
> >
> > IIUC, to remove `std`, we need to patch our vendored `syn` as well to
> > not depend on `std`, right? I think it is indeed a desired change.
> >
> > If you don't mind, I'm happy to patch the vendored `syn` along with
> > this series if the team agrees. Alternatively, if you'd prefer to send
> > the patch yourself, please let me know.
>
> What are the advantages/disadvantages of doing so? Performance in rust-an=
alyzer?
>
> In general, I would prefer to avoid patching vendored dependencies,
> but if there is an advantage, then I think it is fine to have small
> changes as long as upstream has merged their PR (i.e. so that we at
> least know there is a good chance we will eventually get the same
> change when we upgrade the dependency).
>
> Thanks!
>
> Cheers,
> Miguel

Yeah, I wouldn't rush to patch the vendored copy. We could just
knowingly give up on the IDE support in this tiny corner (assuming
upstream takes my patch). FWIW the only degradation here is that RA
wouldn't see the ToTokens impls for CStr and CString.
