Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6231440FD9C
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880693; cv=pass; b=VT/5AtnQRnySiE7QuiGOwbMmEiN9E9+7nzL/iWPk8odrdQzyMPowjTSlULtzQ/kcwpShstIk+2NyfSAxctDbnTGMBtiV/eJkU7BNTm4tqeJzj2GFvVJTAVqTsVP6MccWM4nkBnGJy/pRB/Hlcb08LGaR2putXvY7SayYxul7jbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880693; c=relaxed/simple;
	bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4D7MXiKQnj5VF01T+CsMV+F4ZBoryTpTa1XVsOLbdhSxY+2OrDDKGfdNvGJ74Uu7jgu0fRnkIIQTFW2KU9Rp5/WHP2E9o2a2Nys5DdfPic4lUK0KvJ4ocMoOzbhLBHwsPco6EA4fkb8f6w7rnH+3XlLCVQylzXb2b5xEHUpiI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ilfcfo9l; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ilfcfo9l"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b04a1f495fso58742eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 05:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767880690; cv=none;
        d=google.com; s=arc-20240605;
        b=BMOEDImsKssrbLtYbtghgRzayK055sqAdlwaWnFosxOXx73ZKXka4Tuu8v3CF69Bg6
         ubCMavmjM8tu/pRN3na5Dmsp1iOFGLXhQgwi5o65CEAHPomi5ja9V6v3fu6w5Ls7U+W4
         O8VPM2KZRUFUG/kVPEbGZID4wxXAvjxecURFg7k/94XaT3RVKnZ2TtFT83mH1Z7v9VSC
         f2X4SSwOuLst5R1yNCEOCGI6YYY78oJWrlpP4ujyROHPwbQvu/n1dN/hor1tRKky0k4Z
         2dk6uXXINTIRSDg2BUQIz/prfRS8sW1aaOO8UL8gr5P/5bLu8VZNRwbANZRwAJNGLAPs
         kypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
        fh=xzozd/zC1YdJjt5m76lRJhGbnwDBN6t79AyT0ReifzM=;
        b=M/3EfXjOYECqbqUDroRlwcwbEhQ7bJReBOumhjTqrRLJJZrnLw0u6PjFjE/gOJY4uM
         DzrFIvCza5oR6AQiXhi99V8cml1tN8YvV9HVcD9TPfhj0/ANPiXCcA4J1OU0FCNZ+GNw
         f7REPYVCrisCPUFMG8H6tHa1DVLg4UrHCoEhruw5sa8Ejl3hKCCPUkthLQfHL8kHtEc7
         /nb8ZdRpBd589WWZhmxiOS8Btxcm1fdG0XTB7gOBzOCEe8mv+AZrwl9nF9Kgab2LwnDt
         3UL/ToD3lkpq2AS6fC2Dz0WFtpBTJGO0IwyZRfE+fdI6UQAsnWnMT9nH0vhKd4AYBbAD
         iVyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767880690; x=1768485490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
        b=Ilfcfo9lhPbFoRwXYyeWTa35Ybnj14xI7aJp+J3RZeWzb1Y58ehXAKXbI2lCRWxjri
         9l1F8djK2AftPQ4aVHsRmcLERuPatxSLv0s7oGJrs4iVgh+Q3nBRw6By6yAt7TQoZun5
         3DOZnFeI1gL3oNBsmeZNRVGzoE+JoBHHr/hDfRJyQNVVuwSXuAHKy4BE5mzSQfcanEsE
         5Sd3iX50T/MSSzc+jdmaBFXlOVQgRzo3CCMFo5QBBWs6wM/lcBJpDS02fshclj7GWE5+
         mP7J+FTxRVOdCYbKDJyhFh3MSSuveyxcPSvMCTlpDu0Yw3hsQS5ezi1MiJrQ9lUieQ+t
         2RJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880690; x=1768485490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
        b=YiGuecqqbO3+Uo9lSaja+XUmAAjIA3RaTkqXzKLxy8zX3LG4l8f6A84IATGL/7dl2X
         nRXil7Yec4E/FzCDuTe8U7GFcVJJvYyzPAqvoQ5P7OIXRBXvtj1tz/YMVlAGRYhhpzR8
         JgvHa4SxVoithc8PGJ8T+c2VAHlhEP/beX7xi7PLWlsUaOw+pjnlKO9DgfrlI/DAnVqx
         5DAtQ+hUw1MebB4+iNWkRVruWLh3jghlmDpySt158LHqCMVQRg+uNu5mUenBFOb9Ydzw
         KBBgGOh7d96xQeRIEuy9ge82svj1brSrykHMxBB+Kv3NLbFylc5IVAAROUFUOoo37ROg
         c3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCX/I9ilDdE1QH4AZ8/PGc5bUnpzP7SvPqHxsT/XP0Rtm3ylAlJkqT/EsqDA86J3mkmgwdycULnnjJS2jqBlGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4F69LEAsXRd2CG+ESHqgsszb5xqNkGyNiMpnw64f1uckH4QQY
	Pv8Niy3akFSlv7pcHVyYWgtfGDslmdjfAdvMpjLmBlNioqJoHhr8HjIAV51emExzBXx1iNfe/TK
	t+WQPJJrwTM14JxtbcSsgF8gpNii37Zc=
