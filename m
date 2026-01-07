Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0B530BF68
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767789993; cv=pass; b=gii3NIZZRvXvkmD5avX2nJvYuQ/VuBIOEcg2WFR4RdbQyiKiRP+X11n5jRgrAP/EUI01j9bYe8qIIQIS7sKplS+8M/yP15LdHF7tSGJ5GiS4s0xfFRSYxNTTlc6h3yzE40xvx8wh088OtScFd4kZDFJs8/XO+AF6u4d2mAfoGZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767789993; c=relaxed/simple;
	bh=diRXR2Re1+OHdUMzqSTY3/4W/RblejFu9jTBjKLGYAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAQ34ReZZnTNLdY0xFDPhS74rrMLYRYb1c3N3BM/t+CXyLGutX3fOqXleMcTCDKwKaiNuyM0Up6mq4sxIHdvB3vwHVm7sctnGJwfSI2tbGzUWduyI6NkBug2Oja0CCe+UPdbmGjqgZDwlIqeGT1On8JNCHgeaXx6zmWig53RPJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUg7YZRS; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUg7YZRS"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-11b7bd9e6e5so123269c88.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 04:46:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767789991; cv=none;
        d=google.com; s=arc-20240605;
        b=IFeMJyaU9NZfgKOKBFZ1u3BrjSfN2QqvkmVT5skQMcTSeKmtsgSeoppGmVdpgI7/Vl
         9MGJKYZqAox4YbQw/qTsB36fhPVSFoAy+t6uJqz3VoNgolcdaTj0SYJSAE+H1nM84QCr
         u5cF7B+WWpIDYy9Wa0AaU8uaTNC+qAb+KsL1e8+Dt6FHA1NIxyKRSFpiRrJ25x8+XwXH
         uJmwf3+Pk1npm0OpPwqjLZARI67IPNUTcJTYWYJWEJQSu5BTELpiPyyI3VzKtvCyWILP
         Tu7yEeYwAfl8/CkozArEvbNR/sbB5B4vrmhBWe7F//b2ERLb9isZmwh6Tmf154e5FVxp
         507w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=diRXR2Re1+OHdUMzqSTY3/4W/RblejFu9jTBjKLGYAo=;
        fh=6DVKRNOaRdyD2hQkd3lWUlEaX4pt4APnqTbEI5VUOhg=;
        b=YQJnxNQZtOdCtvMfLZT5UzI2tzH82amySLZbffWmz25Hs6l3gwbQ7ml+nyL/YI6sEC
         3gUa5SFLR89RdaYZY1/FbszSjE/iYtb+aEbzic8zZ7HGBMAWDRxKzrs1QahKrzggS94i
         yaniWIXHC72dKEJdmhJ8Rjd6/QN6818wh6clrbNOSiHcMAU7D6uZvDO3BxyREBobD1Na
         N+KvfM20pamEiXPrVTV/ANisgPdcSfd7lOn357ei5yTcYkDZOWYmanEvtDlAHEssATgR
         W9W9Bsq9EwiNVbo5O0RIM6XBcXba4tV4RmpyFetu5OmqKniqbFRa/jPRebyJm+JsyFlY
         VcGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767789991; x=1768394791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diRXR2Re1+OHdUMzqSTY3/4W/RblejFu9jTBjKLGYAo=;
        b=TUg7YZRSLBYwBtmyyyih02fLI1qyky3/MpMAu57IzXkhrhgAmGQXZesxA4OlU+TGJz
         Q33tvU0kF7I4Yv7vzrtBDtOKPGGandesFPRcn4KRIy39F/9SoQ75MJ410t+GG4BOOMIK
         7HFVoViM1u5DT878uY1FzLmDr77tsx52bqefT8y7LZT6vA1FEr3ykUvLlixNngF8PVq+
         PM4V9TIp2nYRr6ASLxFF3zOpr9ZamHlCQOJ7pzqIsgHNMQRlF7tFByzmmhSLRi3IQKU8
         U+A0weVqV1hYLHJ5vTEcdmufGqLkpHNWHGS+FnLriN5uMtYOLZtgAyjl2HBsuiBXhcxn
         Wefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767789991; x=1768394791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diRXR2Re1+OHdUMzqSTY3/4W/RblejFu9jTBjKLGYAo=;
        b=DUjX2M3Jvxbbs3Xr76Q8WnAHyGWQ1w1CtbQ/4uyjjbMgRAsFKA4Q9LWesEvrOS3GEM
         0CDQpgJigWPU7i5oCSubK7eMD+NsLlArEOnCD8cwLc3tV/uPxla7egjuFDh5ZusPFBN+
         r1FUFHm14uZYeIzDLv4CZtixceztYhtgmmA5biR8BzSdXUqCIOBW9SsjwSAuLE8gg1B/
         UVK/ZmSlT6ulGP9ZOouSoKTTxCU9+yocvuFAwQ0EnnkL0ygAW/1k6DmDZPrE2RmV+wy8
         bqdRsZuWsKCXt+tPHeV3nzqmRWtscO0n0s9fwLt1pzGP9EcYm1F7szVTmV3E03nfULRD
         eGmw==
