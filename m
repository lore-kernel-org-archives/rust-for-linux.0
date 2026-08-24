Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC9923EAB3
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 01:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787534101; cv=pass; b=b5otv99zTTiAVM28Jz2DqlA/rT6EZMeeOchqVxUurwtjMOJkARgMToy9M+NnlE7C9QhzE47zc23J9u3jZi4hNLV5vrXe8Avy1Vy/0Iu5FClJurYFjOpvzrni2LQxoMys4BhnA6LwKmsflgtMW2cikW1U3ITNZguQhXmfby8RmTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787534101; c=relaxed/simple;
	bh=EFMqYNienst6Zt3Hwl5vzay/rXw+23moFADZxVJtEwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eaznk9gB/tG7iaRQ+EJhzsibenbk9km+wTq2nB3HLNpRN/Y5u9VDVFiJf2qds9PMUmSEId6GIm+kThEQkPSGLjCOx/rAaMtcnyCyqWdu6G7AXsUi8ubOqn8ztT02ECmVgIk+mP5bcWRSVfOW0YyvcAmRwyz2ed4WKjSrOOD+RLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eE5fJVpd; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eE5fJVpd"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so301476a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 18:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787534098; cv=none;
        d=google.com; s=arc-20260327;
        b=m/9S/hO7fQGtgu6AHOkYTghsN0i/i6AVoKre5pJCHiKh0Tr6Uu7Tqg1WPQWf0fz3yb
         M92v/DGeqCnvEBA1OSNJOYmE2RTITlVGXrlD+0ZwvnyjH1SOHqwN3vsVGf9eBlh7i4Me
         NbqmgRtCvTFVwjsJZDlwX76c5CV3myQ5biYnSzIQzn2D/ioLpZ1zQeoynd0HNw4ktDAF
         YtWH0jL1avnb+dSGvsoiAJd8J6gdiaDGyoozU05we+twmjjvqdmfXPmn3tY9Ez7QHZX3
         HaKHEuX9cJlGBpDLeGn3OkWBoBSkeOfzqJ1BI1PM3o7wReWm51DHOB1VuS+sXwqn+/tE
         eZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O4fZgybci2D+e8o1oc3AoV029q9BxrtCFu+neJFYznQ=;
        fh=Brc/vi8hZf/fj2gU0viL56oOHhZ5DDYzm68NqS3J1bk=;
        b=QcoRFt/oo/q8osRuYJujlw7eHLTwosjB3qhhVIUHJdXgppV3GjkVafkG5H/NQZqMoO
         e8vYHE1n288Baa1neaWrJHTvEmdvXxCk1gtEGQGKf+KYPlJZMlR8SkXBq+qjI4nLxpSp
         pFw+W9cQysp1Bq7aIfp3St0L4Y88CcmKcmM1lNl4osrXAV+C9NfGm+ymYlerv+Cgpy6v
         OA/n/EyRRdasLaMeLT4FxkDBnWxsqcjM2xD3oiMpxZao76Opf615yI5HPikQxuuBnxJD
         s9CkaovBIPvzVQI6TbIHGrw1UV1/usCbKUTch0OyiE4SZaIVmWm2VApsblh7z0vM2RJe
         Gorg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787534098; x=1788138898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O4fZgybci2D+e8o1oc3AoV029q9BxrtCFu+neJFYznQ=;
        b=eE5fJVpdpBszDc5uJ3PDyQ9D6rlt9JBJhOozAv6SttsabZrHgI9b2IT1pCfxCuNfK3
         sezXBkFeiaV7HiA6Z0ivdWUipnziRaVzb5fPyoOtA/f+q5qw/yHluXJVRTrF8xQXlajG
         0kIAblafiK29rhXXTKXRm7w4T6h1PM0Ql/yEkwh6Agkm5HiMWyZwG3uqE6bWo/yvXYN9
         u/sqMTSr8ED8CFkySzfzZTeQQNOwyjy/C8YPHcV4Uf4jdxDK+iagEfRvO7WxTBWRc9fO
         UBwldfPD/L7jgyGPjAJIcSb3TOTiVYtwlnlqjGpSeeEDFtCCfoYITqKlta48uly/tTRY
         jDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787534098; x=1788138898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4fZgybci2D+e8o1oc3AoV029q9BxrtCFu+neJFYznQ=;
        b=ERMaev0s3XxC1eLiv1uXMAX11bf8O9DT/nk7AIMyNJAOvH+FUT6GMNd5pHx8QMIODI
         i6vJDrE3/t91ezDiwgYRhgSJcdklh+bwCrm1pprGp9vwKweJpxCAcsmgNOSD9Amjb3Vc
         ANqal/+leR1D4irJTO2rDzZb+M8E2XJYOuA/tXU/HPs+CJGVeEnavnBN0HFUI6ZE5GIj
         jy2x+iENjf0NA/fFvvXRrzvu+jQX8QeZ1ka6P7uCOvXc0NFcElP4H5t5ZldKx4Rgu8MC
         g4U4HyP4Pk1K5icYgK9575fuxCtmsHLe0JRxdg4eutu24QVz/AdDg/aQ8gSqMPYxHT6d
         DUIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlcsrX+ingVE9VQzLRB0EHoNh22Tl/aInWodGPWQSd5vmLzzRTs0i5/VIcEo0qBev0DKzusYVpPvdtfH4M0g==@vger.kernel.org
