Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2E876026
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763948927; cv=none; b=B6mRfOQ3crrTTLU55YCv3+C9M0HgtglVQUO8bj6ee07MwAk1hQr+4kneD4r0rQ97+Cq5uHq69fUueL6F4LGdvkqyZmhoYv+GCyBzKpXNYZsYIqn5vSwdYE6+yOiDYHPt0IUgqI3S0pdMHWB+wBf73NeyzseRCVsHfB+JgT7LB9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763948927; c=relaxed/simple;
	bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLC9RC7Q8+nQWmWZYRqsn58ELqluDVN+sYjPRzVi75jX6M8uTIx3f6jtA7Tre/2PERKCG0vHHo+ccf4oibCEXuYqtnjWCLjjtJ9DqFeTln7IGYnKt7WilCHvul4Hyef+1VFatxZrG96HpbFhZFCCJbqQwif0Vii3NGz4LwCTx4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+R7KS+c; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+R7KS+c"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc0d28903c9so413494a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 17:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763948925; x=1764553725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
        b=Z+R7KS+cp0DR0Si5CVWNw1LJqMRci2Rw8vcCRU88AxxAFN0VMeXicm2mvXI0DanGB8
         eqL4+6PRMk4mBA60h+Tx8JlEi9hHsc+UV+6dbEciHT0/bYQOrPmGtOO+Xi6bs8DKpOYj
         R6H4XVCUx1YWY5PLFkdVeyEBb9utxEGCYKP6y1N0Eua5LJQSFLNon32Pk/WVdEMdqypK
         VvP5wg6eqIBQ9TWEAgi10Mrb4nJp5FTvzgIP/6elr1ibBfssHy210PKveWa4XupXH4OQ
         jwrWahH+DqA3rjGyzkEKuOgOcoRM9oFW3dRsp/VvCoUoZWYMqH6l98+VLxf09buuxfOw
         NQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763948925; x=1764553725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
        b=csL5ME/pqh+aydG9WaSW/whaFS14pxPAQJX7XHuBpNaGTuViSvzemW9Re7tjAMBnV5
         G97Jspz0c0o2LNRsjKxX4ZObUR08XR3ihFZ7IY7k3DpCLq8CaKIXZ8vSPxOEZEAFjsvI
         9FQHmErR8o8r9JwUYaTYUtrOa6zthpgP1zLYje0IIiAyUghfYRt5IbDf8dm5PKwD/UwB
         Cmb6J1s0TNr4xE3doGJ3DhPuuBHNkjBiQ1qFDzyErB6wHiYkmjdRRN8gERgsb88UOPVw
         4EEEbfe+tYA/4RYjAboreQ5CSOT83TvhcM8SnA5wiA51oNLbb0U0EduyC34W/D5cJhvc
         rhVg==
X-Forwarded-Encrypted: i=1; AJvYcCUHlr34HiW4+2Pb9uLnpaCfvSdQq3SaQGrk77ozPtmtdI2GIxVmyH7qnapmYNLFV8+zf/RVcYVwkWGl1+p3ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9rVFNqoi605Va4Dpp7tXv/vkXLFj4/LXw0HYFV7jDS1loHjPn
	rxNjs9ONzkFfEiLT92+RBfC0eZdRDwZu6e4uvyDP4OSSs3P5ib+Z5AoQtuh/0pWZPx+kqlUBqYa
	7XcBXRgEtbhjWigqRa/BewJ4NELaOXSc=
X-Gm-Gg: ASbGncvQWvmz9Q1w9JQIyQzxjJIeN9BfydPBDf6M1Euq5D2F4gjOWcRbr7JgigIV9T0
	Yp8QM2fiETZfYI4p257h5wIpLevUSNxqTs85z5YmCS0C07nN5insvJ1/nC6Z9yyFUH7aiLRuZd0
	OyO9aOeUoDU3VSWCovq/kpw5Vg0MhJAyZHvVRINSB50kVsGswEs8iNjLFMsgILeEY7Z71vWy7wB
	NAJuHbyBsCCo9zy7fVp8GPfPiJu6Ak9eUcTwGLSosWtnqXxu55K88a3KKbl+QIwTQ3cvVjvWR+1
	rcELEuZgK3MOXfkjjkwvgvZJNLIxOkiEmkMjHg4vmN8dc1m9iERxVvAHfbnNAzR0aMglpItHzdO
	bR3XHCcgXisFfOg==
X-Google-Smtp-Source: AGHT+IGn1fQWUtfuo1zOBYncWXTAQy3r5XJCczzktuyTrIF4ISG4pCB6BfmuhKsOzi4ofGGWNC1ayRtxHafCtO0nUC8=
X-Received: by 2002:a05:7300:ea14:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2a7243d9794mr3793745eec.0.1763948925113; Sun, 23 Nov 2025
 17:48:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:48:32 +0100
X-Gm-Features: AWmQ_bkQhmxLSFViZmcLEfniv1-_q0VIV-sH15dOpedbSpl6O0HvgiWJ0WM7vVU
Message-ID: <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Use the `BINDGEN_EXTRA_CLANG_ARGS` environment variable to pass the
> `--target` option for cross compiling, so that the function can be used
> to test both bindgen options and bindgen backend options.

It seems this explains part of how it works, but not what the commit
adds and why, i.e. could we start with "Add `rustc-bindgen-option`..."
etc.?

By the way, shouldn't this just be called `bindgen-option`? Up to the
Kbuild team.

More importantly, should we just have a separate function for backend
flags? That would be easier and would avoid having to use the
environment variable, if I understand the commit message here
correctly. And, anyway, it is actually the only function we need so
far.

> +# Return y if the Rust bindgen supports <flag>, n otherwise

Maybe just "y if bindgen supports"?

Thanks!

Cheers,
Miguel
