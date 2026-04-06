Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE526145FE0
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 19:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502110; cv=pass; b=IH8VYDtQA1ovgiPbrsa/hFBD4c2MIp/+VmKZ7xta/q+JzTGg/aDMVRCGaQHgcIepkI2jsTB33W7YmLyN3zmtzDyVONdG3niiZPApWxCUvade6YwkdqMUoKs8z7smdEh4YwZpDF590g7bkxMW8tBXVfVAvdbGR2O7HRV2fggiu+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502110; c=relaxed/simple;
	bh=WRVPBP1r3UEupcj81ppPFlfizIU+h6eu8Pvb+T1BfIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsRG9egQvZ1SbIoIj8RUL1WB0yvy51LKnVf8YtIm/2wbdiUkynNlqiB2DA76b9hTe3NRhXm5eHrOyaJLDM+ysx9pdSXtHycAq4ob2ZffHO7Irj9qospbnDo4E28Or8S/NaI6ggKS5wvYakHZO7guQT21laDvenucHnpqPJI2mMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn7sFvfz; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn7sFvfz"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bd5658b901so258251eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 12:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775502108; cv=none;
        d=google.com; s=arc-20240605;
        b=Woj3r0vbQ11YsWuoRCOKaeDGpOXbY4SOhxO1m2xRE14WSQ0Pn6rCQRgcZX+/Ha54Fq
         Q1GSDrK5oAtZvsApM2220vO2orM7ErL4n8scoV6idKeq56ZIP7GwcPvRmRoeE1YbUKxj
         J5QI7HUBJ7vXMWz32qpvlK6N0kjYs+Kgn32qxcu31R2oXQvHpGj+kKDBSXt0dzePAWU9
         xx2sPp2obqGHnisEvH9BwhquZTKnOYB2rpkxvjpOxcIAkYxbITW60lX0rc8A4PElIRaA
         bIjrbUSmdD0OWx58wi+6zzjgQU0V0otgP7syKybG0/r+ZH5VurYE5cS8VhzDfn446ZNa
         xxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        fh=u9vrG2IvOd5ESpuptI9KBpkJwrXjOzD1zem4pDv6fko=;
        b=C82sb0On4E5wF1HPl5h36sJ9GKdfoE4RZqnA2WbUZ20OThkTfBdEzMDNynzSrD3ujq
         lKEWYo8l0A+FAaL60xi4FsTu4lDY6gnmiVGaIXfDJumjKKhdp8Iv0VhCZN1dVb/9PX68
         9JcbKwh5EzzuufqImh7sjp4w4HB2W2oS1fKD0vo/9KVvXQfiRsolPwi7DRZakqmdenFG
         lyEmGjCLmfrKvvIwKaiw9sVPXzdfDA7aDTurRWTg7Fbi/lEm2xLiiwOAhOX9AvjpazjQ
         gxQLobqGWoDt9CRfeCblhkPbhqRsQNC7bceJUQGC3/uG10GtnK/tfOaP7h/E1Nj8+bhn
         nBwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502108; x=1776106908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=Xn7sFvfzRt9G0FrCZPuRREVKeZOHqh/la5bppkaKs8mMh4RHCWrQNCcSCneN+bMK5W
         1Y/dTLBK8jVnry4fmyC6KTYSpgc/2nf0BaC/v1XafHg3IqhVICMt5dA6Bgy6J9hNN5el
         xKLZxlGoENIhb9GcLr1vkwEszZrHpge/OVzkiMhoB/2H24BFDaQ8OA/MooOP/S6tc0uA
         HwvkyesOG4D1To9WLTTQnWG+ixbv8ZGY9bYJU4sS3VHu24coyiphoELx1MtMKsppQzV5
         IDD9W7su2vaUf4wW4+NTW0vk42O5er7xMJR7a+4MWeoefRbQDYGiIN023PdpUsVkgia3
         LTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502108; x=1776106908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=W/U0Qf6CkIz3UyFoi+LpVqYXabx/QcsAIj5QhiYaBDQpCAWCF0GtVbZTgOlr6NjSey
         QihWjItrezVNk9xw8NLYoBISJwLALCkWL9paCGvVWXWRib51ptpKLt++HPIeHW5ckll8
         sXztm2dBYfKLeBoLXrLqqqcnDPq7KeGEuqxRm8iGKaxuKDHN1DD/+e0jm3vhprFL4Pjz
         5n2K7lcO2eNSkuGuN4bdUuz8sBo0FpBBIJoKoLoYuS9NJDsGX1qLCDdxAJIxgVwAImg0
         jDbdzgvrSRvOKdQtvVEABGqqYggObeQFTxghL2KmsS/w5sBFDckBwUC2l4VKEjpaWRGV
         OIrg==
