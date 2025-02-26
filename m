Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788751E1E1C
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 09:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561825; cv=none; b=O3Sw15wXFGIMEdRRSXPmSxaMcLW3WDjEr0ANFCiAXrfpR/rU7PSDPxH1xh3GTFOxlpB6ocsHW7ojkYxTC69F4fN0yE8X4wEhR7QoMZWJwAB4mNxEO6BSbdJRdWfoq5gxt7rs+OkT71ZJoy53G5XOd1C/jSOz6QWGocYnHzN9b2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561825; c=relaxed/simple;
	bh=p4Ym6uFd+a4HjnTUB8RZrVFMgrTyDhnkWn9RtsDN2XE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ru1B9AzLddskT4XaZQFR1zllbXdQTGUxicFd1xC4HnToKTBV2t1u5WaB8k68UyaPFBFlbs3KZBrnpx5nCewlCsIa+2faMtsYxeakZZhBgLLHb0t2/zeIFyddHK9TYFY5zQdCO6fPQrISQAdadSKrFbzvI2TOANzGDLmdzqssdjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EzajmSa0; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EzajmSa0"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4393b6763a3so27875615e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 01:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740561822; x=1741166622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pk8dgs27jijazmvA8B3vaETW0/po24foxSj9cCzDqsU=;
        b=EzajmSa0x/KKEQVBx8YeJ8bErOEjzK3Eeccmw4bKl8/vFZCB441pIrCzzNco/cP2Dw
         SmNaD/rge7oyyPPeFlqlbf6rWy9pXVQ25Q6eLrincHOFgBu213IevXEeHs7IGGpWgX0n
         +2Kjo0GmheIxqXgeZL2iAOHDtx7he8ZszGG+pAl18s8q8JyKxNDJlrfvM6ZysqDSVdzj
         5JXl2nZLtMuzPuk9UimGHzX03poOOH/PEWXJ5Lj6hFnJ/4Bva6qRmaHAC/JF2yh2IKwM
         q6RUO/LbsIMS8RhfaCtrNRc2xgsKG5d3vRV/1oHW/YcT8DnSsNn/NWl06O0dQufAmpMQ
         5QqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740561822; x=1741166622;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pk8dgs27jijazmvA8B3vaETW0/po24foxSj9cCzDqsU=;
        b=gL0tXHf3q+znSO5a6nJO1x6XXYEbF7BwEHZPbq9oLktQnxlINktG0agSQ9mNBs2BC6
         egyTg4mdIg8hRUQ4qoCb42WtE4KKvj3jjpG7GhVtS6Tlz3ilgpc2XR4mgLMUvor1hUrs
         meGL5G0/l4gnRThw1thlsQNKnLavR3APIDNODPDEdS6LODAigUV4qpkKXhLmkNNGlx4X
         lkCF3k+kbUSSKsCWdD4v28YAtx351IXqQjhSigcfxH+phlDI1rO8rIlDxYJi7F3w4yzL
         yOzyP5oEs+0jlwD3JvKZJIcUh/qpmdBqCvo6ybAc6SVt4vxmMYXVZSt/t725YN6xHR4q
         450A==
X-Forwarded-Encrypted: i=1; AJvYcCWAYVaIL2xXktF6c+3j9hYQkFBFM0Hxq4Dxe1xplXCrPhicud7JKzvUcrFclCYur2DK1QLkoxDSQ8F6f1nT7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPXGbinp9Yyi9ZhhQv3kcZisviOf1lAEK09c4x77aIGVMe2ABb
	tg+UTauvl31szp4sp39crXgNfOI+yRqBhlrZy4btEDYlG0IZew3rpdXykcAJQV+HQDGGk659LOy
	XKwiu1W9F9SI0kQ==
X-Google-Smtp-Source: AGHT+IEs8HO5Ml6nZnQ6KRY5UHYewnhQ67q+wlvUIYAlBU5XFYac8t8uvtmNF73ubLQpqxPWbCQNxWONvTz7wYM=
X-Received: from wmbfm22.prod.google.com ([2002:a05:600c:c16:b0:439:98a4:d14])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f93:b0:439:9c0e:3692 with SMTP id 5b1f17b1804b1-439b75b6417mr142482775e9.28.1740561821904;
 Wed, 26 Feb 2025 01:23:41 -0800 (PST)
