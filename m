Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987611C8632
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 21:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677543; cv=none; b=WXexxsv+zTeNBZXRdspnpWuW2vy+f3NTjm1s0JSZvOViE8NzetEWfqFFIVRKRFqDSeH3nWl++xlneHi4B/KOQmYzgiHZsY3shfXvaNzMmKUlG6TTrRz1vTx14KZ495MfNGcCYfrs10SaJbZOW3hK8fBdYNiqSsmjfs+6fkI+HJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677543; c=relaxed/simple;
	bh=YupYUQilP0QxXHIjzGZlm4sAbHNJPvh2Hh0qSV+u4k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpPb2cNWnmJoj0ZIUbuoxnlwAsFIbobS1ES3A6gir5oYSctMwXbO6pZV8xy7z9UBhAYq+nNGeRP/oqwBu5HexYgI7DuXcsnEJaRohcZvUuGlQBco1HYFHtmqomg5nk8b/BM7/CpJZ4KDiyTLRhURfoAU7hzabroos/nZLWyDM4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ckv7/wFP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ckv7/wFP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so2038165e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 14:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749677540; x=1750282340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spsEjP8qEOdvTfxDRozqzSsaxiwtL4VXiPFQ4J66DNw=;
        b=Ckv7/wFPkcIrxv8mBbLcOgRuhgtPjPHl+LpCZUhGZI4/WQp1IawDQKv1WH9NBLgVqW
         jz08US0aqUnmPfNerUq8l2v+btxgghBP+oQZ8t1WOo7NlXI0R/CiJA13QRas/anoPGjz
         J763JruCxfE6mM4PSuAhDdQELSaIIhlDABXXqnFzV7HWIY6b+7oimqS6DXVFeqr6jvj5
         1ah7lvQOcyPHOr0bwKHpf1V7TGPzY6F+vWek7O8p1Ti8ekTLWMU041InOrh0G4p6WD4x
         CYVrD4TwtJIlHMYS4B+bfj6I+lC01Y12q9lVE9WczZaCTwpm6NnkFAla8VIJAdeXPIXQ
         wC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677540; x=1750282340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spsEjP8qEOdvTfxDRozqzSsaxiwtL4VXiPFQ4J66DNw=;
        b=tpY59czVu6UgmxLXPYIksrCNA4wMkUGDxwmck3ipQTjamfKAwEvGZ4uCI6VzuhWz5+
         anYBQTJKTEjRaURDZxsyI0fooEfHSkuqfa3tJZTKTyiA42ksNpPUyovSffc4+AEUy7Hv
         0NR77gcjr5o6Puru4YFf+FYXjy2RLNRKjc5tS69TmWST4V02ADgvl/d3uS+0B1tQXTTI
         71f15ptJBEUVHcNMwDUkIocML3argZTsaaeoMwAso4Rrapi4IICkDFs1bs3oDLGAfJSU
         B/BcKZOo2GLGOdq5LsWZbe8sast7+BFKX5Spv8YeAOKsio0fIA438a5GhWOwc8cLpG84
         zjPw==
X-Forwarded-Encrypted: i=1; AJvYcCV0FnobTe81a3pwFd714aElJ/0QHrHCaVIQ5jHkK4EIKD74+7Pm+oSTTZkswrb0MG9FaLchNm8Z/0QrmJpWBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVcMtVDp9+kHQ0b/WOAwCh0U5eEwfJ5bXwIqvbipXes9Z0GRwm
	1RpwzcIiQi0QSO1Up7jo8d8IpzKaMvlN5lnf9LBKfeKQmzfn/KzSZrlPlZuHLdn5lDIu42z8XWD
	fBSg/L2Hc7/fmU+NbEapOtqUPL4CCB+ddjxXXWmOn
X-Gm-Gg: ASbGncumuF67uOw+sn6OFfHRxa/cYRR27vLpUB5XUDgWdwuaOGMvh1hP/W0EGfSppxJ
	aicalhQBBr9f3pdsUnKJZzuq/UK65Kbika65avxvl216A17gOdOXshX2zvSJxALPhxdlZd2+YMf
	zroG27psYj9C6UwV2NrLAQYgaHfhxmNhDr6+n5SDzqilDP+E+32S55SpU=
