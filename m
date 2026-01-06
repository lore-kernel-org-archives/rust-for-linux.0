Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D0349B10
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 17:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719926; cv=none; b=eyPQTO1RIisP+haQYp1QQFAvhI2eEqip2hAXfN893LQwlXEyyNCzrwx2pIy3ER0VI4FE6c5aPB7/so1TNfYABugKHYE1MQQv7gQaBCD1sztNQD63p22ZQSVpPBqqaMf0x7EUZD+5CN20wIYaN5z5vzDFmSWSUU5bAvmiTHT9QHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719926; c=relaxed/simple;
	bh=XEisAg/MnjV2oZq8aRAnJ9zp1IlMfqSIlGbNK4vlOCE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ylw5DzFMWOlnjciXjpmQG4uTGZ1hn5SWW+u+vGslYWrUicSPdT4l+H66vc4CkcKJwuQBWVASCE6pcWPjAPzt+N8UEmZxRKoaQtxxsx9XGLxArSp7J696Hhwi1msL83S/AKy1HOLjtjm2X0g2aJ8EFKnfl/fcl19HatsYrRYpSqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yyNWX2Fq; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yyNWX2Fq"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8395cae8c8so139463166b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 09:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767719923; x=1768324723; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ln38EXokf2MTcavACELfKHcJ1IUIC02DBxVY4r0KfV8=;
        b=yyNWX2FqRUcjMqY9oGV9TVNMlaiwxsHMuMu3bUubrjJNYwuo5BkTApW1G73Gy4k822
         31AI8Lm6DCdibwH8DkYyG3Yqvz0pq4TzGeYs6jVmBVZFPDiiaLmMNV2viylURKK5CCCk
         0OEDQ3g8t0fIkohb7NqXKd3Zl1+Qzglp5Y3Y7AvlZBO5JrPLH7VonhQ57JZwlQQtnpmu
         9zzxJTE7w59Cwc8fuzUTe/PzPehs0jVz3QMt+2bh7UxOYhhmY6OXzg1ZxS5XRh50aX3R
         OkVF+e/D3wxsbDFNePNtz7AekJMQoJtoePr1B733xoBuG6GyPYb/BavAqLqhq5/8z0Mx
         EXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767719923; x=1768324723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ln38EXokf2MTcavACELfKHcJ1IUIC02DBxVY4r0KfV8=;
        b=diGmy2IgmkPKr2IvXOVaHW7dQYNT3GSihELljDgUKVXhRost8PApK4gVhtvFdEe0rT
         kY60FyHj1/dSx1fIMerpxFNcqnoz7ZX/1xCkEVAESpuZKLTxfQ/uJ2q/wGOWxjW8y2SM
         jKH6llUYPJ6cgCLKgl1I+RS3E2iyMh7/dD3vQXJRgzF4HcBfsw+qCS8odAbHita7nwDG
         9zXiNj7Ys6bs3wEPBJv5XiQ37xOf8boYneNJFjb7G/N56uPjv2cmG8xY+QdciLr2MhEO
         O7GFivaAfN+Uu9az2jGjMouaAgBPsv0HB92aV26fUdcbmmO3meA5EmOpd2B4dA+iNWzV
         vCMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM/D3nS6vFMr2mXSLYNglJsKkYuzyLB3AImCvbwDCz06gvUfYddbM4MEPA7TVbNn+xH1IGhFDnEaZlA6n79Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zcFgaeriXIa/CH9nx5RUv8DLn548m9wEJMIODcY2YhmU00nV
	v3Oa1uEcuPmJf0JwH4kU3UhO7fjNcA5R2k1ZDQBqRxlzBpzq2pqJJvk74fioy2evqqy7ZXgto08
	eBYrFu325qoqOotBhVw==