Date: Wed, 26 Feb 2025 09:23:39 +0000
In-Reply-To: <ea2466c4d250ff953b3be9602a3671fb@dakr.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ea2466c4d250ff953b3be9602a3671fb@dakr.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250226092339.989767-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/2] rust/faux: Add missing parent argument to Registration::new()
From: Alice Ryhl <aliceryhl@google.com>
To: kernel@dakr.org
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, lyude@redhat.com, mairacanal@riseup.net, 
	ojeda@kernel.org, rafael@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 10:06=E2=80=AFAM <kernel@dakr.org> wrote:
>
> On 2025-02-26 09:38, Alice Ryhl wrote:
> > On Tue, Feb 25, 2025 at 10:31=E2=80=AFPM Lyude Paul <lyude@redhat.com> =
wrote:
> >>
> >> A little late in the review of the faux device interface, we added the
> >> ability to specify a parent device when creating new faux devices -
> >> but
> >> this never got ported over to the rust bindings. So, let's add the
> >> missing
> >> argument now so we don't have to convert other users later down the
> >> line.
> >>
> >> Signed-off-by: Lyude Paul <lyude@redhat.com>
> >> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> ---
> >>  rust/kernel/faux.rs              | 10 ++++++++--
> >>  samples/rust/rust_driver_faux.rs |  2 +-
> >>  2 files changed, 9 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> >> index 41751403cd868..ae99ea3d114ef 100644
> >> --- a/rust/kernel/faux.rs
> >> +++ b/rust/kernel/faux.rs
> >> @@ -23,11 +23,17 @@
> >>
> >>  impl Registration {
> >>      /// Create and register a new faux device with the given name.
> >> -    pub fn new(name: &CStr) -> Result<Self> {
> >> +    pub fn new(name: &CStr, parent: Option<&device::Device>) ->
> >> Result<Self> {
> >>          // SAFETY:
> >>          // - `name` is copied by this function into its own storage
> >>          // - `faux_ops` is safe to leave NULL according to the C API
> >> -        let dev =3D unsafe {
> >> bindings::faux_device_create(name.as_char_ptr(), null_mut(), null())
> >> };
> >> +        let dev =3D unsafe {
> >> +            bindings::faux_device_create(
> >> +                name.as_char_ptr(),
> >> +                parent.map_or(null_mut(), |p| p.as_raw()),
> >> +                null(),
> >
> > This function signature only requires that `parent` is valid for the
> > duration of this call to `new`, but `faux_device_create` stashes a
> > pointer without touching the refcount. How do you ensure that the
> > `parent` pointer does not become dangling?
>
> I was wondering the same, but it seems that the subsequent device_add()
> call takes care of that:
>
> https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/base/core.c#L35=
88
>
> device_del() drops the reference.
>
> This makes device->parent only valid for the duration between
> faux_device_create() and faux_device_remove().
>
> But this detail shouldn=E2=80=99t be relevant for this API.

I think this could use a few more comments to explain it. E.g.:

diff --git a/drivers/base/faux.c b/drivers/base/faux.c
index 531e9d789ee0..674db8863d96 100644
--- a/drivers/base/faux.c
+++ b/drivers/base/faux.c
@@ -131,6 +131,7 @@ struct faux_device *faux_device_create_with_groups(cons=
t char *name,
=20
        device_initialize(dev);
        dev->release =3D faux_device_release;
+       /* The refcount of dev->parent is incremented in device_add. */
        if (parent)
                dev->parent =3D parent;
        else
diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 7673501ebe37..713ee6842e3f 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -28,6 +28,7 @@ pub fn new(name: &CStr, parent: Option<&device::Device>) =
-> Result<Self> {
         // SAFETY:
         // - `name` is copied by this function into its own storage
         // - `faux_ops` is safe to leave NULL according to the C API
+        // - `faux_device_create` ensures that `parent` stays alive until =
`faux_device_destroy`.
         let dev =3D unsafe {
             bindings::faux_device_create(
                 name.as_char_ptr(),

