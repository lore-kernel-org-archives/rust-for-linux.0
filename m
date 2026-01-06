Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983D42135D7
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 16:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767717943; cv=none; b=ovrBIETBDxhcI+SXbYvYlQCREl9UmL5e+NxL6LSrg50vBL6OPRUwpxGcOVZTr03bZyTZdAyYC0Ej9qNlEVNXpgVNW8XKTm72+kxxzrBGY38itpO967WufFFpeStv07MopKYSC1JV0pyJYesTlzJM4Qp+yi7YgneJdYOYs2jBXqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767717943; c=relaxed/simple;
	bh=Tmpu/PRWSvVtzQT/kFmwOR80qvRgQOffrApVGbTDdYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBz4eji8RXUBQ/KNnOhWAmVNN2pMMDFQILOYmrMXY01IQ/KtTCqs2bKgPmaMxeAysIC9YVquMzv058NXjy+acP4FkC7oX9ZEn68TvjXzcBh6nEF5sTaLZ8CHx1K2oloxqydjAi7fQypJ+Cwyb+tWWvbwYgIq31TCrUjUP44K11Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MNo1HZkG; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MNo1HZkG"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fb5810d39so678394f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 08:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767717940; x=1768322740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O5ALs3z8YDmHncssmsju6wlRlSueYtCO0iwNLjEaLyg=;
        b=MNo1HZkGPGXXOGt3OD4La8MxKG/GpYlVe25M7sTLh9iNqBTkNq/Q+6I/psPdh0hIY5
         qi2CY27HX29X6DWpvPD9btAa4QJagN6tc6Mj9FgxFaasiYNgbjQbqg8yjxWWjL/D6sZe
         c5slzm7U6XGEU2H5jcJSrEf9oMUzwfvwsIs1cjY9ShYC8kqkzHAFiFNdDOCYzKBCaRkZ
         HqMVNXH8bopWZk6vct01sJ3ThAAnQ047wuCeFq5uE6iRnVzZ+BzmKqDRN/C18Ouis32K
         83hxd1gatJs8rD0jqwKM2X29Ol2sInjCRTtaWtAGJ7PJY3F2DtbLBd05zd0GWPByQV8e
         wJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767717940; x=1768322740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5ALs3z8YDmHncssmsju6wlRlSueYtCO0iwNLjEaLyg=;
        b=omttVVJISA/XdEKVYs4a6RSSfqVsvhOfdQVahz3VVfDFQpZBk1IiQh05v/LcH36tmE
         O72lr7uP2k9wAbNr7890gjNWYS17GWwCgcNrnKBGCjy6z99Y2quKvNCBCp7fI8NLuohA
         ORx7v0QwK/ANL1EsUasyQpulKjMlFpLYOZ87grBEhAKq+j+hmcoHF5Cpslw2ZxP9QYFv
         CvPpL/PcHHN2pL5fayNDhKhH6ZMFHwGpS0+LZxhRirr4hQRmKGIac9TMSJMOB0neu3K+
         aCvb9+Kc1EjR2z6o4lLekswKBw4AQ9umrVKeY1JwIpecjiEVOUG1XDB8CAd2cfifN0os
         yvDA==
X-Forwarded-Encrypted: i=1; AJvYcCUPmBA7m5/DOx0npVLHyucGld/RYligPEsXvxsoFVuVmIYtqAGZhwW/aqa1ZqhYTziHIfwA+TSEgilvUeP7Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwFEodzVnnf0Dst4lIQiz2uPKZm1aQpipQ74flnDXO9Nb4R0iA
	8rKYYKuprmlhCtHqVj7quOFtYllOg3HS0nf3HDdLHV2izc817BwyozdPvJK7I+OL5sI=
X-Gm-Gg: AY/fxX6c6umcI5t6DQQb/F5uxvn5KLiKPMVyxLOoQGrfNrfXx93FxhO+xrWIIKHd9zt
	xvplRk7NsY2Yz74NQ764a6bkymi14rsnM52WCG/M5pkRgDvdujBPiVVCaOLRU9DivXhxvn28eCz
	V+jLHboNavIWpG22g1LxWHX5F3TrvZmY7PEhmiQHX0cafiRKBEf6gQtvVMVY34TwcRh1YBEcobz
	Nf3qNZo1sovED1sdNRxMBT92BSBbDLb0rcNRKeBewLgre5hnw674DAv8e2Leb4KZpEIMf4nl5e9
	jhBdqd0z37txZfG8JpDWiRhoj0+MulrFgzMNFJK/rsT5elDm0YWspXKrFCL6o0QpndCtGjqRaXk
	NdKHF+zJfujjRCT6AAmisFjdXVnVGZzfl9n9xPKt891O1Xc5MKKsqdNJ8PZursGXVQyyQ0pQnu2
	rofH2N8zBSZ9rHBA==
X-Google-Smtp-Source: AGHT+IG4xThXxGTMGW8z23l6yQQzeQVIYxpmnDbWgzESgd/ENlvMxMPhKyeaVHDFxPkk8P/8ij675w==
X-Received: by 2002:a05:600c:8116:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-47d7f09b775mr37052255e9.22.1767717939863;
        Tue, 06 Jan 2026 08:45:39 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f668e03sm52818515e9.14.2026.01.06.08.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:45:39 -0800 (PST)
Date: Tue, 6 Jan 2026 17:45:37 +0100
From: Petr Mladek <pmladek@suse.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Ke Sun <sunke@kylinos.cn>, Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/4] rust: fmt: Default raw pointer formatting to
 HashedPtr