X-Gm-Message-State: AFuF++lxbZgx3ImNIYOCw7iWmQsYT8lu2HsMTpLEGIwPL1UBlCxY6pVg
	YvfgGTECdnljiYzCQKyZm/k+z4NUN583Z1vPzSbpzhu6fwaFMcaMTe1YBaQAnwuXcMNJy/HvPvr
	m+jVlDLK3znUzUZxC/3QXhpSpCICTxec=
X-Gm-Gg: AR+sD13V04120NNMycRW30hNxFiZoJKFay6p4iRahKqpW8Y4+Ce7w+vgjEcPLdCZReT
	SIrr4zl+LqDVuhJFyjq59gC4a2XaZ4ZClG9L9DRBh5gtY6zNMJS4l5PmoRbX303keFA3LNBsUo7
	c1mGeD+8f1xWqJIEZjhDA2uGvRfmWq7MpMG3QykiZfctchTpq6BG6rQfvhY9bNZsDJqvU2BOU1s
	tK2042w+o3dZn5ht/AGgTPBkVCKT7okXZEt/5VNfIK9dqa7aM5EjK7tIsVex+UetTwIis1UZjTE
	Ml/vnJv9KUw6Qs3ItyBTvaKN2oAhwWPzeh6pECQ4BCkPq4rxeGTAs3lEiCMVXghPII59OlA0FDZ
	8FT5b7OjB5gLbayj0i5TOco8mbriVElxQOzm8w+z+iflInJksVO0fiOTyyfUz
X-Received: by 2002:a17:903:46ce:b0:2d3:71af:782a with SMTP id
 d9443c01a7336-2d64aa278f3mr194994615ad.0.1787534098002; Sun, 23 Aug 2026
 18:14:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809134858.1219036-1-tomo@flapping.org>
In-Reply-To: <20260809134858.1219036-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 03:14:45 +0200
X-Gm-Features: AcwNN1WA2KT1xTl2y2oKoLxQJqXMPAnjNVX7w0njs7htyItMoiyvHIPHCFAqP8E
Message-ID: <CANiq72kwncSLRAY09p3DL_f03Bcjpjf5e91v2d6QxmfEeY2ehg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: jump_label: skip arch-specific asm in `testlib` builds
To: FUJITA Tomonori <tomo@flapping.org>
Cc: aliceryhl@google.com, jbaron@akamai.com, jpoimboe@kernel.org, 
	ojeda@kernel.org, peterz@infradead.org, a.hindborg@kernel.org, 
	acourbot@nvidia.com, ardb@kernel.org, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	gary@garyguo.net, lossin@kernel.org, rostedt@goodmis.org, tamird@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 3:49=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Running `make rusttest` with `ARCH=3D` set to an architecture other than
> the host's fails, e.g. `ARCH=3Darm64` on an x86_64 host:
>
> error: alignment must be a power of 2
>   --> rust/kernel/jump_label.rs:51:13
>    |
> 51 |     include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_s=
tatic_branch_asm.rs"));
>    |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^
>    |
> note: instantiated into assembly here
>   --> <inline asm>:3:10
>    |
>  3 |     .align        3
>    |                   ^
>
> The reason is that `rusttest` builds the kernel crate as a host
> library: it passes the `CONFIG_*` cfgs of the configured architecture,
> but not `--target`, so code generation happens for the
> host. `arch_static_branch!` then selects the arch-specific inline asm
> arm based on CONFIG_*, and the host assembler rejects it.
>
> This does not happen with the current master because
> `arch_static_branch!` has no user inside the kernel crate itself yet,
> but fix it now to avoid surprises later.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-fixes` -- thanks!

    [ Reworded slightly to clarify it "may fail in the future". - Miguel ]

Cheers,
Miguel
