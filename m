Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9613B1AC448
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732548897; cv=none; b=VRhb4Q0sgZeOU7lSaGI4FaEoiRqFOkPZ65HGtdnf1jYFY8JMdQKUKS83WihbvVca/Fy/xhNoXMuNK/LlwRBEGADmGcBQ3SXJOCoIOtxm3sA3kDc5rbnmt6RXCRDRvDgq1q7jOo7LcrVRINbgwMLII9Cxqdmrcr6Gt+ZUlGHfORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732548897; c=relaxed/simple;
	bh=rEFJdZSwH2wd+21uchAY2/iTR59ZVMr1M18odRCoI1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B71MX8/6m4HYYFs+7DkzbsaJdNhHliOMyl+miYVolE7+2/b46E3LNUKg3eHlGKXcOtmnswH7A/hrhFK8m6NbXda2sMS628JxPWDLXFTGCDaM7tiKKm0TABnUUjziQMZrWTsF/jeWz5tvUWAs4Z5OcWSnCtm8To2v5oaEHJMMzvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JCQPbVr7; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JCQPbVr7"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d027dc53ccso12786a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 07:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732548894; x=1733153694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEFJdZSwH2wd+21uchAY2/iTR59ZVMr1M18odRCoI1Q=;
        b=JCQPbVr7wnofDau/L49eky1TxDcaQzWk4/fmNrAn47ts2yPZ7AHYovhP1cmdp7ar1G
         TVycJ+46WnLlHgtt61tvuvUs/YqVszj7JKYQOAI233EXVZCtQV8DLT/1rCocUcWWXPMN
         vyRmKGpRpXyXXQt0Gx/6p1zptJO8UAdetj53gxzEzLZqgfAyx7xlVJlCblanL0uf6xQa
         8oYIMtGX4wId93qwALyi9dnGDy0J9b3udeO59b0ASLqo9Lk03BhmhVD1KhRwak1OusxW
         cYZS4iT6xkG1KROp1sIXKcThABf8+/rpy6Vh73Kh/HohjKAAztsSLA4VI95RnOZzPhgY
         pUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732548894; x=1733153694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEFJdZSwH2wd+21uchAY2/iTR59ZVMr1M18odRCoI1Q=;
        b=VkLWjSpHM0rinHwQy255dKcEg75xTIgq69Du91re0q6ou7mccZvwEz/i2dKkw9YVea
         UZO3wMW38RI+NTCceSq0g2VdIcHmrY0x9nIIR084riXr6tp5DAXLcbKAkKi3iU8jFRF9
         ObwqovkZnZBILIBFwAMrgiiIERsOFo1mnwh5zfon+V5RbMAXDahxM7N+R0i3mIFwO/2b
         vcyQCKLclzvpGzmQCOcMn8sqTJPuwisCfsFVlIeEwJu97BvAKf4k0NX3ncZe6Eh2TSjc
         k91wKZhlYpglC09dhmuVbUJKLPpABAmnFnRjuxVsB43H87OqSh0R0LQV9IwuwL1jyYng
         LJvg==
X-Forwarded-Encrypted: i=1; AJvYcCWWGWreSmkBMXKZhU8ljVzsSK+X6cHisDezYwwDUldvZsMLxsfBbNbctjjfdLDQJgfAUUYTY83bdwYfrQkz6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy87o0pCxLwDG5J8lCWtiRvW4jE7tWCBxU1gMwt3F2Jz0M1Fpb
	WAkOLfnsFETQe/3IkG6pouu9e37SWjrk2KnkIKkUfXURfzaRk5zPfQsNH9XRf3uRfCMtNUk99m3
	p7yFRsvuNpb5LT2HMqOvE1fdZSFW1PeVjwkws
X-Gm-Gg: ASbGncv0B6p0yb3iXQWErdu/iSuBXAMMEFZzXgetVl8E1mQ4NeVp7lOzZCIQ9mynbO8
	n5ddgNxJldvGdByNNwpughZfPXAhQXGYg
X-Google-Smtp-Source: AGHT+IE62Erf6kbiue7Q5RpwnMVj1FvBBMrksPcQ0CAHn5mGwDMlww3cSZdxQ5Drpgle+KMsT0aQiif1LekyY7uoXNo=
X-Received: by 2002:aa7:c504:0:b0:5d0:3dcc:16bb with SMTP id
 4fb4d7f45d1cf-5d03dcc1934mr98711a12.4.1732548893632; Mon, 25 Nov 2024
 07:34:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com> <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com>
In-Reply-To: <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 25 Nov 2024 17:34:17 +0200
Message-ID: <CABCJKudozEhZXLZVxVixsO5YuZg0nOEmgo3=vMyhcrEw+6Xo5w@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Neal Gompa <neal@gompa.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	"Darrick J. Wong" <djwong@kernel.org>, Donald Zickus <dzickus@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 4:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Nov 25, 2024 at 2:29=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote=
:
> >
> > As my Acked-by was removed, I'm sorry to say that there is no point
> > for me to provide feedback since it is unwanted.
> >
> > I hope it lands soon, but I also hope the people here who decided that
> > a person's efforts aren't worth recording because they don't
> > personally know them should reflect on this too. It's a good way to
> > keep people from coming into the community for the long term.
>
> Hopefully this reply helps -- apologies to anyone if I am overstepping.
>
> On one side, it is true that Acked-by is typically used by people that
> is responsible for the code one way or another, because the tag is
> meant for them to acknowledge they are OK with the change going in,
> and so I can see the argument that restricting it for that purpose
> only may help avoid confusion later on reading the log.
>
> On the other hand, someone being willing to put their name on a patch
> is very valuable, whoever they are, and whatever the tag name is.
> Moreover, it is also true that, Acked-by may be used here in a "as a
> key user downstream, this looks reasonable and satisfies our needs"
> sense.
>
> Finally, sometimes new tags are invented on the fly because there is
> no good fit, too.
>
> Either way, I don't think anyone wanted to disregard your efforts or
> to be rude to you in particular, but rather wanted to keep tags usage
> aligned to how they view them or how they use them in their subsystem.
> The Tested-by was still wanted, so I doubt their goal was to remove
> you from the log or to make you feel unwelcomed.

Thank you for putting this more eloquently than I could, Miguel. Neal,
I do appreciate your feedback, and I'm sorry if I didn't make it clear
enough in my previous emails. I would very much welcome your
Tested-by, or another suitable tag that's acceptable to both you and
Masahiro.

Sami
