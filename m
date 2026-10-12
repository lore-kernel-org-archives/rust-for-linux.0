Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFA02F8E98
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 05:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781812; cv=pass; b=jykpLhVIYJkdKufk1n2wo0zQv/YD3Rwh5/ut4I9/2aqYuNYYDttG7kBPozba7zLPOkyU6bz1BU8CSiAvHnB0QtbnqBzp0XKQ6MEVZ/iSGe8UcFtGee/HJDxuyK1KS0+d5VPVdHjQZsEDPo76b2qtZlYEVxSurX2vYI1Z1l/rd7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781812; c=relaxed/simple;
	bh=HHt7nUAfsHxh2tpNWm08+AyK6RmNnRo/vegQxbEoP7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSCy018PXRH1Tyd9PRuQUZ9y+WaATdBiUifJxatShTrY3kKydiyaCkxoljbUjSsq7qwhh8ssYIOr/DVyRogq91GI3lWzC1biAbrh1KmSl9mAkjWuJVQCxAmV4wC6u/W9PzR3RSKE3u0yd/XocP3zHH598ej5gvlnHR65dOozXSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzKcbYPE; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzKcbYPE"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35159e0092aso164575eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 22:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791781810; cv=none;
        d=google.com; s=arc-20260327;
        b=OaDuOuUffomfsN6zqGJHtMZjh0yle0Czkg6HeabaMvZc7QrxFPtPSTcnD8vQpydswo
         sgFZVmDyBxByU43bwWIWivTU/FrUybswxSBTBgiJr3p2dl3iGyxUiJpYZjevtezSKbfr
         PYXZ2gm1KPUQ9GiYDzZ3gDYOR2mEypXKjRJzcHVPBLhYPFTwTUHJmSYQDaygoWvCWaJn
         2aZpy8E1jFOo8oUzWkG+EW8vQL9ZTVCZEwXEMQXpWI6VvgEYrAQQsfkyZn+UTjyAjNwi
         7fWCtvFi8fFJRyBbvHvrm+BA+8Pzy/Q4Qj0zlhgWnwt1Q+VdrEK3cSyf2Qm311KEZL7Y
         H6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HHt7nUAfsHxh2tpNWm08+AyK6RmNnRo/vegQxbEoP7U=;
        fh=tkXHBfGcfBlnJ1RmlwUh1dXcoGlp7loIGWUu2C18ptE=;
        b=F7AwISLiElZvXbwVzvku9C8pq/ZX3UgMvP0C7YqCKkzYfaaBZYVPj8P7kg6Vc1X3R6
         shjWnQ0EU+0Gfa9NgTcbQpQ+euFYQ+Ib+0fUhX49rOUXXXiEuyviKw1Ej0KlmV7HYOX6
         5Y3v33r5tm68o2LE5qg0n4tAz9GORESVa9tPy8432D255e485a3p3FKPubl1YgKokXr8
         2oDgZ5X5LlnjwzdRAMxG8yjnqSFmk5Tp4HonO8Ud+TPkY6lTgHkm+W+5xsINivtuAQqb
         TqLJTBYZb9nIm0FEGfLrFqKWBiec4y+fQxZtNBjT5VAUiyhXodO51RBuu0hZ8O6Hx8US
         MwFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781810; x=1792386610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HHt7nUAfsHxh2tpNWm08+AyK6RmNnRo/vegQxbEoP7U=;
        b=BzKcbYPEpdDnSVrkZQkvfeV2HzdBQ3bBCvEtvvgxuB2guf64w4wfDFFKmv3Tlg/ZAI
         SoUI0tngNtsGBtxJe929AyGIbdZ8mlUeEGF8a23WFDz+ZeKL5jiXvKrsKpqN4/ghYWLn
         /IALZ4f4JNonhoCojwHgkKXo45a9OKeZIuP0g/8dExdIHLUREoJBER+spDwIngNvTKUZ
         plLnCCRI+u0fbLNSEF0+dyG8lP77IhU9AjmCTiAiEhOLSqh3ogVl/TA9dT+Bb/kUKE+1
         mfHOAbLnWuSfMSMapG738R5FyaaNiDeilSEsfu0gMXIXJihevcS9OijQrChDsGwYLZL4
         VGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781810; x=1792386610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHt7nUAfsHxh2tpNWm08+AyK6RmNnRo/vegQxbEoP7U=;
        b=Lmo+VPpNv4NRgSIaYxvCZMJfxTeVeCNcAktZw7c4UVx+XDKrq8g6PF8djt2IidI/b9
         Qy1RXjpIFlaXBF3rWI1VwLSzjS8GKKrWFN6Waf2zqyKZxCypdC3NcaX6w4Lav4UjLawh
         z0N92t0tBojR/tUozh8LxeiIuscWYCUT8+bKa2q40FnfDK0K3peuvY1sfeJvacrix1Z+
         Te67UOQ99Vyg+l6VhYiLm4oMWeJ5mxUMnexiRltxQRy42JOFx/nJSlHBml04uuvMbuT3
         Xi/WXDPXK2UuP+jZcroz6MS0v+J+5RwsLYSn1pAKwwKvyTm8NNkQNKzag2TKbWrGcRR+
         htAg==
