Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE40330FF1D
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 21:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459508; cv=none; b=p3t6yGGeHBxcyLH3CFHE8ue4jRtQWFR9ttYfJ3OtoXbh/1XoKOxUHlal9g6NJhfEZW517av94m8JSovTxvX3/fvs8adEOBTo7dtqDSb6hdzxGOtlQ+WLhRkH0WsnZd/JuDW7Po1lkF67WtWWW+EvTRI5SRjbJq//V04sswU9bGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459508; c=relaxed/simple;
	bh=/TvGuKACJ8YCYobU7nAa0jKluqBcQbMxwsYcDW33eOM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SEvlAtzWS5gi7yvjGkHPbwh4HHkcMvZ0f4HywscUmQ1ZqNj+f6X+9tDsr6Knv4soC/1TJ9t1IOGGY5gTpdpiruPthAO+uri9tmUNeWVKXFtQ7JeIy4avqJTCi25IFUTEuUlXWQ06AYFgHoT+nNJZqMywpp86vqkGQ+xM7WOvZUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ho5L8wom; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ho5L8wom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783459505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TvGuKACJ8YCYobU7nAa0jKluqBcQbMxwsYcDW33eOM=;
	b=Ho5L8womIObk9evpDZsT74ICLe+ud1mGcLUa3OhfDuNJjt8SIOJOq0HOMOg2UU3eFdof9T
	MGWAyvEeByaAFwvj1VQmUmUp/JhbFP0F/4Dsoh9u0jwa8VHWkxiw16fxFmVVBEymmOkNC2
	KmTE4fdNSitAYzH6OqH5oaiOYeKrR/M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-UfZ3xSFbO_GTiBbmZCznog-1; Tue, 07 Jul 2026 17:25:04 -0400
X-MC-Unique: UfZ3xSFbO_GTiBbmZCznog-1
X-Mimecast-MFC-AGG-ID: UfZ3xSFbO_GTiBbmZCznog_1783459504
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e61b38eddso853732885a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 14:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783459504; x=1784064304;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8+egEg7XjneaX0dUc2JhrJLuH5wZDzqw0byrp9deh4=;
        b=ixFJ/7+FR8AJulPDR3f2eqP6x+G4NKnqiZe0ieIAlR/GLYcDbcdVifvvpLnczHI1Hx
         THgY5yiS94BTHB6Df0DklieQLeyXX7qAyidCcE9GG7WLGjZEgKXPVFczJGTqVPYAq1ag
         8aTxw/KAaenJiUEHEmlP6vBF1cAT0e9DEvLnv7acnwL25FS29wqpp8NfuIstqurqhLO2
         +erv66cCLGvoy5LO3TBqP242j6h2RmnZK29VrgABXsn9vBUdQmPnzpJ6EzWSmp6JYQ/7
         8cwQSU4P9hR8F/EHXXLFMHMs1Lc9Jvg/v9TthMDmTV63u+M9e5290DmTV5yIJvyYShqt
         0q1w==
X-Forwarded-Encrypted: i=1; AHgh+Rq01KaRTrJVjVfVwekQqJTTZV39cNMd9zScC+6jHbHtCT8kEI4mUuwHtcx12C0KUDoipbqOGKMZysDBjHuPtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzrQwKT0HkNaJlxOxvMxct3wybT9mTT9mQ+WjStzO+jecxlo4W
	sOLYMGsVoDh7PcbsOLg9oduQwDtHAbXzdVRCPEWc5ZgiJfpSAwfpQsXmtg6iGOGy3rZBj/OIQwO
	1g+CuBzbiBeMtzCUczFLI/z7AyMeeU4OEULZFkkCpoMLG/11HQIjbfAHBYTlKYI5rovn5
