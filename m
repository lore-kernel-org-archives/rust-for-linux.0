Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35803E0C5A
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448713; cv=none; b=oSkv1ubuZoGPW3458NAZhg9MjHw4Q5zvzqVehY65gM6kIAhDgzzNq0nqQwTHALrWP24RtLdYj9WeO9SHf8MpLKcey/x4C1cix0i/wT6lWe3EMmdXVAMA5QArxzjcwCMSZ+2wW25eeKG0kfSY9d5iBrmBucuZh6zzFnO8U9cec0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448713; c=relaxed/simple;
	bh=KeIOzKBhU62G/u5cZ3gJ8+XPcO7J7CGnTPeue6bXdMQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:Cc:
	 References:In-Reply-To; b=tum6pcNLFRTAk/Qnlwlq8yHXdxLSeChueevT054Srs1SarT1Nqrqsj5PVhNCGS8UPA7gBwqJt0efiSLEfJHJvtY6aMmIWRtLE/cakqj2lVynMws7EIAhZ+x8MHcsxRa5HyLyRK8R2H8/M/9fooO9yOvJQpTDWFk8zg3sksoo2Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=Fcyma1Cr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="Fcyma1Cr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486b9675d36so54995105e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774448705; x=1775053505; darn=vger.kernel.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsxBp0FI4f/EC09mqgJEiJLgATjdt2ORoT6797B+Cpc=;
        b=Fcyma1CrkkUgSJh+Rt7Y/Y9GRRYq3jThgvTK/uyQOF9UAiqVknxKbd697JvKrOGWNi
         mbo/CA9ebzBoqkY3LWh1tgngvFOt98IeZQTImROP+9XRRyaUGjZ/Eli1E7MSNXXWJ2iv
         XUCkgNk3aKM4im1i2V/z0LOfkhcshP74YLvbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448705; x=1775053505;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xsxBp0FI4f/EC09mqgJEiJLgATjdt2ORoT6797B+Cpc=;
        b=V6M3umt1bO0NlpbI6liC//pWnfWTTHN4q+uwVzVjjHyhD7tjY00Bj41koXVDRLaxIS
         jHU3gM7G2M8J1XJoR9rsLhTBpIlDEyg5P6VAz/KUC2Iwe9UztcC63W85fprBOVFD8OK2
         h9kvzCRRuKJziwmpx+z+Lq+4nFr6GhXIEwR+4HIeQNDq219ejU3sW/+WP3t22Gkyjy1e
         R4EC2OuSQMY4v36VQtSY5KoP3+pHgmNiteeCJB4ANOxV6e+cuBV61qxp3FZdclSSn+ns
         9444aooWU9ixkmoUfNMwfGry8Pus0QfIicqb78Uwf7IeGS4KNmFqzcj8snNDVx/E5OkP
         Y8sA==
X-Forwarded-Encrypted: i=1; AJvYcCVXMpt1YC9lQru79MgcABGMcYDWM/bRgvIqFbaOVqbmfXyD6e/Kmqa7KFVhAGdKnmceNKMvDRlldF5Uku/n9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXydsvbCLRfXNcQSTribR1ZdAlfn2l27nyqBTgCc6bv+qzpJ9W
	9ymTBdFVbbcLjD8LWrH0ne9W1ozckLXjYDtOM/LQkGNVgCZggZhnROAcxmFk3AEHvwjqCVov2EQ
	6HreG
X-Gm-Gg: ATEYQzylBHU8N8TqA4QTgE6jsUGZ6eJS8fj3yoxFKiuigHAE8BSluqL/3CalJQTpiGT
	3YB/0ZENGa8m9XJffHzAOCpdknqi54JbnEz784fVmQyBK+izbBGfkBfqxpKj6lAoWKQY4EIUXzR
	IeHiRbA09vG3oNW51Y/vqx7xX1RpUsFZr0as1G2U8oLHUfUE+ZW6jUUhKnDCdrxv7h5NzOlAdX6
	2toWTyzRxlqv68Yomr4w0sMu4fOMoIXJKYZY93lB/A2cXkxv5t7PJNW6zSzDalEYL6+mlb4ELHJ
	gel4p9mxcyUFJbRfPCl4XYA9u1OMrZMr8F8/hlVuOBybWcvbJFnNR8wMnm4kS/EfKNbJ7OUQ1Ht
	Afpt/0tlFjmuPkL5/VKzzZwUdHd7ML/vV2qy/C/PKTuKPC8UA9chJgKxqaKd9M2c+zeQ2PT0NFY
	AtFW6anJ2zWpb25afeZ4R8rGmRnV5EZAFxoEecjxCIKb8HNOzkYnI3gP38wJb66OrjIJKatA9nJ
	tL+VVW71iy+Ebo=
X-Received: by 2002:a05:600c:8b0a:b0:487:1114:d431 with SMTP id 5b1f17b1804b1-48716039d36mr58720685e9.18.1774448705431;
        Wed, 25 Mar 2026 07:25:05 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48717337fa3sm33382655e9.9.2026.03.25.07.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 15:25:04 +0100
Message-Id: <DHBXKH7PG0NH.1KU2M9L2IMLJ5@smile.fr>
To: "Mohamad Alsadhan" <mo@sdhn.cc>, <nathan@kernel.org>, <nsc@kernel.org>,
 <ojeda@kernel.org>