X-Forwarded-Encrypted: i=1; AKwUvBw1z96s7pLM8NB/zFwsxMSy0FfuxVYR2WugLlMDiwXKAObRRYexfdpjjpRB878TsyiIM+iaSZmAajwMLf2LMQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLlbT1o2L8lgNzfwMjvnXNhBvq+o6J+OTEgOxtDOiMmCYg/wmdQ
	/9qLO7QlihHLiD+6kFavmXZ2PIrAqbRRGhFfBlhmt83455AztgYkBByYGPMRagn/06LyasDiimI
	Fycdlg8bhJ8BMk1FdJCis5bXVjgynLfg=
X-Gm-Gg: AYBFou0RUdYYr/ylap2bkxU33mnrmfkrI/fS9nb3LgvGPLXPUCSXKoc/eGaOQuuTV1j
	sbx9DnoUfzfynK2MT1IIK3Of9EGuHjBNDy/qh2CjCYqaVln4/IrTZwC2vYqs3yP6EgCGvUoIxBj
	BDEOx9K+/k9fc86BZcGeWwcy7W6ZsMeWCvFQsdqTorBc898xv1JEveJPom92SZFy20bQbJBJnHh
	4YGCqHNGEhYt8hxK+mkgfE/zCgCXLo6Dnh+bnG05zXdSFLKs3RTcpwd5OdT9mver81ubctwxQrb
	Cw8rygwJuK98IPScJ+zDeQZEEAodwbCdeu6x2zcIqTSXHiNKytNZEQ99Ye3+/3Wc2LUYoWPoyXD
	1Z7lCOIVIn9viQYxZyZcMrQxItiXzo/NmBLJAN+TMRvJHl50NJYnput5UFwruxYZP6fjDmEP0Pg
	Lhyjqzu/SyGm8xsXziE8P/M+6E7pbxS441tsv3PCmE+TzoBZWmN9M=
X-Received: by 2002:a05:7300:d116:b0:35a:279a:39dd with SMTP id
 5a478bee46e88-35a279a3bdamr4993445eec.0.1791781810359; Sun, 11 Oct 2026
 22:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004124211.381401-1-tomo@flapping.org>
In-Reply-To: <20261004124211.381401-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 07:09:57 +0200
X-Gm-Features: AclHuK_oDM5yaXcf5mBcKFKpP4NIDnVg0poZ0lbzLgzOtqC3YrHZY8d13mbqTDo
Message-ID: <CANiq72=3YQBbvq0H42RV6nbGByaO7wCnRbzUFc4bXrX5U+CDbw@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: add entry for the Rust `bug` module
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 2:42=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add a MAINTAINERS entry for the Rust `bug` module, which currently
> provides the `warn_on!` macro.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-next` -- thanks for stepping up! :)

Cheers,
Miguel
