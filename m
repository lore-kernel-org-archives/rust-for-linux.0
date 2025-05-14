Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A62B22371B
	for <rust-for-linux@vger.kernel.org>; Wed, 14 May 2025 21:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259718; cv=none; b=HI0oonQyZYhLZ5HS6SeDthHGI8R3alFbQSu4b5maZxfmvIVKqyyn79YuYCX4heI48GkBZZtB/3agl/eK5LHSpvaUchetG6f7y3svoNqmTyJjDngOuuCZpg9oL8M8AQplUdvZNTxryZQPilFYjINdTS4n9UUijlVSTWeJe8/Oho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259718; c=relaxed/simple;
	bh=bVadc9aZr2iOqXkVaZAFmXyh4XNAEuCm5GX/abPfv14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CF4Tw3jGIUFcttLrvd2AofrTi2FLxbot/BUK1O0toKaKC8+APyshEMNY0Bsq+bVM47r27uzk6pdN+ko511WseYJ3RedZg2mRqTsjS8aDEvfMh67/86cgaeAlI9ZzH2flYp/eTaFI7GoKuPxYE39akYCoULde8AXSpTl9YHrvp6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jb7NSeR4; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jb7NSeR4"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1279a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 May 2025 14:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747259714; x=1747864514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VQtRV5ufZiAh46yc0JAQHBKcwW066Wa8pGlTHjdVBw=;
        b=Jb7NSeR45PzkfN+l8AtISlBPxhe2AFKY0ITmOi9D583qgQfZEBvfm9ZchfP27E6nd9
         Jfp1HNRCnj8sstf617no8kUoBX/dGFumf2V1olVa8l9td9L7SEFtSziFyNB7DHPQOik/
         HeATBHWc5msMOzHJXryNwfwSawu9A9+UfWFsVcWjk6C3P/ZlSWLcYkq0BxVVr2cB7vR1
         K7EXDiguEnuHRIaA4qmhLOtskO96mWmqvF9rWgqPBkeCY3+ezj70KkPqn5DLfe/ktDPz
         KjSKcGSi5DROlXu2s9IRrDvjVFCgrrCkbGsY8PA9SJ5HHsNpZEaVBIypQpYWfE7oX3DF
         syAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747259714; x=1747864514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VQtRV5ufZiAh46yc0JAQHBKcwW066Wa8pGlTHjdVBw=;
        b=wQgNeH3klibnZTkI70qzVgGKVr7H48rAGURoNtMWbdF3F+ibYcJmw/9CtCZcpSr81h
         UdZGXHVIcmYnmTFPunkhGGPopEyzrqumB6NVg3XbffB2b5znP/FIzO1RSp8CpEdqDKYh
         6fdjnMBKJ/Nei9sUm+rFZWWV91BghkbPPmd5hbVmGJHgXwrJ6MBHQbbcEOYQrVnH5akY
         J+itlppOGGTa/XELMpjRvGtB58Vs/ZPkp3ZqFLHdRJDjnTpw0nIQrHaBx2IuN6up432R
         xWChoSVAQx50qI0+sWAiZ6MdmMe6RcKV2g2RZX4vhXF9lZqc1pYf8vqL4VzZoKT9CEB7
         7uxw==
X-Forwarded-Encrypted: i=1; AJvYcCVNRRGEw0w2vXKNo9LW54vrnwl9woTh9Sxkf2M3SauxBHCl8to0qcUzgXiTeAG/LGzHq6zr+kxYsKDgXhwtlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCy7dA8z/Etp6Z/88tZ4NwIE6gbtEyL9SITQsssrunTgvT0468
	oWzCNzWuWJg9Eg6Kqzv4VEBytvdJF4QfuhePGg+iaYteLVoOlDPyVAbYXjbEw52cIGsgrVHcW31
	PWfIh0VZ9lJDk79As8OdAl0wit3kShRK4V3hX8byp
X-Gm-Gg: ASbGncsqle+zqBZFNpyzDKjCzPA/seYepM05WDLurXBKNo/PbD10SFig9hjYLsayPWm
	QWA9bcepSN1PVZQgdjmeXlcuVWzf1BEv9aA0pEaYg7oqPw4Vgrw7z/G40fkrpTehsGTcjTdK+tf
	Xem5s+WvBqfwuqcBRfpWnHzjv8aTA/khnPwgHJrDyqb3FPN2lwoPfHG/E5CcYBAd8=