Subject: Re: [PATCH v5] kbuild: host: use single executable for rustc -C
 linker
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <gary@garyguo.net>, <linux-kbuild@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260317112021.14353-1-mo@sdhn.cc>
 <20260321150034.9915-1-mo@sdhn.cc>
In-Reply-To: <20260321150034.9915-1-mo@sdhn.cc>

On Sat Mar 21, 2026 at 4:00 PM CET, Mohamad Alsadhan wrote:
> rustc's -C linker=3D option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> `-Clinker=3D$(HOSTCC)` results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:
>
>   error: multiple input filenames provided ...
>
> Generate a small wrapper script and pass it to -Clinker e.g.
>
>   ```
>   #!/bin/sh
>   ccache gcc "$@"
>   ```
>
> This fix should be general enough to address most if not all cases
> (incl. wrappers or subcommands) and avoids surprises of simpler fixes
> like just defaulting to gcc.
>
> This avoids passing the user command as an environment variable as
> that would be more challenging to trace and debug shell expansions.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1224
> Suggested-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>

Hello,

First, thank you for working on this. This is appreciated :-)

> ---
> v4 -> v5:
>   - Fix word splitting issues
>   - Remove unnecessary `exec sh -c` and simplify generated script
>
> v3 -> v4:
>   - Use filechk instead of if_changed macro to regenerate script
>   - Remove trailing space at EOL
>
> v2 -> v3:
>   - Scrap previous hacky approaches (e.g. using lastword) and go with
>     a proper fix which turned out not that complex to implement.
>     Apologies Gary, I should have listened to you earlier :/
>
> v1 -> v2:
>   - Rename HOSTRUSTC_LINKER to HOSTRUSTC_LD for consistency
>   - Introduce explicit HOSTRUSTC_LD override
>   - Warn when falling back due to multi-argument HOSTCC
>   - Error out if a user-specified HOSTRUSTC_LD is not an executable
>
> v1: https://lore.kernel.org/all/20260225102819.16553-1-mo@sdhn.cc/
> v2: https://lore.kernel.org/all/20260227132713.23106-1-mo@sdhn.cc/
> v3: https://lore.kernel.org/all/20260312002852.11292-1-mo@sdhn.cc/
> v4: https://lore.kernel.org/all/20260317112021.14353-1-mo@sdhn.cc/
> ---
>  scripts/Makefile.host | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index c1dedf646..2d2429ca0 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -87,11 +87,29 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
>                   $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
>                   $(HOSTCXXFLAGS_$(target-stem).o)
> =20
> +# rustc's `-Clinker=3D` expects a single executable path, not a command =
line.
> +# `HOSTCC` may be a multi-word command when wrapped (e.g. "ccache gcc"),=
 which
> +# would otherwise be split by the shell and mis-parsed by rustc.
> +# To work around this, we generate a wrapper script that forwards argume=
nts to
> +# `HOSTRUSTC_LD` so that such commands can be used safely.
> +#
> +# Set `HOSTRUSTC_LD` for a different rustc linker command than `HOSTCC`
> +HOSTRUSTC_LD ?=3D $(HOSTCC)
> +define filechk_rustc-wrapper
> +	printf "%s\n" \
> +		'#!/bin/sh' \
> +		'$(call escsq,$(HOSTRUSTC_LD)) "$$@"'
> +endef
> +
> +$(obj)/rustc-wrapper: FORCE
> +	$(call filechk,rustc-wrapper)
> +	$(Q)chmod +x $@
> +
>  # `--out-dir` is required to avoid temporaries being created by `rustc` =
in the
>  # current working directory, which may be not accessible in the out-of-t=
ree
>  # modules case.
>  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile) \
> -		 -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +		 -Clinker-flavor=3Dgcc -Clinker=3D$(obj)/rustc-wrapper \

Shouldn't this fix be also applied to rust/Makefile?
It also contains a "-Clinker=3D$(HOSTCC)" argument for rustc[0].

With something like the following (On a 6.18.19), it does compile:
diff --git a/rust/Makefile b/rust/Makefile
index d4618f646b05..516fc1ea872d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -422,7 +422,7 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORC=
E
 quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro =3D \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
-		-Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
+		-Clinker-flavor=3Dgcc -Clinker=3Dscripts/rustc-wrapper \
 		-Clink-args=3D'$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --extern proc_macro \
 		--crate-type proc-macro \

Note that I did not use the same patch: scripts/rustc-wrapper instead of
$(obj)/rustc-wrapper.
$(obj)/rustc-wrapper did not work (the wrapper was searched in rust/ and
not found) when I tried it.

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/rust/Makefile#n553

Regards,

>  		 -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
> @@ -153,7 +171,7 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
>  quiet_cmd_host-rust	=3D HOSTRUSTC $@
>        cmd_host-rust	=3D \
>  	$(HOSTRUSTC) $(hostrust_flags) --emit=3Dlink=3D$@ $<
> -$(host-rust): $(obj)/%: $(src)/%.rs FORCE
> +$(host-rust): $(obj)/%: $(src)/%.rs $(obj)/rustc-wrapper FORCE
>  	+$(call if_changed_dep,host-rust)
> =20
>  targets +=3D $(host-csingle) $(host-cmulti) $(host-cobjs) \


--=20
Yoann Congal
Smile ECS

