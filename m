Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8791D7E35
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297374; cv=none; b=bkDq42TMfrMMeUg90UqhmhSs6aYPvbwu6QS6sEqa0CbG3y44i23++4/JPfqtdUC+1vuhwG3JyMwj9fB5GNjE2hFjPXMK1IhDd0cUumXgAyP6q3fFTtbVhDezpheo+p8PS8VqfOqMZU5PwH2uI3KWXAeB+mBw5KZGOph65D154JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297374; c=relaxed/simple;
	bh=duw4OZpx3j5V1ogd4oUwtA8eumGubdO+3+0LPCYfM64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4BUHWqlQD3m05J+IvhOE0yuSnz0fF0DhPe5zlxMS5JELU3lSOmr6KjSu2GOnX5tJayzfQhRjqv08T1Fc1dSY5pwTLLubxThPOnZDdmzL5P4yJxEjd7DbV1QzZ+YoPzkgJDMtwKe7DJ4UECcl1ISWp9HY/IN+oVSjyeTgGVQOJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FCkUd3hC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FCkUd3hC"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso717930f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744297371; x=1744902171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duw4OZpx3j5V1ogd4oUwtA8eumGubdO+3+0LPCYfM64=;
        b=FCkUd3hCIVLIHc5yFg1qMNusFgAskduCQIUpDD/lCgq/UWOwwFG3UPjAS6xyAktEwd
         zRz1IjUz5fhsmHS5tcS61w3FKMYjWGNKY3y7TWDVthQ6RMkJeJ+08H+5SyHI/usF1qk0
         8p1kkcSDYwtC+NMZpljN+nnaIGy1ad8sB3iTTvv0uTbd1LWYxmqtg3T6eqbsTKW/qxIl
         9ttZwE/aMFpd+Bl0lzPv/AuR1hPa1yRk+UMmNSuNdXJlhVfBTs/hiMn0uIDzkJmdYYZy
         zyR+TJ1ujHJ3JFI2bI8wsMt4uYZEXiX1FB7P31WRYPRsrm+IWdRgLebVeHaxa5W4ltIg
         dzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297371; x=1744902171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duw4OZpx3j5V1ogd4oUwtA8eumGubdO+3+0LPCYfM64=;
        b=isU90vqYDWGo3T2ye6wVF4dGoPssxLzqfHp4rz4ErByzTzpnpkI5iODpOJGVU4FHIn
         0HQkIyxAea9nkPHV9Dmkw0UrpIb48gbTnk0HxhoutbrxGYLZF9+qw/Gk3pOD+gIB9p5p
         8xi148644PQhBf5r7cqxQpJ+ZdbTt+D+tJyf8+p8NcR0C8JoG330/7TvILM8mdSEBJ5T
         Lrxwt9Wu2uUVv1ebG4Tx/YW9SlHw9brYa9+V9ELA1TBXJCfLSwGsk9eLBJkKUFwJYlyX
         +h5zn/j3cZXOwqDeYsiEs0cKVJO0iuTa+7k7iTLoEI6qUfbcQdw1HTNKTJR9QCKthSpu
         65ig==
X-Forwarded-Encrypted: i=1; AJvYcCVkuURbS79FvTldw+mv4PnZZG+OgVErY2ItIXa9zM1LBAK3qh6Pi7vV6AeDFrm2JBHsDZRZrndBwh6yJzObRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMy4KKBk4mKHijFca7Vfn0ty2HVagfli0qRuIhQHVWnxBPleL1
	XBXajechozGh3cFzfw7RYeRSXIJVCQLH2CUfNZNVy6hqlFlhMf01w+63ypIw3zZ+Fe6KHgcPA1T
	6CpzSQglKY9K6IRc0jKGzHfK0UnNrb05gOhBu
X-Gm-Gg: ASbGnctsmhx0cdiMKrIAXUpagM5gYJM16WTBXIBZCoJrAaSiX23+NVyoQJHaydVnGZ9
	J/e/b8OxgdWz6REsOdk1C1s/T/p6E3lGvU0WYyzLLwZX5Otad7bGZuOdcIU3OjBisYe9dyCRGzi
	Iogkem6Nn2ug4rEPSFzORXmio+/QJ0QaeFMWKmyBrfHLJ5v75xhDB45RL5P9Y8VRo=
X-Google-Smtp-Source: AGHT+IHiZoALZCZd4PFAd91UXULEzSBoqZYQsT5CEc/lviWExzRV8zhxR1WpSYtZvTdvRkqX+J6b2CSGYtr2JbiH1LI=
X-Received: by 2002:a05:6000:4029:b0:391:3fa7:bf77 with SMTP id
 ffacd0b85a97d-39d8fd51667mr2817530f8f.31.1744297370888; Thu, 10 Apr 2025
 08:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <20250410140850.GH9833@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410140850.GH9833@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Apr 2025 17:02:39 +0200
X-Gm-Features: ATxdqUFsxWS9zxSxb4hXkIJHsSed98Cytb4b1WAHJ36cEk0v_hQ78JGOjPy0cFg
Message-ID: <CAH5fLgjm+Fru+VOjpbq+DJD=xeRreeKocv9C9WO9sGWBX0cpmQ@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 4:08=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Apr 10, 2025 at 03:59:53PM +0200, Alice Ryhl wrote:
> > On Thu, Apr 10, 2025 at 3:34=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Thu, Apr 10, 2025 at 03:27:55PM +0200, Miguel Ojeda wrote:
> > > > On Thu, Apr 10, 2025 at 3:26=E2=80=AFPM Peter Zijlstra <peterz@infr=
adead.org> wrote:
> > > > >
> > > > > New compiler can't build old core?
> > > >
> > > > No, that is not intended to work -- `core` is tied to the compiler.
> > >
> > > OMFG, you just gave me another reason to hate on this rust-bucket of =
a
> > > language :-/ What language can't even build an old version of its own
> > > runtime :-(
> >
> > I don't think there's anything unreasonable about having a place to
> > put logic that depends on compiler internals.
>
> Having compiler internals exposed to such an extend that programs can
> make use of them _is_ weird. It creates the whole problem of where to
> put it.
>
> C++ doesn't have anything like this afaik. Esp. if you disable rtti and
> exception muck, you get a very minimal runtime. And even if you don't,
> it certainly doesn't break every 6 weeks. ABIs and all that.
>
> Maybe I've been living in C/C++ land for too long, but you either expose
> a full language feature and then everybody can use it, runtime,
> libraries and user code alike, or you don't.

Well, I would say that Rust has just decided to expose such language
features in a different way from how C/C++ exposes them. Core is *how*
rust exposes the features. There are quite a few language features
that are exposed via a type or method in core that you use like any
other type or method. I think it works relatively well because you can
expose new features by adding things to core, which means that you
don't need any new syntax for the feature. It's just ordinary method
calls into code that you could not implement yourself.

Alice
