Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86461C8620
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027104; cv=none; b=O3YZaU2+u2RXo7bS7vx2mmvvwI0dNx6KUBS5whqS3AqPmqzXbHXZoq0iZz90W9t1eFmt5HbwC55UCwpv759l/0Vpt5fvxnXn+3dho6LcFiDT7ZzwqV5TZnxznaQqQacagwmL7GwmNVYEn7Ee8sfHyWtkTeP5swIyMjC9vzwJ/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027104; c=relaxed/simple;
	bh=fXRSK8az77nJsoAUy/Cx1DGbZeRTIdVM+Sl7ZshNeOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rgusy0PNatyhFyrvDfpOkEKygqwO492XWnJNhTmQLQQyWoETZl0IxGBb7rVzjKFs8PX4a5a7ZTHiMcOk9Pg7ZANga/NiEduG+Xgv/S6NvAZaiR6P3J1pcW3i2Dts+9ejkPQ/jvH1XXpLFT5TtIcBa6Xc30L/akRY7iBSWKDOqmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=reUT5c2K; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="reUT5c2K"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f88f236167so12087a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 08:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746027101; x=1746631901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6q3AvvTtFldFWOFSDMoyKsrqSUogaJUOndjd33ab2yo=;
        b=reUT5c2Kad1wFrH/hL3Fmf9Ce0uZdfJzvaGvCJtOWu9qe8HMvwSdJoZi9FSLhSQTjq
         MddcwHnt1g/s+HhUi6SJYBTibYKHq1Gy+55VlBpGgjh2uVzqSSnKdffXM5qjgwdM8tna
         Jag+SfMCjERDILsSX+yiRDEuoUaWcL4r6nkk3FhMSoikbWO/mizPO4xNy3dIFaGhtmB4
         2b5zeuEKgtgaBMe6y/bdsf2i2rcWrh/0h8RP7zkou1bH3fGwFTDNb800qBzaW8eU4Qec
         z34+8GboEJ3bjLOT5UTlpPHc0wGpL+gUgM9OEq065wYM02WgMKS//92glQIDdRvZlSFC
         iDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027101; x=1746631901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6q3AvvTtFldFWOFSDMoyKsrqSUogaJUOndjd33ab2yo=;
        b=RSYYc1vEulXMhVbMNfIiahM9Sl2Q1A7jtefjAQSlq64khv2soLGpk/KfSTC5q/5LNc
         R/CcBfyjuAE6QvY4QdCT0YhjRdzK5SCtokRdicA/T6Z2UhK15gyjN6D8pLDM/R+lBqDv
         2z8mTbwR6fXWqw3fNVGPlN+Wf1DqI7bXUI2pgnqECGOXKWJe+HB5lij/ENMLaG/jpQIa
         4fF47X9BknM0HTEL/K1LlQaejoHB5q+zgy463Q6hWdZfqv5HBOYekNrk8c0rZPaZLylw
         yZtHfI52qs5x51IKLm7R19iMi73kFJtunU4ksh6DBcz+g1yLmSXttsuHdi1JaBYSHwns
         XaZw==
X-Forwarded-Encrypted: i=1; AJvYcCXqhA4vykPApdjpG7RC1Hv4u08EHFES89UQ061TskOpkTtFA4IwwAzVlOpT/40uRktZmFVR7wKOzgVNbV03/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPDTZmV28mJpwa11UqugHxQdVcrPVJrL6DSkwSopPRXkUXQSir
	7oKnBYvgS7laLbVu+rwNdw74XMRv8cZFlv9DPt14F0TGKunoa1uHTHt9dds1GuU071j4YZXeC0n
	Duze7yIkvMQkAWSwVj+LZpBcGujV5pyjKjbm5
X-Gm-Gg: ASbGncu3g4uirDeRf+urG62OqjWaO66tLT1jx78yO7XDUQHop+aXl6+w3l+EBPWdBOs
	zowhrdGs+N4A+ci6xHA1tahSMxoL9CHIJgV4IS2WhysgOqvRjC+9gu1frWWjGgPokd0xQ2stq2h
	0W2Cr0MwLlTNlaHSpQGB6Zen+rYGQ10unY+SM9oTyDSUCXRgZH/G0=
