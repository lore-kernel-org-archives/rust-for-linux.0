Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC7522331C
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754321086; cv=none; b=JAUf6Nw+Gho6km/5x4ToboASkbKzY5dn0SlOZ6Qe5iqoQJQp1Ia2Dhzyfk+C74U6iE6YYm9+zwsHklLVfdbceuy3UGOfEUvp+ZSWMYpYindH5u8UGYEjFi0Q+1EOb0JroKvfLAbXIneuMsLxzAWWH/21tReFhIs2keHBC9iYEc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754321086; c=relaxed/simple;
	bh=td25uwgg4fLe3vfiY1gjlqeyos8bdAIvynxHGhWsZSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNwVrAKr2CtE0vyAPtrT4GT7Nz9Jn1qjgreSMt0Pxm3TdNnWWXr4Ra6AqBPS8Hb570ILJyWt4RIpnu6mN/7RgJkpbUefgL/nURcDC3TaLdJoYF5TysKrLuxO2LliHtY33jCXo7bZ6cWEthZ27epX0hcb9XnFyEMbl3Xe+E+nKj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1BJAEjW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1BJAEjW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-240358f4aa2so5407465ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Aug 2025 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754321083; x=1754925883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=td25uwgg4fLe3vfiY1gjlqeyos8bdAIvynxHGhWsZSc=;
        b=h1BJAEjWBRulHa02CmltcoeHqXq5bGyTDuBxHrqc9T03p9kt7MpDb8mQEXbEfDzRex
         2P3IfxuU/6fFbWgUEKr6GS3f4zoE8gg8GWYKhYSLHepauzXnOngpWmU4QDzvtXEqKyhN
         XEz8d3bnIQhtpqWF/v+tkJhbseoI/cIr7nQjMYHrqQbxs9KTJWAgYEzVE/pIZjk7Pb9/
         +C3xrjoC8Kv+Ns/4lq3voDmszBx0r8uyCYPajAiMueJfPU+oINwsBuTfPqXMRIM6ZNrj
         QkzDI8LiBTijmWUXDje8uP7QvOSFbUzJbwvjk7JXZTmIjAicPqFxIjn4iLwUrcmTiIGo
         aATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754321083; x=1754925883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=td25uwgg4fLe3vfiY1gjlqeyos8bdAIvynxHGhWsZSc=;
        b=wAgeSwKln45WSJADr+8jzFBbPe8lv/3aYc4GAihxG3aYP6GAll/x9kQuk0zDfubIYu
         YtyGKiUtY9mKea6BQek/Zq8WW6ttD0XQRLFW4NsUvT1k9wzNZNL2mkkUF9h0MH2ZpFWI
         MbsHqFdWkbw/nogJZoPFRI0XF7aLM4rq1uSFdcESatqfUtSnPufEslAR3VNVlRZzYq6B
         MAPQhMVkgI+91nxDvYKnUwBljBFVPVs7++frDVK8+Wjl+45s1zaZkz73oHoHI16VBSHm
         AAvDVIgvz+psn6ConRoM14voNttgBCxWHECUT25yT0V7cXwleAKixkvz0o/kDxq9a5Gu
         9tvA==
X-Forwarded-Encrypted: i=1; AJvYcCV9zjS0m2JuWoXTs6cLGXzR+C9dSOKnXN+SQ31GSOUmucLHe2goEHKoEae9NIeH50pE+s/gySBRCim+UF+Lng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kHKQcahTvyZOFEe7xRISF3btGVZ8C8XhcYwHi3XgiJg1/mF8
	HoS4QeOMTTowkVBXt72vpBu10O8OePTXgt6bQyP+QcxpBeXl0ZiAkmbzqmo8bjs70AHxFbgkPXJ
	VyX9vjmzIqPwChe0s97zLRgNMzQU/m14=
X-Gm-Gg: ASbGnctCotIbhlZgP5Zpp+snaPcMP2/iNAGTcxet6J4DvbtgDJ7rs++6oQeTM0/5ukj
	Wrzjk2OHR21kSsTjpp/CwiXPMnpqapxYpdho8sJNbga/rcL5WJH+ipbpGJ8pEyOUsVR5U8gURN0
	ogLaFofxw/c7xRQHd2gfpjdRjVtO281/61Rb+icKHQq4B0I6TWzvLXrAt15/eG+PUWW4qDY81CN
	CaVCapVZHNr/HKTKQ==
X-Google-Smtp-Source: AGHT+IHPfzFK9GoY00UNYDt0nzQM6AYa5tjfVjUK+qRGs1Tx+bZH96/XbttsZpkes0IATyc3lGPXVS1ireZuAZGXYNI=
X-Received: by 2002:a17:902:ef4e:b0:240:729c:a022 with SMTP id
 d9443c01a7336-24246fef45bmr58446315ad.11.1754321083463; Mon, 04 Aug 2025
 08:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com> <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com> <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
In-Reply-To: <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 Aug 2025 17:24:30 +0200
X-Gm-Features: Ac12FXx0N0QXZDVy2P80cisNlxVJacoqt08izIkce3XtuNRH_0rGAdf_dOf8lwI
Message-ID: <CANiq72kOo3QLMr+kgy5=5En9yhrSXRQQXGaW=4ONhhktU_NuDQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Igor Korotin <igor.korotin.linux@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 5:17=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Given that Wolfram said that he prefers you to maintain the code under a
> separate entry and send him PRs, you would need your own git tree where y=
ou
> pick up patches, which you then send as a PR to Wolfram.
>
> The link to the tree should go under "T:" in the MAINTAINERS file in the =
entry
> your patch already contains.
>
> I understand you haven't been a maintainer so far and haven't picked up p=
atches
> and send pull requests, so it can be a bit much in the beginning.
>
> A good place to start is the "Kernel Maintainer Handbook" [1].
>
> Additionally, if you're willing to pick up this responsibility, I'd happy=
 to
> offer you a call where we could go through the details of applying patche=
s and
> send PRs and clarify questions to ensure it's going to be a smooth experi=
ence
> for everyone involved.
>
> Once things are in place, you should clarify with Wolfram when in the rel=
ease
> cycle he expects you to send PRs, i.e. until which -rc before the merge w=
indow
> for new patches, and if he has any additional expectations.
>
> I know it may look a bit complicated at a first glance, but it's not as
> complicated as it may appear either. :)

+1 to all this and happy to help as well on learning how to be a maintainer=
.

Thanks Igor (and Wolfram)!

Cheers,
Miguel