X-Forwarded-Encrypted: i=1; AJvYcCXf00OI6Qp2gAV3NUyruWT2ZnZ0zTB/RSt4xU16yqej981QcFLJfnL2NQPCwLOkQGnbDTZ4nYYcgeqm3LGVVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/Dd66bxVZVJlAXF8eH9HPUaIdP4Z8Tp3Pdbg10mVCzJLqBdE
	11yUvst8eZt6u+b0fnlRI2OlQdv0rRRD5F/+CjEsTBuuj/3u2m9euaNWO7aCDN5tK9KYUnG8pU6
	Im8cYZOZ/SqoKsg3aiaAC+Qi2XKn0v38=
X-Gm-Gg: AY/fxX6KgotT99zDimDhEzxoJnSxU/Y6Ka1d2UqAbZFDqYLaISt50+kWxHk7Fif/H0J
	xcxfxK1Mev/48t14RjBqrWG5Cf3mTcG4wR4SYdf4fNW7gttO37CJ70ur3qbyov1+XwmGsMGYGTp
	7Lf5/msV/nUpG1PorZA3NHdh4ShYGgZyKhheR0m+YoBTdIyc9g2SLfmW6bIL/+RZoZX7d8QFjk/
	gegS38OZljTv0awpLou+a/VWBOvPHTIajvi1DW86ikZvC7C1azLPdmuLvI169S5/LrSF45K4PQx
	glRSwVoxDcnZbFxRMbNS5gZFvupmV51ZZbflO6y6LhxaATFrGrmXq5uGqAQjJ5ZcB7drIBPKt7D
	SmEZugwZWWXRb/z22WlB52wg=
X-Google-Smtp-Source: AGHT+IHBFO+bAPP6V9b03rrjN1+f1r7uZEP39oWoXoE9m/s7w6G4H7XkX2N2kHMKJjrXVBAD8G3GKTzc0IzPpMR3ns0=
X-Received: by 2002:a05:7300:ad08:b0:2ae:593b:2163 with SMTP id
 5a478bee46e88-2b17d2b80d2mr977198eec.4.1767789990606; Wed, 07 Jan 2026
 04:46:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com> <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
In-Reply-To: <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 13:46:18 +0100
X-Gm-Features: AQt7F2oY3rJVLUAzPCfQNldNx5mLoh9iddgjtwFpYIBSLt204r2ybXXsoi4kwrU
Message-ID: <CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
To: Joel Fernandes <joel@joelfernandes.org>
Cc: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, nouveau@lists.freedesktop.org, 
	Boqun Feng <boqun.feng@gmail.com>, Paul E McKenney <paulmck@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>, rostedt@google.com, 
	Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 11:56=E2=80=AFAM Joel Fernandes <joel@joelfernandes.=
org> wrote:
>
> It is more important that mailing list traffic does not have issues which=
 unfortunately us and other company domains have experienced. I have been u=
sing my domain for a long time without incident.

You could consider a kernel.org one too!

Cheers,
Miguel
