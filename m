Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7EC171C9
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732369050; cv=none; b=LQYXPNw9idrA7pcEEsxVkeiK72Jb2EVxNPDqBKBcw8oEMIhLxnwRrSRVCbLJjctjh2vkKBnAlknUUxY4xDjKBaPgeq8XpPS3OFAr8fgOxzE7zSY8QNfoQBZaIYE9P/diIEh+yz57pbIiawC8NsdQsH/L4xTifJZRqw5qjjtZVSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732369050; c=relaxed/simple;
	bh=n4o3ET/5/v0XgXEhLTm9t6I21PimgpUc367DYz67UCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4X2FgtqQT1PSiw2Xsm9e0g7sfJUvEESvYb9mpN0ek95+drzHD42GGpR/7FJRj0u4rdp1H2/t70wBB5RYj7IJuNiZ8sZUE6OOdONAnl71Pbz/u0IxL4GUfDExF/pgAR1bZEJ7Uc0SKoi6F/6mdvx/uxoYaFtWdt3Oq5FCyem3z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ath179ID; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ath179ID"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ea456f1029so178238a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 05:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732369048; x=1732973848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4o3ET/5/v0XgXEhLTm9t6I21PimgpUc367DYz67UCw=;
        b=Ath179IDPKQ9Y6FKdnhxTnsWA03wjJ6AwvfaChAFGaSGQUmInjvcZRhTn9jSUNCNt1
         YQabqIzvTxn2mex3KnW0VYavlWi9NCTGVd9X7ztP8vGoJxo8MZkHDVq6SsrJhpzlxDqK
         1CSd8MuSE89swtkrR8KZINMLjCD9pVImL/6AUiN5KPvY3q0LVyko3QrZfYQZUwDbF5mf
         New91SsuMHTqWTMJhn5wZ9Uw1B9gL5EaY0pM/kfyUEeomWoXmQYsXLuCEhbLUw5f7S1R
         bryCTw1Ts8bXj/JUur4gC3Dz2h+bCYlKSbWlJ3vdFwb7bb2hjlN2pTrcL3kL1ANHDbat
         3H7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732369048; x=1732973848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4o3ET/5/v0XgXEhLTm9t6I21PimgpUc367DYz67UCw=;
        b=ObwsaBZQRQp0ha9c5nUke17VXfxJusyEWo5hQ6m0BA08EMesoEnLB18CZl1FlFDdlo
         t9j8MNYpIbihlOKsccGALgHBHig0i8iyjEfNlgxmyrCxkg1nI3Yvqf67P3eHCsH063CU
         Q2g3Wm8i0z1z4okl84j4quKNA/UMubxLCP5Ey1sV5C+h1apnlikz2ftcPDGY+KG9Bsuw
         +H9q4QbF8xE8oUJM5axUzKAfjfQ0JVVb9ucnDMOnr+yzrBpGwl5LumBoyZMytgMdGdyA
         b4bnVN1QSWBBub860GsimlYTIaV4dRsaHk4ktpDShtRFYFOVwMyvaqScK710r5Ou62XN
         38wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZuyXO9zXDyoAya66PWZn6WWFn24Bvrk8vdpvJTK2dcbi5gDoHOJf9KJSCvkA7Un0z1QgUL99jbT2TDtzWhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjgg7XLhxW2ZdWwyBIaYnrA4MipDlNnrn3r7rmVNLzECb+BHT
	4slISM/cDs0E+9WQ1ASzUiC0VALjs036gvGtrW9QdQt6iqE3ppFoHkDQfpJ/gAiGSK+JVLnmQno
	/SfP0IVLejMsM6SifN4gD6tYVIV0=
X-Gm-Gg: ASbGnct6oJ4vNp2GtcEcXqLe31OMIw/S4uAG+n9ZUmzLuZYsCFu3l3Jedw/MGiUPpA+
	CqgWffSrOMXQGa9SoApkH4q3aT63h7w==
X-Google-Smtp-Source: AGHT+IH7LvAB45/lx8tG6Zk7GfAg5fBCOZt8RbDCqz7oZe4nfDv7cDMBVFPsuiAVm7cEFmMp9sFcFogH3bpGYXKgrgE=
X-Received: by 2002:a17:90b:2250:b0:2ea:47f1:79d3 with SMTP id
 98e67ed59e1d1-2eb0e89c251mr3205216a91.6.1732369048066; Sat, 23 Nov 2024
 05:37:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123104857.49385-1-daniel@sedlak.dev>
In-Reply-To: <20241123104857.49385-1-daniel@sedlak.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Nov 2024 14:37:16 +0100
Message-ID: <CANiq72m94-w5Qx1PB+zDCVOZaFK52U85TCWkFDP8ka0kknMtig@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] make `from_errno` use `try_from_errno`
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 11:49=E2=80=AFAM Daniel Sedlak <daniel@sedlak.dev> =
wrote:
>
> Currently, there are three patches for this issue. There was a race condi=
tion between
> me [1] and Guilherme [2] because we both picked it up as a "good first is=
sue" without
> knowing that one of us had started working on it. We both agreed that one=
 of us would
> be the main author and the other one would be noted in "Codeveloped-by." =
However,
> Guilherme has kept radio silence since [3]. So, I am resubmitting the pat=
ch, which
> builds on top of [3].

Sounds good, thanks!

(By the way, if you have a single patch, you can avoid a cover letter
to simplify by writing this right below the first `---` line in the
patch.)

Cheers,
Miguel