X-Google-Smtp-Source: AGHT+IHlGnwmvnKpxZtJsuvf5pcWhU4LUYZV0J7+c0o/5rJjgJHBNuc9DKGt5MQ5K5+xyJ5k7vtXGsFcCBuVMGA050g=
X-Received: by 2002:a05:6402:10c9:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5f8aac01ed0mr105224a12.7.1746027100840; Wed, 30 Apr 2025
 08:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-1-6b6e7cb7929f@google.com> <2025043021-plaza-grip-2916@gregkh>
 <CAGSQo00Kg2QV56LYFg6nRY+yS2KtiVAPaggKaKFCdprjBfXCcA@mail.gmail.com> <2025043022-travesty-slicing-2089@gregkh>
In-Reply-To: <2025043022-travesty-slicing-2089@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:31:29 -0700
X-Gm-Features: ATxdqUEiUtzr0p9I3Jb2VH0NqGLqjnjE0w8Cr3O1gH6G7TBfYuJu6dhVAHvmdE0
Message-ID: <CAGSQo00nE+n41ehYdAuE1XrJmLZJNLEhKYee6qfF0Gp7b0X5Cw@mail.gmail.com>
Subject: Re: [PATCH 1/8] rust: debugfs: Bind DebugFS directory creation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 8:23=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 30, 2025 at 08:10:44AM -0700, Matthew Maurer wrote:
> > On Wed, Apr 30, 2025 at 5:06=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Apr 29, 2025 at 11:15:55PM +0000, Matthew Maurer wrote:
> > > > The basic API relies on `dput` to prevent leaks. Use of `debugfs_re=
move`
> > > > is delayed until the more full-featured API, because we need to avo=
id
> > > > the user having an reference to a dir that is recursively removed.
> > > >
> > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > >
> > > First off, many thanks for doing this.  I like this in general, but I
> > > have loads of specific questions/comments.  Don't take that as a
> > > criticism of this feature, I really want these bindings to be in the
> > > tree and work hopefully better/cleaner than the userspace ones do.
> > >
> > > First off, the main "rule" of debugfs is that you should NEVER care
> > > about the return value of any debugfs function.  So much so that the =
C
> > > side hides errors almost entirely where possible.  I'd like to see th=
is
> > > carried through to the Rust side as well, but I think you didn't do t=
hat
> > > for various "traditional" reasons.
> >
> > Sure, I mostly had to do error checking because I was using an
> > `ARef<Dir>` to represent a directory, which meant that the underlying
> > directory needed to be a valid pointer. Given that you've said that
> > the returned `dentry *` should never be used as an actual `dentry`,
> > only as an abstract handle to a DebugFS object, that requirement goes
> > away, and I can remove the error handling code and always successfully
> > return a `Dir`, even in cases where an error has occurred.
>
> Great!
>
> Except when debugfs is not enabled, then what are you going to return?
> The same structure, or an error?
>
> I'd vote for the same pointer to the structure, just to make it more
> obvious that this is a totally opaque thing and that no caller should
> ever know or care if debugfs is working or even present in the system.
>
> Note that some drivers will want to save a bit of space if debugfs is
> not enabled in the build, so be prepared to make the binding work
> somehow that way too.  Can you have an "empty" object that takes no
> memory?  Or is this too overthinking things?

Based on what you've expressed, I think what makes sense is:

* Initial patch will always return the same `Dir`, just sometimes it
will be a wrapper around a pointer that is an error code, and
sometimes it will be a useful `dentry` pointer. This will match the
current behavior of C code to my understanding.
* Follow-up (probably still in this series) will check
`CONFIG_DEBUG_FS`, and if it's off, will just make `Dir` into a ZST,
and just discard the pointer. This would be an improvement upon the C
interface, because drivers would get the shrinkage without needing to
add conditionals on `CONFIG_DEBUG_FS` in their own driver.

>
> > > Wait, what?  Why would an explicit drop(parent) be required here?  Th=
at
> > > feels wrong, and way too complex.  Why can't you rely on the child
> > > creation to properly manage this if needed (hint, it shouldn't be.)
> >
> > The explicit `drop` is not required for normal usage, it was intended
> > to be illustrative - I was trying to explain what the semantics would
> > be if the parent `dentry` was released before the child was. As
> > before, now that the child will not be an `ARef<Dir>`, and so not
> > assumed to be a valid `dentry` pointer, this example won't be relevant
> > anymore.
>
> Great!
>
> thanks, hopefully this should make things simpler.
>
> greg k-h
