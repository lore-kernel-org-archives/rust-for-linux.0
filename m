Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9D115B97A
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 22:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715034336; cv=none; b=bBZ6m6BGcDUfhNY4EUy5LXHBa8boJy8V7BDb0dBYRPBzqQzlNeoPB58Dji5Ur1bhDrGEACeZzDOv+d8uloz0EBQHbQVOoGGsc69IObPxsQ5MIQCYcysw2lCEGrEXOk05wuu7GW+i4UrvK8+IiheIYsIwws7eXr6JxHFYJeQPYEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715034336; c=relaxed/simple;
	bh=8eKWvn/G32hcGZ84G+dXhTvGjODQIauy7njWkNJhcAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssrrLEPbL8XAHnIdX/KozQQ6+HvRTZXVrqkiyU9EkqvCGnn/amRHNssTVZnnUMazYZDrx22J8nGv8zq28OCde8T/ILK1FuD/lLB33BiDSCBofr70pJ03tgaAvDrGPHE1qQ2vQw0+9NOd4JBC27PsSdNeXVYf/amA4LHGjLYl+Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg/lXT45; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg/lXT45"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e65a1370b7so22517685ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 15:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715034334; x=1715639134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eKWvn/G32hcGZ84G+dXhTvGjODQIauy7njWkNJhcAU=;
        b=Yg/lXT45/p25eCD+jl1aZM7bP8LOSkRnUH8rvXX3ftphM7qZSXeorKN/AOHK6Oc+sC
         R5dNtxpOd+Bag8Sah095VfcDA5vf6eVrnBUviNX7Iz7U8f0ObNEjYP0EFGMoksfkv0C0
         SrEFI/I8JZvghLJfsmLfQ4Ta14bl6kXR/tWmRmhkHLHjOVpSz0JXCufRZ+IaLvvgRa5y
         WrAetsEMA16zL8NIhQA4sxtOTbFYZoVD6z8TpTHPKglzPUnH8V3xvtN2RkzdrG6qr75E
         iUmgwxqBtBkdmcjFnWAyFDONBD/aE3SjnaKLAMkQh4ZfF8JGVlah7nlPwbOnIUYD3XZU
         ZK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715034334; x=1715639134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eKWvn/G32hcGZ84G+dXhTvGjODQIauy7njWkNJhcAU=;
        b=KrjhGgkzpQzhv1DNa5vqaetzIQz9IUFFE/7+GlV4bqn86MT8+sd7+Vb71LgGkLY6Uw
         AG6+JnxbppqrO4NIJ6Eq4IJFkK4cxgAqydvD7SWY1imz93e99PzhKHP41vOoqmDKk0as
         KVVbY/niJQ0Jwnur7pn3z7UAMylDAgQq1bjtGhGLcEZKJoDfNoUdcG1ep/HqirQPzHv1
         CIugvTtV2fuiw1DR5/qc7geBwCDYYt11HaZ/SBuGA6jqZULNW/pnmX2ygcxBn0BDQOVA
         Dwn6fP+U7xMsoEQc55HIw4QsefV+ITIMiaM/cmy7gEPj5Dz9fuByuSnBe4CrWs6RvaCI
         afnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUpPsVdxAsTDlUJFWzZzDZ/+OmDxvcvoZ8q8qFULynKyzGD0NkaopWBFQZN0nlgV3YDgYwKwlcS+AyDq1fsNqvaP7wX4zxFKL/xgsgcW8=
X-Gm-Message-State: AOJu0YzFLASVGB9w/4rx5dx3eDslIqOlsrKrme6ZZNTJS1QgI/4ch2wR
	mK/JvuGvRBX9ghGEJenpjJE4w14gRTtZCOfyZ4L68heW1x7curTPlHVVeoPAC1fVkTnHW393WE5
	Ll7KwdhsZESLIt8yo14sYv9XSQ3A=
X-Google-Smtp-Source: AGHT+IExYnmktnkn/f0Z4ZZNj+O6iLpKUouGdmhXPAEzFxO8L7cgqgRDMSV5ONPGrH4v4xocBeK8ERk5K5nszaYgV04=
X-Received: by 2002:a17:90b:92:b0:2a5:16c2:8551 with SMTP id
 bb18-20020a17090b009200b002a516c28551mr9782458pjb.19.1715034333972; Mon, 06
 May 2024 15:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501134834.22323-1-dakr@redhat.com>
In-Reply-To: <20240501134834.22323-1-dakr@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 May 2024 00:24:09 +0200
Message-ID: <CANiq72nSQAE7c8ypWQA__BMoaBYqiEjXvHpuzn-=CsCky9uu7A@mail.gmail.com>
Subject: Re: [PATCH v3] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 3:48=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> w=
rote:
>
> Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> passing a dangling pointer (instead of NULL) to krealloc() whenever a new
> Vec<T>'s backing storage is allocated through VecExt<T> extension
> functions.
>
> This only works as long as align_of::<T>(), used by Unique::dangling() to
> derive the dangling pointer, resolves to a value between 0x0 and
> ZERO_SIZE_PTR (0x10) and krealloc() hence treats it the same as a NULL
> pointer however.
>
> This isn't a case we should rely on, since there may be types whose
> alignment may exceed the range still covered by krealloc(), plus other
> kernel allocators are not as tolerant either.
>
> Instead, pass a real NULL pointer to krealloc_aligned() if Vec<T>'s
> capacity is zero.
>
> Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation fla=
gs")
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