X-Gm-Gg: AfdE7ckbOCfAVdEO+EqMh/LJHnDAp5wvwkIw+bw5P8vragaQ1g+qXbuebvTx7QEBFsf
	frZhGb6ZSPUDuBxxE3xDjyNUt27up8qUexmCB7NFrM4FLyRwP/+jQeCJJHxJqWxJg4W5xUqH7sB
	OYoIoqRFaVctxiHm3eaTxeJRGyBpgv4GGhF0awU1CVeHZ5eGvTMGH7LhCF4l9T95KWg22raId2z
	tV6I1Q6Nv4+9unpp7dUCcDvnBYbbK99F3vpiYKc4vxKtRTz4QyhWn6dJkcbabrrOLhNuP0NL2rx
	iGROhqHusipg527pdcDN+i5s2L1as0Zab7sK4rghCnqinPUehS8RtM7bzIcXfoYS5mooUrvIKdf
	ZFxgQihk=
X-Received: by 2002:a05:620a:ac08:b0:92e:bcb5:f180 with SMTP id af79cd13be357-92ebcb5f234mr541365985a.32.1783459502784;
        Tue, 07 Jul 2026 14:25:02 -0700 (PDT)
X-Received: by 2002:a05:620a:ac08:b0:92e:bcb5:f180 with SMTP id af79cd13be357-92ebcb5f234mr541357585a.32.1783459501440;
        Tue, 07 Jul 2026 14:25:01 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90bb8629sm1264581885a.19.2026.07.07.14.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 14:25:00 -0700 (PDT)
Message-ID: <be7651a76f2932b8781b05fc72dfb60c4e779732.camel@redhat.com>
Subject: Re: [PATCH RFC 2/2] lockdep: delegate Rust lock class printing to
 Rust code
From: lyude@redhat.com
To: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, Alice Ryhl	
 <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, Onur
 =?ISO-8859-1?Q?=D6zkan?=	 <work@onurozkan.dev>, Miguel Ojeda
 <ojeda@kernel.org>,  =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich	 <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot	 <acourbot@nvidia.com>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar	 <mingo@redhat.com>, Will Deacon
 <will@kernel.org>, Waiman Long	 <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Tue, 07 Jul 2026 17:24:59 -0400
In-Reply-To: <20260703-rust_lockdep-v1-2-1c21c62d0341@garyguo.net>
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
	 <20260703-rust_lockdep-v1-2-1c21c62d0341@garyguo.net>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S1xhE0JtwuEwS022CmODuSYUXjGYQ_PylJTBOuHlxfI_1783459504
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks great, one comment below:

On Fri, 2026-07-03 at 14:47 +0100, Gary Guo wrote:
> Add a special "(rust)" name which means that the lock class comes
> from Rust
> `#[track_caller]` and thus should be delegated to Rust code to print
> the
> name.
>=20
> This allows locks to be created with usual constructor syntax and
> does not
> need macros anymore.
>=20
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> =C2=A0kernel/locking/lockdep.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++++++-
> =C2=A0kernel/locking/lockdep_internals.h |=C2=A0 3 +++
> =C2=A0rust/kernel/sync.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++++++++++++++++++++++
> =C2=A0rust/kernel/sync/lock.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++++++
> =C2=A0rust/kernel/sync/lock/mutex.rs=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++=
++----
> =C2=A0rust/kernel/sync/lock/spinlock.rs=C2=A0 |=C2=A0 8 ++++----
> =C2=A06 files changed, 49 insertions(+), 9 deletions(-)
>=20
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 2d4c5bab5af8..1e05d51e710f 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -724,7 +724,12 @@ static void __print_lock_name(struct held_lock
> *hlock, struct lock_class *class)
> =C2=A0=09=09name =3D __get_key_name(class->key, str);
> =C2=A0=09=09printk(KERN_CONT "%s", name);
> =C2=A0=09} else {
> -=09=09printk(KERN_CONT "%s", name);
> +=09=09if (CONFIG_RUST && class->name =3D=3D lockdep_rust_name)
> +=09=09=09lockdep_print_rust_name((struct
> lock_class_key *)(
> +=09=09=09=09class->key - class->subclass
> +=09=09=09));
> +=09=09else
> +=09=09=09printk(KERN_CONT "%s", name);
> =C2=A0=09=09if (class->name_version > 1)
> =C2=A0=09=09=09printk(KERN_CONT "#%d", class-
> >name_version);
> =C2=A0=09=09if (class->subclass)
> diff --git a/kernel/locking/lockdep_internals.h
> b/kernel/locking/lockdep_internals.h
> index 0e5e6ffe91a3..d18d50f7fd99 100644
> --- a/kernel/locking/lockdep_internals.h
> +++ b/kernel/locking/lockdep_internals.h
> @@ -134,6 +134,9 @@ extern void get_usage_chars(struct lock_class
> *class,
> =C2=A0extern const char *__get_key_name(const struct lockdep_subclass_key
> *key,
> =C2=A0=09=09=09=09=C2=A0 char *str);
> =C2=A0
> +extern const char lockdep_rust_name[];
> +extern void lockdep_print_rust_name(struct lock_class_key *key);
> +
> =C2=A0struct lock_class *lock_chain_get_class(struct lock_chain *chain,
> int i);
> =C2=A0
> =C2=A0extern unsigned long nr_lock_classes;
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index cf76fb37c460..cf35858469d1 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -8,6 +8,7 @@
> =C2=A0use core::panic::Location;
> =C2=A0
> =C2=A0use crate::{
> +=C2=A0=C2=A0=C2=A0 pr_cont,
> =C2=A0=C2=A0=C2=A0=C2=A0 prelude::*,
> =C2=A0=C2=A0=C2=A0=C2=A0 types::Opaque, //
> =C2=A0};
> @@ -150,6 +151,29 @@ fn drop(self: Pin<&mut Self>) {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> +// We want this to be completely unique so lockdep can identify when
> lock classes are generated with
> +// `new_static` mechanism, hence making this `static` and attach a
> `link_section` so it cannot be
> +// merged with other constants.
> +#[export_name =3D "lockdep_rust_name"]
> +#[link_section =3D ".rodata"]
> +static LOCKDEP_RUST_NAME_BYTES: [u8; 7] =3D *b"(rust)\0";
> +
> +// This should only be used in conjunction of
> `LockClassKey::from_caller`.
> +const LOCKDEP_RUST_NAME: &CStr =3D match
> CStr::from_bytes_with_nul(&LOCKDEP_RUST_NAME_BYTES) {
> +=C2=A0=C2=A0=C2=A0 Ok(v) =3D> v,
> +=C2=A0=C2=A0=C2=A0 Err(_) =3D> unreachable!(),
> +};
> +
> +#[cfg(CONFIG_LOCKDEP)]
> +#[expect(clippy::missing_safety_doc)]
> +#[no_mangle]
> +unsafe extern "C" fn lockdep_print_rust_name(key: *mut
> bindings::lock_class_key) {
> +=C2=A0=C2=A0=C2=A0 // SAFETY: `rust_print_lockdep_name` is called when t=
he lock
> name is a reserved value indicating
> +=C2=A0=C2=A0=C2=A0 // that the lock_class_key is static and backed by a =
`Location`.
> +=C2=A0=C2=A0=C2=A0 let location =3D unsafe { &*key.cast::<Location<'_>>(=
) };
> +=C2=A0=C2=A0=C2=A0 pr_cont!("{}:{}", location.file(), location.line());
> +}
> +
> =C2=A0/// Defines a new static lock class and returns a pointer to it.
> =C2=A0///
> =C2=A0/// # Examples
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 447fec291cdf..66d51c860483 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -127,6 +127,14 @@ unsafe impl<T: ?Sized + Send, B: Backend> Send
> for Lock<T, B> {}
> =C2=A0unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
> =C2=A0
> =C2=A0impl<T, B: Backend> Lock<T, B> {
> +=C2=A0=C2=A0=C2=A0 /// Constructs a new lock initialiser with a custom n=
ame.

I think this rustdoc is a bit confusing: we say "with a custom name"
but this function doesn't provide any way of actually specifying a
name. Maybe this would make more sense?

"Constructs a new lock initialiser using an auto-generated name."

With that fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>

> +=C2=A0=C2=A0=C2=A0 #[inline]
> +=C2=A0=C2=A0=C2=A0 #[track_caller]
> +=C2=A0=C2=A0=C2=A0 pub fn new(t: impl PinInit<T>) -> impl PinInit<Self> =
{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let key =3D LockClassKey::fro=
m_caller();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self::new_with_lock_class(t, =
super::LOCKDEP_RUST_NAME, key)
> +=C2=A0=C2=A0=C2=A0 }
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Constructs a new lock initialiser with a cus=
tom name.
> =C2=A0=C2=A0=C2=A0=C2=A0 #[inline]
> =C2=A0=C2=A0=C2=A0=C2=A0 #[track_caller]
> diff --git a/rust/kernel/sync/lock/mutex.rs
> b/rust/kernel/sync/lock/mutex.rs
> index 3675ce244e08..c730196b9d2d 100644
> --- a/rust/kernel/sync/lock/mutex.rs
> +++ b/rust/kernel/sync/lock/mutex.rs
> @@ -24,8 +24,8 @@ macro_rules! new_mutex {
> =C2=A0///
> =C2=A0/// Since it may block, [`Mutex`] needs to be used with care in
> atomic contexts.
> =C2=A0///
> -/// Instances of [`Mutex`] need a lock class and to be pinned. The
> recommended way to create such
> -/// instances is with the [`pin_init`](pin_init::pin_init) and
> [`new_mutex`] macros.
> +/// Instances of [`Mutex`] need to be pinned. You can create such
> instances with the
> +/// [`pin_init`](pin_init::pin_init).
> =C2=A0///
> =C2=A0/// # Examples
> =C2=A0///
> @@ -33,7 +33,7 @@ macro_rules! new_mutex {
> =C2=A0/// contains an inner struct (`Inner`) that is protected by a mutex=
.
> =C2=A0///
> =C2=A0/// ```
> -/// use kernel::sync::{new_mutex, Mutex};
> +/// use kernel::sync::Mutex;
> =C2=A0///
> =C2=A0/// struct Inner {
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0 a: u32,
> @@ -51,7 +51,7 @@ macro_rules! new_mutex {
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0 fn new() -> impl PinInit<Self> {
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin_init!(Self =
{
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 c: 10,
> -///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 d <- new_mutex!(Inner { a: 20, b: 30 }),
> +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 d <- Mutex::new(Inner { a: 20, b: 30 }),
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 })
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0/// }
> diff --git a/rust/kernel/sync/lock/spinlock.rs
> b/rust/kernel/sync/lock/spinlock.rs
> index 091167ceda66..f8bec26f1cee 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -22,8 +22,8 @@ macro_rules! new_spinlock {
> =C2=A0/// one at a time is allowed to progress, the others will block
> (spinning) until the spinlock is
> =C2=A0/// unlocked, at which point another CPU will be allowed to make
> progress.
> =C2=A0///
> -/// Instances of [`SpinLock`] need a lock class and to be pinned.
> The recommended way to create such
> -/// instances is with the [`pin_init`](pin_init::pin_init) and
> [`new_spinlock`] macros.
> +/// Instances of [`SpinLock`] need to be pinned. You can create such
> instances with the
> +/// [`pin_init`](pin_init::pin_init).
> =C2=A0///
> =C2=A0/// # Examples
> =C2=A0///
> @@ -31,7 +31,7 @@ macro_rules! new_spinlock {
> =C2=A0/// contains an inner struct (`Inner`) that is protected by a
> spinlock.
> =C2=A0///
> =C2=A0/// ```
> -/// use kernel::sync::{new_spinlock, SpinLock};
> +/// use kernel::sync::SpinLock;
> =C2=A0///
> =C2=A0/// struct Inner {
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0 a: u32,
> @@ -49,7 +49,7 @@ macro_rules! new_spinlock {
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0 fn new() -> impl PinInit<Self> {
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin_init!(Self =
{
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 c: 10,
> -///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 d <- new_spinlock!(Inner { a: 20, b: 30 }),
> +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 d <- SpinLock::new(Inner { a: 20, b: 30 }),
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 })
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0/// }

