Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3F418734E
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758521; cv=none; b=AWT8oMCEwpwCceD1BD6sDh+0COvfymvB2fQqgAgXFBZ982RAFViZgM0KOLf7bm10UO8SR3tFbPlPwiN+QoLPkLZJwwIVAo5JuzLBHtuEHmcDr9HusVnyJOPBH0MNVPUrr1aVs0G1Cg1NDku1jaRGKM6ewxYS/bd63nrInhhJ6vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758521; c=relaxed/simple;
	bh=oyhlSsZ9u9jea1W+2i6eZUOvz1sTt2oMZhFdHqZNdTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJ5Ha4oN9lC3R938/2tmsp0WsVwydXRJBIGjkNBBKDaSFvfpeKegLlNyQ0/Part5QQcz7GckLw17F4HN37PQ/bGRgfNSd1BmpJQqfTcvi2s3fV22awdzRn1IBzVBbTqamWAafgxFOsz6PCHluRNA5gdVwpO0Gp9wSyJxKWgPSuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gH4Gbsz0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gH4Gbsz0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35dca73095aso1761426f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Jun 2024 04:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717758518; x=1718363318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nK7eNQ+hoX2l5wdTyQQ8AV5LulVt/l/ya99NvQfTdM=;
        b=gH4Gbsz01CLU+qqGp62pq4ARD9t9VcIVrXFI29L84aeKfnFGQ2MJyA2Kldh3iyl2YJ
         NzYVgucvTII3CyresLN7OCRGAXUq8wLQsUpXbY2+M4cQNPjMeps6y/lweGDLy1XmM7Ur
         cpGae86RQKqJ/d9cub//wKyVg6rMUHsmUvCgeXco+Njb1yZAzUTqcVRtObZ5Wd/utXnf
         tOBQ9mk1gDl9zoDVHLM1ak5sMrPImIjIP707aSB+rBJeIhzK90K7OtDY8ysi324ln7Z0
         THZkdDlRyFGE4Dex3xyqgcAxatQbTF9o9EOqAX48ZAr24J3pBfFhPBbMP2nXl6GJ8wf8
         5OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717758518; x=1718363318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nK7eNQ+hoX2l5wdTyQQ8AV5LulVt/l/ya99NvQfTdM=;
        b=AtZfOrlxTIa7sGD3N+kqVlKkx0VJFFRIZjgyCC5ZZbUrK1+NBFPh2JCgcUQm7agYBQ
         cOccd8/6Y9H5AG1FgE0TD3eNm8aM6JotkrFyB6XI5uXAuhNQmGpd+gcydrjNCl0kXFdL
         eaX4HJOK1QY7gYXCm0fT51en13Dx0/oKZS80+yUZ3zOaTN0tcEs422toN+7/Vtv4o/yj
         yvErsrBByEcRev9/NARpEOWNV1bZg78wVBhSP0S4Bt3AY+AwI1tFCHb2eVZutzODo1b6
         dQJsbleK7laPQw7MsYjq+ElRaRQe/adPljs8qEsqrswlaO3Sd4uDVKpUqKdJcEvjKByR
         wbOA==
X-Forwarded-Encrypted: i=1; AJvYcCURNHB6LgtG/pkmUml9cdXmJL05O31Wf3OUq3mHY8oGIR/rwtA/6JNce/g4PqZa1ip9FdTscBw2GQGxmkSdYWY7PZY0+jLrEcelvLbN+2s=
X-Gm-Message-State: AOJu0Yy+G3nwfBZsh5HRWQ1IkN70f43XxclTwBYO6L/AYO5tiYqmIEvB
	Od8UY4goR6xl1qi6nDljlmHNkY1GWYT76gNvdGrq3VZGOw8xYkDRy8ieR7R/l89fW7nFEC4lu3D
	CMfifIa2fVMNzNuqpJI3YjngQas/3aSH/Ae30
X-Google-Smtp-Source: AGHT+IEySEbc8YI+5RaCD9sW2IuIsZd7+PNu+mqp7niXSuiZHWd3aAdVtgXnRo/4POEAdDLpUYXf53dYxlwhawtJvRg=
X-Received: by 2002:a5d:59a3:0:b0:355:692:f663 with SMTP id
 ffacd0b85a97d-35efedc9eb5mr2103498f8f.50.1717758517672; Fri, 07 Jun 2024
 04:08:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606193318.GK8774@noisy.programming.kicks-ass.net>
 <20240607094329.3878781-1-aliceryhl@google.com> <20240607105232.GP8774@noisy.programming.kicks-ass.net>
