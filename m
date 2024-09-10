Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A5718F2D5
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Sep 2024 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725971142; cv=none; b=pVWmpOPY1aZfMMg5Gf8rVyhTFqO5Oh/TZe4pKU6bvthXfPlkENw86v8gNVIeW8xg8LmAuhgfaSLmCtUAw8GFDQgoc/qCpI8pMmbYUd37g+llJK0V6iHkfYpHv1H8IsaYDz/nsLTFc79xvJ3mQAjf/zkg7+MKYjk7ay40G69bi3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725971142; c=relaxed/simple;
	bh=23lw6QTHAeuSEH0lv039QLg2af/dNYhHa9NZAKrZRhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Imt1VsbMOamTh9O64KbiclbNM8MncI/+OadfKec0U1riyERsp9xE7saBau0uPwHZgGZv/oPEWmSAYa1yyICv04RvqN42C17z49k9BUbVGAexxrh1uBz91WPPyHuisKPtAgNnXBhB9kquEKCorkoktwyETExSz1qexs5X5sdsrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dS7ly2C6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dS7ly2C6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-717911ef035so4246032b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Sep 2024 05:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725971140; x=1726575940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23lw6QTHAeuSEH0lv039QLg2af/dNYhHa9NZAKrZRhQ=;
        b=dS7ly2C6mW18MR5WDRCx7yZhYZHTRQpb5ukBmzdGqmGg/GRPRPYmVtToRwFihTOmED
         uYgCSXcxn8Ui786eouO6Y0+k5aPODcOw4fbbNTa+pzvYYqcfawbvnx9S7aSde9L5ID9P
         MwREmd5z674KI6Dagj5R5I6REfn7/CoIGmLAhU8hj8xe7cZhD5DI3NVZd12LmJkXskaD
         cI+oUtAQMxVvzSzvu0Rk+Yap2/jcMhB+Qk7Qi5Da8Ef3vEa8tkvZry837SzTFPmg+ojZ
         bpMqa6CNE55sAalo6fgjtODfcYfDKlOQeOjQCX6Qfkae5UQ9TUz4sitfegq3aKFeZcte
         WGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971140; x=1726575940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23lw6QTHAeuSEH0lv039QLg2af/dNYhHa9NZAKrZRhQ=;
        b=dQy+VOXtVrooyzRxeVXy6RKV8FP4gVPD7k62c2UKLAO3d/5m0iKJiK1X2F1C7r7f/Y
         ezfJydHFZa2jlGtpLIMkGWgwmZBRPr71OhQ71Abw6OhSryh2/jXB9siIUkeNzJ0ftYA2
         g5bNxcKZ2gM6h/gCP4fn07B8B3Vm91Eqr5YUX93GdssR7B5D9IqdSfM5AURnWY/yJ/rn
         yIgZ8L6lZM3QGYGNWK9S5GlaVNUvF542unyHpCfMJm6nwmT7BawBWxRe3D+rcXR0Nj5S
         gdVlxA+0HnoUZ3NEB/KcmcbelIWa6yiy0u+HY13Z3F5jatvYtj+PpIra3dQCjYvxdKkG
         nVIg==
X-Forwarded-Encrypted: i=1; AJvYcCWuK5JvgvkBbgeiTQRh2dsUmVeDFOo3lDyqr7SmF5BxJEiBdZYUf9b7H2zO543661cnExxpaZdFbpm0RLH9kA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqHh5McJMq6ei+ucDpT8yAZRpJa+24HeYf1GfIfVTQuBiuOnzP
	fM61I5Gm7PFw9GUHToB810qba8gjLaolrFmUrsLjL9ByDnR3U62NkSUOuzHNVyaD9CWbIYsCFW2
	318/9pN2BnJG1nMXJ8A0rmgLLm1ME/W2i6fOsegIA93WmwpdQENKH
X-Google-Smtp-Source: AGHT+IEckPhplcOK29+1e83SplE/Ewu9iwiWEbZuc4gFX7LKUtgrRhin1IuO3tBqq9kPB5iAdlcQnaK9T7JP3IeQkrU=
X-Received: by 2002:a05:6a00:94a2:b0:714:1e36:3bcb with SMTP id
 d2e1a72fcca58-718d5e0f288mr13790061b3a.9.1725971140013; Tue, 10 Sep 2024
 05:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910120721.107877-1-gary@garyguo.net>
In-Reply-To: <20240910120721.107877-1-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Sep 2024 14:25:26 +0200
Message-ID: <CAH5fLgjwwnqO1p6GaUgKO+XaMiUtae_f_dO=ZX8CetUGxW0caw@mail.gmail.com>
Subject: Re: [PATCH] rust: enable arbitrary_self_types and remove `Receiver`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Danilo Krummrich <dakr@redhat.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Alex Mantel <alexmantel93@mailbox.org>, Adrian Taylor <ade@hohum.me.uk>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 2:09=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The `arbitrary_self_types` RFC [1] is accepted and the feature is being
> worked on [2]. As part of the RFC, a new `Receiver` trait is to be added,
> and it will be automatically implemented for all types that have `Deref`
> implementation. This is different from the existing `Receiver` trait
> that we use, which is a custom implementation that opts-in a type into
> being used as receiver.
>
> To prepare us for the change, remove the `Receiver` implementation and
> the associated feature. To still allow `Arc` and others to be used as
> method receivers, turn on `arbitrary_self_types` feature instead.
>
> Cc: Adrian Taylor <ade@hohum.me.uk>
> Link: https://github.com/rust-lang/rfcs/pull/3519 [1]
> Link: https://github.com/rust-lang/rust/issues/44874 [2]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Please update the commit message to explain the compatibility
situation with various rustc releases.

Alice
