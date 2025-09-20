Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4E11E1DF0
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Sep 2025 19:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758396849; cv=none; b=V6CFkoUSX7TyPC3Y6Z7jL8PHtja93hnpuUETjfbaxi76FYn0U9DtZ39iAJm9LvpoT8617vxx+T2racUnS+U7XFP8dfjm8OOLu2qgB+WYRV63xBL+zQeg78J15Z5AHcZERwiGfwz4oKRw/R3JYkU+PXwtKXfZ4/63dU/ewkqnxYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758396849; c=relaxed/simple;
	bh=DoTNAuOzU3EjzBg6upNXUalp/TGhCZnHU6ZjgCgRCWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMwSYCtoCUBdx8u7bTct2v4/lukeDrYp7bg3x1Rv4/TOvtfIWVoalASswJbYJP8DMjCLSzewjKB7UdDszvDuKX+HTbYkR0jz2K1QLqhhCBIIwJWBx2iMVt2YJD4ziVwZR732P8MoUjinTLACbo60QlpkpEZqEVqGQj16Ho3V3a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThL1ZGvE; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThL1ZGvE"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-80e4cb9d7ceso420787485a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Sep 2025 12:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758396847; x=1759001647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6xkL+e5O5vlTy5zdD2Q5ov6tJYSg710f4pj8Zlx3T8=;
        b=ThL1ZGvE4lIse44xJWlbqnto3C7ta9GnK9e51vY+VDMRJJnNNbGm2jWsTRqN9MfaUl
         Herl4zlf8nNkXSPnXB6kwNE9oDfyTWSYvWU8e4b6LqRkPMQso4jvahCa2Kfs6zHntO4/
         fZWk9cyBUfaynYCaLavhOSesD9We4JAnqYFGOnj9BDaWhZJvkJMKhftmV9nB5r2rx1Qm
         Dckpw5ZJ9cHEMfsOVX7AdsrICJQdXhwZWR7mNBG1Zz4LJNej7riNgXv6l7KYcu4fyu22
         SzK4wgKiqqLhkxMMbWIbAzZLS6FFYLfwKM1YckLo/y8VtO+e700KJbWCrVUOGuEjf0L/
         fdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758396847; x=1759001647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6xkL+e5O5vlTy5zdD2Q5ov6tJYSg710f4pj8Zlx3T8=;
        b=Qhwsdg0dbwKZXXfFeQ60BsFJicxB2GbRiMrbYubRQPm+TogZT95GqSBik2fQGreXo3
         T3mi845pBi0v840Rq3q5SAh1FCu0hhZ4bqzRN3iSXwTV37g/Etr0ziKdqKzuEgDmz1al
         2vdDg9wa7zNvTlDtK0nMP07IIRr1OIln9fXfqPm6VuThkHQikMAn6NaKr0wmU6tRSJ9G
         wPhrdNhUxy522zUraEg78unazqX18nr5Wnpla11sBvsHAHwApIgUaBOX6nGzj+SLgtm2
         UWfVkJbd6e8FtxPniNwZ8TUo79l5/dOrqFnUz2c0AoLBk7b9aZQ1kEIQOESLB25KTWmY
         xnTA==
X-Forwarded-Encrypted: i=1; AJvYcCWtK8ElWZdDVqEwkOXxrAeeYiGVvlhXjEogjDg7nWOGTBkRcvdt1Fn7cZN/JZe3B/R0gBCkIEw8Fn2Z70Q+LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaohgdCDqiI+Mkc2fM7aR0tDnJnZH+IhAC77qzsY2TresmR4sW
	mxEsP7vjeKb3BWvoJKJkdNPiqqMUuEtieGpREEkKUvK8EHV4AW+xoLgz
X-Gm-Gg: ASbGncssbXFA4iY1TrrmLxwYykMMdzRD25CPXe/a9MyMoyDBQymYKlhSFU5kQtPsTWx
	Oy1BSW8D+UCag4sNTtdlC6QlvlGMm7f1jZ4h748p/QrnUghZrjp3RXqAetnTCwwrUEB+9k/ssjf
	964b3HbPgwTPd66tdrBIHFchH/pEqQUzbDeKLdbZ9YEWHGD88KbW/omLTC4ggcgbQiBLsN6el2c
	QYzpEryJHIgT3VvsZaJsxcxbQJP4Dy6lG2kgLrjfxy7/c/5I2oAG8kkh79GvfuzQEZ81S65ln88
	XmOSoM7CyfrskHeiEy/X5Tm+dMFM4Pu6vzILggPkJl2Ov+9cMgUH54eog3VGxTUVJ+z4wV+zFoJ
	sZJoh99QpXyRSbxh+rXnEbW/g3BYsr6Bfkgw/3LPUKU0/mCRB/f3GYHdOe/rJAcExfvylClvXGk
	t9yU4aLOdmUKv7jqRTi6VUrj4=
X-Google-Smtp-Source: AGHT+IEZ3ARjfpVbgZ/4uoIhuTXWTeNbTj8D7ABJ4oL8uHI3L/hqSdCbTWjJZYPEjVZyP1PBOfYVEw==
X-Received: by 2002:a05:620a:19a1:b0:829:217e:eab1 with SMTP id af79cd13be357-83bac4afcf3mr923599085a.80.1758396847085;
        Sat, 20 Sep 2025 12:34:07 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836278b77fasm553972285a.23.2025.09.20.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:34:06 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0CB2CF40067;
	Sat, 20 Sep 2025 15:34:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sat, 20 Sep 2025 15:34:06 -0400
