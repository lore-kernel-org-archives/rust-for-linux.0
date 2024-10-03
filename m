Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68CA38B
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Oct 2024 00:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727914248; cv=none; b=eBLvoHiCL7b1eYyI6zrI2BWIXIeI6l77g/F7KamK+XSkbZMfu5HjnDKcEY75MOkLwICtHZs6t7MneVqHBymTLWFUdFnXKraNCNZAmTjTeX5c3CxhQ4AsP0UBjjAWjSq3nnQdZWYubkUhipBS7Ck5hedld37vYZFQvP4THi5eZ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727914248; c=relaxed/simple;
	bh=hrPHd1ydC4KXkjOIXPbC7/fCdEuSLDUfvBzApm+LS9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fi3unOLmfdzuT0bD+dsdANh9/Yv4STc/Z5hGu3SlIHgq8E6pSeDClbDwwvB8q88d3E7KkcA85DHuyutLqxZ9ahmiRWv8ZtQVusJbdahNDJb75xoIxeRJWiFeIgLJisJilR/+QVKkUsnzhKeT5tYch8AKh+M5dkuW255eXEThOJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOQhLvLb; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOQhLvLb"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7e9cbd25337so48030a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Oct 2024 17:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727914246; x=1728519046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TC6hIZRp94YKmONuxBRpz+eKoqkdCTm2ieWkGLHsQxE=;
        b=SOQhLvLblB5Qw3CIeePdxpdL9ZEcZPMcFMsQm0UbLfr7N1A9DOlYRbZqSoHV1hpTvS
         UoPAPIZzFAGNrKSMdkq6E0uqmWzqqF4/gfeDuKe+SP1HiXXlnsUqxGNj8VT/KUOkYVYu
         vUf8vekor9jvSzdmFuVFQtJbnYutCALNxUslHOLaYV/ZiqPLGf2yMoQHyN/3N0LrtIqy
         WkcilRKaf54goNUQ3K6xUTcLx4pj3fCz2gChokYLNXrzC0N5yuFboOPcV2CfpVY9mRNn
         41HEdctz+Ym5aCFsZusMKo76XFjzebEtmKD4mfU/HYsIMWC/B09Syw44F5jcFRb1gvkU
         oyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727914246; x=1728519046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TC6hIZRp94YKmONuxBRpz+eKoqkdCTm2ieWkGLHsQxE=;
        b=TfaHHNEg+EB3NQCxcyJ/oHzOn2/hAQ62O2++apcuUS+eBR2vt81vORzJ+AmIur+LH/
         iZEEYoHaRbyg85BxqMtw5PW/Vfa9MAZ5mvByDLsgSlvSwOtKyOJO9MruAtwJWjYVR6iv
         kdlqk43pdCnZSjcsrr2kKV0ZLaWhRdmjlDc7YCuRqGRO8UIcDadSktO/P79XMvPo5Qom
         Ti1v/Ame1hBFKvYh2HrBk41IVryPtUwplHLIuLO5nKwLO4TH9eLghbxa1q9xV/pl7Fxo
         9htGpVXGWSYpUMNTuzvNYDdmstgPIUXamBfHT8aSu0Yguf72YviXuQkKxCkrW17rI3ly
         LUfg==
X-Forwarded-Encrypted: i=1; AJvYcCV6XYvg7bru96ePU2Cid7quVAUp+DLXNm7K32gGVO/ZHrRk7lKxMSf4N90Bm91P4OYWesPKil1bL1Kmwb/f8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrKljeePFvhWQBArLzafH8AMugh6liLpvg1wcR5HZxQ0o4mfId
	WgFRPY3k6qCv/t7kYl1HXHFcmM+BP5xmQlBMjDFoR6GpfTeHUKKjgrW3eF6vBAzTbVFXQwaz7QP
	wcMQ/aKGx7bMe3qDzDpB/seY6g1E=
X-Google-Smtp-Source: AGHT+IE4nxwUmiL0QjFQ2eZzYVsgUvo8a4WBQbveDnTdxFJNwLhiZDQhsMQgzMI8tYs7+uu+hjUe6VyDs8OZixyyEnA=
X-Received: by 2002:a05:6a20:394c:b0:1cf:4fc0:4ad4 with SMTP id
 adf61e73a8af0-1d5db177936mr3677980637.6.1727914246236; Wed, 02 Oct 2024
 17:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB49142BDF011175DADD6E79D0E9702@BL0PR02MB4914.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB49142BDF011175DADD6E79D0E9702@BL0PR02MB4914.namprd02.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Oct 2024 02:10:33 +0200
Message-ID: <CANiq72n+QR823Rk6XLYp=Zch=Pi8KiWPC48VBjbkFgVbe8UHhA@mail.gmail.com>
Subject: Re: [PATCH] rust: optimize error type to use nonzero
To: Felipe Alves <felipe_life@live.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	"gary@garyguo.net" <gary@garyguo.net>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 1:52=E2=80=AFAM Felipe Alves <felipe_life@live.com> =
wrote:
>
> From 18d0c4b19e036572062fde15ab78c286f4840be4 Mon Sep 17 00:00:00 2001
> From: Filipe Xavier <felipe_life@live.com>
> Date: Wed, 2 Oct 2024 19:25:56 -0300
> Subject: [PATCH] rust: optimize error type to use nonzero

These lines should not be here.

> Optimize `Result<(), Error>` size by changing `Error` type to NonZero*
> for niche optimization.

Nit: newline between paragraphs.

> This reduces the space used by the `Result` type, as the NonZero* type
> enables the compiler to apply more efficient memory layout.

Giving an example of the concrete size reduction would be nice.

Also, for some reason, you don't use backticks for `NonZero*` but you
do for the others.

> -            pub const $err: super::Error =3D super::Error(-(crate::bindi=
ngs::$err as i32));
> +            pub const $err: super::Error =3D unsafe {
> +                super::Error(core::num::NonZeroI32::new_unchecked(-(crat=
e::bindings::$err as i32)))
> +            };

Missing `// SAFETY` comment.

>      /// Creates an [`Error`] from a kernel error code.
>      ///
> +    /// # Safety
> +    ///

The function is still safe -- why was this added?

> -    pub fn from_errno(errno: core::ffi::c_int) -> Error {
> +    pub fn from_errno(errno: i32) -> Error {

Why does the interface change?

> -            bindings::ERR_PTR(self.0.into()) as *mut _
> +            bindings::ERR_PTR(self.0.get() as i64) as *mut _

Why is an explicit type used?

Thanks!

Cheers,
Miguel
