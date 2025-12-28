Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25E720D4FC
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766920904; cv=none; b=IU3CpgKEK8u+lj7MjQKU5OC1/xaWfAbIBEif8Rjx9DzF46zGL14RN/Xjy+rL9J6TnQUoiDoTLfTiC0pJHUZOyaom4wNZdERKw4dIhfoHrIYxJNj2/FipN9lmFI+m4tPJzL2T/d9cizCdaOZjtu/3evuN+vvdZ2gvHHMEG5n0EDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766920904; c=relaxed/simple;
	bh=1G0GXGNS5IhkzeoRrFkCKG1imo+i1Rps5Rr5xdm/hkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYv08ExtZP741dEVW7J8BoX+7wsn7Xx9HVfL1mhGPbB9SGN9j6FwWYRh/EHopE2a2u5xYWL6pFqypbU2ZA55dSXR+jZ09bfp604gKvmWK3XMo3GONNKYwed142Zmg3Qi+v5fyRkV58ICS0e2CKL6h+uPQhUlfh+I/UyLTEPzuq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLfiL2SB; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLfiL2SB"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc0d28903c9so208236a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 03:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766920902; x=1767525702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G0GXGNS5IhkzeoRrFkCKG1imo+i1Rps5Rr5xdm/hkk=;
        b=NLfiL2SBIJN4Cyjn7HsLJqzOpsPvY0Z3Irigneljaw9oyTD9vlH+dDp3J62WOBETTk
         Pfmj1ay4VPlYdD5WHq7coUmCLq5AUFFeP3yGd/iVQULznPMk1f9UnkukX+hq5UkOlhru
         6mFUB/4vmCuRlKkACHeN0AYH7wX8vcmUx74s1JlgiG656qh63z/bhgiQkm3qM1ENxmZi
         lBDlo+8XRaiQqonWFnQ94D7FtX+Ez+8pI6cNUgulH1XVwZVw1b17zSQauSirlKH2Ys/j
         JPZNJBgK08YuM83yRmErai//ZNn4mb4uKXLnXXPb5nHejtCPKpp6ZUpPXmNKA/CdVNDK
         t8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766920902; x=1767525702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1G0GXGNS5IhkzeoRrFkCKG1imo+i1Rps5Rr5xdm/hkk=;
        b=fH8XaUlWuHmFV/tzDp+uuFMm2GkAaC/KHG0GTQYI6KsYDNFhSZmRBi6sTfiudgAH1M
         tR+HHIa04Ifj5GNXQqyGgnYUFrlvF8jfZlhSQs8DziLIab70VYPGXUkSalAx2jY6tv03
         qNsOhUOYjSc8tSM7cixI5hwDfyq0vZRqgaXAlefVyU50vA/tQTgE/wPD+bMsID9amAVZ
         7gYT2n6VRuHs+kAKTNJtXj3Sl8wh9bKkn4LhXkQqPH0mNCnQ/9XJgoFoT9YjlppcXWeQ
         jkqvbHwTrS+xEUZvUYQ/kQL+QILtGrAZ7M1lx77/58dDNGQLr4amLyQ1CFgwsNVK2qA9
         CJGg==
X-Forwarded-Encrypted: i=1; AJvYcCXo0YCdDSVEKxTkXVf/tajYXyGcxbyy7tVZuXwZfYULCqoSL5Wgt214kFRT+Kwlu3RyUyUKMBSbiFui+pHLbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwyde4bZUIdQC9p/15N73USk3mJ4yFl71DWcekD/eEAWvtEp8r
	OLZrHx3jboFCoKcBGuAzy0USLmDm8rI9Q6T+lTZ1OaS0zgKkpLnu/F01TMYe+oc3jzWtrR4Aibb
	58mJlLqBauATL50Cg9dDWa+3RzOb2hpc=
X-Gm-Gg: AY/fxX6weuEI3azig38Gcge3DrYTQupqFI6n4opdBx8ua7QzMsp8wrVB4nXplh56UoO
	qcnO9IPQejB8Ov1pQHuIL60JmfKuRqOa/9hNTa5EFMZIdEMQYgySm1cxP2qbDxaIdI9lnaLiwow
	jxByGB4YRWG3YqyMcdeLtZWURdxkBUozl9LQQPGQcYhrRAaJ7Dt1dUg91xj9douuHS4reoLtr+c
	e8CeATQzAhNskMF+EESrAwZI0IggA/zNhusjoDn/IjT2XorW+7snoXRXq24A55ZDprOqQmiE9/n
	oE5SiQY1fYWHusfDwU6xHOQ7WnqeMTQlG6ZRNzQYXJYPO6JhneJxjnbOhwjkIPleemj70kaJPWs
	Lm95Wc97n
X-Google-Smtp-Source: AGHT+IGPzybrsJ/R5MqAZnYz5ziIhVP7+EEAm+C2LscqS/G6XQpPCJv6+8JmPFtBxfLrMTUB7VZnCNQOVRewt3C+7Aw=
X-Received: by 2002:a05:7300:fc13:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b05ec3dc45mr11312670eec.4.1766920901908; Sun, 28 Dec 2025
 03:21:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
 <20251216-soc-bindings-v3-1-42ecdc8c117e@google.com> <DF050MST4PTF.DFB7FVBD25I7@nvidia.com>
 <CAGSQo0173bon2kGo5wGFXo-1x+LL1NpH376Z4GcshKaGVNLHXw@mail.gmail.com> <CAGSQo01XL73n7rjst-YYoOpGEv4rB9C6dv5k8uSEgL2QY3YC3A@mail.gmail.com>
In-Reply-To: <CAGSQo01XL73n7rjst-YYoOpGEv4rB9C6dv5k8uSEgL2QY3YC3A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Dec 2025 12:21:28 +0100
X-Gm-Features: AQt7F2peXUyxpueTxU1aObKrRipfFx6JtVYVK8zvIVFJqBo1ECG1UCx-PS6lFzQ
Message-ID: <CANiq72mNuWE_K128Ona03PATjFkSX3y7R-yjw3G0iOBQ+p+WRw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: Add soc_device support
To: Matthew Maurer <mmaurer@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 8:38=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> I don't think I should do this unless there's some kernel-specific
> style guidance I'm unaware of (I checked and couldn't find anything,
> but maybe I missed something):

So we don't require private docs, but developers are always welcome to
add them. It really depends on a case-by-case basis: sometimes docs
are really needed, even if private, and other times not so much. Thus,
so far, I considered it was best to leave it to the developer and see
how code evolves.

In the future, the value/benefit of private docs may increase: I would
like to have a runtime toggle for the user that shows/hides private
and/or hidden items in the rendered docs, thus treating them as
first-class docs (including e.g. checking their intra-doc links work).
Upstream `rustdoc` seems to like the idea and even they even
implemented a draft of it (see
https://github.com/Rust-for-Linux/linux/issues/350 -> "private/hidden
items").

Comments vs. docs is an orthogonal part of this, and indeed, we use
comments for implementation-oriented things, and docs for the users
(and mixing them in the same place is also OK -- there is an example
of that in our guidelines that I wrote for clarity). There are some
exceptions and cases where it is reasonable to have either position
but, generally, we should avoid aim to avoid details that are clearly
implementation details in code documentation and vice versa.

As a rule of thumb: if a Rust item would have needed good docs to be
understandable if it were public (or became public later on), then it
should also have those docs even if it is private.

Cheers,
Miguel
