Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D7A265CBE
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740420739; cv=none; b=Ava1f/2EL1TKb0VURMH6ScCBQVuwJxDbXcuJaSXj6De0aHPTaxkggpxP1lzbQ4mgb5kzEMBTJS48S/BWjYzQjDBNyYQYrSJuBk+NDv5mSPmWYtbhOoMWsWD+930oQMehCZu7bxa0WhvhWq2PzbFyD10rcqC1qxxo25LwOqP13q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740420739; c=relaxed/simple;
	bh=xvAR+mvpnEkw3V0bWLcJxiiVQwnNac2zGB3dNnVWVd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9DM8lBi2qiCWkFuujFg1BCtK7dGQPlCWrkNux+K/XXEgJ5XcDEjmRxqpJha/1zRkha3w/L3WezFNOWVM27kReQd+zBessRPomoUbQXxv7Ijmq85DwPU4JEIMBDxGgdkMZt+LnZvkWHhghzG9hOW5beIwvzoCySOpNHradRSH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gn/X48wr; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gn/X48wr"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f31f7732dso2922473f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 10:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740420736; x=1741025536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvAR+mvpnEkw3V0bWLcJxiiVQwnNac2zGB3dNnVWVd8=;
        b=Gn/X48wrexe6Aii9vE3OZHM1VFTzXIV1hRR5EI26zCanued5/bMR3ug5DT0mItJ06j
         iE/bnIRN0wy9zUmy3IUghXz78bhCp3ahzzT3RxRl/m6B4EV7ud9klxTWpEGEprXs41d+
         m68q3w2SkUKXq3vMicJA6aBPOHRSyys5+4f7ROuF8ivxZIYrM3yX3f4L6RtHNZJk1SdK
         j1gm1KEu9m3vZD6pjme9ngZQvhbmuWacQjXXtedjC62tO0GHiNqcvyXNjwJWHDjxWe1Q
         2hdgxrwHb97k6IjHJCCTqqZl5oEowu1HHQ5bT/vtKy1FEzD0K/3+e3AkdXXjEpqqh9AP
         AzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740420736; x=1741025536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvAR+mvpnEkw3V0bWLcJxiiVQwnNac2zGB3dNnVWVd8=;
        b=UCqobkoTrSuL8LLValDI9e3j/1EvigfgjALwyWZGjaKFaDQUQLatjiLxXrIrLt9vL4
         FRwL9ovjgn1zRmYH6j5LX/ssDBcSHnIsk+bf7irzmwG9GScS28CHN3ZwFWTZm0BUxwAZ
         LfWynoTSAk7PEdGKszb6y1FFa7xLsVj+Iot3NZdy7eZREqL0jv59ld8fdlcmyHdRP0FS
         9TRA/xq2J4urv7uP7JRp4sVYctlT7FkLT21kKaAS/zyl2sUq7GVVHkspqGnI1Jachb5g
         JS+dTBTTJ5D653EOIUfyUoSlV1bWkuwTWys35rGyOnGLZtdny7yyJBx6zFcJFb2j4VLk
         JtWQ==
X-Gm-Message-State: AOJu0YyeMU9mGQlOcdT+uyQlniGzkx43P3iwzbEx+Bx3ZPBauJUzFr+7
	lPiABlE9fM6faIgQ7fJKVQPP9pcWwFvxeFaJ9TSSpFTorrFgPGVpayF5NfLHL34Ias+T/fWQN7V
	2X250wb+3cAy92OKefz+BenJi6vmFt6bGcPEADWvFOt9T7EHMEQ==
X-Gm-Gg: ASbGncvrvwOV/tCO6IEZ7jgAvJUa69/jadA0grPNhT4HbKZkcUEC4YSrXcsIBtZBHfl
	h9kGPHWyoY58n6liqFX43PYy6dntjoRlKz0dX50wJv2HutdQkGq7GLe8t4HD4ksAOAw1ICrBJer
	HwMGCZXBW7
X-Google-Smtp-Source: AGHT+IFPMrPhjY/2dbKor0Wcfga1hfkHkJ8ba0hmBnI5YCSJx4/LsXQeF2I6GzVJfar6jBGIA0OBsizuejhRq8QbqZQ=
X-Received: by 2002:a5d:5985:0:b0:38d:c73d:e52c with SMTP id
 ffacd0b85a97d-38f6f3dc27cmr12092538f8f.14.1740420736050; Mon, 24 Feb 2025
 10:12:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224142326.38396-1-hamzamahfooz@linux.microsoft.com>
In-Reply-To: <20250224142326.38396-1-hamzamahfooz@linux.microsoft.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 24 Feb 2025 19:12:02 +0100
X-Gm-Features: AWEUYZlZXAqT7XF1ViotPOrIIHvgMB0pnr6HYaxTn8vUab2MyN-OHlP2BLxEzrg
Message-ID: <CAH5fLghR0BBFtV0eGHJsuX_uBFixQT59=eaPFHcCf=agJQSOfw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: define built-in bh queues
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: rust-for-linux@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Wedson Almeida Filho <walmeida@microsoft.com>, 
	Dirk Behme <dirk.behme@gmail.com>, Konstantin Andrikopoulos <kernel@mandragore.io>, 
	Danilo Krummrich <dakr@kernel.org>, Roland Xu <mu001999@outlook.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 3:23=E2=80=AFPM Hamza Mahfooz
<hamzamahfooz@linux.microsoft.com> wrote:
>
> Provide safe getters to the system bh work queues. They will be used
> to reimplement the Hyper-V VMBus in rust.
>
> Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
