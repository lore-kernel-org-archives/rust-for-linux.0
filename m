Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A88193079
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523668; cv=none; b=BtJBXSyRoET+AhlMvV72bSw0vYteo0Kop7DnO6/+Xu4pjz6ANm6Bejb0q4Qybdc72AKcAIZMIQbOcfByhfHj5YzeKyBpVPzufPHzJE5RZ08kuIj00QpvXntBdANnwfgBGfl5DOGNoNvRZ2xH1AcSnoej6RmQFJpfmOs3F/rOw2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523668; c=relaxed/simple;
	bh=HZnCJipsXwMP4VZBsZOkHz1xv48awVQlqhiAnpcMQ/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eC9fMBDipXkt3qRo5M3XrugWqstZuM6RejcLDgRdUbl1zozmC2ozWhEjhdmYqhmDgiorNszn+z90BZBhPdA4WEkI82TzadXbs9FPvLaNziQqk8lF87AdkR2OUqaiVHcp5RFbLcPB3PifQt730xqi9Pu+7bUhVv4kO2njA9W9WyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hQsiOz0j; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hQsiOz0j"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42c2e50ec13so3258395e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725523664; x=1726128464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZnCJipsXwMP4VZBsZOkHz1xv48awVQlqhiAnpcMQ/4=;
        b=hQsiOz0jE5rJ9UVB6AUQ6shs3DAlhYcaeNbn4hTVkcsaFpc+mXnnTO3uN4L6MhP8u4
         K0E6Wrv1VPqkpWGVVt3D5To1j0lLchYPQCX2mJi0NvYELMZMxOykBY5+0kMf9yewOh6y
         MvrjQCwJ6nwiyU7v/mR6dVqv7qz3oHzwoHFqsNY95YQhvYV8CzFSXIzG6/BKF+gVoqsA
         Vufeflbrn5uuMlqcv/QdBx+pDMZUtLaoEXMFX0Md0r2fXCPG+Fi7/XVvgLhcXlH1a/n6
         Y3W3KDVD+P7XOuVwypkYs9vGFrFunHIupcQGGx8sN2KVgWXoVu6s4hoeP2RQSgHVi5Bo
         wLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523664; x=1726128464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZnCJipsXwMP4VZBsZOkHz1xv48awVQlqhiAnpcMQ/4=;
        b=RHBsfZcqEiDSLTFhYzt+9O2B61lmdIENhE2EnwWW0bx3kjhAwod49v3cwYIHanHj1m
         VBtOnAUt5032R/Z50Ig+PmbjJYTz8fb4y6kRsS4jQHgch1L8RDEcglC0YZ+/Ta5c8Yen
         /27YLpy+C8TAaNXu7aZ8l2M5FBgMoOuDrW3Ol+iymQ442LaI6p7x+q3jH6YtigHtz6nz
         1VwDIHZVEWxX35KD7ERmRKoZAPuL9krbLGsqQ1xb3ycC4PoRyYsg8OAaoQxGggq08/KL
         p+/0QR4grHMMvBaHovIDZkLrgXi2qH1xm6244DIpbx1TQy0bqzoWWDzXRvECAnVB19z2
         sD2w==
X-Forwarded-Encrypted: i=1; AJvYcCWP59RWDk6y52HVVrIiIgHpFNfmK07Jssal8nCEnfqd3/FwJqp8slTRNj9zxihx3HMVfV7+HVxfedYeVKS+LA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5XGZo4qe/Ppuiokvx2YEgDDJoVt5snSM1U1z4MaDbUSUr6/an
	+jFB66X4pPErnqk36SpI5ESoEHYXsa+68vq6SBFRqIe78neMAOLkfL81BrjpiI5mvsfElpVTJ+k
	UUgA6C6KD/lgPTJDoScrOQuH94JlR1ojVO5bv
X-Google-Smtp-Source: AGHT+IFhiAj/3EFHGD/JiFE+H1pUAlKa3bW4DHEc6Kdw3MES/KJPwsv1V++t7JJOI75tAiCoDGf6ibbzuzPSulZPbkc=
X-Received: by 2002:a05:600c:1e09:b0:425:7974:2266 with SMTP id
 5b1f17b1804b1-42bbb436e04mr134483975e9.24.1725523664230; Thu, 05 Sep 2024
 01:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-6-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-6-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 10:07:32 +0200
Message-ID: <CAH5fLgjmBQe-VmNP5RUB3sAVGh7EKi3i6GZmaP2b3WZMnGkQ4Q@mail.gmail.com>
Subject: Re: [PATCH 05/19] rust: enable `clippy::unnecessary_safety_comment` lint
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> In Rust 1.67.0, Clippy added the `unnecessary_safety_comment` lint [1],
> which is the "inverse" of `undocumented_unsafe_blocks`: it finds places
> where safe code has a `// SAFETY` comment attached.
>
> The lint currently finds 3 places where we had such mistakes, thus it
> seems already quite useful.
>
> Thus clean those and enable it.
>
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/unnecess=
ary_safety_comment [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
