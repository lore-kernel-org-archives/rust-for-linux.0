Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D031FCD07
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Feb 2025 20:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786100; cv=none; b=llIepYWWbwkJhPLz7y+IPnOrwOMKcMoFvMqPTXSsG8O+f7AiblGDouyqiT5ts6VFitk134d5OLBM/taD2TBiSSEQW66db670cl+M8pekJld3fF2Vwp4PhUPawLA/MI3gMlt55G7P/wMPEIPyYiFJpupg4TT6EDWG7gCehx1FsCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786100; c=relaxed/simple;
	bh=1+8osiND+poixajs+uGj5lEQpMJBkufcI1G19mRvd3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNt27QCZk/cbuJLwircC6hYoAYu9q+kXbtAms8c4oFHWRb+L6WPCpt/u0SYi7416y4INIn8XCADiQ/B97rTCY/Egt9J/PEtVQa6gfEmQzlDioJqMQJn00FHy4ziJa83w9OMiyg1ivfYWsUmcItLmzDxwIFwbt0jBRkIBBvzsYLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ekJxztB0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ekJxztB0"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so1921a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Feb 2025 12:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738786096; x=1739390896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+8osiND+poixajs+uGj5lEQpMJBkufcI1G19mRvd3U=;
        b=ekJxztB0fiWaIcgmfgJNAxLeOx0jlECZn07k08L7c405O5TyD8AlbmTJseOooMyul7
         WhDoSB0F/Y2gox3/AzwlH+8Zr/YH502O9wVQ/zmAq69meCbOqz4bjJoHhkj4KfSU6/w8
         rc6xmRpPbjplaLT/iiPGisx+nZufPedVwuTOK3mSOIjsixh0ciqe4DFWKpGzVUQ1UuIW
         MMKqXyDaoR8eU32n/5XD3y29dpXLLB1GHf5IBTnvVQbeR6ynoQ56oLZoTFvqe46wVqCm
         0HGhRtV9/nmzd/QChX6T/8MV0VvK8ijkzgxItqnsICbsP9MUWuoFG1qdKZFIv+fhdAQJ
         C7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738786096; x=1739390896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+8osiND+poixajs+uGj5lEQpMJBkufcI1G19mRvd3U=;
        b=N2ho4p9nM0S6Slto4TILlkzFA/fJmyrX9J+YZ/6+ybASWjbOJ6C5u9KRf7NrlOgQBn
         4WtC3UPRrl2LTaeOFcOOBFhuz6UevqFYbROzZgDVex+Lr/+cKenTGQYzIgMFTSvVF6KY
         NJKF4d0Ih5kgm9Tufx1SlnwmGEhpvf4TB57t1UrKffMNsnKITOk6VSLCzKu466jOsAbk
         mKkqNWRjVu4aDHYEkNegwknqhenIxQa/wtjEMc+QvhJLGvR8/Gbc4YygOLbRgOEuiCtP
         Fo+B6ZtuWJaW8vxEMkQrGnZgwqESbSMxSB6lS0bf8xWM3QXp/94mgaBrsLt3wriCnOUI
         q6rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvdoEkoiQSBzxlOqe7ClXfNcuoFAPP30nAmP51cVc80djaoH41s/7JLf/xvSAh7yPN7EtJudcIpSmmk8vUqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYNSQ3wqNgj6WAhZwfjiT1jyECbxtDFI9ztHWc9ktsrCN145yR
	8YNDhRvRnGSEjUrJItlYuSfO4I2SaGAvHwWP0x7QRppzlw4F+biq3mQH9doNFYnOxEL+EgXbUbH
	UK/RBLLgmxLZ5senSbvCKEnPxAOwORSTS30Kc
X-Gm-Gg: ASbGncsqgN+8CaNtT85v4OXWo64fqXZ+8/1cP7I2ZdL1ewaXl86utTeqMbSvhMb6mhU
	AY+8gHT4PcZJ4voMFHErRLQyXlZWl7SrXiuQu80t63ndMo8MdbOnwqt76qKV1dGST7Tds6kuFbc
	7RQZBc0A+prHT3Jf9UotcD+u9LdGI=
X-Google-Smtp-Source: AGHT+IGx316vv85yz2/nvJFRxkFiWThWunwKRnKhnVM6RkZhlGbx8MIHHEJ25sjRD9Jdsb9vJmcFpLr/AhWfE2Ty9Tc=
X-Received: by 2002:a05:6402:f90:b0:5d0:d935:457b with SMTP id
 4fb4d7f45d1cf-5dced624585mr15835a12.0.1738786096220; Wed, 05 Feb 2025
 12:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com> <CANiq72nr9vTgUF9u0uyypzprQrEpGv4qbOUJS_QgYbMZhTTrRQ@mail.gmail.com>
In-Reply-To: <CANiq72nr9vTgUF9u0uyypzprQrEpGv4qbOUJS_QgYbMZhTTrRQ@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 5 Feb 2025 12:08:04 -0800
X-Gm-Features: AWEUYZl61QhSjJhgUceZS-V8R2uiiR6L4GKn0W5Urdj0QBNHHGznj3vzrZ4SpcY
Message-ID: <CAGSQo02HFMn0b=d6LVFr35Bc06F0AY8XmPFtqWi4b17cQSF0+g@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not export generated KASAN ODR symbols
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 1:12=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jan 22, 2025 at 1:14=E2=80=AFAM Matthew Maurer <mmaurer@google.co=
m> wrote:
> >
> > ASAN generates sppecial synthetic symbols to help check for ODR
> > violations. These synthetic symbols lack debug information, so
> > gendwarfksyms emits warnings when processing them. No code should ever
> > have a dependency on these symbols, so we should not be exporting them,
> > just like the __cfi symbols.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> Sounds good -- are those generated unconditionally by ASAN to check
> for C++ ODR violations and so we get them anyway or do we benefit
> somehow?
>
> I also wondered about whether we should search for an extra underscore
> (`__odr_asan_`), but I also see mentions of `__odr_asan.`, which I
> guess that is the reason you used that prefix. Is that right?

In case you were waiting for an answer on that, it's because I was
trying to be as loose as possible, since `__odr_asan` isn't going to
end up on random symbols we *intended* to export from the kernel.
We could technically restrict it to `__odr_asan_gen_` to be more
precise and it should still work.

>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Thanks!
>
> Cheers,
> Miguel
