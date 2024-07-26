Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ABF176FCF
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721991023; cv=none; b=UtcW6BqITmHonv1LVzy4j0uE4vahZheEkoI3s1qCaAWYCgiwYz8fzvpfNO8PC38pbPa6s3Zr3/GJHEs2M4fewSXWAec7vAxgrvYBVv1SDmHWMIVvp2BxXy7f4/LDyHaBen/dB/M3P7o/emb+rJSV57I89rLdEHeQBrOwWvW/B+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721991023; c=relaxed/simple;
	bh=Qy8S0UY4uIlSRFDIwsZ+rC2quK33qj3MJXVi7bEiuII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSir0d06AA/OlVNP1YdQQpynjE7SE4lcuI2basLZnARcojwb33oizMSDWwns0H3aIUMNwnAPoKGdFm1ybT5/WmGH9oQOT0CmLCZh8SdbvsrDrp2ToOA6UnX+e8QKF05SQXvaIo8OPBJzWm3payEt9X13g6DFxciSyoql12PSMkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=mWIdU0EU; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="mWIdU0EU"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6512866fa87so19231277b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1721991020; x=1722595820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijK4BB9NKjijkhh0VtXecMEZ79Tn/oYyKmCGMg2L0/I=;
        b=mWIdU0EUNgSWpO3tME669YSUkwWfzfIFeFsyviCuA/5JG5zRcTmL21CGIvA3vzAcQh
         B9YCAOe5cjmgXMFrPBiWYRT0vDOKB5Q+Q+rG1OVaerLkDauBV2Rpz26gtNu5p3bWwyR6
         hpZ7wY5FtMn/DWtii7cjQtq6zr4xMjaTp49nFIVK/aaaEj2jKv9Y1XBnzKMM8BM1x+Vn
         J8S6vWQ3PRJqlKSpaGt5KOiFl/VQPl6rVJLCjHNIHeI9eaTBjLEQ2QxAL/xX5cB1H8Or
         TJpYL9UxhdAGke0GtsHGLHRVytUZ+xHPZ0/1TktPTzq2ZZUpGsWO16rN4bI5xiOP98wn
         N27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721991020; x=1722595820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijK4BB9NKjijkhh0VtXecMEZ79Tn/oYyKmCGMg2L0/I=;
        b=rtxklIEuLw+2ZVWm/pOkIu/5iQsQDfze9kVe4seE4PTL0sIJ5X6E7jziMwLi5rHVBo
         7nx+G9ebeaNPi3q8ifWSK9bLyqRXH8ewn3xO2KjFrAHEfo1a/8/ePMGjoRy6TYpkMJ1X
         ii2UVHLJGOV1BLkKxDOaCJoLseKs2o4Qa4MhCkz94dzylQNIAeeQPKmYG6CWbrx7jZ7d
         1e9T923ndXQIYoKoRN65FXK/qhgy+l7HoTp0aLLk8JIsC46bje9P2vl2zHxprd81u9sK
         iypW2T1MCJIk9xoaWrQ4wR33QUlVatkMdAbzbQ/9nIE+99ZRwLNqHNT2rq680nev3DNW
         tr3Q==
X-Gm-Message-State: AOJu0Ywsz0oo1l6PKymRC3Pj656V7LanfBCI7IryqKiG5w5340gIiCvG
	o/X08fWrFBl64iPbvYI9HEFjkAWky3OFW2WwYQ2Ryc5C0yUywVcFSeq57kGm7ReKWFpyhXxsGsX
	kQ8wDK6Q5N5teiaPQjn0vpTgVWS7RgVWW9sYUNA==
X-Google-Smtp-Source: AGHT+IEWE09yjy7H1uIdWPeLlwZTh0X3VDPs+EgGH4tRVC/pHE868SOJEKdot/CKNhvGzq2wMS1HXdoizMsUwu4GvRI=
X-Received: by 2002:a81:844c:0:b0:632:7161:d16c with SMTP id
 00721157ae682-67514c47c13mr60677927b3.28.1721991019965; Fri, 26 Jul 2024
 03:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725222822.1784931-1-lyude@redhat.com>
In-Reply-To: <20240725222822.1784931-1-lyude@redhat.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 26 Jul 2024 06:50:08 -0400
Message-ID: <CALNs47shY_e8Zc_OQqOThwAwHUjk5-MAzwJvxqm=Xj5T7YD75w@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: Add irq abstraction, IrqSpinLock
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>, airlied@redhat.com, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 6:28=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> This adds a simple interface for disabling and enabling CPUs, along with
> the ability to mark a function as expecting interrupts be disabled -
> along with adding bindings for spin_lock_irqsave/spin_lock_irqrestore().
>
> Lyude Paul (3):
>   rust: Introduce irq module
>   rust: sync: Introduce LockContainer trait
>   rust: sync: Add IrqSpinLock
>
>  rust/helpers.c                    |  14 +++++
>  rust/kernel/irq.rs                |  74 ++++++++++++++++++++++
>  rust/kernel/lib.rs                |   1 +
>  rust/kernel/sync.rs               |   3 +-
>  rust/kernel/sync/lock.rs          |  20 ++++++
>  rust/kernel/sync/lock/spinlock.rs | 101 ++++++++++++++++++++++++++++++
>  rust/kernel/sync/locked_by.rs     |  11 +++-
>  7 files changed, 221 insertions(+), 3 deletions(-)
>  create mode 100644 rust/kernel/irq.rs
>
> --
> 2.45.2

For reference, this is a pattern common in embedded rust. Example at [1].

Summary of how it works: anything that must be called in a critical
section takes a token. A function that creates a critical section
provides the token. It needs to do this in a way that the token can't
escape the CS, so typically it takes a function argument (start CS ->
call inner function with token -> end CS).

(This means nothing at runtime, it's just to ensure at compile time
that IRQs are properly handled where required).

- Trevor

[1]: https://docs.rs/critical-section/latest/critical_section/index.html
