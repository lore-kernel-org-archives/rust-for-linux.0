Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D8420F2
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 06:26:30 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FD110E
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 23:26:30 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-530199bca8eso374339a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 23:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694672788; x=1695277588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOR8rbLo41OLz/VvTiYdmWMpE6D+3BTIwaoiC8ByNO0=;
        b=a8Z4Y3q5TkON2a+ooSDT59o0QcUZ3tKfBSClPPcsKEAJRYpiPoy65C415JRyy157Eh
         swVL/6LugZdiMZvu96zPUg1lkHnDANZavHx2V2fl61ruCrKIk8MXNlJIr4CTqI90nWu2
         kiny5yZVtgj97049CPMZazl0sZs3h1hLEbhPNQHTOfDSEJk8PCgpAAx2eW66Txc+h8lT
         2gGGDmX37dinaeTWnlrwj6K/XBwxX1iBJHTCp1jB4iaDg2qwQ9rdI1X590DAoA1qaHQM
         SIdU1e0a38WQrC4HuGoiqX8YgQPzqbIihaI1J57p6sOJlsKPV+HHSIGJqZx/EsYVQtKj
         vJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694672788; x=1695277588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOR8rbLo41OLz/VvTiYdmWMpE6D+3BTIwaoiC8ByNO0=;
        b=DHfvSYSv4VJ65Gm2syBgTjOKlYynrn67YaiIfvjbr+Ml43wqOpTq22zDxFcCpjNTIf
         hasDYBDL2rdxL8xFYE0nHNS5wBh9vImyilrXQRnYM9RCkhPjIFZd5FOCtDUMny66rA8x
         vdhFbFlZL/J+QuTWTO4KSkRBHEHcIz/tmmpJntnbbWk0KZymefE8W68tKLdEya7TpzUo
         sdCy4I5M1aBGEbteQLQCFR6E8yn7giZMO0262vS7B2cdnK6MnT5wRgLahD6JfAugz0bD
         /bJ90gtnnN54Fh71D11obLDIKWAf9XDXavOrc+ju9aQguWwFF1q1n09HV9Ssvb4uMlbQ
         VmDA==
X-Gm-Message-State: AOJu0YyGpLrd2TZ2+r5/QvuJN3cGhq8/D5rmIMDPZX5JQyKBxqO9fhr4
	Y+Pv2HYc5UP9qfjUDCe4l4lhnEKm1MlL7v7p0jD++rIQ9msb3JMGC9g=
X-Google-Smtp-Source: AGHT+IHRkCIGg/w859uKDoz68YoSTVvYlVTzVOySrqsnNmKj/GEgb4zXUoQP211tVXaUfsjh+0/RKHdV4opAI672GSc=
X-Received: by 2002:a17:907:7fab:b0:9ad:7cbc:ea5b with SMTP id
 qk43-20020a1709077fab00b009ad7cbcea5bmr1351027ejc.10.1694672788630; Wed, 13
 Sep 2023 23:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com> <20230913133609.1668758-3-fujita.tomonori@gmail.com>
In-Reply-To: <20230913133609.1668758-3-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 14 Sep 2023 02:26:16 -0400
Message-ID: <CALNs47s7wH8yFU-jbcQxVRiHta_pEdueSGo9mFOdYriT=o0SOQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/4] rust: phy: add module device table support
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 9:37=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This macro corresponds to the kernel's MODULE_DEVICE_TABLE macro,
> which embeds the information for module loading into the module binary
> file.
>
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/net/phy.rs | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 2c5ac5e3213a..ffe1a609a7b2 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -649,3 +649,39 @@ unsafe impl<const N: usize> Send for Registration<{ =
N }> {}
>
>  // SAFETY: `Registration` does not expose any of its state across thread=
s.
>  unsafe impl<const N: usize> Sync for Registration<{ N }> {}
> +
> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! replace_expr {
> +    ($_t:tt $sub:expr) =3D> {
> +        $sub
> +    };
> +}
> +
> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! count_drivers {
> +    ( $(($x:expr, $_y:expr)),* ) =3D> {
> +        0usize $(+ $crate::replace_expr!($x 1usize))*
> +    };
> +}
> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! mdio_device_id_table {
> +    ($(($x:expr, $y:expr)),*) =3D> {
> +        [$(kernel::bindings::mdio_device_id {phy_id: $x, phy_id_mask:$y}=
),*, kernel::bindings::mdio_device_id {phy_id:0, phy_id_mask:0}]

Some formatting like
    [
        $(kernel::bindings::mdio_device_id {
            phy_id: $x,
            phy_id_mask:$y
          }),*,
        kernel::bindings::mdio_device_id {
            phy_id: 0,
            phy_id_mask: 0
        }
    ]

I think `),*,` expands the same as `),*`

> +    }
> +}
> +/// Defines module device table.
> +///
> +/// This corresponds to the kernel's MODULE_DEVICE_TABLE macro, which em=
beds the information
> +/// for module loading into the module binary file.
> +#[macro_export]
> +macro_rules! phy_module_device_table {
> +    ($name:ident, [$($t:tt)*]) =3D> {
> +        #[no_mangle]
> +        static $name: [kernel::bindings::mdio_device_id; $crate::count_d=
rivers!($($t)*)+1] =3D $crate::mdio_device_id_table!($($t)*);
> +    }
> +}
> --
> 2.34.1

Is there a reason that the mdio_device_id_table is separate from
phy_module_device_table? You could use one match pattern

    ($name:ident, [ $( ($x:expr, $y:expr) ),*  $(,)?])

Also added the optional trailing comma matcher `$(,)?` there.

Actually, since there is only one public macro, all three hidden
macros could actually all be internal patterns within
phy_module_device_table. E.g. `(@replace_expr $_from:tt, $sub:expr)`,
just helps reduce what is in macro scope.

Could you also give the capture vars more descriptive names? This one
isn't all that bad but macros generally aren't the easiest thing to
understand by reading...
