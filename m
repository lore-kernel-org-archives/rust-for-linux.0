Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67571684B4
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316686; cv=none; b=WYrTa6C2BmZ1MOYj2JLg+1uYVUX7/EYxdWExeSpPKg6hZuA26org0qQX2v+0jsp31sOymQKnagr9nWKtuzbJ9O+CQNtkarB6OZYcd+UgDGH8YG6NNRjouRF+9hekb1rogi0wD8dl8t5NNV3DNBpBkXYir9imnS/T8ScozaaJNxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316686; c=relaxed/simple;
	bh=fpRBWTcfBcpWvgwaOUZsKUEPhkvG3EBOGd5gxAKARUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gW2CerTnXj++d62G0tnHclmmXOrn9cchWfhUjS1jt7LPDM05g2vXS1UU4JG66C6oABgZW1nvyEXlgthAS0SiVjEBOIiW1N3ScAUgtWwEE7NycwG5W+76+wAwFf/WqkciB+9aClXd7xe9VfDwCwfb1hw9nhskaDpZ5mAu8ff0mmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uNwFeLgy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uNwFeLgy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so54356735e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 01:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731316683; x=1731921483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKayKqe0eF6kfNbNPuDxNX2WdU2cinAgyH6KWYYcC+I=;
        b=uNwFeLgyp0NGRj0GV0tSTKv7R+CvtXucEpVbOVDSWPJWCxjVl5kBzcMzlKUMf40Svm
         +/0xl8PEUDWjykmsg/KP9lo+IsBYxXWpUwlHfZbKBApR4+t2IPRJ/B10cDFq9qqiQgXm
         lOG8Z7a+noFQKyWbjkmNE3fzDpNdxkj9TV3/U2wGvoqvhuvleNxqcnz7GRUSTS6w03Ex
         2l0qtHNEULRdofFE0IjPH25PNneqMMZwLj9dejWREH7ytpWd+Rku/SfTqjzV52Xpxqss
         yKHwf0+PA0jshJ+oYgY2YE2Anju61tEDWAM1MtGvXiq/7dLjmxeIvAtlMJ5UI3OpptAJ
         rbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316683; x=1731921483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKayKqe0eF6kfNbNPuDxNX2WdU2cinAgyH6KWYYcC+I=;
        b=CahhUzy+x+Wf86VsMUt7GOwbjlU4omCVfNnOqYVziq/gg6NQihnU4fVfXEwvuABhAV
         IWg76qB9zKhCHfQKBfoVkFc/gE4vNXsiUE2C0LIMbGI7V41zV9XRskJfr3RU5duxopNi
         vFp8nAZfyT8VLetqZRVaf4xIP9vV74AH0d9esE//p2OsSdgumE463uKbaj1V4fL1ByLz
         fli45CjWkOyPOIwjheuE1eu3/ovFwjrh2lA9jU18p/3qmMRBdfhcNZGmovKGIUmIFl0I
         SCcM6M57h1YRD2F1cz+7aBGpN4mc0FyXxfUXhJ3J/kUw2+/t02xvTFAukxqaQEYDEqDG
         rljw==
X-Forwarded-Encrypted: i=1; AJvYcCUvpFwU8n1Y5rant/68sh633yhOK57xQh+piClr1N05BqoJka6kEVRjomJQQGhaMKJM+yXOwzh89PuRpdnRdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyz6cS3r83uoD0pD+vSos1JwdzErOCdIOp9pNpnhJg0PH6HCr
	6yVbCGBM9/q2BohHmNRhIRXrbAGpkdxDynCAfuFncYcFwenq5oFifpJgXOajJoASD3/Cu/5Z0kn
	NUnsIWhA252LDYWnEZDz3+2kHMG51bTm6D/Z9
X-Google-Smtp-Source: AGHT+IFPKR4x4qGQw2V4rryFkjOlFT35qG95EmKqwpBTLjjALKsoKYDYaWMnQWMphPcvbytNjBYTzokRNezxgdYrVh0=
X-Received: by 2002:a05:6000:385:b0:37d:4a16:81d7 with SMTP id
 ffacd0b85a97d-381f1866abfmr11785905f8f.8.1731316683039; Mon, 11 Nov 2024
 01:18:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
 <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io> <Zy_oj_k-qUPLSVEr@tardis.local>
In-Reply-To: <Zy_oj_k-qUPLSVEr@tardis.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Nov 2024 10:17:49 +0100
Message-ID: <CAH5fLggOJ1QMdzS=hp+wEGDSKEMFuCh=VPSga5jRy=F+knKE=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: print: Add do_once_lite macro
To: Boqun Feng <boqun.feng@gmail.com>
Cc: jens.korinth@tuta.io, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 11:56=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hi Jens,
>
> Thanks for working on this!
>
> On Sat, Nov 09, 2024 at 09:30:07PM +0100, Jens Korinth via B4 Relay wrote=
:
> > From: Jens Korinth <jens.korinth@tuta.io>
> >
> > Add do_once_lite macro that executes code only once.
> > Has two rules, one with a condition to replace [`do_once_lite_if`] in
> > the kernel, and one without.
> >
>
> Instead of a do_once_lite macro, I suggest that we implement a `Once`
> type similar to the std one [1]. "Doing something once" doesn't need to
> be implemented as a macro or relying the static memory allocation. I've
> checked the usage of section ".data.once", it's only used for reset
> WARN_*ONCE() state (see clear_warn_once_set()), so we can have an `Once`
> implementation, and mark it as `.data.once` link section in
> `pr_*_once!()` like:
>
>         macro_rules! pr_warn_once (
>             ($($arg:tt)*) =3D> {{
>                 #[link_section =3D ".data.once"]
>                 static ONCE: Once =3D Once::new();
>
>                 ONCE.call_once(|| { $crate::pr_warn!($($arg)*) });
>             }}
>         );
>
> With this `Once` type, we can do other things like waiting for some
> initialization to finish. We can put the waiting as a future work, since
> `pr_*_once!()` don't need it.
>
> Thoughts?

Using a Once type for this seems like a good idea to me. Of course it
requires that Once has the right memory representation so that putting
it in .data.once is valid, but that doesn't seem like a big issue.

> Another meta comment is the usage of `AtomicBool`, please see the LKMM
> atomic patchset [2]. In short, we won't use core::sync atomics in
> kernel, instead we can only use the atomics implemented by ourselves.
> And we currently don't support `Atomic<u8>`, there requires some work to
> get that done.
>
> The other thing of using `AtomicBool` is that it's not the most
> space-efficient way for `Once` (if xchg() is used) on all the archs that
> support Rust in kernel. RISCV doesn't has a byte-wise swap, so the
> implementation has to simulate with a 32-bit or 64-bit swap + mask,
> that'll be totally 5 instructions, and each instruction take 4 bytes. As
> a result, if the `swap()` is inlined (which most atomic operations would
> be for performance reasons), you save 3 bytes by using `AtomicBool`
> other than `AtomicI32` at data section, but you pay 4*4 extra bytes at
> the instruction section compared to using `AtomicI32`.
>
> The solution could be: 1) forcing the `swap()` to be a outline function
> call, or 2) using i32 insteal of bool for `Once` on RISCV. Either way,
> I would like to see this being taken care of, and you could share some
> results of the space cost from the solution you finally use. Thanks!

One advantage of using a Once type is that we can use
core::sync::atomic until we have working LKMM atomics and then we just
swap out the Once type without having to modify the warn_once
abstractions.

Alice
