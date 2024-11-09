Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ED4141987
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Nov 2024 20:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731184918; cv=none; b=XQ/O2uZ09yHINRKHq3Jt/4NDgT2iLxIHz0H7Lnh6feJzXtI2THTeH4MTC53OLoN1v4owO/SZNVcjpcpkonoBYftxy6AGX0wmGXmkgQV9YXxWzgEkggNWJ7cbgUbD+rRkltNZjXXpelA1raGelm+6PMkv6DoTdQi8xlhxrGXooQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731184918; c=relaxed/simple;
	bh=dojk5YEYK/08TiqjtJs9/ARe4B/76OZTUSWgqbZano8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYnD23J6q7tgOz0Tb0tY0Nn4i2t4jv4tvG/JB6CDZmuUQKCBj6gZWiGMut7GiD6n/3J/khomUNFdhibIYhEeufHgrBWroxc2L5GpnGSj+iQXnbfCfUWq4zHJoRq/oPGCozFKmgVpdZfpt4XA24X+FLnkTY8WmwUiAUsFbVRcDoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/V/ZoSH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/V/ZoSH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2a96b242cso476154a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 09 Nov 2024 12:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731184917; x=1731789717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tc+cXpuAksyH8B2EiVCDJw2BCa0XNKDlH6wylZLk2Rg=;
        b=O/V/ZoSH3zrJwXf9oBpOle+8upln+n+UNGXSnuS0btIkWb7VovAMTVgb4c5/RyQhM1
         KtRw4MsevqHuPrvBw3QMvkgmJRTD8zRAt2k+IjmZLXn43P/HQR7/YnkO04k4QsGsBXCD
         XmZ4KtGTrKayTsZ8+Ah2D1khFfLmSLWlkE1BxoIzhHyoDMYMWykcvTqk5KNImlslGhM1
         cvNz2qBdqeQdyr3dHvemr0wnLkGEmyuPlSOGBWaC3cwAYY+0ea5fCiqrZeTNlohjl+yD
         Q4pt4Jefyz+UHt2cpkzYcJJ7q3hai2ZBfXV2hOrEsR/TXFN43IPxtRkqvZWOjVGcnXUP
         G26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731184917; x=1731789717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tc+cXpuAksyH8B2EiVCDJw2BCa0XNKDlH6wylZLk2Rg=;
        b=A9Hbs+7Jux65m0JcfCNB7/O+UuWfbvpNyXrWopSOL6c+WW2yMuH6/5BwM73M4Y7Iyu
         X1F8+mKEoDli3CWnH/YhrMD+ioQD54ofyq6XiEC8oDeoD8d6/H8bVngLbYkVO2hCw5bT
         aVxNyGcti8jrjqabq7iJJgj6ogJFkYDUlwswdKfBGIsvRQu8QvH37GuuS61eGail0/ty
         lQVg6cNx/Iu2eGpsN28bGwk09IeJL1xuHXWSkwrZrzXswGU4sxSLA+LyToVUbc8x0rnn
         ZbW6uPqZOH+XVBAs8q/aaxqjEUdB05QhdZl/PsOsHN/sI0hFkhcKf8LiP3POyTw9vWU2
         Gx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3w5jT1EYa+f1YpBfEhq6H7P1o/tT6B5DmIo6z18NDTZKSrVyIWH31GOdyFkkT/03sSdGRKUfeAJrWAz+2Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyZG/c+3J/iVzRW0GKHdY/rSscb1ulQlVML5Qlitxfbl0YE0KL
	J8HvRvbS4PhGBa/irgiMsMatmfO8+ltmoQC2M78p+wONGdWZnjvB6vvKy/L1jiY9HjBqMU36l9r
	txD5+O53mjDIoG0wjeX0Za1w6How=
X-Google-Smtp-Source: AGHT+IHNvQdS5HNflzW2Vb1p0TZDaBxjIRvd/2VFIapVZ8JTgjLHY9+QEZ98r1GHZ7lIj+K2pGgQMnPteB+NkqmqiUU=
X-Received: by 2002:a17:90b:1e0f:b0:2e2:da69:e3fa with SMTP id
 98e67ed59e1d1-2e9b167fe26mr4320221a91.2.1731184916661; Sat, 09 Nov 2024
 12:41:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io> <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io>
In-Reply-To: <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 9 Nov 2024 21:41:43 +0100
Message-ID: <CANiq72kUAOX5girN+07e+R0OHuwJX_XRJCW0yQPpbBLmaP0wng@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: print: Add do_once_lite macro
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 9:30=E2=80=AFPM Jens Korinth via B4 Relay
<devnull+jens.korinth.tuta.io@kernel.org> wrote:
>
> Add do_once_lite macro that executes code only once.
> Has two rules, one with a condition to replace [`do_once_lite_if`] in
> the kernel, and one without.

It is fine using Markdown in commit messages (personally, I think it
is nice for Rust-related commits), but if you do so, please use it
consistently (e.g. backticks on the first line: "Add do_once_lite
macro...").

In addition, the intra-doc link does not really work in commit
messages :) You probably want to either remove the link, or use an
actual Link: tag, e.g.

    ...to replace `do_once_lite_if` [0] in...
    ...
    Link: https://... [0]

> +/// Equivalent to the kernel's [`do_once_lite_if`] macro when called wit=
h
> +/// a condition expression.
> +/// Public but hidden since it should only be used from public macros.

Paragraphs should have an empty line between them. It does not matter
much if the docs are not generated, but still, we should try to write
them correctly even then.

> +/// ```
> +/// kernel::do_once_lite!(pr_warn!("warn once"));
> +/// kernel::do_once_lite!({ /* perform_complex_test() */ true }, pr_warn=
!("warn only once"));
> +/// ```

Since we will have `pr_warn_once!` for this, could we perhaps come up
with another example? i.e. to avoid users thinking that they should
use it this way.

Also, you could use `assert*!` (possibly hidden, depending on what you
want the user to see) since it doubles as a test.

> +#[doc(hidden)]

Do we want it to be hidden? I guess this could be useful for other
abstractions etc.

In addition, if we unhide it, should we move it into its own file?
Just like C has `once_lite.h` etc.

Thanks!

Cheers,
Miguel
