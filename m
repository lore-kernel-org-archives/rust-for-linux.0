Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E21EE7A8
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Mar 2025 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741680236; cv=none; b=IJyg6zL2vzEXqYy7doW9bbAwrUTV0AoOzdEE6bYUQjBwCUMdWOYAjatV6Z1GdTP4yJaqrfJL3M6DjQMV4bBR1oOsITvzINfbk9W38klezCbCQzL14ko6+iHm4KG2s1ptePpsP3sTAvR/btbZVidL0UEVtvgS8IlAdiE5mvZSWU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741680236; c=relaxed/simple;
	bh=2hLZWnCv2EtDgjR8+K6vyZNyIgHxNMcWJXvdlO7Zh1s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hFrE+c4f3WlSMVAINK+KvsBmBU2CtPQcNK2rXm/BW4kFqaipMeyhJJulZ2bOGx9s/JjuXqxN7TJPSC+SdbPzPG30CzYSEgtH3LBi1OhabNYtol9SgbMRH5kOXaJGSSJFJSwi+FR0WMbQlsCSS8M3v6LDq/DQAc2fONhtu5PdHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QHS3BQUq; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QHS3BQUq"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf64f1dc5so10639725e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Mar 2025 01:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741680233; x=1742285033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hLZWnCv2EtDgjR8+K6vyZNyIgHxNMcWJXvdlO7Zh1s=;
        b=QHS3BQUq/XB/hr0supueIRd2pAyWRf71yj3CD+95AWlBPh3Lc/dt+r7BB92DQ4jPsS
         6CJ6gTmkZ3mkR2WDbx9aYpdc+LitYCzYQnhG4kLISupSgAqq3rkeMPkrl11arsOv3/Xd
         At4BRijtBZqsITFTkDGGv9yW8z+mEaFL3I8MyN8zTkC6FqJ2BlQUoy5TS5Wy4ShpNWla
         ZRBEnsQeF3ohlsvNIvpk2Ms4xCQaBVjW+fTxIlGTdNsau1ohwHPho3mbnn2LiQBPvW0i
         K9cVmW6Ybtq1wacXURCM7TczepXj35WNWx1FjhpjL/1LZ+ZWboeS/XP8pwfl1zMhHzUj
         HMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741680233; x=1742285033;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2hLZWnCv2EtDgjR8+K6vyZNyIgHxNMcWJXvdlO7Zh1s=;
        b=leWWdTZKr44JUnixPmBwnq755IYsqIxrD1vwFJ2gsBBHiJH44iJ6HggeVTtQGcptRw
         +9N3VZLzGwxSplbRwdEra3kZ9C9i7GM3IagdS11TTRGTD6xElOQ7qVaMG/d7LWPe+/vw
         XyQULmtsXKwgtfYMx3bkUDDsiqEyP9q3nPTPfmlBOxlwEf1geE3gXmv0bQqUEGMA2jvg
         n+f16Kc3ylSMilW5g/xpZ1KSw+qdPaoOlRiUxS9Llh7JJsJbU15ApUPWX/5yqDL+EtS6
         PjfB0dvmDb8113Io1ywKPaoZNKDS+vCNxeenxA3eR8UaCYdePnhGvDxZ7CwUVjMIQGZm
         5FbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUULzEWaN0foWbCUfEF8/0P1JQ2m4YfwTGUxH751fvs4qQyyn0XhfDv0UV9BmieNdpd8gm8TiLH3rMCje5kaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhuP+gz11/P/n4nRhYQfLG+VZKgYk4OIaNjPOthWGC4SomKjPH
	U08EtXIv8h3k1KlvGiuSHE2dN6OpgAtRwwwCJTptV0J56nqaMXxvnNQZEERM+FIhLwLE9rmTwG1
	BaG4rpY9h48xYIg==
X-Google-Smtp-Source: AGHT+IH2MIRvfpH4CFKMRuL5h1TKTG/FHun9wu65UOLvGgc4pnBQqob4uGqZMxl5J5g5i+cSWeiIdjJ5Uemv4L4=
X-Received: from wmbay8.prod.google.com ([2002:a05:600c:1e08:b0:43c:f482:222])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c9d:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-43cb91c5830mr108693685e9.3.1741680233073;
 Tue, 11 Mar 2025 01:03:53 -0700 (PDT)