In-Reply-To: <20240607105232.GP8774@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 7 Jun 2024 13:08:25 +0200
Message-ID: <CAH5fLgiF1bq52sTHKQRvqzVv5VP2w1WMeDZPHZ7qnxZ59zKNjQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add static_call support
To: Peter Zijlstra <peterz@infradead.org>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, ardb@kernel.org, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, jbaron@akamai.com, jpoimboe@kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, rostedt@goodmis.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 12:52=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Jun 07, 2024 at 09:43:29AM +0000, Alice Ryhl wrote:
> > Peter Zijlstra <peterz@infradead.org> wrote:
> > > On Thu, Jun 06, 2024 at 09:09:00PM +0200, Miguel Ojeda wrote:
> > > > On Thu, Jun 6, 2024 at 7:19=E2=80=AFPM Peter Zijlstra <peterz@infra=
dead.org> wrote:
> > > > >
> > > > > This is absolutely unreadable gibberish -- how am I supposed to k=
eep
> > > > > this in sync with the rest of the static_call infrastructure?
> > > >
> > > > Yeah, they are macros, which look different from "normal" Rust code=
.
> > >
> > > Macros like CPP ?
> >
> > Yes, this patch series uses declarative macros, which are the closest
> > that Rust has to the C preprocessor. They are powerful, but just like
> > CPP, they can become pretty complicated and hard to read if you are
> > doing something non-trivial.
> >
> > The macro_rules! block is how you define a new declarative macro.
>
> I'm sorry, but 30+ years of reading ! as NOT (or factorial) isn't going
> to go away. So I'm reading your macros do NOT rule.

So you already understand ! in two ways, but you don't want to add a
third? That seems to violate the Zero One Infinity rule. :)

https://en.wikipedia.org/wiki/Zero_one_infinity_rule

> > The ($name:ident($($args:expr),* $(,)?)) part defines the arguments to
> > the declarative macro. This syntax means:
> >
> > 1. The input starts with any identifier, which we call $name.
> > 2. Then there must be a ( token.
>
> The above exaple fails, because the next token is :ident, whatever the
> heck that might be. Also, extra points for line-noise due to lack of
> whitespace.

The :ident part means that $name should be parsed as an identifier.
Similarly, the :expr part means that $args should be parsed as an
expression. It doesn't mean that the input should literally contain
":ident".

> > So for example, you might invoke the macro like this:
> >
> > static_call!(tp_func_my_tracepoint(__data, &mut my_task_struct));
>
> static_call NOT (blah dog blah);
>
> > Inside the macro, you will see things such as:
> > $crate::macros::paste! { $crate::bindings:: [<__SCK__ $name >]; }
> >
> > The Rust syntax for invoking a macro has an exclamation mark after the
>
> Like I said before, the creator of Rust must've been an esoteric
> language freak and must've wanted to make this unreadable on purpose :/
>
> Also, why the white space beteen the :: scope operator and the [< thing?
> that's just weird. I would then expect the output to be:
>
>   ...::bindings:: __SCK__my_static_key

Sorry, you are right. There is a space in the output.

> > name, so you know that $crate::macros::paste is a macro. The `paste`
> > macro just emits its input unchanged, except that any identifiers
> > between [< and >] are concatenated into a single identifier. So if $nam=
e
> > is my_static_key, then the above invocation of paste! emits:
> >
> >       $crate::bindings::__SCK__my_static_key;
>
> But it doesn't, so it isn't unmodified, it seems to strip whitespace.

Thanks for the correction. The actual output is:

$crate::bindings:: __SCK__my_static_key;

However, although whitespace is generally not used here, the syntax allows =
it.

> > The $crate::bindings module is where the output of bindgen goes, so thi=
s
> > should correspond to the C symbol called __SCK__my_static_key.
> >
> > > > Is there something we could do to help here? I think Alice and othe=
rs
> > > > would be happy to explain how it works and/or help maintain it in t=
he
> > > > future if you prefer.
> > >
> > > Write a new language that looks more like C -- pretty please ? :-)
> > >
> > > Mostly I would just really like you to just use arm/jump_label.h,
> > > they're inline functions and should be doable with IR, no weirdo CPP
> > > involved in this case.
> >
> > I assume that you're referring to static_key_false here? I don't think
> > that function can be exposed using IR because it passes the function
> > argument called key as an "i" argument to an inline assembly block. Any
> > attempt to compile static_key_false without knowing the value of key at
> > compile time will surely fail to compile with the
> >
> >       invalid operand for inline asm constraint 'i'
> >
> > error.
>
> You can have clang read the header files and compile them into
> Intermediate-Representation, and have it splice the lot into the Rust
> crap's IR and voila, compile time.
>
> You just need to extend the rust thing to be able to consume C header
> files.

I wish! There are people, including me, who want this. See e.g. this
very recent document:
https://rust-lang.github.io/rust-project-goals/2024h2/Seamless-C-Support.ht=
ml

But there are also people who dislike the idea, so it does not have
unanimous support yet, unfortunately.

Ultimately, I have to work with what exists today.

Alice
