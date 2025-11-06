Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1C340A63
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445264; cv=none; b=MNfl8Nj+Z2eQn8ppIzPcv4hgO0rOcmqeEv+qM7LTx9MfeVXyfaVCbSs0K8HztG6I4sgFCCixdHAL1p5ES81gtkAHV30z0ndXmgo1DLwDXbA6qme7gpCFUXjOKOy+mtjfBo3sOH89ZIWNz68B6hbFD0PZKP6LyOrNWGleTF2fuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445264; c=relaxed/simple;
	bh=Nzzlrmg2j3/3q8FevLWWH7MRQgKjJ5IbIXmjitSDalA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtQZSWh5awkGHVD8EcXil2fd0K19YZ0WgmAQYfvrvozl6jnbdqeKu4q6Httd87Guc3/n0zeQ39S++GkRcAfwauAkn6owEdVxZepwbkcWOsUsLRCnmvWIr3hb+6dGzYQ2eKI3ixR6VHUJpTH9yOv6uTHSLU7W3k5YodCOhFboLtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lm5rj7yE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lm5rj7yE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2959197b68eso198525ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762445263; x=1763050063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nzzlrmg2j3/3q8FevLWWH7MRQgKjJ5IbIXmjitSDalA=;
        b=Lm5rj7yE3O01d9k4/t1bzmLKw8mOYs5iZjzs0vfaECNSIK4otIlzS2ND+dNrNrjmrP
         S6poKgdBnHrUUWefN+E8Ue2yiBCGu//XAFDzxpCijY7nmg013eZcsbJ0RP4jfIi/gvqj
         jtQHRL5fM1Cw2nroi9ZHn0iAGM9+jZS8rjmPVzjWPmtFzmJT7LPdmAelgMu7ZhnwxFSY
         AJrdokhUmOZttjTCnpZwuEzlEKq6jwT3B+YxfOe6/mEYdd8/X0jkn4W7U9LF9XhxdcmG
         vDRKqU0JsFZXYVMX5IA5+uPl4gv/WnDDe5reLHsLuQcd0nuCfuB1dLCZqwdEpTz0gELm
         o0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445263; x=1763050063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nzzlrmg2j3/3q8FevLWWH7MRQgKjJ5IbIXmjitSDalA=;
        b=nO8f61EGtTsQcaohcJzgt6e9tzCLWybNcJ8WWCtBU4v/jxkn2N0MtrmdeO+qPBjZVF
         CccfsIQfZeJ+qIAQjyfsPSh8RKp9ppWYZUxohHFpMW3GVFweL/cs9cZ7HmhPIZ6lDdCs
         uSFqEI01ay9w9SxjPnV7UPE3i/wIYix+jbEob8FgHnbHCLP+IGlnFTbMNJsiXkSf/meH
         /JQPmZEHmBAueqelTLaqplBOrMDFJetKutXoKjt3uVwE+J4EtJFjNUoqXASB/Cz2vO7S
         1PHVNNtxl7gY2J2MLdDae8DNlRACBK6Wx7HIxZyehMgEgAiuDmGvE1U1psSYev02riUQ
         S0Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUf2QB1MdjUUY6PtUcCrU1IUbpPdMRufgy1Qy0EPW8/jBiLseRzxHW2k6mT9lVxxEF1+bTynycD0F735M4dEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpUEwhSHhvi0pK81pBSzZQEbRqTxmaqdc7nnu6xIBiwt27AhKk
	a9pbrD8gd+d8JWJkOcvQd+g3zrfqLo+bDdOKt0gz/m4DbcsdU+U2vE42ZevGeBx2+MtmxHMes7I
	eRwB6zblQCiwgKhBBSlEAWz+gaMbL2tIRE6bPnTgW
X-Gm-Gg: ASbGncupU2nLJgVKNELU6DMZNSAP3MLx3i1Y7Bxz2TVEJ9rGPSt8Aw4x4KHzY4yX1+P
	H+q4KXcbhiBnUXIusHxFtOGPIzB5A27QOb1nekJmvyKLt/4Gd+/sm6cUseyRnp9G9IMKI19SNdd
	KZFlVGZT+vxWMik6hxRPbz/Pc8+hIM22jC/27dE4EM2mMSFTuRYhagtcCQjFr/8SafJZFBx5RPg
	2Rc4h5KN85YtTrdTQ6BD4F7yB7jciSxtmqGN9D06ZGsoglsABnfrmWtVbzZFAkA5Y61
X-Google-Smtp-Source: AGHT+IGJrSQnF3wP8OZ9swEpkYM6kSGamHzGXGAVorA64fWZ3wYfYUNWQRnDULUAfLehZdmVqoWOJHEZGY0/oHgrTL8=
X-Received: by 2002:a17:902:e885:b0:290:d4dd:b042 with SMTP id
 d9443c01a7336-29655c7b81fmr6092435ad.16.1762445262132; Thu, 06 Nov 2025
 08:07:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
In-Reply-To: <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 6 Nov 2025 08:07:05 -0800
X-Gm-Features: AWmQ_bnwLdgdkHf9H1YieFCO4w6r6305meY5Ank0AAAGt5lDH9YzCvkKH09X7BQ
Message-ID: <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 5:57=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 6, 2025 at 2:08=E2=80=AFPM Haiyue Wang <haiyuewa@163.com> wro=
te:
> >
> > Strange thing is that ONLY 'rust/bindings.o'failed. And if I add
> > '$(obj)/bindings.o: private skip_gendwarfksyms =3D 1', rust build
> > will be successful.
>
> Thanks for the report!
>
> Would you mind copy-pasting/attaching the your kernel config file
> instead? i.e. the `.config` file (the `rustc` flags aren't the best to
> reproduce the issue).
>
> Cc'ing Sami as well.

I can reproduce the issue. With rustc 1.90, rust/bindings.o has
debugging information, but with 1.91, it no longer does:

$ dwarfdump rust/bindings.o
No DWARF information present in rust/bindings.o

Sami