X-Gm-Gg: AY/fxX75EN5I5chuu3gjyMJ7uMRXOO+mpjS38nx1ZZqx+9x3+Y5KCJSFPuOPChZaw3h
	61xcv6hnijGwslsuSLBcty7hg4jj0xMcdPFF9ssv0CQrGSTZwlhUFAWjHqNuCZbNGzo04jMGHY+
	wutmgx5fAK4gLi6I8AzBXeXDmOKdbkS2rOT3DLb7Sm1VkeIdsOauNORjk8ZYxQzHkqzKXRqJVTE
	2HuhPirgFHc90DOqmFgwZwfMWYxsg6BbAgVnLIIGIN9FMGv1jGUe+SRuSZHNIQkBwSQSVK1ACI9
	VEay3c0w9v4ej38w2mZhpC3iAVYZ0txfSS0mYj/4lnYfasEdyt5hdhdbjihCZi1CHTQDQxV6ANP
	69f2DixfF2vjUarNgM1nGXmk=
X-Google-Smtp-Source: AGHT+IHlnNhSjE3fiGAFdHKCvng7Zuc8n9ttJNcOcaKfOXOHrvEYhA907pjuVU71kxGKClIXln7ajb5XI4DP4iSFO60=
X-Received: by 2002:a05:7301:10c4:b0:2b0:502d:c27c with SMTP id
 5a478bee46e88-2b17d2b80c6mr2509787eec.5.1767880690160; Thu, 08 Jan 2026
 05:58:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com> <20260108-delectable-fennec-of-sunshine-ffca19@houat>
In-Reply-To: <20260108-delectable-fennec-of-sunshine-ffca19@houat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 14:57:56 +0100
X-Gm-Features: AQt7F2rtmhmzWGc_DLT6cTXt2EVzqLjQhI34cDZ6wkg42nM_UD7cfFl6t1r9_zk
Message-ID: <CANiq72=38RO9PGAMDtnTK8wj-yRSmg9UOfq7D6af7AwAKwn=DA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 9:07=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> AFAIU, encoding the state of the clock into the Clk type (and thus
> forcing the structure that holds it) prevents that mutation. If not, we
> should make it clearer (by expanding the doc maybe?) how such a pattern
> can be supported.

One possibility to consider in cases like this is whether supporting
both cases differently makes sense, i.e. one for that covers
easily/safely/... the usual "80%" of cases, and another "advanced" one
(possibly unsafe etc.) for the rest.

While it may be a bit more to maintain, it may pay itself off by
making it easier to review the easy ones if the majority only need
that etc.

Cheers,
Miguel
