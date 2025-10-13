Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABC62749D7
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373159; cv=none; b=pbzjQUu7+L6tp6P6adl8QB50eMvSdsuNSE6PnM6Th3kf4wVO0f/islYVAQfeBlXqGAYmh6eRCDvg0UHCb2XtGiVDfWAD9boh/Np74dZ9O/hjsB2I3dHWGs9o0xuU8XXsp836XOfAx4qQNwzPVLHqQ3737a3kwJzbvZVXioh7M3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373159; c=relaxed/simple;
	bh=8PEbt7/KiisZENpthYaEwPRP3ny6x+ce9ThxH5LQ09A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQG8pJd9RXQ1OxZ6KB8SLYLKklC/2VRgyLKfZn+7OTQQpb/cen4qoqbQ3ixvlCI+HmGsF6uk58lJk8G7mAUPHYTBjiW28734PKFTR/6tLIPweoaUpk8mkzdAVm1/6Hsbxr7VWCy+NSXJ2smYwK9fYoP6lq+K2MfF+teddkptdkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/UdoII1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/UdoII1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-28d18e933a9so9148395ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760373157; x=1760977957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhkE2kxttgjbOmTglGY3wFhQ7XB/INVjgyXJP2fCnrU=;
        b=A/UdoII1weJXtH40r0xBqkXt4/ChtPyWccPix7as/CZCDCwH6q6qe7myR5boIWx8f/
         UMuVW5MfBQlIgNjwwmkgd4A7l6F9K+4CGCx7kh4MpHAl4L33mAIzM6FRN3kKBPJ83h++
         m32b1hvVcAlRHlGkJ9IN1UFXfX3+5PIZpZ+m9HPm8RRsQOzqnBBvCIOh0Z/7pCoGh1fP
         1V4Nht43Y1iMN984DFp0bR07m/0F2Ne+l+tkWYnf9x5JTD9GPrl4ZPK+r9d+0bGSQCr9
         7+StuPswGN123ua6pa6UkJdcYXZd5ZplfwO9JnHQyJj84ix4oj3jmIg8AceSuVJ9D9wd
         UISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760373157; x=1760977957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhkE2kxttgjbOmTglGY3wFhQ7XB/INVjgyXJP2fCnrU=;
        b=N6CvtwcZHd2EuYF36XgTuzUi84yGLAZi4bxMZHqA7gpVV+x0LqNEOXQOOcOnaPXlos
         9wFlTjYYUU9GyiaQe80xi5jgNWa6/7aEjOfNZBrxhiLb6qiTVE/VviwdHBltxGzACKPL
         885wDrqiovwdkIyciaOHVuwxTdYzZXg8SxyhKrHRwbJVkfCgW6rIpiX1hSyczdBjDRRu
         NUK1BZF4mT0dId8ydgee9+tZTk1zgwTZGm0jhRtpl0JET3XQkfr2mUxqn3vhJU7+ojyf
         OBBcpRQ5SjPCJIjWBP991XE72Saer04m/fGXks7p2kvBsoNN7HK39DUn0Nnqy714dtx0
         /Ofw==
X-Gm-Message-State: AOJu0Yyjz5HvxHFHQKAiU2f3xGT4spK94TaWjYQh65bSWvasXHx1aVwm
	QyPjXrPs/iXrMHiLFEEFV7uhPWbLlt5SHapJjY09e64nPDRqEg4YqGh0wkyCFqwpaQa8KpsYbHe
	8m8u+GGRaabAmWxZqf88ZX6hZIX7L9Jn6OCOCOKw=
X-Gm-Gg: ASbGncvL8rjuispZr7iBnn2c/rbiF+8toE9km64QX0hO7NqW+O/fJxD9BZqGYu90ewt
	17L3V0FzffGQ1ktofB31VnplZG7FGEOMFvHyKlgZbW4mbcpzoRcT5abPLbvNuFced5og5QIS7E6
	+xV6Bfn+MDPfz/Toh5jpPBQv107OhpKGwXI5L7D2gKfROd0r+ON2LsEE033NY79UPzgELFfl8Bf
	cfdtV9Kad12F4V4py5AZKZkrtR7ctUZzJDvd591bIxCc0r2Cyl6OM4hrHzNhqP8Xl9vA86bWlkQ
	KtahhKraBb1aqbK8RQ7iFjJdSNYEBaKQCfr5d5yWrvZ8pYKukE82FQQ=
X-Google-Smtp-Source: AGHT+IFL/ZfJ4cj1Fo21vdtAWa72Ot3BxKQ8+vXwbOeeF2ANwjBEWGV/ZPwLInyjcxfIhg/pREwZw5L55MhN3eCJYLQ=
X-Received: by 2002:a17:903:110c:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-290272667a9mr157087805ad.4.1760373156695; Mon, 13 Oct 2025
 09:32:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013155205.2004838-1-lyude@redhat.com> <20251013155205.2004838-2-lyude@redhat.com>
 <04dc4834d38932242df86773e47030e8105461c9.camel@redhat.com>
In-Reply-To: <04dc4834d38932242df86773e47030e8105461c9.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Oct 2025 18:32:24 +0200
X-Gm-Features: AS18NWDyh_CiI5BROIDxIAOTwe9IjcgjNOybhNZ0YtVxcSx0Nj5WUlyw0Qb3tYk
Message-ID: <CANiq72kkC+aieH-SqqGwX2iA6wZEJcysLui0JWxAmo75RZ5fiA@mail.gmail.com>
Subject: Re: [PATCH v13 01/17] preempt: Track NMI nesting to separate per-CPU counter
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Ryo Takakura <ryotkkr98@gmail.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, 
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 6:19=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> JFYI - This hunk shouldn't be here, it looks like there was probably a ru=
st
> formatting issue somewhere else in the kernel tree,

Yeah, one is the one that Linus kept in the tree for the merge
conflicts discussion, while the other was probably not intentional
(i.e. simply manually formatted) -- context and fixes in this series:

    https://lore.kernel.org/rust-for-linux/20251010174351.948650-2-ojeda@ke=
rnel.org/

So, no worries, I guess it is to be expected given the tree has always
been `rustfmt` clean.

I hope that helps.

Cheers,
Miguel
