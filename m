Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6BD2882A7
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601196; cv=none; b=kK64zYWo/I8XessEf3uiOyB+zd3yW11ssIdV50kNKrzgIcGVRMnCfAmeWctnimlVWL5aCa66h+cOX/4PmR6dP2PVn0jK8JA6s0j+5ytPP75852rMhVWNR3IPfUgRYprCLEjJbgSLcDDhtsSr6GhnR33tza/inbVQHZ7/v65zkaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601196; c=relaxed/simple;
	bh=dTxYc/IKu3DcL3xT1BkFZKbjD0VBI3+mkBobpZI6TG0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f8hasogeZfE/j9iWULwjIjw1jKdDnwBhHKtJx5UJZv7T+e/kyhDyXePZPrNxrj7VORybPM5klCYYgHhHyc/S3nCTOc4zlZ58lt8Hv2WUgOqDzkTY3Loe68tAgah/mQnzZehAr7xPv0zI0w+RuZivNWdYAIm/5sFeZGgvc3YEDM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g42luu1+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g42luu1+"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477a1e2b372so111346635e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 00:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767601193; x=1768205993; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MC4lgz+vhd9xkI5EZQcemSdMcDBgSh/t6/gI05gnidU=;
        b=g42luu1+Y5LDu2R628X6xpBAwnDGK+p0R3LibBQXIiUv4WBeruFwQ1sxnqKBfIgYGf
         /gLHC/GTu2w/tTDtDglH6wmyagT5SXEoH2275K9ibA1lKH4GvsnDK+8j6PvtNwCmDuA9
         xv7Z4eLfExftL/J07V+l/rshbKZPL30LdWGJ4JUJVrWIMuqmew9cMefFGUM5uPMgCbkg
         UmfP4K8jZ5jNH0HpKhs9CGrYKFBGpBjmUQlOnZUnOwI+mbJDU72tEXZQyfVBLk7M98Cx
         8N62t18WuTNEtUXW9Uh5d985gtfbemuWpgVaAzAODPyeAbDhs6S8iqR7MFYv7S4h1J+u
         VW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601193; x=1768205993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MC4lgz+vhd9xkI5EZQcemSdMcDBgSh/t6/gI05gnidU=;
        b=d/daJKIgUmDsTFypyd784zw7p812Ut3Z/9oksMzboAhyH+1jAZc8yyCckCJXbFty2E
         CI+fAigPBpGzYXTk06BR+mg+MX1eqdUXGyjOw+k1GArYbC0cKP9yEeEHHi7r+H6u0K4i
         iy79ieDfjrpICFKt1AEfSznW2+Ir9UTVnyIZKNgRlYr0oCAPpixiG0yRVWYvWXVCMLvS
         QbOZu7U76w1W1hGQgRaoXDmi/MgKQNC7pAf7lHozWQLFx1AQNc7kd8yqp2/jHOjGnMBu
         B07pYt26I5Q2P19JRqMxqEHJysTRAxJ1fIe362uCro1JXMlBu/qO6emIcfhOEI61uMf2
         G2pA==
X-Forwarded-Encrypted: i=1; AJvYcCVYFeau4EbNTtcHsJ5exT6UkHg0rl8M5HCcU5Ec3gvxd10FRLH++NUdEP/+SKe5zEwbWiEDUsoS0OJryMCWeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVdMccyce7efZ/mhxQOycyMnxP9nYJtL0LQHrrpRxh8jtrB6pH
	FmKIWbWz+J6+FXQdTOvNvDeLBtsSuFAIIa2WlkkuqxJFyVZiEw38DSWIwul12dZIBmkPvheJuay
	T1uG/ELdDDRHeakhylA==
X-Google-Smtp-Source: AGHT+IHDQj6SEgXQrGhkSskeZ/EINOV0mSI0FDjcvcu0XEUcWh8sV+SFo1l/wU2xui/+7vaYB6hTDrTL638ZLx8=
X-Received: from wmbe15.prod.google.com ([2002:a05:600c:590f:b0:47d:52ef:c607])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1385:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-47d3a5f47b3mr424654885e9.7.1767601193036;
 Mon, 05 Jan 2026 00:19:53 -0800 (PST)
Date: Mon, 5 Jan 2026 08:19:49 +0000
In-Reply-To: <aVgC1qXp1La6E9p0@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260101081605.1300953-1-sunke@kylinos.cn> <20260101081605.1300953-4-sunke@kylinos.cn>
 <aVgC1qXp1La6E9p0@pathway.suse.cz>
Message-ID: <aVt0JYbbXLeuqFBt@google.com>
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

On Fri, Jan 02, 2026 at 06:39:34PM +0100, Petr Mladek wrote:
> On Thu 2026-01-01 16:16:03, Ke Sun wrote:
> > Make raw pointers (*const T, *mut T) automatically use HashedPtr when
> > formatted with {:p}, providing safe default behavior for kernel pointers.
> >
> > This allows users to format raw pointers directly:
> >     pr_info!("{:p}\n", ptr);  // Automatically hashed
> 
> It should check no_hash_pointers variable, see default_pointer() in
> lib/vsprintf.c.  See also "no_hash_pointers" and "hash_pointers=never"
> kernel command line options.
> 
> Hashed pointers prevent leaking information but are not good for
> debugging. The "no_hash_pointers" variable allows to print
> raw pointers without changing the code.
> 
> I am not sure how this should be implemented in Rust. If you need
> to keep HashPtr then it should become an implementation detail
> and should not get exported. Nobody wants always hashed pointers.
> 
> I hope that we could find a better solution which would allow
> to reduce the code duplication.
> 
> For example, I wonder what would be needed to allow calling
> snprintf() from Rust code. The fn fmt() might call
> it with "%p" format...  It would make it easier to get
> also other "%p?" formats.
> 
> It seems that something similar has been discussed at
> https://lore.kernel.org/rust-for-linux/CALpAb9MoT20Ch4pe-oMz8kpqaZsvmgNwPk1XSC+faZi7huwQKg@mail.gmail.com/
> And it was said that it would need bigger changes.
> 
> Maybe, we could create C wrappers which would allow to call
> snprintf() with some specific format, e.g.
> 
> int scnprintf_p(char *buf, int size, const void *p)
> {
> 	return scnprintf(buf, size, "%p", p);
> }
> EXPORT_SYMBOL_NS_GPL(scnprintf_p, "RUST_INTERNAL");
> 
> And use the same approach for any other %p? format, e.g. for %pU:
> 
> int scnprintf_pU(char *buf, int size, const u8 *addr)
> {
> 	return scnprintf(buf, size, "%pU", addr);
> }
> EXPORT_SYMBOL_NS_GPL(scnprintf_pU, "RUST_INTERNAL");
> 
> Best Regards,
> Petr
> 
> PS: I suggest to wait longer before sending a new version. It would
>     allow to get feedback from more people who might see it from
>     different angles.

I think there are two approaches we could take:

1. Have the C side provide a method that returns the correct integer
   address to print.
2. Have the C side provide a method that returns the correct string
   to print.

In general, for cases where the output is an integer formatted in some
standard way (e.g. hex), I think the first option is stronger because
the Rust formatting machinery lets you specify different modifiers such
as "prefix with zeroes or spaces" or "how many zeroes/spaces to prefix
with" or "hex uppercase or lowercase" or "hex vs octal vs base10" etc.
By having the C side pass an integer back to Rust, these modifiers are
taken into account automatically.

Now, just using scnprintf to write the resulting string to a buffer and
passing that string into the Rust formatting machinery is also an option
of course. Especially for modifiers such as %pF that prints something
like versatile_init+0x0/0x110.

Alice
