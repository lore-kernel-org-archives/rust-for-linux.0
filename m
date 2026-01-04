Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA55B27A907
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 22:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567336; cv=none; b=IpuQLAWG7ZH4PiLWVd4TakDLeS66l29pr6zLyop4q2OWrKTOrx1U9sG1jBjs2V238tqWgbeaN9bTU9rY0NRW5fkp9kgCCOpzfhDDXpz0SpqjeO05+a7agVrHWbTfO+Lu2saD5VgBCtKS6953NQd3gC+0PkrCpEBRzfxrhOh89gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567336; c=relaxed/simple;
	bh=XWFjo7yFk4Lhn1VE3N+woPHqW72tIjxUCMVJzSVlW48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPxigGcAs/BPqYCigLhgSKQGAw3HOAGgohlZx00or8cQaY43C/XghxpKcZqiz+YgumdFrzES+pufZWVH5v6R3G9Nchc7nZv04ZOrOKWhw2SOA8sOC23h4sqk5AmE/hcdcFK0wKatO9tRWqaQ9A7SOb0XZQseJAdDl/ynKyYhWFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlZhl5vT; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlZhl5vT"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a355c8b808so14050845ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 14:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567334; x=1768172134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSmrwsb6MLgfHQS/XsmrDw6d72K0+2su5HiSnOuRzE4=;
        b=MlZhl5vTi/ERVScNwG1dhCWkeShzGzda3u89AdHH7o8hnhTR12tL4kt6FOtt6o3q+/
         926Y68+fFiQymiKnw8aNggIAVMwpagbuY9lpt7EcdKAjHh/ED7szYxgoCZDvHtww9XbQ
         81k3Tm5MnFw0suISB7ZHPA46lOpPMwiYOc6qNplR9g0nmrTFvpxQEJoYeIPmOEqMPtWz
         tuFvG3Ojx6LRU0JJeb6ll6GwFDll7PgQQRx7JNRFco74DbM5CPwM3tDh5coZ/SShaUtD
         TFse7voJvkEkR9Yj0DtjKeOqg6Y+jCG1iNpIhPe/5QM60LEbVAxLIRjPM6t/SrU2e0Ha
         IXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567334; x=1768172134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GSmrwsb6MLgfHQS/XsmrDw6d72K0+2su5HiSnOuRzE4=;
        b=R0w5+Go7eXjT4mBoA7ygcGjDmsJVBiAKku8o+MuCuclySpwdhTpZpwJr5u1JOLUDdX
         I1SoxkSW0lKDOUBiGta99ysvx/M3GOQ1naqW//kB27sGbpYltH80ps/fdr+LCmRrp+xG
         ZIYWXougVdMfcnKMIJjZvc3P0CScgM8uluP19qbZWqQ8phdSrbvi+fEOpUP0jrkv/RQz
         wvxASzwODZgKljIw4wqGryCi1kP8MlJCYTZjHuOFsMtdJuj2P4+Tkd/1B9ZjzYUmBlz9
         BMTTgjdc0eVDwLCZl/e7fTD9DYpPjGJDZ6jerCeSV+p6T9FMirP3+ERHQcv41oJPWK0K
         dIag==
X-Forwarded-Encrypted: i=1; AJvYcCWxkgtCI2mdTpJlttQZyahV/zL5jtelTYlPW46Z6TK6EriqNQeSTS4/er3u78yplyfNPWg6OWFqAYmD7cT06g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRUtyqLm5JngrEVxp5fjHQKArHYwSytBNmqS9AFSoMoKssUVb3
	77O6HkQeExiy4YfMw77FM0FcGPDbh7rbvmg5OLGLUutokYl+OaLN53+BsDTayykdVNmWT853lsk
	l4i7OqWoLAr22sJFAWs/jAwnwTbddHi0=
X-Gm-Gg: AY/fxX48TQrwBJF827fvc1xjS2oDfbidtnhvVGEGKM4i5jQeCXSaF+ZcD4EsRzroHmF
	TY5DAjeG/0E1urX4cKtFa9jJRgcQTmOatBGpmK6DfHbuhvfceSebP7HOOrIRaZ/+XKVSwXztOUE
	mGofl0/+ArMRNZZXXRHeyowBssP5/9Cx2kRe162+/Q9rIau3N1wQrGTp2w9UN6nLUDRMJ5pETJr
	rbQKN+3Uf03T02BR2lhtHGVJY36XwXlcLc1HH5kYbJ5t7GAv/x4/FatxNn7szWIhloqm3gU4hpq
	CYQQM5+ZVl5yKYl4uzX7jVIYmzzwRHjkxJWO+E9U/6YZ5ILsRwO0o/5p2zlUoXG1Q8M8CafKFs1
	EKeyfWTyvUncB
X-Google-Smtp-Source: AGHT+IGS38TU7FQ5k6FY0EiYC51K1rR6oaRsIMdG2ATvQ0wOyR6UZrgYW8WHMNLMFlb7Q0Vr5OdMeOSKBC0mFnMGnq4=
X-Received: by 2002:a05:7301:7e01:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b05ec45da2mr13983256eec.7.1767567334084; Sun, 04 Jan 2026
 14:55:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>
In-Reply-To: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 23:55:21 +0100
X-Gm-Features: AQt7F2pLUhSHchgEY6jLzT6-nGaOY8Cl-CoLDhh-C698HMZlEjsIo9zP4A1q_UM
Message-ID: <CANiq72m4nM5htTOWmYbuPNpO4v5z3gFSTuHL9zBCGt=DRStsvg@mail.gmail.com>
Subject: Re: [PATCH] rust: fix formatting expressions
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 2:00=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Allow usage like `pr_info!("one + 1 =3D {}", one + 1)` to compile by
> ensuring that a reference is taken to the entire expression.
>
> Fixes: c5cf01ba8dfe ("rust: support formatting of foreign types")
> Reported-by: Janne Grunau <j@jannau.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/Custom.20formatting/near/566219493
> ---
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-fixes` -- thanks everyone!

    [ Added Signed-off-by back. Reworded title. - Miguel ]

Cheers,
Miguel