X-ME-Sender: <xms:rQHPaKwCKt3N-GUnLOJz-noJBB3oX8m4GBwhQTxh7XYPhHjmMJ9dkA>
    <xme:rQHPaL0KjTucS_1d7sQvuZCDobgKL0fqEL1681k3aFWExKwZzOtMb6wYS6wuMubrp
    -VZLPnZaatViWzkgQ>
X-ME-Received: <xmr:rQHPaF7oQPOcWZcvoGgn2odVGXgNojqDtxEIdmX4NEsOyyvZm4i3m9YUWZOymIogoBEiFYJqvbkaJL-g9GhwOEsxK52MX4dy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehvdelgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepjhhovghlrghgnhgvlhhfsehnvhhiughirgdrtghomhdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeho
    jhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpth
    htoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggs
    ohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhooh
    hglhgvrdgtohhm
X-ME-Proxy: <xmx:rQHPaBailX2lvoKSZAppwPnGJJpmQdAkka0NnNE-V2ghEdFl_gvMdw>
    <xmx:rQHPaDTjmd654q-jkRoYqgGgTTSkNvxGIaxiMGWeqv2SS2MJq7CRcg>
    <xmx:rQHPaOLA_GbuxPT-FoB2peBSmutWuYcg-ohgaLXnnvLa-o8yU6uZxw>
    <xmx:rQHPaBVqQIs7I9T6iQsUxZFLiuTVnMLSILhk1XMeqbZeODQG-DpfzQ>
    <xmx:rgHPaCiHUGehw2u-RgrzT9mTKuk9PMnJFFNB1RIyy329up8zkiyEo60h>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Sep 2025 15:34:05 -0400 (EDT)
Date: Sat, 20 Sep 2025 12:34:04 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, acourbot@nvidia.com,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: print: Fix issue with rust_build_error
Message-ID: <aM8BrIT1clk_efE6@tardis.local>
References: <20250920161958.2079105-1-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920161958.2079105-1-joelagnelf@nvidia.com>

On Sat, Sep 20, 2025 at 12:19:58PM -0400, Joel Fernandes wrote:
> When printing just before calling io.write32(), modpost fails due to
> build_assert's missing rust_build_error symbol. The issue is that, the
> printk arguments are passed as reference in bindings code, thus Rust
> cannot trust its value and fails to optimize away the build_assert.
> 

I think "cannot trust" is a bit vague and misleading here, for this
kind of "workaround", we want the reason to be a bit clear. @Gary, could
you help explain it a bit more?

> The issue can be reproduced with the following simple snippet:
>   let offset = 0;
>   pr_err!("{}", offset);
>   io.write32(base, offset);
> 
> Fix it by just using a closure to call printk. Rust captures the
> arguments into the closure's arguments thus breaking the dependency.
> This can be fixed by simply creating a variable alias for each variable
> however the closure is a simple and concise fix.
> 

Similar here, "breaking the dependency" and "creating a variable alias"
can be described more accurately, e.g. the latter can be "creating a new
binding".

All in all, we need to establish a wide understanding of the issue and
agree on a reasonable fix. But anyway, thank Joel for doing this ;-)

Regards,
Boqun

> Another approach with using const-generics for the io.write32 API was
> investigated, but it cannot work with code that dynamically calculates
> the write offset.
> 
> Disassembly of users of pr_err!() with/without patch shows identical
> code generation, thus the fix has no difference in the final binary.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  rust/kernel/print.rs | 44 ++++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 2d743d78d220..5847942195a7 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -143,34 +143,38 @@ pub fn call_printk_cont(args: fmt::Arguments<'_>) {
>  #[expect(clippy::crate_in_macro_def)]
>  macro_rules! print_macro (
>      // The non-continuation cases (most of them, e.g. `INFO`).
> -    ($format_string:path, false, $($arg:tt)+) => (
> +    ($format_string:path, false, $($arg:tt)+) => ({
>          // To remain sound, `arg`s must be expanded outside the `unsafe` block.
>          // Typically one would use a `let` binding for that; however, `format_args!`
>          // takes borrows on the arguments, but does not extend the scope of temporaries.
>          // Therefore, a `match` expression is used to keep them around, since
>          // the scrutinee is kept until the end of the `match`.
> -        match $crate::prelude::fmt!($($arg)+) {
> -            // SAFETY: This hidden macro should only be called by the documented
> -            // printing macros which ensure the format string is one of the fixed
> -            // ones. All `__LOG_PREFIX`s are null-terminated as they are generated
> -            // by the `module!` proc macro or fixed values defined in a kernel
> -            // crate.
> -            args => unsafe {
> -                $crate::print::call_printk(
> -                    &$format_string,
> -                    crate::__LOG_PREFIX,
> -                    args,
> -                );
> +        (|| {
> +            match $crate::prelude::fmt!($($arg)+) {
> +                // SAFETY: This hidden macro should only be called by the documented
> +                // printing macros which ensure the format string is one of the fixed
> +                // ones. All `__LOG_PREFIX`s are null-terminated as they are generated
> +                // by the `module!` proc macro or fixed values defined in a kernel
> +                // crate.
> +                args => unsafe {
> +                    $crate::print::call_printk(
> +                        &$format_string,
> +                        crate::__LOG_PREFIX,
> +                        args,
> +                    );
> +                }
>              }
> -        }
> -    );
> +        })();
> +    });
>  
>      // The `CONT` case.
> -    ($format_string:path, true, $($arg:tt)+) => (
> -        $crate::print::call_printk_cont(
> -            $crate::prelude::fmt!($($arg)+),
> -        );
> -    );
> +    ($format_string:path, true, $($arg:tt)+) => ({
> +        (|| {
> +            $crate::print::call_printk_cont(
> +                $crate::prelude::fmt!($($arg)+),
> +            );
> +        })();
> +    });
>  );
>  
>  /// Stub for doctests
> -- 
> 2.34.1
> 