X-Forwarded-Encrypted: i=1; AJvYcCVoU32B5QcQ/mqlMhbZkko1Zz8Wdk9ArHI88ALTsnWJ5g1IfuuHzqmZkZsswMfhmGj9Nh1xDmbc5wZ49kEFcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzeek6uOKFga14eoZ7S/j5mN3yOg9CnI8kFQOaQqT50wMjh6xwm
	1p59EwxIf3939GvTFYetRNv6HbAx59sv9f+zTVR9WkymzlZuSBH2s385LsfjpzY3ynMjkF/eWpX
	nej5ZQsgTODQzHdHrtmztKZsdahWB51s=
X-Gm-Gg: AeBDietleU73qB9NxbUnHReWoq8y6viWBanhQHIrWB53lRdzylvqC/kvxfl1HgPAYXe
	Dn3GeQ1FML3VvJV/ZXuTBIVIgJ5ST5UkHzZqduBooYETkiaFU+kt/JHS6UBXeVsElKTLLd2DCaG
	I+yj0qvotLtLFF7yD20bxwaE2Cie+ksqxyvpYxaMHlsVYAp0+K0BgDrfFo1U+wPmn0J2bCFbZ73
	ZsxRAkqATFW5GPjaskl8PI999LEvsi2dGhXz0SnXFrcThWXp0b4V6V6uYBH+VXlAg5k6ZPC5Gm4
	8Y8fptiCBPnuZrUbDYPLq0/C3oDStfGA5UyOoBz7bZdrgSEt8xkLf9RWsBexhXEMa431i+QQ601
	TaRXzKDiaQFUM9cKYPS4sxsw=
X-Received: by 2002:a05:693c:2b02:b0:2cb:6653:ea05 with SMTP id
 5a478bee46e88-2cbfcf5295fmr2949463eec.4.1775502107727; Mon, 06 Apr 2026
 12:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
In-Reply-To: <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 21:01:35 +0200
X-Gm-Features: AQROBzAfx15_qleB1FpEnqVT3LDjlhAucDNDkuNXvaEMC2J19jPyg217OqF9cWw
Message-ID: <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 8:51=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Looks good from the perspective of this patchset. I am seeing
> one remaining problem that we previously came up with a fix for,
> so I expect that that fix is staged in another branch. But in
> case it's not, here is the report:
>
> On today's rust-next, using rustc 1.85.0, at commit 232e79c72f57
> ("rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0"):
>
>   CLIPPY [M] drivers/gpu/drm/nova/nova.o
> warning: consider removing unnecessary double parentheses
>     --> rust/doctests_kernel_generated.rs:4240:14
>      |
> 4240 |     pr_info!("The policy details are: {:?}\n", (policy.cpu(), poli=
cy.cur()));
>      |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      |
>      =3D help: for further information visit https://rust-lang.github.io/=
rust-clippy/master/index.html#double_parens
>      =3D note: `-W clippy::double-parens` implied by `-W clippy::all`
>      =3D help: to override `-W clippy::all` add `#[allow(clippy::double_p=
arens)]`
>
> warning: 1 warning emitted

That is already fixed and in mainline: 487f9b3dc6e5 ("rust: cpufreq:
suppress clippy::double_parens in Policy doctest").

Cheers,
Miguel
