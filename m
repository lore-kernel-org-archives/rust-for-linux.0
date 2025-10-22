Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E58246764
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761148128; cv=none; b=kv8QXFr3twlYrS+p5kL01vThbParW4n4LyCUFxBaUxFSJU5rIN1vtR47PKwAMM3qUZFv+AOJZy4zwjwirgXzZhQDk20x6TvCuJAGRax+gH3YtX79WNNkjUZ5VMtOtuXv8v+bOboW4GD4I9HbgN5HZab1y+idpFXZsOk3sRPFDKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761148128; c=relaxed/simple;
	bh=EQHZZBPOlPHTdI996dBmEJ9hhVfKAg7TUKpqX0ktyLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQtTM5Pm14/gPaPRna3iL8jEItOnlgNsg2fA+lNBqpOmanHBW0Caa3GC0tW3UCfhCaOT1sc1hV/2m+VLqhJEgvVHhArxWeEuSuLmukjThy7OyU0shXnOCv++i8r/m3YDQ/TkhQHghAHlTPdqwHfttjMQnfDdA1nuEG9Xyf2PRE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BonvEqrd; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BonvEqrd"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-63e393c4a8aso4052082d50.2
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 08:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761148125; x=1761752925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbeSxf4Q0NCd4AbpKCf8W3ske4uozc0jvWYlMwwghaE=;
        b=BonvEqrdZeHviNMdGfaLPgq0P0Zo2cLNgwKVkznfmlp1B7l7VE9gFpuyfDVeAuGuik
         f/NxmzcNsn7kJg/UXQcfGEnA02d8kU/3BXkUgLrvkgoy0oBliPpIyU/jkwx0XW5xyTFj
         JA1CNne5bnHInazn/FwedEoDpqjvfySDm7P5rti+xcn58sqqNvMWBr4ygqf+vCPUorub
         Hkt151tVvsMTThJqFxXGFMSdcAnuWaiutGzzV8crjR+GimKW6hkLbbmvR3R9+nN63jx6
         63O6sIcaZ7hxk4D5kN6mbrwOCOJ5ZHsPeJHXBlYeJSugSORd33eVntqqcAj0HxTEdojL
         GVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761148125; x=1761752925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbeSxf4Q0NCd4AbpKCf8W3ske4uozc0jvWYlMwwghaE=;
        b=cMS3Fs22LuuXEd+Bkan5a1oo789e/IjXAgDKZRmuyMZJQDdHVRA2r2dKic53aICLcf
         8HOSiYTvGgogqPF+Taujm8ieZlX3quf/dLtGnRwAhj7s0AtmDgIT+uTjnO1QOPpR4qgu
         9GziKW+8lNN56bVtyxLwEqcnMVouUzwfyiBNa1wGh5683WnKTmhQyGMB8/ipHhqzBTmj
         cOHrj94MmPqJHkrCMu8e6Em69dez5r2FVWr1AMMbLmkpVxXAtfRV88ZXf6kcya8dtVUZ
         lcjFCzJW2PgCGusj1WA6rbvhd9kkQek/c+HRgRg9Zajh1yWD5EzoSMpiw+5BBxbOBu/e
         rNnA==
X-Forwarded-Encrypted: i=1; AJvYcCVbr44LKsdYI36qfmRbtr/ogl3dFzKfbPM+o078aMZiB47bDNAwD28sTrKrh33uXsWAH+heVhhTpvGTXUUuDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfktaqgnWxIW4/VMvaQBy31qyNmZbhSMvvRRoo1r8DUY2Co0Gp
	RQKN7GlJWnfLM9seuaP+RjH3JWm2yx4kZhE06pEfgH5oFUVL70Wdw7GcTqep/mrqeimoQmyC6wd
	8VWFpeLpgq+9CgSDG52XAB9DoLWkq8MU=
X-Gm-Gg: ASbGnctoPMiXnPJGeUVYdFnA75JH8ORH25AECJyTfwS6IiXrox2CHXhJUDwIV/FqbNz
	p3Th97ohQE83rLLis69j2pHx6YVwaGEQ1B8okfds1yTh4mRxyLyDndlPFavKAwvvK55MWlxPlpg
	w866STySj36L3wVDVdEsC9x3NaDQtrKwpAGAjTc2jggDp/WVyNDMslfnea2ESkXXfvEDudE1dro
	O9VWV6/ADcUE3YgArKYFkdyZUZGBGvwdE+6Gy3agQAR4h2yLHXE+Jf2R8g=