X-Google-Smtp-Source: AGHT+IGhIxpoyLd/Fty54UeoyqzZyU2thZen35cCszRNRHi4H8P1ETz1Usot6bVZvQl8oOJ3tUXRs24+0VbhmPk=
X-Received: from edwf2.prod.google.com ([2002:a05:6402:1502:b0:64b:5769:413c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1b0f:b0:b76:49ae:6ee6 with SMTP id a640c23a62f3a-b8426a677d2mr377172366b.15.1767719922841;
 Tue, 06 Jan 2026 09:18:42 -0800 (PST)
Date: Tue, 6 Jan 2026 17:18:41 +0000
In-Reply-To: <aV08Me9QLvi6uqsf@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260101081605.1300953-1-sunke@kylinos.cn> <20260101081605.1300953-4-sunke@kylinos.cn>
 <aVgC1qXp1La6E9p0@pathway.suse.cz> <aVt0JYbbXLeuqFBt@google.com> <aV08Me9QLvi6uqsf@pathway.suse.cz>
Message-ID: <aV1D8d8EyuzwQhHK@google.com>
Subject: Re: [PATCH v8 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
From: Alice Ryhl <aliceryhl@google.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Ke Sun <sunke@kylinos.cn>, Dirk Behme <dirk.behme@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 06, 2026 at 05:45:37PM +0100, Petr Mladek wrote:
> On Mon 2026-01-05 08:19:49, Alice Ryhl wrote:
> > On Fri, Jan 02, 2026 at 06:39:34PM +0100, Petr Mladek wrote:
> > > On Thu 2026-01-01 16:16:03, Ke Sun wrote:
> > > > Make raw pointers (*const T, *mut T) automatically use HashedPtr when
> > > > formatted with {:p}, providing safe default behavior for kernel pointers.
> > > >
> > > > This allows users to format raw pointers directly:
> > > >     pr_info!("{:p}\n", ptr);  // Automatically hashed
> > > 
> > > It should check no_hash_pointers variable, see default_pointer() in
> > > lib/vsprintf.c.  See also "no_hash_pointers" and "hash_pointers=never"
> > > kernel command line options.
> > > 
> > > Hashed pointers prevent leaking information but are not good for
> > > debugging. The "no_hash_pointers" variable allows to print
> > > raw pointers without changing the code.
> > > 
> > > I am not sure how this should be implemented in Rust. If you need
> > > to keep HashPtr then it should become an implementation detail
> > > and should not get exported. Nobody wants always hashed pointers.
> > > 
> > > I hope that we could find a better solution which would allow
> > > to reduce the code duplication.
> > > 
> > > For example, I wonder what would be needed to allow calling
> > > snprintf() from Rust code. The fn fmt() might call
> > > it with "%p" format...  It would make it easier to get
> > > also other "%p?" formats.
> > > 
> > > It seems that something similar has been discussed at
> > > https://lore.kernel.org/rust-for-linux/CALpAb9MoT20Ch4pe-oMz8kpqaZsvmgNwPk1XSC+faZi7huwQKg@mail.gmail.com/
> > > And it was said that it would need bigger changes.
> > > 
> > > Maybe, we could create C wrappers which would allow to call
> > > snprintf() with some specific format, e.g.
> > > 
> > > int scnprintf_p(char *buf, int size, const void *p)
> > > {
> > > 	return scnprintf(buf, size, "%p", p);
> > > }
> > > EXPORT_SYMBOL_NS_GPL(scnprintf_p, "RUST_INTERNAL");
> > > 
> > > And use the same approach for any other %p? format, e.g. for %pU:
> > > 
> > > int scnprintf_pU(char *buf, int size, const u8 *addr)
> > > {
> > > 	return scnprintf(buf, size, "%pU", addr);
> > > }
> > > EXPORT_SYMBOL_NS_GPL(scnprintf_pU, "RUST_INTERNAL");
> > > 
> > > Best Regards,
> > > Petr
> > > 
> > > PS: I suggest to wait longer before sending a new version. It would
> > >     allow to get feedback from more people who might see it from
> > >     different angles.
> > 
> > I think there are two approaches we could take:
> > 
> > 1. Have the C side provide a method that returns the correct integer
> >    address to print.
> > 2. Have the C side provide a method that returns the correct string
> >    to print.
> > 
> > In general, for cases where the output is an integer formatted in some
> > standard way (e.g. hex), I think the first option is stronger because
> > the Rust formatting machinery lets you specify different modifiers such
> > as "prefix with zeroes or spaces" or "how many zeroes/spaces to prefix
> > with" or "hex uppercase or lowercase" or "hex vs octal vs base10" etc.
> > By having the C side pass an integer back to Rust, these modifiers are
> > taken into account automatically.
> 
> Just to be sure that we are talking about the same things.
> 
> 1. C Code
> 
>    According to "man 3 printf", the C printf() allows to define the
>    format using the syntax:
> 
>      %[argument$][flags][width][.precision][length modifier]conversion
> 
>   , where for example:
> 
>      printf("%016llx\n", val);
> 
>    would printf zero padded hex value with a field width 16.
> 
> 
> 2. Rust code
> 
>    According to https://doc.rust-lang.org/std/fmt/ , Rust allows
>    the define the format using the syntax:
> 
>     format_spec := [[fill]align][sign]['#']['0'][width]['.' precision][type]
> 
>   It is actually more complicated. There are also traits, ...
> 
> 
> Now, I think that we are talking about three categories:
> 
>   a) Number and string formatting, in C, for example, %d, %x, %u, %s
>   b) Classic pointer value formatting, in C, %p
>   c) Kernel specific pointer formatting, in C, for example, %pK, %pe, %pS, %pI6
> 
> 
> My view:
> 
>   Ad a) IMHO, we do not need anything special for the number and string
> 	formatting. Rust code should use the native Rust formatting.
> 
>   Ad b) %p is handled quite special way in kernel:
> 
> 	+ hashed by default
> 	+ hashing disabled with "no_hash_pointers"
> 	+ special hashing of early code when "debug_boot_weak_hash"
> 	+ no hashing for IS_ERR_OR_NULL(ptr) values
> 	+ fallback to "(____ptrval____)" : "(ptrval)" before
> 	  random numbers are initialized enough
> 
>       I would try to avoid as much duplicity as possible.
>       IMHO, the current approach duplicates too much.
> 
>       This is why I suggested to add a wrapper for
>       scnprintf(buf, size, "%p", ptr) and call it from Rust.
> 
>       By other words, I think that this is close to the c) category
>       with all the kernel-specific pointer format modifiers. They
>       print the data at the pointer address a special way.