X-Google-Smtp-Source: AGHT+IEVHVP3cU2A9uR1QbwmVLTk0uCabA4E3xKpPhc0gkg9XOaInY/OR3X/oP1yc4WJjUGEewZOobYz8P6AWX+7CP0=
X-Received: by 2002:a05:600c:1d0a:b0:450:d3b9:4b96 with SMTP id
 5b1f17b1804b1-4532b8c65e2mr13895795e9.13.1749677539877; Wed, 11 Jun 2025
 14:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611202952.1670168-1-andrewjballance@gmail.com> <20250611202952.1670168-2-andrewjballance@gmail.com>
In-Reply-To: <20250611202952.1670168-2-andrewjballance@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Jun 2025 23:32:06 +0200
X-Gm-Features: AX0GCFu3JIhASEbKWApyPZ901XhH3tEKz1_inQTURtY-R1efLtqeP2Vjn9Q4Cfo
Message-ID: <CAH5fLghOp4+P5SVMAoNbxwjf9HASRRU11SErJary7SZ0qrB-HA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] rust: static jump: add support for nested arguments
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: jbaron@akamai.com, jim.cromie@gmail.com, daniel.almeida@collabora.com, 
	acourbot@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, rostedt@goodmis.org, 
	viresh.kumar@linaro.org, lina+kernel@asahilina.net, tamird@gmail.com, 
	jubalh@iodoru.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:30=E2=80=AFPM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> allows for nested arguments to be used with the static_branch macro.
> e.g. `outer.inner.key` can now be accessed by the macro
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  rust/kernel/jump_label.rs | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
> index 4e974c768dbd..4ea3cbb340ff 100644
> --- a/rust/kernel/jump_label.rs
> +++ b/rust/kernel/jump_label.rs
> @@ -19,9 +19,9 @@
>  /// The macro must be used with a real static key defined by C.
>  #[macro_export]
>  macro_rules! static_branch_unlikely {
> -    ($key:path, $keytyp:ty, $field:ident) =3D> {{
> +    ($key:path, $keytyp:ty, $field:ident $(.$field_cont:ident)*) =3D> {{

I think this can be:
($key:path, $keytyp:ty, $($field:ident).+) =3D> {{

this means "one or more identifiers separated by dots.

>          let _key: *const $keytyp =3D ::core::ptr::addr_of!($key);
> -        let _key: *const $crate::bindings::static_key_false =3D ::core::=
ptr::addr_of!((*_key).$field);
> +        let _key: *const $crate::bindings::static_key_false =3D ::core::=
ptr::addr_of!((*_key).$field$(.$field_cont)*);
>          let _key: *const $crate::bindings::static_key =3D _key.cast();
>
>          #[cfg(not(CONFIG_JUMP_LABEL))]
> @@ -30,7 +30,7 @@ macro_rules! static_branch_unlikely {
>          }
>
>          #[cfg(CONFIG_JUMP_LABEL)]
> -        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field,=
 false }
> +        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field$=
(.$field_cont)*, false }
>      }};
>  }
>  pub use static_branch_unlikely;
> @@ -46,14 +46,14 @@ macro_rules! static_branch_unlikely {
>  #[doc(hidden)]
>  #[cfg(CONFIG_JUMP_LABEL)]
>  macro_rules! arch_static_branch {
> -    ($key:path, $keytyp:ty, $field:ident, $branch:expr) =3D> {'my_label:=
 {
> +    ($key:path, $keytyp:ty, $field:ident $(.$field_cont:ident)*, $branch=
:expr) =3D> {'my_label: {
>          $crate::asm!(
>              include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_ar=
ch_static_branch_asm.rs"));
>              l_yes =3D label {
>                  break 'my_label true;
>              },
>              symb =3D sym $key,
> -            off =3D const ::core::mem::offset_of!($keytyp, $field),
> +            off =3D const ::core::mem::offset_of!($keytyp, $field$(.$fie=
ld_cont)*),
>              branch =3D const $crate::jump_label::bool_to_int($branch),
>          );
>
> --
> 2.49.0
>
