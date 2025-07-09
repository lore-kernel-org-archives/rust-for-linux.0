Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABE941C71
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752098043; cv=none; b=bM7dk5ME8HmvucTy7m+z+U/pRCfNyyVc2UwHZjYG7Z+Xu7lqsymjiTxw9hpF75nbcnh6Wyxyr0pwT/mPUcGtm7PFW83+ZoILQ5MPDNofPR4KQZcCOXy8+5Q2vlb2HwaPQJg+rNgB1m0LO2Nhc0nxetAcAFSQpdDdkoZX9CtzmYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752098043; c=relaxed/simple;
	bh=ussmeAKsU5UyUSjBJVhduD/D8CHVdqbk5aJ/8Xb+cIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ClWxwTqR26Y4WTrO1AjeHWk1nmdYDNj0kmgqn47E7elWpXb91S42W+I+pALGZtfKJB5F2ZqQhI03nNbR882u+PpY4pWY8v9H2Ezag/H2LkehoDRKp+xX7OCWOAcqs911N5pgIcI2Rps0F5aYoVg+hCWgnrU5x3W1l7FQfZUxMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HjyXM/ZV; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HjyXM/ZV"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so1815a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 14:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752098040; x=1752702840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ussmeAKsU5UyUSjBJVhduD/D8CHVdqbk5aJ/8Xb+cIM=;
        b=HjyXM/ZVyShMXCT9l3xay4qtKd+kDzlwTIVF9mRV8dFs7ZUDtEg9Ve0etw6T2JwWg2
         qIGuOAKScFnmgfPAaPeNvReaXYu4XT9bXkeBScvqRMRnzQgwYSdYjtROaHFVlMIjf7ua
         n4/2Ky31pPZ4I1ekqdR9XCX6UnIaFP+EfGM5wWQRTALrhNVLQijn+4ENMAe98hXsTsgW
         0jrfGuKrLFFqGqppTe8R7bqArRqmMT90PeVzdnQVZz9NCnfs60PbQlEhlyqBDHq8cg1k
         YMNFO/ABQ/4zXcyK/YxgNsMtzWGWYsdctS5HdGM9X0PRq2MjB5JijIptlcihR4ZOjn/Z
         I7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752098040; x=1752702840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ussmeAKsU5UyUSjBJVhduD/D8CHVdqbk5aJ/8Xb+cIM=;
        b=eP7uzpb7qPFwPEegRbUU2307oMSl6a1NZsufLBs4xPmm+8AgbK9VneFLy9nStAUzMb
         olZI1SJng8MIvzMEIeMpoRR/0dH7XIigrsmEJ9wYT15VHugXWiUSxBSAunW8rPWPSZH8
         ysf7IyZZu9iEaghSOrlCQNsBS95HDfQW2uvLEhKPYix/IFN6eRLXu8N3HGG1n3vz2vOm
         dC2NGdGkKXKB5bU6TtVarJhKOsGcZ/77jay7hXVyifQHZQIDxYkK+hYXXnCjAc34tvqq
         5O0whGteSLXtGcdM14drecybSnKcbKEi0xmdBuRgX2T7DetnfT6N39mHhelaQa2xsHkD
         lVwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjoIIG/Z67CZFzNTp0RAkLLNw7nsZw11c1Wo1pfZsksMwdsLEvAAM6wnVAqA7xnxPAdHXKxQ4ttNYA3l/V2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlmwSnQ3BIXieH+tTmOkEQ+oOB62ecAR8kWarBfrd00H6dj2Mb
	WSizJiK5HwolwWc9Zz9O5aI+1jf3MrFUCytg1z+rUwRAbv0PpWDHEIDBfDLZvEQ2KGCm9Cfv66i
	JoMm2k+3tHDQ9E3Eij1b1rScRv5kNsR5qjhjXwRyp
X-Gm-Gg: ASbGncut0yS4iGgrz8GheHB9iv6WOctmjhYZ8w3oHHMRgQs9qqChd3wpab4fN36LWti
	0JJlpBhTk/krtGESHpWM4pIAZuL7enqdCDquPIssLhLF4OHMNjhWqTLvRIg0J5ls89LkSxrXx5f
	I3IGKM5Pd0zhtR3jgKKUi0YxYaU2wMxODJdp3tMQ9LCVW8Ks+8WxfjJDsRLQya0uwjXe1szeaKc
	w==
X-Google-Smtp-Source: AGHT+IFRN4CNJMEx5C1O8OOqdP/rgcRQDoaYg/mZR6xBdzHzo05JHMIJ/063LCPw8opQYmkXLwsQr8hruGMJCcPTzNY=
X-Received: by 2002:a50:9e02:0:b0:608:fb55:bf12 with SMTP id
 4fb4d7f45d1cf-611c46403e9mr27076a12.4.1752098040055; Wed, 09 Jul 2025
 14:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-debugfs-rust-v9-0-92b9eab5a951@google.com> <DB7US8G7ISG0.20430M3P7I0K0@kernel.org>
In-Reply-To: <DB7US8G7ISG0.20430M3P7I0K0@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 9 Jul 2025 14:53:48 -0700
X-Gm-Features: Ac12FXw1T_zpTlpyMPgLzfrfnwpvNnIIPT9GSXgqhtg5XyR3BN4gk168q38zjQ8
Message-ID: <CAGSQo01hORWAtrGaYp-_xxrAiN47JkJg=jiqnqdpw87QKzt9jg@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] rust: DebugFS Bindings
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 2:47=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed Jul 9, 2025 at 9:09 PM CEST, Matthew Maurer wrote:
> > This series provides safe DebugFS bindings for Rust, with a sample
> > module using them.
> >
> > Example interaction with the sample driver:
>
> I understand what you're trying to do here, i.e. showcase that values exp=
orted
> via debugfs can be altered.
>
> The problem is that the current abstractions only implement read(), but n=
ot
> write().

I was trying to keep the initial bindings simple. Adding `write` is
definitely something we could do, but I thought maybe that could be in
a subsequent patch.

> If you really want to showcase changing values, you can, for instance, cr=
eate a
> workqueue inside the sample driver and modify the counter periodically.

This is supposed to be sample code, so ideally it should be as narrow
as is reasonable in what subsystems it touches, no? If people would
really prefer the sample schedule a ticking counter I can do that, but
it already felt weird to be registering a platform driver in a debugfs
sample.

>
> We really should not teach people to modify values by read() instead of w=
rite().
> Also, without this workaround there shouldn't be a reason to export the e=
xact
> same value twice, i.e. no need for File<File<AtomicUsize>>.
>
> - Danilo

How do you feel about the `Wrapper` struct, intended to simulate the
driver doing its actual job and show how that would look? Is that
similarly verboten, even though there's a comment on it saying this
isn't how one should do things?
