Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F09F3D648B
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172893; cv=pass; b=To+q4UG9j8Qg20cNnRNZEYpSyP9+Ms/KaaYvtrMd4/fNDKUBhawM4YV+mxXqSxS3lC18QrFdI3Mm0k92E1uLARe346HHBtd0KjU9CvxzCcg+i3NkkrNoXnYz+12pbKI3K1Ht7Gfi1+kPLFmRuelzcq/d9J9EkiIoDP9Yqi+fcnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172893; c=relaxed/simple;
	bh=eHz95h42IE6R5fUJyNeqX9dSZxQ/C8plsVpvlccr3Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UM9ypBd0+RdkrGGjQM2Xl1EinlNnxjfihlbWU8EBFGkJXadePlz9tFsI2nWTwmAs/A+x1LJQiIKO5Xctct2nWB/L+ifqpPqL87/4FtiA1wImiTcMXgAcUfYOAD9JV9grATLD2ekmJyVAzq3aKm1O1jyPl3rVieDlzFKl6raJd+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4e/6xmN; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4e/6xmN"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a137632c34so153763e87.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 13:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773172890; cv=none;
        d=google.com; s=arc-20240605;
        b=PJyTpHJcxnQa+ljf85QRAhiQ1TGO/PA3LIgbaHgD+JJIhYc/0jxKznpZQhMImiuuvF
         T9J0W1nyjQNSkjnt7iZoVU3aILIEYXDZF6hdzcbfDU8GCepRLFjpkBMX4hhpsXnSs7+l
         WZ1WneYVMhBCDKWnndwoaGCWZpnxEpnVWIxpHNIY9rTDJBub2qj8ckqLMJboY6B4dw8B
         RbfWu2vIsIbxEhG3PYNPQpqltgE8uP+qoemNfZww3mt2Kta3ZKWDM6yDGZOYbAa350jj
         CiZJ8Sn7MwCzdDR+fkRFuTjHtc3DbhKqQ/oiUcJFy/TC3jN8LB+5DPrg20PlYJwLR3Ug
         lbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eHz95h42IE6R5fUJyNeqX9dSZxQ/C8plsVpvlccr3Cw=;
        fh=6LplHxayYsfmONRbtxPA+mqcRQ8Y2iMY6mLX05I9rLs=;
        b=LetLTEfchLK36sMkL0Zu++7CewDAYDJ4IVgogZ51VVlO/W2Fks5EyCXyJkKomwewxi
         goBcZRXQ7906rULQTsj3JtOJ6ZeIfAtVuAxnXQ69OM+rvzA7yVajzAXPeLauGsiWkZIs
         uwYRIiQ7DqrD28vMlotfZqMdl7NX2zSQallMHpqIarW3mFoskPi1ZdlgLsyMd+K7tYvw
         MfuFS8Uk9wNNMekF5ybx7dmWvU9ZZEk4sKjdjyC/VJsHtSceTgKRueTr6orMSfTVtF3i
         jOYErEu16zh1Olpq1egK8SntcJ9daLF+ompKC9R9sdyWs8n/1i0CojGg2+Az0EApoEre
         aFag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773172890; x=1773777690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHz95h42IE6R5fUJyNeqX9dSZxQ/C8plsVpvlccr3Cw=;
        b=g4e/6xmN/srUqgt9azj3g0/8nBfaqwKTg2XizvcDyBb29I50nVccYTFlBT911P6uPu
         IxVm9lcz2B7VRWkLqIVeZoEDPvQSl6YAFVe5X/+W4pTuAs8ow/6BbtSYjzlkCV8vREvG
         +AY+++KcvsaFyA2WECdEQegO+eKLOduai8GBdeS9LEcIjJbuBLR95HPcDkrDD51UZj5H
         UO1GrkM7Z3O+zxwFTnP1AIvzX0BGnigavk56a6kLOa80JTuYbl9wztIyQVsb+4msiOku
         NaigIfmi7/SosN/Ou9cv8XjIcrBMCX4GjcmSVnEnF7yURuMJ44VkytZqFj7CNXWeSKPq
         jVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773172890; x=1773777690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHz95h42IE6R5fUJyNeqX9dSZxQ/C8plsVpvlccr3Cw=;
        b=cKNofgez3yyWlM0zrx08m8YvcQngNSarIM5iREkVBzoH5t47DeaD61OOpHoMIR9UiT
         IdO+g2B1OQU+52nJ1TFu3KMAEHcIQrPMcZszqeDBxbyhRwfEsZ26rU8cbnwlP6zyuppI
         XlEA9Yzx+gBvWcqV21VlhDrO9oezfwTNJXRmFHr4GByN47/7PQAZggOQaWf4rwcwNVw9
         OhEEM7gJjSMwUwHWWzh2NckoVp47mroiPwFHLN2dfFAc+wHu6wKRq9Liovth0u0up8k3
         3XXB90NEKWwVWkbAQacscwuGlgkq7oMZK/0FgeZbHVj44SKV5OiEHtjxzfl6jbOvTGLN
         L4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmMZt3FoeEnMZ1DUQ1WkhOcEM6BNcGYiLixFExedTqwnHsqSogni62FPbSLBXyEMauzBwVkfm/bS3kD0ywCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSJCE/7d1kgmoJuz6Ghdx6cnRMSyIYKs97e3qn/ihzJfC5RyaO
	L2hM5lJ2XdxNGrEoF3yCxFw7uqjZ5A3OR89uCGp0Yg95kn4tJPZ5GuGzWtJYk/7qkU5iix/JjQg
	fxA5p00OQyrNzsnFRkQvE23Q+WhO/rhU=