Message-ID: <aV08Me9QLvi6uqsf@pathway.suse.cz>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
 <20260101081605.1300953-4-sunke@kylinos.cn>
 <aVgC1qXp1La6E9p0@pathway.suse.cz>
 <aVt0JYbbXLeuqFBt@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVt0JYbbXLeuqFBt@google.com>

On Mon 2026-01-05 08:19:49, Alice Ryhl wrote:
> On Fri, Jan 02, 2026 at 06:39:34PM +0100, Petr Mladek wrote:
> > On Thu 2026-01-01 16:16:03, Ke Sun wrote:
> > > Make raw pointers (*const T, *mut T) automatically use HashedPtr when
> > > formatted with {:p}, providing safe default behavior for kernel pointers.
> > >
> > > This allows users to format raw pointers directly:
> > >     pr_info!("{:p}\n", ptr);  // Automatically hashed
> > 
> > It should check no_hash_pointers variable, see default_pointer() in
> > lib/vsprintf.c.  See also "no_hash_pointers" and "hash_pointers=never"
> > kernel command line options.
> > 
> > Hashed pointers prevent leaking information but are not good for
> > debugging. The "no_hash_pointers" variable allows to print
> > raw pointers without changing the code.
> > 
> > I am not sure how this should be implemented in Rust. If you need
> > to keep HashPtr then it should become an implementation detail
> > and should not get exported. Nobody wants always hashed pointers.
> > 
> > I hope that we could find a better solution which would allow
> > to reduce the code duplication.
> > 
> > For example, I wonder what would be needed to allow calling
> > snprintf() from Rust code. The fn fmt() might call
> > it with "%p" format...  It would make it easier to get
> > also other "%p?" formats.
> > 
> > It seems that something similar has been discussed at
> > https://lore.kernel.org/rust-for-linux/CALpAb9MoT20Ch4pe-oMz8kpqaZsvmgNwPk1XSC+faZi7huwQKg@mail.gmail.com/
> > And it was said that it would need bigger changes.
> > 
> > Maybe, we could create C wrappers which would allow to call
> > snprintf() with some specific format, e.g.
> > 
> > int scnprintf_p(char *buf, int size, const void *p)
> > {
> > 	return scnprintf(buf, size, "%p", p);
> > }
> > EXPORT_SYMBOL_NS_GPL(scnprintf_p, "RUST_INTERNAL");
> > 
> > And use the same approach for any other %p? format, e.g. for %pU:
> > 
> > int scnprintf_pU(char *buf, int size, const u8 *addr)
> > {
> > 	return scnprintf(buf, size, "%pU", addr);
> > }
> > EXPORT_SYMBOL_NS_GPL(scnprintf_pU, "RUST_INTERNAL");
> > 
> > Best Regards,
> > Petr
> > 
> > PS: I suggest to wait longer before sending a new version. It would
> >     allow to get feedback from more people who might see it from
> >     different angles.
> 
> I think there are two approaches we could take:
> 
> 1. Have the C side provide a method that returns the correct integer
>    address to print.
> 2. Have the C side provide a method that returns the correct string
>    to print.
> 
> In general, for cases where the output is an integer formatted in some
> standard way (e.g. hex), I think the first option is stronger because
> the Rust formatting machinery lets you specify different modifiers such
> as "prefix with zeroes or spaces" or "how many zeroes/spaces to prefix
> with" or "hex uppercase or lowercase" or "hex vs octal vs base10" etc.
> By having the C side pass an integer back to Rust, these modifiers are
> taken into account automatically.

Just to be sure that we are talking about the same things.

1. C Code

   According to "man 3 printf", the C printf() allows to define the
   format using the syntax:

     %[argument$][flags][width][.precision][length modifier]conversion

  , where for example:

     printf("%016llx\n", val);

   would printf zero padded hex value with a field width 16.


2. Rust code

   According to https://doc.rust-lang.org/std/fmt/ , Rust allows
   the define the format using the syntax:

    format_spec := [[fill]align][sign]['#']['0'][width]['.' precision][type]

  It is actually more complicated. There are also traits, ...


Now, I think that we are talking about three categories:

  a) Number and string formatting, in C, for example, %d, %x, %u, %s
  b) Classic pointer value formatting, in C, %p
  c) Kernel specific pointer formatting, in C, for example, %pK, %pe, %pS, %pI6


My view:

  Ad a) IMHO, we do not need anything special for the number and string
	formatting. Rust code should use the native Rust formatting.

  Ad b) %p is handled quite special way in kernel:

	+ hashed by default
	+ hashing disabled with "no_hash_pointers"
	+ special hashing of early code when "debug_boot_weak_hash"
	+ no hashing for IS_ERR_OR_NULL(ptr) values
	+ fallback to "(____ptrval____)" : "(ptrval)" before
	  random numbers are initialized enough

      I would try to avoid as much duplicity as possible.
      IMHO, the current approach duplicates too much.

      This is why I suggested to add a wrapper for
      scnprintf(buf, size, "%p", ptr) and call it from Rust.

      By other words, I think that this is close to the c) category
      with all the kernel-specific pointer format modifiers. They
      print the data at the pointer address a special way.


   Ad c) I am not sure how to handle all the kernel-specific %p?
	 modifiers in Rust.

	I guess that it will be done by implementing "fn fmt"
	in a crate for the related pointer type. Or something like
	this.

	Note that I have almost zero knowledge about Rust at the
	moment :-/

> Now, just using scnprintf to write the resulting string to a buffer and
> passing that string into the Rust formatting machinery is also an option
> of course. Especially for modifiers such as %pF that prints something
> like versatile_init+0x0/0x110.

Yeah, I think that this might be a good option how to export
the kernel-specific handling of the various %p?, formats,
including plain %p, on the C side.

Best Regards,
Petr
