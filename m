Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C246C2F7AA7
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265665; cv=none; b=BH02U2d1VytakxRxx3nG3rUeJP34ESgeOPF66bBMCALO2C7m5IaOUP3UjGFDaXcHOGTSGWKqaEsksvjdEfOEmEnPVvnDw/E5Hg7ZbMhxdnBI/5rSeujFvKV5YFwl8jtVA/EatGgKBpVEI/F8tW2Sds30/7H4G98Ie109vRXUkv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265665; c=relaxed/simple;
	bh=SGP8JF92L/6RhRBwWPU+X1229HHx3P2St1M5nRR/lJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaW6OGYMIRXhLaOnwdV68TvbcVkDishsowOgBGp2PKiHGheg7PN1GeDGrvPjXNZyLesYBLa1TW/mafYKQGCJCUHgFFJqeArzqg5la6CfQKuf70+4GI8NqlVUr4iLst6GF8LiDCYd5HxCX++EB0nZP0g4qv2lBnYsecsRMGYwgMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0EojjdD; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0EojjdD"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b67cd5d88ddso416536a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762265663; x=1762870463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGP8JF92L/6RhRBwWPU+X1229HHx3P2St1M5nRR/lJ0=;
        b=Y0EojjdDxEpPAAdeCQL79Dmy99njNLdmS79Goutog4QWcxc1f0DC8XpkjrwSgvYve5
         VCLKiZf7g9P2WjR1Zvz/Ki2KVk+BpDxwYx+CILMQ3G/QuDKU5dQ7/3vJO0zah14Mu6dt
         1eVj2U1X3/IxysiDba7anRaFuspZ5EK9D1E8SBmm2dTCWdKRLuB7TpcyZ7wp0hC2B2Dq
         B9J6qBG6zOT9nD4K7br0YD283D5nKtKvb/UvCnp3VWcYL1bLcyMNVBa/GLN4sRgNUP6w
         7psSqmv6E1fwzeItWE67DMAMgxttQJO/GAsTXtpwmDjCu47cgiYek3n5SRLVUWDxJ1Wi
         hMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762265663; x=1762870463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGP8JF92L/6RhRBwWPU+X1229HHx3P2St1M5nRR/lJ0=;
        b=i3gX+ZQ1Ez/dZ+y1m9Y/e43fRgchyOiMM0d5EKi435WbyesB3prSEvWhZUSoOEFbMc
         IJhnELDXyO0CtOKEWLIKCLg0Yrnk4sq7M1W0lM11gmUyGscJT4N4be5Jf7xmQC8dIurz
         zSsi6dkpUzYKXEfoTgRdcVVpCZ/ogUOkVu6JlGAkvJ2kiopld+Dpw5yVbZWMzNEdKDLz
         jGkM3jLoHx4Ab7R1nU8MZ+AhbuzC+4hO38lErajDYMAWA3J5RpuZp7VjjvFHg6Uoyhdh
         j62kE04AjhbQZgbjERc/kMwTQBtBJIorlkUEq983QOz/4/HiyoxdwmZEdG4W5YuTxFbq
         xvUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqFYjA+ZieMInik2yj10+xFQ3voe1UIc65RUh7U2x0KC6xLQc/LZ1JLtXefxEmzyp/7DcgIC4NESGlfitsTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZq+1s422L4HOZb5pX0k4Zr6ITn8zRyXvPrSc+SwFw2AaCNsN5
	OJ1G79FnaKBKVtvKKpCUlF06mOgO/MN/vbTbqKxbaQb8vVTuHWS9kAedDXjlm90mgvOtgabZlbm
	RdS3M6aGh1+UstiqxKlzjOdU2qM1QYU4=
X-Gm-Gg: ASbGncvJxyGYPKnvoRCwEExTJCF46xM4L10rSWGmQkOs8f2Dq+j95mOoOyb3wv9RT9t
	OC3dwfdqvMoGplnknEv1Or94SLwXIP8elbzyPDSYaWLw88XRHQw8xLpatVya1aHG5BTBkvy4s2t
	apt338fHwSdVnZWkM/thTQkA/3SZMVY6tfYpKCnQlEf1W4esOLGuAf5Fn9lUtrO1eBSiFrP7fa8
	fu2SBRKRPteGP0GQcnmkJwa/nhjtt4zJC3Sf3VQYgvdcy+Zl37ZzymhJ8n+xoC8iM4nkFfcugXu
	I6KokWB6tXwOPNN30RoZEa/KxWzygqNYanEp09dLBFiCVrX8NAY1ICeLbWyjioYcdJYnZopzNBA
	mbDYGm7fBDcZyvw==
X-Google-Smtp-Source: AGHT+IENtmho833wN6Y44k3ZoLlyo6il7Q9SnD9Us1MRf94Lyv+kyTvd1By7QWzNerf9flzY0EtIawjmGFkh/4m0d0Q=
X-Received: by 2002:a05:6a20:c89b:b0:342:41fd:38d5 with SMTP id
 adf61e73a8af0-348cdb00a48mr11418895637.7.1762265662997; Tue, 04 Nov 2025
 06:14:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <df3a68334760b2b254219a69426982bf858dee39.1762221537.git.chenmiao@openatom.club>
In-Reply-To: <df3a68334760b2b254219a69426982bf858dee39.1762221537.git.chenmiao@openatom.club>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 15:14:09 +0100
X-Gm-Features: AWmQ_blFZtrhuRadtbS8ZQwPdHW79l05pO_B3UA9ukD7F5PYPPp4Mnzv6n9S5i8
Message-ID: <CANiq72=WZJ5=UACpFLWCVJ7mcXbc93X9MyYAZP8-0F==2b0adw@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: Support more jump_label api
To: chenmiao <chenmiao@openatom.club>
Cc: ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"open list:RUST" <rust-for-linux@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi chenmiao,

A few procedural bits below for future versions/patches...

On Tue, Nov 4, 2025 at 3:04=E2=80=AFAM chenmiao <chenmiao@openatom.club> wr=
ote:
>
> If finding the offset from the primitive type is necessary for this
> implementation, I will abandon this change.

In general, this should not be part of the commit message, but go
below the `---` line.

And if the commit is not ready, typically it should be marked as RFC.

> Additionally, support for the `static_branch_enable/disable` APIs has bee=
n
> introduced.

Please split different changes in different patches if possible.

> Signed-off-by: chenmiao <chenmiao@openatom.club>

In another email you used Chen Miao in the From -- in general, please
note that the SoB is supposed to have the "full name" ("known
identity") as you would normally write it. I mention this since
sometimes people use the local part of the email address, i.e. `...@`,
but that is usually not the normal spelling of a full name. Of course,
please ignore this if it is correct already.

Thanks!

Cheers,
Miguel