X-Google-Smtp-Source: AGHT+IEIfRKHiHqLQcXf9zlKf/oZfFJ39GnLfiwW1p+VcgxmwF0z4t7wuUKJs1TrmF7UeFvTYrphDr9YzPXO/9hrgW8=
X-Received: by 2002:a05:690e:12c9:b0:63e:2a54:3afe with SMTP id
 956f58d0204a3-63e2a543f85mr12477281d50.64.1761148125056; Wed, 22 Oct 2025
 08:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b929896b09325ffcad073edec86c3ce2048bd363.aca6009b.af09.4398.882e.a39af511d7bb@feishu.cn>
 <CANiq72nAdYX2Ja7D7QrsSeLyzgBKrSaTzSyJahXS4HAT5tNVEg@mail.gmail.com>
In-Reply-To: <CANiq72nAdYX2Ja7D7QrsSeLyzgBKrSaTzSyJahXS4HAT5tNVEg@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 22 Oct 2025 23:48:19 +0800
X-Gm-Features: AS18NWAHqEZ7aGemC4FvgFRatbmuFex20S0mgRC1r-2UeWHlJhb-ilriD4yq5hU
Message-ID: <CAD-N9QXQ84awmtkGKz28GDUUmws+mpYVR7LsO9TNHV_D8SO0OA@mail.gmail.com>
Subject: Re: Inquiry about Contribution Opportunities for Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?B?5pu55ZCb5rO9?= <caojunze424@openatom.club>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, "wedsonaf@gmail.com" <wedsonaf@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Alex Gaynor <alex.gaynor@gmail.com>, chao.liu@openatom.club, 
	HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>, dzm91@openatom.club
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 9:17=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 22, 2025 at 2:45=E2=80=AFPM =E6=9B=B9=E5=90=9B=E6=B3=BD <caoj=
unze424@openatom.club> wrote:
> >
> > Dear Rust for Linux Developers,
> > Greetings from the OpenAtom Open Source Club[1] at Huazhong University =
of Science and Technology (HUST)!
> > We are an active community dedicated to promoting open-source culture a=
nd have been involved in various open-source initiatives. Our club has expe=
rience in Rust-based projects, such as leading the development of RustSBI[2=
](an open-source firmware written in Rust, which has been adopted as a refe=
rence implementation for the RISC-V SBI specification). We also organize op=
en-source learning programs, including a QEMU training camp[3] that has att=
racted nearly 1,000 participants, where we incorporate content related to R=
ust in QEMU and share updates about upstream developments.
> > We have been following the progress of Rust for Linux with great intere=
st and are excited about its potential. As a group with Rust expertise and =
enthusiasm for low-level systems programming, we would like to contribute t=
o the Rust for Linux project.
> > Could you please advise on what areas might be suitable for our team to=
 start with? We are particularly interested in understanding:
> > Current priorities or tasks where additional help would be welcomed.
> > Whether there are beginner-friendly issues or documentation tasks we co=
uld tackle.
> > Any specific subsystems or features where Rust implementation is being =
actively developed.
> > We are eager to align our efforts with the project=E2=80=99s goals and =
contribute meaningfully. Thank you for your time and guidance. We look forw=
ard to your suggestions and hope to collaborate with the Rust for Linux com=
munity.
>
> Thanks for the interest in Rust for Linux!
>
> I would recommend starting at:
>
>     https://rust-for-linux.com/contributing
>
> In that page it is where I put our usual recommendations and ideas for
> contributing. The website also contains information about related
> projects we use as well as actual users, including users being
> developed within the mainline kernel tree. Contributions can take many
> forms, not just code or documentation, but also e.g. reviewing and
> testing, which are credited in the commit log. We also have many open
> tasks related to the toolchain (upstream Rust) as well as other
> projects, of course.
>
> I also recommend joining our Zulip, since that is where this sort of
> informal discussion happens:
>
>     https://rust-for-linux.com/contact
>
> I hope that helps!

Hi Miguel,

Thanks for your suggestions.

My name is Dongliang Mu, the director of OpenAtom Open Source Club at
Huazhong University of Science and Technology (HUST) in China.

I wanted to provide some background for Junze's email. Our club
established a kernel contribution team in 2023 and has contributed 180
patches to the kernel community [1][2]. I also began serving as a
Reviewer for the Chinese Documentation Team this year.

Recently, our club recruited some open source interns, and we are
focusing our efforts on "Rust for Linux" and "Rust for QEMU" [3].
Junze is one of the interns participating in this new initiative.

Best regards,

Dongliang Mu
The Director of HUST OpenAtom Open Source Club

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/=
?qt=3Dauthor&q=3Dhust.edu.cn
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/=
?qt=3Dauthor&q=3DDongliang+Mu
[3] https://lore.kernel.org/qemu-rust/cc709134-2d28-4ac5-b7fe-c61bd1c5ccbf@=
redhat.com/T/#m584865b82bf8449aec2b3baf422c28faab049dc4

>
> Cheers,
> Miguel
>
