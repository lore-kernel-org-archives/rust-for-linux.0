Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="XjEXDiNy"
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EF0AD
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 14:52:46 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5e263e43ff2so6109527b3.0
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 14:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1702421565; x=1703026365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6L/MRN8cwEAtX7flqzbEmTnr/zJMHFok3539Ug/qj8=;
        b=XjEXDiNyFjsBQENijw9B4H/luPF/HdjnBvw9j+Mu4j8dxBZdaLd9eBHkw4V206Wyoj
         j3ksK8QQdCnKfsHNR+gzcKTebTN4V67rr6U8Z3f45a3ioBp5i+RQJINBNGvxPtKoy1NP
         pOImxD59QjKMHhEB2AI5pxKoUQMBk4+E+S1MS/B7WsPLcSMDsg1bpUlhO65IUQNbC7KS
         QcBWssNdwdn1CBBDALVx4OzW/LVK+EddwmIOno9lTRv/EPwjVy15cJPCHMJofGdqsciE
         DILNnGk3Rl3v2Uv7m5O9QpWPBfk/h5trF4gd1/+eH2lAw7mve1GmnnOPVyhNQrQQfSWy
         cccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702421565; x=1703026365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6L/MRN8cwEAtX7flqzbEmTnr/zJMHFok3539Ug/qj8=;
        b=k8uZZ3WMAn3pvrt8KkKtsHLXlTitsX6B9kPl9D3OkWcWhB8A92PXiwDp2x6/l4MHNs
         dDyKeUy/ErqzoxGpGksBC5Bb9g8OAuX0/OY4xcA50/qdJ7UhsRIrPUpfiYZp+6aZAXTU
         eX/6Lp5S70ADcNUuFo3k7Y5FwJTGQlmVSP/clwpXuVTyZ9lNwLVAu755qfO27naOMR1Z
         ynj5+P4fNOuXSUvI9AN5n9wWUoUjGt24FNQPrQSISzQlwSL1ukI3rtRmOa+3lqGp90uf
         M4I0oFM9ybNHU16c/iKCVPqAcENbpZhD9S5lmwOa52o20bppjjmUQ9O8elYoQlvF4Gwh
         jtdg==
X-Gm-Message-State: AOJu0YyWu8wl65v/ZkuPeOa2TYiolXoxk1nUTfKC0/t6iw5ho17A5zIq
	Cf5QZJLgrWWggXUFsz2TZFbEsH+i4xGHFgzqWg1P/Q==
X-Google-Smtp-Source: AGHT+IHjooYbbdCK2iitz2iP9C7o88THB/ZnIKcbRwMRfQcc3hNE8EPM793Rv1C382I5BK/F8DICFoArNyoTg4LYFHQ=
X-Received: by 2002:a0d:e2cc:0:b0:5d7:1940:53ed with SMTP id
 l195-20020a0de2cc000000b005d7194053edmr5381917ywe.101.1702421565254; Tue, 12
 Dec 2023 14:52:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231210234924.1453917-1-fujita.tomonori@gmail.com> <20231210234924.1453917-3-fujita.tomonori@gmail.com>
In-Reply-To: <20231210234924.1453917-3-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 12 Dec 2023 17:52:34 -0500
Message-ID: <CALNs47s_WvDBTax-6Pu699SCP1u4MxQDYh2o=mb7990OQjktDA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 2/4] rust: net::phy add module_phy_driver macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, wedsonaf@gmail.com, 
	aliceryhl@google.com, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 10, 2023 at 6:50=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:

> +/// kernel::module_phy_driver! {
> +///     drivers: [PhySample],
> +///     device_table: [
> +///         DeviceId::new_with_driver::<PhySample>()
> +///     ],
> +///     name: "rust_sample_phy",
> +///     author: "Rust for Linux Contributors",
> +///     description: "Rust sample PHYs driver",
> +///     license: "GPL",
> +/// }

I still feel that device_table should be an optional field since it is
only rarely different from `drivers`.

But this is not worth blocking on and I can send a follow up patch after me=
rge.

> [...]
> This macro creates an array of kernel's `struct phy_driver` and
> registers it. This also corresponds to the kernel's
> `MODULE_DEVICE_TABLE` macro, which embeds the information for module
> loading into the module binary file.
>
> A PHY driver should use this macro.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
