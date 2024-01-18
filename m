Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B092620FB
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 01:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705540696; cv=none; b=qYQBP4gZNHIm7u8X79nOW3Yc2azUdqUDdw8mMxljnGtwfdzd0okMdhQShZ248uC+X3wvmzNh375EL+n3ct1ZLr+AkYtxnShEBQAUtUB5NbcQEbdKI1NXYJyoAGqaSDd0KPzUnID3/+vY0r15o8O42HzLbd6/tcJspAMrMuoNGbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705540696; c=relaxed/simple;
	bh=u/YnBkW6zd6R6ZWQMtZLf8qbt6kTXp+PIIhG4J4cvFo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=n1m0PRsWSvwhkOx8GedutjqJ7lwNaslSdL/EqR1KLDAEzgoc6o+18ah/K+ESgLtlJLHSjmZpU7+MKP+VVZpA0t/nfGkaGbc5EDC3Cc0XV5mvk92CDaw7pFLD7hV6ynESrDvkOXhaj9S5SjmhW47kpA6pfyE2cIGsSgs/KRP6DBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=T+XjZGVY; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="T+XjZGVY"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5f15a1052b3so108047967b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 17:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705540693; x=1706145493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AX4LbV5uPhoJXb6NYoB1tT93xN7GEGSEV+S3853JSk=;
        b=T+XjZGVYjSxTqlXj+Tf/GjYdolAKWrMHiZ5cye0PzggZV6VIEYM67AASUWC21pSkDQ
         sr11f54qTIE0PZLUCFEkT0wNJqlX0bgeNAGxgfhrvLE0+dRGPKEI1+6iymxGla9kkax5
         KCnAtI4SbdIoJZT5bIirbrpNZR770BKKHFgYXZ52kirqPefOSHvGVATUaq7nW6IqewFA
         IZXM/Y3kIWDWHnzLZ3lE8VeOqKBR9pfjjQhoQsUf3XUt/kITzaBI0O/n3EcW90OQ1rd0
         LR13MSAI90hZO1AU2hoUnjGQ/oD9ZkG3RQCXtqy4cSuSUbiOyY8otj7INpd5OShakKx8
         JowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705540693; x=1706145493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AX4LbV5uPhoJXb6NYoB1tT93xN7GEGSEV+S3853JSk=;
        b=GWr7IjnulGNRTjFSxApeLxqLiedmHseOZCZRUWTMiygvCvvGA7P3KLMNC4siZ6uaoh
         RomAO6lo4P1gpfhYY78jx845DL/VpkL7JZP6YrtzoCSuXBoEs6icaYNBhc15IKK+xXhb
         TvzDQ3DSnPqsPWoE3qiiPl3jtiRPj9IcPTmMQqPDuFIoO2oNDTZZFKTnjb0iqzxvMH1M
         qE7oBFtntwmlU/tqwknFdzhEKSOiK08Z2to5YSfo8TdjHPvVNF/GQsEeZlwO8Y+MR1JE
         2HsQsSmZcnYdZ6hFnkxw84HPtx0hQzyMR4xpjkIKVwoyLOHUcG9UnlPfi0Ol1OMkFa4m
         XylQ==
X-Gm-Message-State: AOJu0YxRLNfJ8OQ/EeFHHLAtgsQ7ujEmFqXg7sJLDKhKhyi//LH+1QSw
	eHlQMx4IHDw+2ENEtfQ1a8sdV8YkiJ3wjsulIWvMOD6635ZttJcslm1NNtOIA9Pd/2yJD6gZ3Ac
	Jc5qyQTrrzVkHaSKjzJDqQbdPi/rT5nA71XUwBg==
X-Google-Smtp-Source: AGHT+IE9SXjQc3NJI5V1qcE7/qqHNEw+hj9SYk8h0/c1Pjl7fy1Fa5puOYV/Dh6ZNjyy3WqXPcLcBftA5DUg5Sdfep8=
X-Received: by 2002:a0d:ea0d:0:b0:5ff:5fe5:407a with SMTP id
 t13-20020a0dea0d000000b005ff5fe5407amr88472ywe.86.1705540693724; Wed, 17 Jan
 2024 17:18:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240117001613.169177-1-kernel@valentinobst.de>
In-Reply-To: <20240117001613.169177-1-kernel@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 20:18:02 -0500
Message-ID: <CALNs47sg6Y5FmHi4tyJbkK7Kxn1xYzSQta026YpY56qNRfpbAw@mail.gmail.com>
Subject: Re: [PATCH 13/13] rust: locked_by: shorten doclink preview
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 7:17=E2=80=AFPM Valentin Obst <kernel@valentinobst.=
de> wrote:
>
> Increases readability by removing `super::` from the link preview
> text.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> ---
>  rust/kernel/sync/locked_by.rs | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/sync/locked_by.rs b/rust/kernel/sync/locked_by.r=
s
> index b17ee5cd98f3..22c38993bf63 100644
> --- a/rust/kernel/sync/locked_by.rs
> +++ b/rust/kernel/sync/locked_by.rs
> @@ -9,7 +9,7 @@
>  /// Allows access to some data to be serialised by a lock that does not =
wrap it.
>  ///
>  /// In most cases, data protected by a lock is wrapped by the appropriat=
e lock type, e.g.,
> -/// [`super::Mutex`] or [`super::SpinLock`]. [`LockedBy`] is meant for c=
ases when this is not
> +/// [`Mutex`] or [`SpinLock`]. [`LockedBy`] is meant for cases when this=
 is not
>  /// possible. For example, if a container has a lock and some data in th=
e contained elements needs
>  /// to be protected by the same lock.
>  ///
> @@ -17,6 +17,9 @@
>  /// when the caller shows evidence that the 'external' lock is locked. I=
t panics if the evidence
>  /// refers to the wrong instance of the lock.
>  ///
> +/// [`Mutex`]: super::Mutex
> +/// [`SpinLock`]: super::SpinLock
> +///
>  /// # Examples
>  ///
>  /// The following is an example for illustrative purposes: `InnerDirecto=
ry::bytes_used` is an
> --
> 2.43.0
>
>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