X-Google-Smtp-Source: AGHT+IFiME6BV5T37fga6cZDbxBNEE1S+GdBsoyT3et6dmBV+37w+db30i9YmaOmlTOKs3Sbtjysj3sP3pfEqcLwnfU=
X-Received: by 2002:a05:6402:753:b0:5fd:2003:3a34 with SMTP id
 4fb4d7f45d1cf-5ffce28b5a0mr9953a12.1.1747259714304; Wed, 14 May 2025 14:55:14
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com> <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
In-Reply-To: <aCRdNJ2oq-REBotd@pollux>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 14 May 2025 14:55:02 -0700
X-Gm-Features: AX0GCFtQJYq_Rs4JDOR1UMOWyyYoJ3ETaZjLvY-VfwOQuDuANZF__EtC1Wak8V8
Message-ID: <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, May 14, 2025 at 09:20:49AM +0200, Benno Lossin wrote:
> > On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
> > > +impl kernel::Module for RustDebugFs {
> > > +    fn init(_this: &'static ThisModule) -> Result<Self> {
> > > +        // Create a debugfs directory in the root of the filesystem =
called "sample_debugfs".
> > > +        let debugfs =3D Dir::new(c_str!("sample_debugfs"));
> > > +
> > > +        {
> > > +            // Create a subdirectory, so "sample_debugfs/subdir" now=
 exists.
> > > +            // We wrap it in `ManuallyDrop` so that the subdirectory=
 is not automatically discarded
> > > +            // at the end of the scope - it will be cleaned up when =
`debugfs` is.
> > > +            let sub =3D ManuallyDrop::new(debugfs.subdir(c_str!("sub=
dir")));
> >
> > I dislike the direct usage of `ManuallyDrop`. To me the usage of
> > `ManuallyDrop` signifies that one has to opt out of `Drop` without the
> > support of the wrapped type. But in this case, `Dir` is sometimes
> > intended to not be dropped, so I'd rather have a `.keep()` function I
> > saw mentioned somewhere.
>
> I agree, if we really want to "officially" support to forget() (sub-)dire=
ctories
> and files in order to rely on the recursive cleanup of the "root" directo=
ry, it
> should be covered explicitly by the API. I.e. (sub-)directories and files=
 should
> have some kind of keep() and / or forget() method, to make it clear that =
this is
> supported and by design and won't lead to any leaks.

OK, I can do this with `.keep()` just being equivalent to
`ManuallyDrop::new`. Since we now only have "by default, things are
dropped", rather than two states, we shouldn't need a `.destroy()`
method.

>
> Consequently, this would mean that we'd need something like your proposed=
 const
> generic on the Dir type, such that keep() / forget() cannot be called on =
the
> "root" directory.

Just to ensure I understand correctly, your opinion is that on
balance, additional complexity in the API types are worth making it
less ergonomic to suppress drop on a root directory, keeping in mind
that they still *can* suppress drop on that directory. You don't want
the extra API variants to do anything else special other than change
the ergonomics of `.keep()` (e.g. don't have subdirectories be default
pre-`.keep()`'d).

>
> However, I really think we should keep the code as it is in this version =
and
> just don't provide an example that utilizes ManuallyDrop and forget().
>
> I don't see how the idea of "manually dropping" (sub-)directories and fil=
es
> provides any real value compared to just storing their instance in a driv=
er
> structure as long as they should stay alive, which is much more intuitive
> anyways.

We can't easily do this, because dropping a root directory recursively
drops everything underneath it. This means that if I have

foo/
  - bar/
  - baz/

Then my directory handle for `bar` have to be guaranteed to outlive my
directory handle for `foo` so that I know it's didn't get deleted
under me. This is why they have a borrow onto their parent directory.
This borrow means that you can't (without `unsafe`, or something like
`yoke`) keep handles to `foo` and `bar` in the same struct.

I could arguably make the subdir handle creator *take ownership* of
the root handle, which would mitigate this issue, but if we want to
allow creation of arbitrarily shaped trees, we'd either end up rapidly
reproducing something like my builder interface from the follow-up
series which I understand folks aren't enthused about, or we'd end up
with Rust having a mirror struct of some kind, e.g.

```
struct Tree {
  name: CString,
  // Order is load bearing, any children must be dropped before their paren=
t
  children: KVec<Tree>
  root: Dir,
}

impl Tree {
  fn subdir(&mut self, name: &CStr) -> &mut Tree {
    if let Some(x) =3D children.iter_mut().find(|tree| tree.name =3D=3D nam=
e) {
      x
    } else {
      // This is an internal function, similar to Dir::create
      // SAFETY: The structure promises all children will be released
before the parent directory is destroyed.
      self.children.push(unsafe { Tree::sys_subdir(self.dir, name) })
      self.children.last_mut().unwrap()
    }
}
```

This structure has the downside that we now need to track the file
structure in Rust too, not just in the main kernel. This gets more
complex when we add Files, but follows the same approximate structure.

If we don't track the filenames, you have no way to reference
subdirectories again later. If we do track them, we're reproducing
dentry structure less efficiently in Rust. Additionally, because this
needs to track filenames, this now means that `CONFIG_DEBUG_FS=3Dn` is
no longer free.

>
> It either just adds complexity to the API (due to the need to distingish =
between
> the "root" directory and sub-directories) or makes the API error prone by
> providing a *valid looking* option to users to leak the "root" directory.
>
> - Danilo