X-Gm-Gg: ATEYQzz+DjCcK35alRfBYcwgXlKLFZxsxVXaDbbwbcAjYVVTiPFRHanM+qI6IyrhjpY
	QAT/ScvjX/Be+hGmSQF2Z25wigr7RlbyaRFUPyTuOwxWpJz3UGxmoo24A7ySx+QlbXcEz7DE3up
	LYx5viZqbnnUjQ9tWxtLrMvyWaPLMqj9V/SNF9jJskgTZX53MJxAYrSwTgSOdF8Tiuq5nFNwKzJ
	XZsNEsLc/fndG0E87VaKQXTzdSqjYc4iSmA3QlhAKczGh/IM2WZ6nMYHy+Kmhdwg/D/zEd7F42e
	eK0NjeUWuwyghqzWHfVbJQ1K+Dl3j71K4xqOGxfgOVnbLosdwjTErEuY2rZy6Hd+D1wTWhREFwM
	bpMncCinz725M1M8S4VDOadE=
X-Received: by 2002:a05:6512:3348:b0:5a1:2c66:90b0 with SMTP id
 2adb3069b0e04-5a13ccdf439mr2810723e87.4.1773172890267; Tue, 10 Mar 2026
 13:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
 <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com> <abAzTFLYsUxK7VJ6@google.com>
 <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
 <CANiq72nM6ECBE+iiKrBRzCwOyd7BtQ4w6o9AH4+o5rcrcY30kQ@mail.gmail.com>
 <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com> <CANiq72=MfwGU7wpeUdYWhhOd962X8-KU9NyWDFY=wEo2_iPdqA@mail.gmail.com>
In-Reply-To: <CANiq72=MfwGU7wpeUdYWhhOd962X8-KU9NyWDFY=wEo2_iPdqA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 21:01:15 +0100
X-Gm-Features: AaiRm52enOAiph-APdQdO2FqtZPhgzhIRj82JOwPvDRIRrYBtmCu6dqmt61J--w
Message-ID: <CANiq72m=2qC=DQ4HtiGT_kt0q28NxCVzHCERrjDGH9cw6j5+0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 8:58=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> and so that you are happy with it one
> way or the other.

By this I mean that either way I would wait for you to be OK with the
change (e.g. with an Acked-by if we put it after merging your branch).

Cheers,
Miguel
