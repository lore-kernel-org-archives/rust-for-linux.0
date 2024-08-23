Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC274D8AF
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724391857; cv=none; b=kPES9ragO0ia/G52ssRu2Jb8idJ8U0evCVPepxs4JnP57x2oH6kR5bVlFm5GO358Iu6h+omFkLSa2dVrqyB7+BruZsohk5038iWM/wVPch5GVNCN12UMFrpIWUR6HGS8f8SYfUeYUfnYnspiA2tznoLhPGoL1+iViM0OCRWBTeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724391857; c=relaxed/simple;
	bh=PCsitZxLDDBITVLB70yX+2ihQij0IKmSC48dH5vNP+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJCCw5rIIIBvu3Bqms85ZIRRMEJRKOSI1QB4n45U1DmTYVASJM6f56igrSX3pljPb2P2l0JGgwMP8VEktabol8oFUaNUmMPaxhQgNC7cQdprnVpQhUz7K5K92U2D2HhtNZMBmm+oczkRuMWdXdzE2ZVqDVxWlbIZlt71q71b2KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=G3e9Eti6; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="G3e9Eti6"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6b99988b6ceso17407587b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 22:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724391854; x=1724996654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCsitZxLDDBITVLB70yX+2ihQij0IKmSC48dH5vNP+Q=;
        b=G3e9Eti67MVzKWR69kyS6atRwHWBC72qD86gbkrbQBIxz7H7SCtZZRsQ8BtsNuOb3G
         W+sEG5DdxA30TJZrtzKJWH4qNWZeiKV2p6wJHSDYYe8Y2ixvxsRRpacDdKn4ZsI+7Nhm
         gunCjeCroZVcmgCxRa0w6HQqRMNJ/5LkBR8CHLrpD1zXNO62TR3trJBbcM9oa+mAgB8B
         uZAftBOxXyon8UMljOFOnd7ks3dZHVsTj1aB6gHsUV10ylxzNVdxn80wMH57hQDsz8p6
         qtBfgY4kX0px3cuEu/fkEitZau1Lq9af6AfbFxJN77ZTs39d+Q946i96PrlE7s4tvbhH
         aUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724391854; x=1724996654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCsitZxLDDBITVLB70yX+2ihQij0IKmSC48dH5vNP+Q=;
        b=ApMuCC9B95myv11ZsSCv2oMQYPH7JQXh3C9xibsTrK7dpR/NahpNRHp5cwsQ4PyqlR
         swmlG7IKkbowBVT5nsYwqnkJJdivzYQ3KaSK9dSB3YSoP7yLav/H5lKeRW8w55tE1tht
         88qL5Mv5xazWFw4k84QPY2B6SxmSiFbMfgzWCf3gR2hgUpbCXjxVIcHCiN5voVCvg9sP
         Air0NBbgvGAbE7nXbpQ6dORxQMZihPsUyHkhh+BUL4Nc15SxzhWFi1nWwNIFegmJ8EMG
         T1hRG2/svWLL9QpWTj4RH1lJFTrOY2yMzfgGdO87lwcufKwcJ0w3wSz8+FeA7LkuRbgs
         ErZg==
X-Forwarded-Encrypted: i=1; AJvYcCWQNWNN8rGs1Y076TW8cbjb+9aHCOrL9iG7oL1iVAKic18rCCLqfg8VbYH+sQoA4ILnP5gBBttY0J6TFslf5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxfQjajq+TNPqTxLbj475capWxBF+bdU4hIqAAoAczY0EJcNue
	nsMbujvy7FPZLq3fSq+x8d6abRhQSjczbR+Tj+NbtoXAknV+Q1s7dK4Qv4kPC2fpR6nFWgegqpU
	8umtxLZ7hRhYVHKUP40SmylDX9JtQwbC+u/SG6A==
X-Google-Smtp-Source: AGHT+IH+x5e07pVdDDl5LhiqyIDvxFaMqhvzJBsLNZq9K1FXe+xmxvq17b0CroJwwLa1MjNyOv2fKFvvG49SSoPyBb4=
X-Received: by 2002:a05:690c:4586:b0:6be:1000:963a with SMTP id
 00721157ae682-6c626109fe3mr10625277b3.27.1724391854623; Thu, 22 Aug 2024
 22:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823050359.1737893-1-workingjubilee@gmail.com>
In-Reply-To: <20240823050359.1737893-1-workingjubilee@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 23 Aug 2024 00:44:03 -0500
Message-ID: <CALNs47tTwECK_pX=RbC3Rj3AVovO_a3_ap3ctCQj724FJVQ3Wg@mail.gmail.com>
Subject: Re: [PATCH] rust: Eschew `Box<MaybeUninit<T>>::write`
To: Jubilee Young <workingjubilee@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 12:04=E2=80=AFAM Jubilee Young <workingjubilee@gmai=
l.com> wrote:
>
> T-libs-api has consensus for stabilizing some of `feature(new_uninit)`,
> but not for `Box<MaybeUninit<T>>::write`. Instead, we can use
> `MaybeUninit<T>::write`, so Rust for Linux can drop the feature after
> stabilization. That will happen after merging, as the FCP has completed:
> https://github.com/rust-lang/rust/issues/63291#issuecomment-2183022955
>
> This is required before stabilization because remaining-unstable API
> will be divided into new features. This code doesn't know about those
> yet. It can't: they haven't landed, as the relevant PR is blocked on
> rustc's CI testing Rust-for-Linux without this patch.
>
> Signed-off-by: Jubilee Young <workingjubilee@gmail.com>

Reviewed-by: Trevor Gross <tmgross@umich.edu>

Additional context of the CI job is at [1]. It's probably worthwhile
to add a mechanism for patching the kernel in the rust-lang RFL CI
job, so we can do things like this without needing to pick between
blocking rustc and disabling the CI job. (I thought this may have
existed already but I am not seeing it).

Miguel - we probably want this in fixes so we can continue building
the current kernel with upcoming rustc.

[1]: https://github.com/rust-lang/rust/pull/129401
