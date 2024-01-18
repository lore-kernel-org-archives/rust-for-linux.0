Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD6146A8
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 01:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705542152; cv=none; b=lwzrpNfb6w5iqamGdE27XciLOnEQD+WjXaNqE1rjU/VYFVmQb5B72jJIsOPj/uBKE4p2nsSLxweP3f8SxT2iAqoP0DNbJ6AqZGfj51vII1tH4IXEXbSleekv/ftMucMRbbZqhBScC8Il4rntToWLIoi/yNXNIC5WStKjoKnJL2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705542152; c=relaxed/simple;
	bh=xlj2RHPaLDfZVJ5y56EGliycY2/ix8XuMk1/vpmzkzs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=K8JX3IQN2u9j4XvRo9nL72EwKcISZAGngiLviIgbEE/MNMgBHXB0196SC2kRTogbHyawosYYgWfnyCHEmkAgT3nK4LLKGTL74sm+Z/OrszutZ0OS2N8R7mugaFMshelAxF1Lov4ta21GotkrFQS6iOrFp59yocrwL/EbOnTwmXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=V8N2lGdo; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="V8N2lGdo"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5f68af028afso101135467b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 17:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705542149; x=1706146949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKVfUfnLIMhvvHy1U73q9X8dV57+YjQh0Y8dDSP0oFM=;
        b=V8N2lGdo6ure/t/Ux47MjY5YZUHD0MTR5j16ffsHH3Zg63896U7cyzptu2Y8ZRqm/2
         RznjGo7grxnHwSeS3oGtn2qJLBme0D6zSDRRoNq4hI+FGjzlKJ37UZfpjDmG44vCtpi6
         Z5Ba7RDarqXh60ku8xRfUJiGcSMhxmR792Fyai+7aSvfXVN386KNFDJWmKc5un+Pmp79
         +FE/RblqKFpwBEfUmHZeU2otP2SxGL1K7DH530zwx7i5PunQDgZFD+ZqCrT8buSNuvrX
         ZI5ut7LWjCw4NxXh/ZE8ZCkoqkxbGgTQ2/FXxye/439pnKH1bBCh3co1tdWd2fxpQyzx
         wE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705542149; x=1706146949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKVfUfnLIMhvvHy1U73q9X8dV57+YjQh0Y8dDSP0oFM=;
        b=sYqjcBfA0qfjiqrnpSFSqTAh1B8/lwOTH0iikdhEV4f94yowpnEp62iBA+QcmWaXw6
         8nsrx70274s8Nes6DZiGalSg1L+ZfbG3QRX3AZ+OUD1LUq5AE3rVOGBFAsyQxaehterE
         KEd7uVmtEFICE903mIFTgJdzcLFtyBlFjQEm7UvkCHwEhQtO5710fX0J07JhTv1IqAXV
         2QU1A2x7dJtbUcK1o04iJdTIPX35L35CWO0CA/qtYf3efBCDfxLxMOyS7qlxywH2dZME
         Dsj/jrd9qPFc3YHcYAMX8Dlv/8Xh7UYrJL8jNr13kzRrCB7wnoMDWmRNAG+xVnyHG7c4
         G9jA==
X-Gm-Message-State: AOJu0Yyt+H4vJ8U5yq0Wh0mp8b5s1lzcyG+OtEtVMm+pfxsaRv8oO1s1
	cAwQZ/3sa7NBQQEDKh7nDqFzsjX42Tv0QPNX7G/U5AzPJWwWyyFfTyNgKvlOmB52U199FokyfnC
	1EvKHIUR3EKnHhxhdUQdYwzE0GwJu2V3MTSmWfA==
X-Google-Smtp-Source: AGHT+IHzLskp3+LbSdEXItZfIpAuNLP0Q+26nlC7cFZ3ZCXbjl0VhD1AurNW479ztW9FR626TmuVrn9fIr4DRhfwg84=
X-Received: by 2002:a81:6c04:0:b0:5f8:5068:7645 with SMTP id
 h4-20020a816c04000000b005f850687645mr89906ywc.82.1705542149056; Wed, 17 Jan
 2024 17:42:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240116231106.168864-1-kernel@valentinobst.de>
In-Reply-To: <20240116231106.168864-1-kernel@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 20:42:17 -0500
Message-ID: <CALNs47tWivxJhqjC-L8rLQKP420y1zCgCiHSZc5JPNbCVpwxgw@mail.gmail.com>
Subject: Re: [PATCH 10/13] rust: kernel: add doclinks
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 6:11=E2=80=AFPM Valentin Obst <kernel@valentinobst.=
de> wrote:
>
> Add doclinks to existing documentation.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> ---
>  rust/kernel/sync/arc.rs  |  6 +++---
>  rust/kernel/sync/lock.rs | 13 +++++++++---
>  rust/kernel/workqueue.rs | 45 ++++++++++++++++++++++++----------------
>  3 files changed, 40 insertions(+), 24 deletions(-)
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 6c46b1affca5..936bc549a082 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -365,12 +365,12 @@ fn from(item: Pin<UniqueArc<T>>) -> Self {
>  /// A borrowed reference to an [`Arc`] instance.
>  ///
>  /// For cases when one doesn't ever need to increment the refcount on th=
e allocation, it is simpler
> -/// to use just `&T`, which we can trivially get from an `Arc<T>` instan=
ce.
> +/// to use just `&T`, which we can trivially get from an [`Arc<T>`] inst=
ance.
>  ///
>  /// However, when one may need to increment the refcount, it is preferab=
le to use an `ArcBorrow<T>`
>  /// over `&Arc<T>` because the latter results in a double-indirection: a=
 pointer (shared reference)
> -/// to a pointer (`Arc<T>`) to the object (`T`). An [`ArcBorrow`] elimin=
ates this double
> -/// indirection while still allowing one to increment the refcount and g=
etting an `Arc<T>` when/if
> +/// to a pointer ([`Arc<T>`]) to the object (`T`). An [`ArcBorrow`] elim=
inates this double
> +/// indirection while still allowing one to increment the refcount and g=
etting an [`Arc<T>`] when/if
>  /// needed.

I think it is usually okay to only link the first usage in a section
or paragraph. No harm having more of course.

>  /// # Invariants
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 467249b39f71..f14179d19d4e 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -21,14 +21,21 @@
>  /// # Safety
>  ///
>  /// - Implementers must ensure that only one thread/CPU may access the p=
rotected data once the lock
> -/// is owned, that is, between calls to `lock` and `unlock`.
> -/// - Implementers must also ensure that `relock` uses the same locking =
method as the original
> +/// is owned, that is, between calls to [`lock`] and [`unlock`].
> +/// - Implementers must also ensure that [`relock`] uses the same lockin=
g method as the original
>  /// lock operation.

The second lines of these list items should probably be indented
(doesn't have to be in this patch).

> [...]
> @@ -290,10 +294,11 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> S=
elf::EnqueueOutput
>
>  /// Defines the method that should be called directly when a work item i=
s executed.
>  ///
> -/// This trait is implemented by `Pin<Box<T>>` and `Arc<T>`, and is main=
ly intended to be
> +/// This trait is implemented by `Pin<Box<T>>` and [`Arc<T>`], and is ma=
inly intended to be

`Pin` could be linked too.

> [...]

Just a few nits for this one, nothing blocking.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
