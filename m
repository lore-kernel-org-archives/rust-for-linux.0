Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894051F2377
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737466403; cv=none; b=Ss/K9Cu/kc5WKGHrTg1Eukp1zmQ0701VBmtl5RBwi6Rb/PmhHZ0LNqS4R2QTGo8RA+XCO772m1nF2L/AWfc+dCtmN0mIMUVor66OEV7QeXkRsgBVerNXY039qr0PN/WrNtPxS1Ldl9QfqK0DvP0PnrVD55cgRmxtbha9yveYZvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737466403; c=relaxed/simple;
	bh=bi8cXuWVPDpPHQBz/h7dHnVaD9mMJjuORAGTH5wHL6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEg/5XhhndZ/4WVb4jZ1rIX3FLqYLZRSgFVP3fv47qmfiWOSX2/e8fo8JyjRhtDSwPR7BM1pUbo32b5dr6RSvzILh2czeh1FZfCLQf4IwwHQJuU3tNP91ef7jZbPx3Ql+TUTcNHFNbSWZJoO+EkzxhsB1dQ1LoSpB2+EmXTNOh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B/Lahq6L; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B/Lahq6L"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361815b96cso39330065e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 05:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737466400; x=1738071200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdMyeDDrZAaJ9r0+3QYMEigqW8uSuG5uFiUq5gIBSP8=;
        b=B/Lahq6LjDaRSm3q01FcuNsmmT6vxSOUI5mW7zHObrMyhX9UuAonY3UpF9AgxElkjE
         snUJGDyKAuFC/xhCT2lvWLzC4tEQFEiB0Eu+JUmbDZPKtNnmksDgvni/hKnee5B+rdRB
         DcRTGmHRBtZ0ljDTLjj2NuyhxuRzp6gc8W58rqViuaNRNrnlRx0Nji9rJYNecWNCGQrW
         DJ6GxgvvHpH7t3kFSQbxH42NrojSAOUcVWsvYUfqLLKPYqQCwa0Fuy9rpRg1hJ/z7bgc
         nsAYR10DvWv9P4p/oCI0OdrEV1pyHJnX8bs0NBsFEcOCLkaNz99ZvxeRrZzYSJEbBRG2
         P7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737466400; x=1738071200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdMyeDDrZAaJ9r0+3QYMEigqW8uSuG5uFiUq5gIBSP8=;
        b=ZKGZwZ8t9iDBJl+0wt/dqfK0N0MLHhEX8dKIklSYcLKMkYFOL5B6UAt4p8wtF04Ivy
         Vec0cmuhdG22peT7iEAmor7JB7tmZJoU7spEZR/OsVnnn/iJ6z2PEWR5xTrAhiQM+oeF
         NyvTq+HhAvCCzo0vKB9VJdIDozYD7SSrgEx7/OnA/o0VRmcZSMsyEG9RGQ0Mu7Wi+VLW
         fHWo0g5Ep4s74YsP6O8cqyEbXLHYRuDyee4S2/X515IuHrndiLuCInkDJcjDkLEkC7PT
         tTx6VtX0YqV26G7BoPrR1Hyh8jJu/ze2LF/f47+EcrNpYV+1LvsSN09w5KaKAmdt+z2i
         tBXw==
X-Forwarded-Encrypted: i=1; AJvYcCWQoavCGG8VHD8TjQV0xCB9pGbobrGJ13GgvP3BcYei7SfTxI0z6K1e1oZ/5XWqEoObbhZVj2vs78HrfeQR3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnSdeo5Hj+okKmkDWaoZBR2Ywpb12M3p1duO0Fu6e4ntJOxKoP
	oczaX2UrxGQqv1QjSqT8Ros6KkpetbePBfsrWl7o8+cEA9eQTqqXcnyg8fm27fU/y1fcQXB8YaC
	HYCDywNpRJ6RWhdaR6FClqt6b0pTFLgm91/4Q
X-Gm-Gg: ASbGncuU90NKrxOmmz7Or7vdxbUAxLAPfskwWGmCu8qCoemuuJ6MSPiqpogESM52WWY
	lk3XcGpDCVzFPfYnQuvZ7I8uy84yfA4+ygS40xI0XgA08LaOQVt9nl0pCsJeQWsnyJvMOFY43EJ
	b2MB7CUg==
X-Google-Smtp-Source: AGHT+IEqPZW7t9yk5EgfCWaSFiso+gq0rFejDQVsC8PGTR6ehVaTYrUW2+ctXC3PXe6cI+8RBsp8LtD4COyeP7z+lsw=
X-Received: by 2002:adf:a343:0:b0:385:fcfb:8d4f with SMTP id
 ffacd0b85a97d-38bf5788966mr13145315f8f.21.1737466399732; Tue, 21 Jan 2025
 05:33:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org> <20250110-hrtimer-v3-v6-12-rc2-v6-2-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-2-f71d50f16482@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 21 Jan 2025 14:33:08 +0100
X-Gm-Features: AbW1kvYm_QanL85Bby6kprJ-twMdYP8QPc_qcSqaB5AswNjGGhZ-SWyabRSN-5g
Message-ID: <CAH5fLgg=Ub8gA4c+RDATVkcPcWSe+61Agyi5zje5uEeaOA4Rcw@mail.gmail.com>
Subject: Re: [PATCH v6 02/14] rust: hrtimer: introduce hrtimer support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 9:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> This patch adds support for intrusive use of the hrtimer system. For now,
> only one timer can be embedded in a Rust struct.
>
> The hrtimer Rust API is based on the intrusive style pattern introduced b=
y
> the Rust workqueue API.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> +/// A timer backed by a C `struct hrtimer`.
> +///
> +/// # Invariants
> +///
> +/// * `self.timer` is initialized by `bindings::hrtimer_setup`.
> +#[pin_data]
> +#[repr(C)]
> +pub struct HrTimer<U> {

nit: We usually use repr(transparent) instead.

> +    #[pin]
> +    timer: Opaque<bindings::hrtimer>,
> +    _t: PhantomData<U>,
> +}
> +
> +// SAFETY: A `HrTimer` can be moved to other threads and used/dropped fr=
om there.
> +unsafe impl<U> Send for HrTimer<U> {}
> +
> +// SAFETY: Timer operations are locked on C side, so it is safe to opera=
te on a
> +// timer from multiple threads
> +unsafe impl<U> Sync for HrTimer<U> {}
> +
> +impl<T> HrTimer<T> {

You are inconsistent with whether the generic parameter is called T or U.

Alice