Date: Tue, 11 Mar 2025 08:03:50 +0000
In-Reply-To: <87725b0d-42e9-4273-a51f-90c82aad2254@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250310-inline-c-wrappers-v1-1-d726415e6332@posteo.net>
 <CAH5fLgi1YOP9gbXEmYfBtjWeMaqsYpNrrC1fd2rGABCKWYVcbg@mail.gmail.com> <87725b0d-42e9-4273-a51f-90c82aad2254@posteo.net>
Message-ID: <Z8_uZnW_0T24z1sn@google.com>
Subject: Re: [PATCH] rust: task: mark Task methods inline
From: Alice Ryhl <aliceryhl@google.com>
To: Panagiotis Foliadis <pfoliadis@posteo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 04:09:09PM +0000, Panagiotis Foliadis wrote:
>=20
>=20
> On 10/3/25 12:23, Alice Ryhl wrote:
> > On Mon, Mar 10, 2025 at 10:40=E2=80=AFAM Panagiotis Foliadis
> > <pfoliadis@posteo.net> wrote:
> > > When you build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> > > toolchain provided by kernel.org, the following symbols are generated=
:
> > >=20
> > > $ nm vmlinux | grep ' _R'.*Task | rustfilt
> > > ffffffff817b2d30 T <kernel::task::Task>::get_pid_ns
> > > ffffffff817b2d50 T <kernel::task::Task>::tgid_nr_ns
> > > ffffffff817b2c90 T <kernel::task::Task>::current_pid_ns
> > > ffffffff817b2d00 T <kernel::task::Task>::signal_pending
> > > ffffffff817b2cc0 T <kernel::task::Task>::uid
> > > ffffffff817b2ce0 T <kernel::task::Task>::euid
> > > ffffffff817b2c70 T <kernel::task::Task>::current
> > > ffffffff817b2d70 T <kernel::task::Task>::wake_up
> > > ffffffff817b2db0 T <kernel::task::Task as kernel::types::AlwaysRefCou=
nted>::dec_ref
> > > ffffffff817b2d90 T <kernel::task::Task as kernel::types::AlwaysRefCou=
nted>::inc_ref
> > >=20
> > > Most of these Rust symbols are trivial wrappers around the C function=
s
> > > signal_pending, uid, euid, wake_up, dec_ref and inc_ref.It doesn't
> > > make sense to go through a trivial wrapper for these functions, so
> > > mark them inline.
> > There's no C function called dec_ref or inc_ref? Please use the C
> > function names instead of the Rust ones.
> >=20
> > > After applying this patch, the above command will produce this output=
:
> > >=20
> > > ffff8000805aa004 T <kernel::task::Task>::get_pid_ns
> > > ffff8000805aa01c T <kernel::task::Task>::tgid_nr_ns
> > > ffff8000805a9fe8 T <kernel::task::Task>::current_pid_ns
> > > ffff8000805a9fd0 T <kernel::task::Task>::current
> > I think it'd be nice with an explanation of why you did not mark these
> > #[inline].
>=20
> Since the issue focuses on the functions that are trivial wrappers around
> c and `do nothing that call a C function` I thought i would leave this ou=
t
> since there is some other functionality (albeit sometimes minimal) other
> that being just a c-wrapper.

As far as I can tell, all four functions will compile down to a simple
call to a C function.

get_pid_ns, tgid_nr_ns: These functions have a pointer where they say
"if the pointer is null, replace it with null, otherwise just use the
pointer". The optimizer can optimize that to "just use the pointer", and
in fact I checked that this optimization happens when we wrote
tgid_nr_ns.

current_pid_ns: If you add #[inline] to PidNamespace::from_ptr, then
this is just a call to task_active_pid_ns.

current: This is just a call to Task::current_raw which in turn is just
a call to `get_current`.

Alice
