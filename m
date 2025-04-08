Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9780254B11
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Apr 2025 20:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142413; cv=none; b=mXn96QgPWL4FaljKx862Fys4Dt9LrK0Cu9wLtlY7pJS3DlwKNDnLQ3Bg7aYEkE0t6h3gJjLdCUBAI0zUFj6FJYIOm3TiKqxt3Ebx+LucERFSX10xGNGzLjBCeUcA3BMgZOBq8dhiwC4BHP1p0tcS70yPIAGllNUiK4ywuevOTu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142413; c=relaxed/simple;
	bh=vRwhzBJ6pHE7efbZatIOG3SRnPqYsJkHfOOGcv/eZCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6jDBKw8HYKxCIVRecsEUtdKtyDn7DDoevnYKr4+IrEndhZc7KKNS+zbH+XIx8S3s8s3Q5L1fNFFVyMQ2FPdylbjpt3VKLiBPn4/3yPctOgEr8OdK/W3NCgBE2bCT0OrtwaG6WtTOdHhBSjTvxH62TQJ8BAkvMDrEZvJofigdRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXhcBYiB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXhcBYiB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223fd44daf8so10604265ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Apr 2025 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142411; x=1744747211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRwhzBJ6pHE7efbZatIOG3SRnPqYsJkHfOOGcv/eZCo=;
        b=LXhcBYiBmZGzzjVc6fib+9scqZs8GOOkOvnjMas/Ec1yhmrh2sDU2PXb/Pr1Fc1GGF
         Azjn47Ei331Z7YRmd5vWB+StnlQroUV8XmaSRuNr5p7dPT15tf4toCFdVWk7v5KtZcUc
         Ze7BrRJD/bEm6y56DLxM0LBZzyCCzV56V3LSmvcJA4hZQJJ1Otg4XAVKMLxwjUfzoKNN
         yG86R0TtVlP6Rh50D6RBr1NbGFdoybkdmHrtaPELgjDsl3rIbz2vpK3KQLF/VSh15Say
         jZaLe59aMeW1jL6YfWKho6NncbCChQMyBLWjRokZcKTrVcSbwtdPUSPrpA1hyhbZD4zf
         9ghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142411; x=1744747211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRwhzBJ6pHE7efbZatIOG3SRnPqYsJkHfOOGcv/eZCo=;
        b=dayCHDXsijJu12M1RoGWyhDSZjDs7f11VEUbYix9aiE1Mzw5pG0pgvj/KvlAGoGhxx
         dHp8S7rE0RKFpG+JBMbBCPxgeeBRK1L6in/dtZss2h5ilCu5msZkIbmi9gpTaYNIos3V
         2jgdLv5eI1Sf0kOJTvlhxdSKAFlOHt4P6kwooJW4NDIVR4O2SnCRMW1WDpz3fxD3sHYp
         scE0vh40yzOlzh1el6VHcR5mfim1gzoFI6jmiOQYhIx5ewtIGWwpyOnRgcsfVaOPiM4+
         km3ccNGlJ1rR1xmmPW6sb6mtqsTk2B/68f/miCpwmIN3Zq2hjhuRsle6Eb1d3JudW1GN
         6iuA==
X-Forwarded-Encrypted: i=1; AJvYcCXrrzLbzZRib/H58G6/QC4xzVgRfkKvizHBu3TSrThYfpUO0azGDCgR7jEbnO2yVBOhJaJoUW6i87PUpUIBCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF6xaZFizHVfeobwXPlBpesZ7nMMhwvm2vb6kCHeHVF1SkLxNz
	PQEb//BkaWZHjdT73cv53qQ786BgIODdFY2hMc1zxv5YIimwvqo/Gk+PUefwwYEQuXZTUlqtzlJ
	SNugkMRohT7qe3kxCMsb3knRyIYXSEvSg
X-Gm-Gg: ASbGncsIoXX5c9VercurdvM8w+sLteoBcGqIRVQiBIb/KsX2llLMIFW29O+b5mhrC43
	WreAR2A2A5Sr7a3tav2GI5m8iQIlyqysdaxtB+terclsMielB9rdD6bWcJUi+E/UadvAJjZuhBe
	gldboP7Vm9DkuQJFvGnkQnv11+ww==
X-Google-Smtp-Source: AGHT+IE8wYwjVg2bYqMVbL7/alrBhvz6V4TIcd89pGS5sl/lyYJTnaw+77bpMQEjyrF8cDiPMwzmsSBf/ZEw7eT0T1Q=
X-Received: by 2002:a17:90b:4d04:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-306dba68a6cmr282648a91.0.1744142411148; Tue, 08 Apr 2025
 13:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407201755.649153-1-benno.lossin@proton.me>
In-Reply-To: <20250407201755.649153-1-benno.lossin@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Apr 2025 21:59:57 +0200
X-Gm-Features: ATxdqUG6EAiUZpBIcpwyuzsOz_ucqU7KgWL4jfU0UGZJmKoudiGk0mvIhA_7UA0
Message-ID: <CANiq72mQpU3f9vMsNqd8aqgxpUZT3GshHhtrCVL79oTM38tuaA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pin-init fixes
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 10:18=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Just two small patches fixing one issue that got overlooked, since it
> was fixed at the same time the series got merged. And the other fixes a
> markdown papercut that I found during review of the previous fix.

It looked good to me -- the Cc: stable may not be needed, since this
just arrived to -rc1 and there is nothing to backport it to, but I
assume it doesn't hurt.

The Fixes: tag can be a bit tricky sometimes, e.g. if one line applies
to one set of stable kernels, and another line to another set, then
the patch probably needs to be split. But they seemed fine in this
case.

Thanks!

Cheers,
Miguel
