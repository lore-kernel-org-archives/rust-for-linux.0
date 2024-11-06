Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397C5646
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892338; cv=none; b=CqhOV4pm+IKUNcqWPvYB0ld8bImcD0Zs5whGgYSo010e9qftdyE6MhTr1hLLkptRHT1a9lojaG255xk3CGowm9sDRlaQkzkDtgMR/zEjiVHkRII0ayh6aFU1albbbTHc1qzX0ZQdshNqSc2ueiwXRRBBVZucb3jzWhmn3cP7Zhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892338; c=relaxed/simple;
	bh=0SH4HQQGM4nuSX8jcv0O7MeRE9p8Ya1KNahVTK725iU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFV2OVs8Mmmncnmtg2yR/NHaDAHD9xO0ESx2AKVCz5OPEvi7Afx1hlOaWkl40T111FvSf7LEreILWtTG9torvVy1rcZbQ54JkmK6pm+X3PI1fUIHyGjy1KCvwN4yJvukoidIF5joyz6brJ8gLdkEsocFR4Gg1hFPXWV9bh+x7mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOQw7/O4; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOQw7/O4"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e31977c653so624441a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Nov 2024 03:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730892337; x=1731497137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SH4HQQGM4nuSX8jcv0O7MeRE9p8Ya1KNahVTK725iU=;
        b=EOQw7/O4PYW3q6O5RxUoaSDHN5cn86rM7To3h8EbfDqeL8gBhCSgozCUdBFGHRzMT6
         c+PZ5ib44sAXX83gfOK0tZ0p1JNPrdR82I/8vKU11WhR3PyNvdR7WXGxEMr3Wj6VNTdE
         FYAYqvCTNg/25A0NXRmdcbEhh58k5xCzlK76fVO8aqO9YJUi8s9SmAlHNyPmhzBqD0Ht
         q+JYJkcn5v2SZEqm+ihBK4dCGI2ZS/1Ay6MsELF0Tbqh3ltauXHjNmwAQRAFf8sB1P4I
         qS20GzACOxDcbIkwGIoOrJrZvBuLNn+Xkdh+5NO+MHoQr6dhvbiaaIfzzolovJP3JoHo
         qK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730892337; x=1731497137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SH4HQQGM4nuSX8jcv0O7MeRE9p8Ya1KNahVTK725iU=;
        b=bD1IIFD9pcaMSQpvJIFuw3k423+RHS65XvWZSyS7aIbfq3PWZt/ftUKCIp9Thh8he9
         gkffmeFTS2A5aYVVOKGjcoYBZILQIyhFIH9RVDAsWkRjASf0myr7gGLbTwk7S9omQc+Y
         uN3GanfFqGOvk6mYId+Erb+N71I+EASRj6qNQqBCCUfK/M1Xb7WTstGMh7b8uT4BcuJd
         W7TMRUmwNEZ1md8vTGaYxHpyW0bm0z3+XhR80EpetuiBGOWQu6jdZkPA5WPH1orV1U6D
         PHkEkir8QdqSZcBnsInym4vtpAVwLAs5rhsrGZJc4JIi4mBt6xa/CN6y+TX/i7KbPHbV
         PdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtoOzygatahcfUID+Ox0xJE4uRpyaZrpXUQf+Hg1sT3k2FkfoGzppHxnIDZaFkzJka1+k37rK7WfXnINLWuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytBicw3a9Zv9IUgQinSawefZkN5q8gEa0wGiuIYY77migCRi/n
	BC7tpQVQ9X1/yiLNJJIEBv44gsNQgiNzU0uk9EVV94oD2ec6P3mBWv3AYFdRON46LqMikE/MDnm
	Ny1wnkHTnQZtbajM15RY69rYM7Yw=
X-Google-Smtp-Source: AGHT+IGYhi3DfA2ZWN/u/9OuypCJaUopiu28ztHgj8qw0CjyGjcV+PmFQLurGwuT2m/yuTMeAH/IvIINjrGAvspRe24=
X-Received: by 2002:a17:90b:3cce:b0:2e2:c414:80a4 with SMTP id
 98e67ed59e1d1-2e8f12e1014mr19492556a91.9.1730892336591; Wed, 06 Nov 2024
 03:25:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
 <20241105104726.3111058-3-abdiel.janulgue@gmail.com> <CANiq72nLNQD6f_Y2+jdcn3w_K0oXaEX-Y+mUE6Nco565m8Jzgw@mail.gmail.com>
 <459782fe-afca-4fe6-8ffb-ba7c7886de0a@de.bosch.com>
In-Reply-To: <459782fe-afca-4fe6-8ffb-ba7c7886de0a@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 6 Nov 2024 12:25:23 +0100
Message-ID: <CANiq72nsK1D4NuQ1U7NqMWoYjXkqQSj4QuUEL98OmFbq022Z9A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] rust: add dma coherent allocator abstraction.
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	aliceryhl@google.com, daniel.almeida@collabora.com, a.hindborg@kernel.org, 
	dakr@redhat.com, airlied@redhat.com, wedsonaf@gmail.com, 
	a.hindborg@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 11:21=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Are we talking about something like [1]?

Yeah.

> While reading this I was looking at something similar to get rid of some
> .unwrap(). Would something like [2] be acceptable as well?

Yeah -- sometimes the `unwrap()` in examples may be used for
simplicity, but in "real code" we should use `?`.

Personally, I think that we should strive to give "real code" in
examples too, especially since they are part of the test suite, so
ideally we don't panic.

Thanks!

Cheers,
Miguel
