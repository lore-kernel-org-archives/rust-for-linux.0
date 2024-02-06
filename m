Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF067E70
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 03:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707188707; cv=none; b=oDFYUn3I2Y9KUOql+lKr3Hwcbjyv0o77MSnimnrvYSjlgxwWl3kWVZeaj0M6n2bJUx2+Txj4S6m4KdddEikhk2I69wm1FLobFXsBiuV0LOnetSuYkjCbaHcCfbOn1M/Xh094vKCxcoFUL//TONJ27rGXH6A1DNC8pT16WuKImqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707188707; c=relaxed/simple;
	bh=HyRrmX8bhSNFlvuh2ssOWx1Ww9UPRMeRQF3Qp15vtq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BC2JvIXJdoTujyJ0GimcaiDQHa/8soyXYgnqisgKFXgyKK+GYmXUG1W5oYTueY9m6njeRLPv/oYpKwblj7lGtHYu9RhAUKJ0PAyDpXSXw3oSNyqUzy4mgiXGyFRIyGBgqBqbNsTnMnNWw4dmw6MqAKw5YINOZWQMPp62JfBE8+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=U+FfCzqO; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="U+FfCzqO"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so4328952276.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 19:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707188703; x=1707793503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0UfQpHEtXO/8VzhpaBnVDwPH0mrKoy/5y/LWxRdi0E=;
        b=U+FfCzqO/0WaB4SXxX5/yr/yviTTSOYos/ZP/LkbKGeJYo+7cxQfbyud86glEPoQQf
         +vMasZKTH5s77ikXoSsX5inDmgdtdLfVvx4XiO0ndyOnCmoV92oqUScnJZxKs+qNacVQ
         f+Srn3HOdHhOg3/Crvo5MmedfsERjFoS8/h8v9Ygo674H3NcSHWNTGa/Luup5CqLV6B1
         Zs7CssIRNyVjKjk5fjRj8Li7vdGKjnMFOAkUWDPP41MdpaHhZnrEt7Mz/Tz2W1Eka+K4
         /G/Zu5G3QinkO25AyEUlqo3ELy53IsAbtLk/tvAEZlSw+itGwD3O4gpxOUpf0uexqXJA
         CJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707188703; x=1707793503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0UfQpHEtXO/8VzhpaBnVDwPH0mrKoy/5y/LWxRdi0E=;
        b=tTTO3gp5jmlICZyA9vOg7H+yVQEVVDChthCRKwpJ1rOUNx/HRJg8LqoHhYyVTGVkn8
         H0JHBd8pghP74F2a9XE/ChfoPiiWDhMcDPTvtdGOj7SOi8XgUCT6zlpnUdhUyRncWlqt
         cIMwxcvIDPmjDpp/x7fBKFytktas6G88xbSL1LNDF0DsP/khe6IZkoVN1OEmQf9kxuz2
         kg01pGaL2QkHjfFaYcYAXUbglsgRCIpai7sOxH7XqapHbp48yyUbWdjTg3KQAcUf8+Bb
         cF70AbCEZSsNrtC3u28ApEP8nciQETBuYCal0XXE8NXi8japoDYvkLIJB/2ns/Q+mVL5
         DeYw==
X-Gm-Message-State: AOJu0Ywuywkvz2/oeKA2rvhfGxwBxJgN+NXFJpEFoQq4l/VDCW+gzlV6
	Vwcky2ww8jpcg87B17wJQRL6S2RfUaB3tQESOEf0lB52Krs1cbH5FY/bHuTVTZ6w0ljY7gYPjl4
	vzOuIz9O+fFfjgiC5cMQ6cgb4TF48sbSjXJGIkg==
X-Google-Smtp-Source: AGHT+IEJx+K53xO7GfUQBPXRZwMr6StUxyeVMXXiQhrhcF2qFKZZbyc5AdTajC0P8HZ+8NkgjBq9bmcptrYEpTKEFFA=
X-Received: by 2002:a05:6902:2485:b0:dc6:d541:74be with SMTP id
 ds5-20020a056902248500b00dc6d54174bemr451795ybb.64.1707188703522; Mon, 05 Feb
 2024 19:05:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202-alice-file-v4-0-fc9c2080663b@google.com> <20240202-alice-file-v4-5-fc9c2080663b@google.com>
In-Reply-To: <20240202-alice-file-v4-5-fc9c2080663b@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 5 Feb 2024 22:04:52 -0500
Message-ID: <CALNs47tX6BvGB9wVmo6Pxg9mU2FLYG51o4tT+LcTS7Kcfsd0Ow@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] rust: security: add abstraction for secctx
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Kees Cook <keescook@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 5:57=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Adds an abstraction for viewing the string representation of a security
> context.

Adds -> add

> This is needed by Rust Binder because it has feature where a process can

has feature -> has a feature

> view the string representation of the security context for incoming
> transactions. The process can use that to authenticate incoming
> transactions, and since the feature is provided by the kernel, the
> process can trust that the security context is legitimate.
>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> [...]
> diff --git a/rust/kernel/cred.rs b/rust/kernel/cred.rs
> index fabc50e48c9e..0640356a8c29 100644
> --- a/rust/kernel/cred.rs
> +++ b/rust/kernel/cred.rs
> @@ -48,6 +48,14 @@ pub unsafe fn from_ptr<'a>(ptr: *const bindings::cred)=
 -> &'a Credential {
>          unsafe { &*ptr.cast() }
>      }
>
> +    /// Get the id for this security context.
> +    pub fn get_secid(&self) -> u32 {

Since this is used in multiple places, would a typedef be useful?

    type SecurityId =3D u32;

> [...]

Reviewed-by: Trevor Gross <tmgross@umich.edu>
