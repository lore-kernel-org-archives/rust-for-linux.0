Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD05B2CA4
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 03:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707189477; cv=none; b=JC415sCJG5l48gVIUgv1ir7veJlBBg6RBPcjCS3mITWF1uSXwYZCKbSjnYjZzIdNTUY0VNYXtSbc2G/N2fhu7MkWny8JkOinXXHgh8C1jMsEws700rpCfgCGqfqBwNZ9Nr/f+tDm5QAzs/i3Tf+xqpjbRE0FAe4TI/woG+4EYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707189477; c=relaxed/simple;
	bh=x5JZ+p+lze1QyHDF5s4HnuT3OaDRyZUv0ydK/wtEbjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYskq811B9sYednYHg16urf8yhdbsf8GFzmJU3+UD5jlXqrUe/8DVlK4y0sNzobwyXpHVYSRTjBBmu1atIuOPHrU0wEbgvVNwHAjtR1LhOhayMK2yjP4o3Jyx/OD3+Q1l07DnZFV5KLGd9i0U6hL2kFG0HE6Va5J/fNWbhMMdV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=U3a+c6Y+; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="U3a+c6Y+"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6d7e3b5bfso4602825276.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 19:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707189474; x=1707794274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tyo6VbbcwfYRk/DmQgGjJ4Q/+BYksnA0qY/gandvIU=;
        b=U3a+c6Y+eSo5wvY11k5qCtOKdmBGnHg4iFbgEp6DdEAO2o37arYA6q7j9IcHA0UBy5
         DYFot+AVrklAcm1zubW+Na7+IY7mTlX9bjpQrmUByZaCO5yK30Ctnf5MfNnCiFsJWozV
         5JSbvKYSetJiEtMd/vKOz+NqDm6y8hiZ+nCFdwiOOdTZwNZxjvHA0dXBDH6th7y+Wy0t
         5apzlJRXVz8wCtDLfOtBX3l6e0teRhJQMhWbjOzT1OV/bPAN7fXolpEACnQOAjVR4lQ3
         0rgk9yJvuYKoD/NO1kLr/w3hMmi3ZbVtGtuz2wOI/hbw1FKRTQvuxrsdATssuJa+6z6Q
         oCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707189474; x=1707794274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tyo6VbbcwfYRk/DmQgGjJ4Q/+BYksnA0qY/gandvIU=;
        b=L2l2scogdREnRjsgpCGLxvyK6Dj0y/CYcLnuLogQnVIXZFfPVgpdme3DDU1DAZyppL
         nMd606SdNJARr9Pu/LE50+7JqRtbqscVcQt6jqqkEf7+XNK6WD01K+RzhKgiTdtuA9MJ
         O6bKaUqwlCqRnnJUgoviYiXwNPm9rPfUs5Bt05ns0oia2UhZOgewVobIO6BKjZCeUDMr
         8wO74PtgH46YQREAjAfp2z4R07nhFXX3m8owmFKW4RESqbOPLi+/X+VtyVUU2JsQlE6f
         vqZ0ClP0O8oMmUaAaZUVTEFh/D7TtVxV5RFYy0IrQY46gw6H67ZaH6XoXQ6kMIDfU5qb
         bg8A==
X-Gm-Message-State: AOJu0YzKCeIahKtM51TtGw9AcJ/GvVetjkLpm31Ogl1HJ8TLthX6z+um
	m7nfDf3k5hQ6Yi/MCHlXBZ8ZZIxVVRZZ05eCYncmmGI3E5oB1xvXsEC/jNsqidG7w2yaeBDuGqs
	tfrkH7dBRVi2DLpNOJ1yiee4Tqsk3tofEfj4i9g==
X-Google-Smtp-Source: AGHT+IHPwXcvUC5QYPJpjif5mNJEUxQd3C2cisvjCo5e38R7J00aHnJlUfsaKa1OHF7h3pa79TB/MWYtgYe+HomB4KQ=
X-Received: by 2002:a25:bc85:0:b0:dc6:bb86:ea11 with SMTP id
 e5-20020a25bc85000000b00dc6bb86ea11mr414416ybk.19.1707189473782; Mon, 05 Feb
 2024 19:17:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
In-Reply-To: <20240206012535.480193-1-tahbertschinger@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 5 Feb 2024 22:17:42 -0500
Message-ID: <CALNs47t9jAqz0OLw1ie8U90pt6sLbjW0zxvP2gZ_BnQ0Evf=qg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in .init.text
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	rust-for-linux@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 8:26=E2=80=AFPM Thomas Bertschinger
<tahbertschinger@gmail.com> wrote:
>
> Currently Rust kernel modules have their init code placed in the `.text`
> section of the .ko file. I don't think this causes any real problems
> for Rust modules but it does present a challenge with implementing Rust
> functionality for existing C modules.
>
> If a Rust `init_module()` function (that lives in `.text`) calls a C
> function annotated with `__init`, then a warning is generated because
> the C function lives in `.init.text`.
>
> I ran into this while experimenting with converting the bcachefs kernel
> module from C to Rust. The module's `init()`, written in Rust, calls C
> functions like `bch2_vfs_init()` which are placed in `.init.text`.
>
> This patch places the macro-generated `init_module()` Rust function in
> the `.init.text` section. It also marks that function as unsafe--now it
> may not be called again after returning because it may be freed already.
>
> Note that this is not enough on its own to actually get all the module
> initialization code in that section. The module author must still add
> the `#[link_section =3D ".init.text"]` attribute to the Rust `init()` in
> the `impl kernel::Module` block in order to then call C `__init`
> functions. However, this patch enables module authors do so, when
> previously it would not be possible (without warnings).
>
> Signed-off-by: Thomas Bertschinger <tahbertschinger@gmail.com>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> ---
> V2: add "unsafe" to the init_module() function
>
>  rust/macros/module.rs | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index d62d8710d77a..e54293faf523 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -222,10 +222,14 @@ pub(crate) fn module(ts: TokenStream) -> TokenStrea=
m {
>              }};
>
>              // Loadable modules need to export the `{{init,cleanup}}_mod=
ule` identifiers.
> +            /// # Safety
> +            /// This function must only be called once, during module in=
itialization, because it
> +            /// may be freed after it returns.

Extremely minor nit, there's usually a line under section headings.
Miguel will probably add this when he picks it up.

>              #[cfg(MODULE)]
>              #[doc(hidden)]
>              #[no_mangle]
> -            pub extern \"C\" fn init_module() -> core::ffi::c_int {{
> +            #[link_section =3D \".init.text\"]
> +            pub unsafe extern \"C\" fn init_module() -> core::ffi::c_int=
 {{
>                  __init()
>              }}
>
> --
> 2.43.0
>
>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
