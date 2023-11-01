Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8875D101EC
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n4wuCNA3"
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407B3F3
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 03:20:34 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-49d9ef118a5so2733616e0c.1
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Nov 2023 03:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698834033; x=1699438833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz6VSHMner62jDzigXvDmGikA8eTXSz2/q7goADHTxs=;
        b=n4wuCNA3a+iOpCV0KjLF6K24a4NscTfTlnZ4iGuEV8HiVLWk7xMuZD1wrr+Uh4WpKz
         JCEyaQ+7YxXQhOslBnf84hrYVTg7TsmEqNvCcFnAJpvNiAgwJ0jAjKaZwJwC18WruWvE
         5prI6t+Yr2YnAsFUjk90NN4WLG7fb9jB1d/6Vps8/3SF/qv3XGThYmr2GXDzNpyIWD0q
         lU83sZLYbbqnPwQl/r6vQQkceePSyJJ1Yyd8GeCb3R27AsAj0DkosyM7G1pCg3p3e0Og
         Msdttte5m+ReBW/AzcoNG/B2oH/953S4i4DTTe7wpE3MJuU4K/WBjsat9s3rngaweJOJ
         i3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698834033; x=1699438833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oz6VSHMner62jDzigXvDmGikA8eTXSz2/q7goADHTxs=;
        b=ftoxoeWGOHclDcu9OWptpNZLo2pRM1DGhlBvrdFF7+NMgcq451bldvUHjyIFaCU8fI
         mrhdEg+aBB1yF8oNoFcyGONF0xz1ZwhgrH7Cptirb0Ui5h3aJ6IN/la5dkkaUscrG3Hk
         VWo+G28h/B6zBi0ltpMZF9owth3Hh7bMQe//wWZa26fcB1uXaIhCK9FxYmSKiPsHcvYU
         +TW66dabO0SsuuYnyhiQ7bU1IIePcfmy6AGz/8NBqrclCASu2YY+XuubOhXaez/EFNm7
         j2mSL87Nb2SogvQpRC+IqMkkpGnIwHghWd2FXkkOEpq/+Wl/5Iob7z5WWatb6fKRL4qq
         VgBw==
X-Gm-Message-State: AOJu0Yz6ofN5Sfd276wF9mMBPCY6mAAFFFFiF9fSeJR29i7J78fhIZyQ
	Atjuk4BgIVRrXEdI99hG9rWxp1Exm4D8v+nyskY23g==
X-Google-Smtp-Source: AGHT+IHdsVmFFMJ9OQqgYB/RwOFuXkwU/9iXlbSEOFRRZoUtRdN6idmJL2hW80l6eDsFQldYkXn4iC8CPPcau9py4/0=
X-Received: by 2002:a67:c38f:0:b0:452:4e56:5e19 with SMTP id
 s15-20020a67c38f000000b004524e565e19mr9811075vsj.13.1698834033149; Wed, 01
 Nov 2023 03:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031201945.1412345-1-mmaurer@google.com>
In-Reply-To: <20231031201945.1412345-1-mmaurer@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Nov 2023 11:20:22 +0100
Message-ID: <CAH5fLggk=YEtB798S+vWHV8J6GZ39rXYcvVnm1apt_BOZvAooA@mail.gmail.com>
Subject: Re: [PATCH] rust: Ignore preserve-most functions
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 9:20=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Neither bindgen nor Rust know about the preserve-most calling
> convention, and Clang describes it as unstable. Since we aren't using
> functions with this calling convention from Rust, blocklist them.
>
> These functions are only added to the build when list hardening is
> enabled, which is likely why others didn't notice this yet.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