If I write this code in normal Rust:

	let ptr = &3 as *const i32;
	println!("{:?}", ptr);
	println!("{:017?}", ptr);
	println!("{:17?}", ptr);

it prints:

0x602ae0ec95d8
0x000602ae0ec95d8
   0x602ae0ec95d8

If we implement {:?} on a raw pointer type (and {:p} on reference type)
to use scnprintf with a stack buffer for the string representation, then
we lose this flexibility. (Or we need additional effort to pass through
the various ways you can configure it to scnprintf.)

>    Ad c) I am not sure how to handle all the kernel-specific %p?
> 	 modifiers in Rust.
> 
> 	I guess that it will be done by implementing "fn fmt"
> 	in a crate for the related pointer type. Or something like
> 	this.
> 
> 	Note that I have almost zero knowledge about Rust at the
> 	moment :-/

I mean, if we take the Mac address example, you would just have a Mac
address type, and when you print it, you get a Mac address. So I'm not
worried about that.

As for %pa and %pad we do not need special logic. The Rust formatting
machinery does not require specifying the type being printed in the fmt
string, so it doesn't matter if the integer is sometimes u32 and
sometimes u64. It will work in both cases.

Alice

> > Now, just using scnprintf to write the resulting string to a buffer and
> > passing that string into the Rust formatting machinery is also an option
> > of course. Especially for modifiers such as %pF that prints something
> > like versatile_init+0x0/0x110.
> 
> Yeah, I think that this might be a good option how to export
> the kernel-specific handling of the various %p?, formats,
> including plain %p, on the C side.
> 
> Best Regards,
> Petr
