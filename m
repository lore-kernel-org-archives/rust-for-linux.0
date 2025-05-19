Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223F8211715
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 20:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685407; cv=none; b=Vb6qOwzjZjsjfIyRz93GQ3QGIFexSBcJ4g073SXg3iJpo83nucI7KFoY5L+LDZgZsKIwrpQcTYoYxt27K+IC+Yg2d9pYx1ThGSbK7G5YlXIwQWMFpZqnvlkFNgJwrapcTIOrqiMk9vHVd7FP/PA4KyGRFgw6pv92ZEn+qyKDDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685407; c=relaxed/simple;
	bh=K65/qfJWkrN5GNeUHzcLgVlSWQLaboVUibSZE7gM0W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+Zc+zjdB9hHAz71FiOKKfV1rL+4wNQh3Ggpc7uuNDZRzHv3Yq9uibQbBO3Qch/7+yN26Ud4LFciZV/k3LoUh2yOJRga6C4aT8uyI9BuRvco3oZ59RaK6ecS7QrY7QbJgPnF0RLEaNpTq+Kdoc3DBPmK185R4E/apwzX/6htJ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oaF1kBqi; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oaF1kBqi"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2d071fcd89bso1131735fac.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 13:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747685405; x=1748290205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K65/qfJWkrN5GNeUHzcLgVlSWQLaboVUibSZE7gM0W8=;
        b=oaF1kBqiZjZRuW4ykTPJe38SZaPBr0wmxQvjsVUFz88JR7YAV4gbKwlsVBzKIrOxw9
         Rchlj4/+xeCnGp9+cr3zgDxwu9Z8V6Jq87KdkTMQPokm6OtsdNvHVxIscflRh+nRsj+a
         AmhngwxIKOmyVvFi/VUsbU9eh5aPUDVCVTD6FiFIxZg2kYNXhfEt9A73TKsirUP+BIAe
         2MoB92FwAfwaS9OY6ZKDgFpAP0cbCwkRbyU6j47Z8S8b+14ACBR7QLrGSFQqTT4Lo1hg
         qOXw6I0N2qeB4tqv67PBG94tjTEMV8Fg7MEw96siQiqnm3OIue4PF77wSjG57yAHuti8
         eM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747685405; x=1748290205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K65/qfJWkrN5GNeUHzcLgVlSWQLaboVUibSZE7gM0W8=;
        b=oLzwJZeluJ5uCmbjd5EaiIb+vfb1AUWqGEW7gV7SXunrQR07V/SeJlwc42rS/brmxx
         w6tf16OD/ToVRf9T2MM049kK9+6gJtY9cPzQSS2MHF6TgxFPQSo0n4Fk8zSM0Bw1hlJ3
         waOcugx4uZsmf8lArWSFopcfSF9RX50hgVtIaxmbVPOcixrIuMV2hZ+JG3GHE0l69Q/X
         0nYLwFCPYfwwPsQ9utbh+cLMbl9q4renep6F+tJe5fNTZ+s6O0jUWyu43Yzt8cDOpnIS
         P/RwieXCW8knrqkeTGVUG0xWKwRx5dUO7Um4rWP6mhlGXIIijOjWS5v9V3CMWpfgsB0J
         GtAg==
X-Forwarded-Encrypted: i=1; AJvYcCV8SdUlUtzeTkxwSS5e3b/flof9XXz3FarQwoSYc2VdTSo6iaXtbNsenjTk7aRtBHenpqGHPr2+F68h2Vy6Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxTEhrkpHd8ln+kyJIJ+d2i1epNQow0JrFiQMYoEtXVzzaGp6k
	si7ZZbGSzUKI2uWuPKI17dXi+K2MhrGVtAL0Vh6IC4n8G8Q9pCHB8toQ2WmEPFC5SM51gimDh5P
	BkOdGTG6PWhB97vfkZ66ZQJgODEFltqr2XF5M/3pF
X-Gm-Gg: ASbGncs/7736lcQKIYBAVWgnV6luJniUyJLIufIPfaT2m+4P3Kq7kC/7twIiLOVn0NX
	4w8tFp3VbzjNc6DGeeHCUCMpR+02LsxzRR7eXCajmLB5HMtiuPTnmvFoWIXak9czmrZSJPLJpUg
	nf3ybSp+HadjUtE3oL/dZGCooBDzs7L8uY7QZkUrHAYZ0pui3bQD1IcbgsPRiU
X-Google-Smtp-Source: AGHT+IEZo6X1kK4PkhIGjc5tX5uLYslHsEyE72DrL/tgweT/Ie6dZbl0uvi0BaTmW1YxQGePtYntcG6LBZDAjWJB/aA=
X-Received: by 2002:a05:6870:1703:b0:2d5:ba2d:80da with SMTP id
 586e51a60fabf-2e3c1fa723dmr8876678fac.36.1747685404855; Mon, 19 May 2025
 13:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-4-bqe@google.com>
 <CAG48ez0rGwFeVtj6AKg8YY=D9Atvp1h5FdW3szswEJsRmkR86A@mail.gmail.com> <CACQBu=UNAFjKw_m8oE5Mst_eThEf36zqgUWZ3a0u1m4zr6MoJw@mail.gmail.com>
In-Reply-To: <CACQBu=UNAFjKw_m8oE5Mst_eThEf36zqgUWZ3a0u1m4zr6MoJw@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Mon, 19 May 2025 22:09:53 +0200
X-Gm-Features: AX0GCFv2e4Qgo0_ldeq5x0ML84MbwuQKliPxpr57_FhrZXPi6YvY6lR_y1GeBmk
Message-ID: <CACQBu=WNdmxqOY6FYiKZm2kxACoKMnusngMexhW-=xHkGbzVLQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] rust: add bitmap API.
To: Jann Horn <jannh@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 10:07=E2=80=AFPM Burak Emir <bqe@google.com> wrote:
>
> On Mon, May 19, 2025 at 9:01=E2=80=AFPM Jann Horn <jannh@google.com> wrot=
e:
> >
> > I don't understand what's going on here, unless you're saying that
> > Rust does not enforce that an object ownership transfer between
> > threads has proper RELEASE/ACQUIRE (or RELEASE/CONSUME) memory
> > ordering or something like that?
>
> Indeed without the Sync implementation, it does not make sense to have
> atomic ops that take &self.
> Sorry for the confusion, I should have added the Sync implementation.

Hang on, the Sync implementation is actually there in this patch! It
was missing previously.
Does that clarify things?

cheers,
Burak
