Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7E931F983
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 21:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459541; cv=none; b=ZNoWW/Rqn8ky999hW9yl/XdIW0tKLBpgydUvWFDVZ2qBEilTY4c34NRO5HCdVBTvy/Z1hlVdXkTavFqo9uubtpccBLdctni/9uOm2Q3+izH6G/cF0utPyM8XsukCySOJl+AZFUAtrQl/kvLGDl7hZko5pbKBKHczTMBPYNOq9lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459541; c=relaxed/simple;
	bh=opkhXQ0lcaMxHbbYuSB+PJk9V1vg4E3l/H9QfsvJUN4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BFBiKuaMO5ZFAJXrMOjhVGrpbkE+bz6qzG42/oCIDMkNAZWgp8gR4XXs8lC3PmRfAkqhBIreO/wmyAr1RsJTIZl092DSn4P4Lz7WjMApcZKoFoEBT7vVFmd91NhHGzpY3kq7e/dw/CjsxppxObrrc/9RWxRARkS13jNZdgR/loo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FaY3fL7s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FaY3fL7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783459539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=opkhXQ0lcaMxHbbYuSB+PJk9V1vg4E3l/H9QfsvJUN4=;
	b=FaY3fL7s9RIFU5+SuCzHJVGQReiWiHbque22eL+WEdg1AEu8mWl5lntUhbSxjqr3xdE7MX
	zs2B++nEZHWKQGb2N2Ui8RSXk9rg7YEjUxkdQRswnegea+B+FJGVOiQGSfFZKk0R3kOu+D
	CG62szWqZB/d4aYiYmulOdBsH5iM9S4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-XgNlso14PBm85p2eJmC47A-1; Tue, 07 Jul 2026 17:25:38 -0400
X-MC-Unique: XgNlso14PBm85p2eJmC47A-1
X-Mimecast-MFC-AGG-ID: XgNlso14PBm85p2eJmC47A_1783459537
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e934385db1so734026d6.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 14:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783459537; x=1784064337;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opkhXQ0lcaMxHbbYuSB+PJk9V1vg4E3l/H9QfsvJUN4=;
        b=dFD0UNvP5kmuXVf6uxjvPrYjeKi5bERJg/lJuZ32Whyj0Y7XxTESXEmhSHEwrv4YgS
         0Ve5fBcU2gnz/IWibAKXA+lEp5w4yPZZHEGOk1xN9S72tsVnY7q5+ghwo4U386AKHTet
         ZKujn//LZIukJ6AI8b3LZzZS3+Cu9nPjDJiQ1ZXpHHm9C1ftbPXLr0dra+6Qb/c+b3lG
         oSlei3nVtKuNrt/lPfgfI0FMYE9dtBoK6reYc4hXcJ/SOS/urFyPKyxVkITHAavsh7+s
         WGhO/v6QtisILBcM1OkXDJj8M/Oy1KndynNWXMclQeYS45Y8Nb1F3Wsz2VR6Yp6wYvlz
         5SrA==
X-Forwarded-Encrypted: i=1; AHgh+RqSzUyuW969PcWM5FRtp1w1KrI+OCcspJHKsj8ZkeqoWbLMg2FPGf95r36IJ0pc+OgzVDotI9/REsqLyO1DlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYS/1fEaK02KpSQfkwYzuY7rZNOj2y8rrq4Guoz+E3yJP0Oih5
	slleINBQuf8+j04skx7++gf5ZHlJlBM5aI0fFn1ZWvDcgd72Bk3NZ7aAlusT60pH8Ppb6ESUZ6l
	1PA2A3TUqYQluZe+l1D7muIWPB2Si0YwCZAPEvLrTmhmlRldZLs+o+1/WfXRl7AbHXsJM
X-Gm-Gg: AfdE7cmQDvMJ1IW4C7kzEzIBTm3sLKOZui0odllWCYh6XY1ADJR91WAqOoSvM+xFNIq
	3NAQyonIzUh/cR5M4BMYw1mv816UdnE1oZ+mpnu02SUVtsyJznUv+KXnGk9Uyk2R7odqNigS66s
	bz+oKmcsU9vlQCkMbPpMlf6pcifvUDwsUEErPYkCd73UW590xeG5moh0bZp8/+C3LMdHKdvG5aE
	W4Ogt/eBXNA7NaGtqj/cQGK3Y8XyhtqJgcFFpNLqRCoCatv6g4JML2szSKiYT/rwdPeYcmTIkZC
	mx8uqXPgHsipCM/fn+4uw17BUcJj8k3XMoMaCxmUVajPjsgZvfUaLT3Gux7KcXu7/c6JcaCBNVG
	Sz+xRf9c=
X-Received: by 2002:a05:622a:120c:b0:517:6b31:8058 with SMTP id d75a77b69052e-51c748534b4mr73040711cf.40.1783459537444;
        Tue, 07 Jul 2026 14:25:37 -0700 (PDT)
X-Received: by 2002:a05:622a:120c:b0:517:6b31:8058 with SMTP id d75a77b69052e-51c748534b4mr73040371cf.40.1783459536693;
        Tue, 07 Jul 2026 14:25:36 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e942af0sm171643796d6.14.2026.07.07.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 14:25:36 -0700 (PDT)
Message-ID: <1df84ed4095c28f1b636ef914ad43b80e00a38ab.camel@redhat.com>
Subject: Re: [PATCH RFC 1/2] rust: sync: introduce a way to create lock
 class from caller
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
Date: Tue, 07 Jul 2026 17:25:35 -0400
In-Reply-To: <20260703-rust_lockdep-v1-1-1c21c62d0341@garyguo.net>
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
	 <20260703-rust_lockdep-v1-1-1c21c62d0341@garyguo.net>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Bp56TKv4WeFZRuJBFSDbTzTjKCETPLvKBnkU2XR8Eo_1783459537
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2026-07-03 at 14:47 +0100, Gary Guo wrote:
> Rust provides a `#[track_caller]` mechanism that can be used to
> identify
> callers from callees. This also works across multiple level of calls.
> As lockdep only needs the address for static key classes, the address
> of
> these `&'static Location` can be used as unique lock class keys.
> This allows a more implicit way of creating lock classes without
> having to
> use macros.
>=20
> Create `LockClassKey::from_caller`, and use it for mutex and
> spinlocks.
>=20
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> =C2=A0rust/kernel/sync.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37
> +++++++++++++++++++++++++++++++++----
> =C2=A0rust/kernel/sync/lock.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 13 +++++++++++--
> =C2=A0rust/kernel/sync/lock/mutex.rs=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +--
> =C2=A0rust/kernel/sync/lock/spinlock.rs |=C2=A0 3 +--
> =C2=A04 files changed, 46 insertions(+), 10 deletions(-)
>=20
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 993dbf2caa0e..cf76fb37c460 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -5,8 +5,12 @@
> =C2=A0//! This module contains the kernel APIs related to synchronisation
> that have been ported or
> =C2=A0//! wrapped for usage by Rust code in the kernel.
> =C2=A0
> -use crate::prelude::*;
> -use crate::types::Opaque;
> +use core::panic::Location;
> +
> +use crate::{
> +=C2=A0=C2=A0=C2=A0 prelude::*,
> +=C2=A0=C2=A0=C2=A0 types::Opaque, //
> +};
> =C2=A0use pin_init;
> =C2=A0
> =C2=A0mod arc;
> @@ -66,6 +70,31 @@ impl LockClassKey {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 /// Obtain a statically allocated lock class key iden=
tified by
> the caller's location.
> +=C2=A0=C2=A0=C2=A0 ///
> +=C2=A0=C2=A0=C2=A0 /// Different caller locations will be guaranteed to =
have
> different lock class keys; however for
> +=C2=A0=C2=A0=C2=A0 /// the same caller location, this may return differe=
nt keys,
> e.g. if the caller is instantiated
> +=C2=A0=C2=A0=C2=A0 /// in different object files.
> +=C2=A0=C2=A0=C2=A0 #[inline]
> +=C2=A0=C2=A0=C2=A0 #[track_caller]
> +=C2=A0=C2=A0=C2=A0 pub const fn from_caller() -> Pin<&'static Self> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static_assert!(size_of::<Loca=
tion<'_>>() >=3D
> size_of::<LockClassKey>());
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #[cfg(CONFIG_LOCKDEP)]
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let c=
aller =3D Location::caller();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: For static objects, lockdep does not touch
> the underlying memory, and only
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // th=
e address matters. `Location::caller()` is in
> rodata so it meets the requirement.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Th=
e size check above makes sure that it does not
> overlap with other lock class keys.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsaf=
e {
> Pin::new_unchecked(&*core::ptr::from_ref(caller).cast::<Self>()) }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // A separate version if lock=
dep is disabled to avoid
> unnecessary `Location` being
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // generated.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #[cfg(not(CONFIG_LOCKDEP))]
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static_lock_class!()
> +=C2=A0=C2=A0=C2=A0 }
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Initializes a dynamically allocated lock cla=
ss key.
> =C2=A0=C2=A0=C2=A0=C2=A0 ///
> =C2=A0=C2=A0=C2=A0=C2=A0 /// In the common case of using a statically all=
ocated lock
> class key, the
> @@ -83,7 +112,7 @@ impl LockClassKey {
> =C2=A0=C2=A0=C2=A0=C2=A0 /// let key_ptr =3D key.into_foreign();
> =C2=A0=C2=A0=C2=A0=C2=A0 ///
> =C2=A0=C2=A0=C2=A0=C2=A0 /// {
> -=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0 stack_pin_init!(let num: =
SpinLock<u32> =3D SpinLock::new(
> +=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0 stack_pin_init!(let num: =
SpinLock<u32> =3D
> SpinLock::new_with_lock_class(
> =C2=A0=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0,
> =C2=A0=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 c"my_spinlock",
> =C2=A0=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 // SAFETY: `key_ptr` is returned by the above
> `into_foreign()`, whose
> @@ -129,7 +158,7 @@ fn drop(self: Pin<&mut Self>) {
> =C2=A0/// use kernel::sync::{static_lock_class, Arc, SpinLock};
> =C2=A0///
> =C2=A0/// fn new_locked_int() -> Result<Arc<SpinLock<u32>>> {
> -///=C2=A0=C2=A0=C2=A0=C2=A0 Arc::pin_init(SpinLock::new(
> +///=C2=A0=C2=A0=C2=A0=C2=A0 Arc::pin_init(SpinLock::new_with_lock_class(
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42,
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c"new_locked_in=
t",
> =C2=A0///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static_lock_cla=
ss!(),
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 10b6b5e9b024..447fec291cdf 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -127,8 +127,17 @@ unsafe impl<T: ?Sized + Send, B: Backend> Send
> for Lock<T, B> {}
> =C2=A0unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
> =C2=A0
> =C2=A0impl<T, B: Backend> Lock<T, B> {
> -=C2=A0=C2=A0=C2=A0 /// Constructs a new lock initialiser.
> -=C2=A0=C2=A0=C2=A0 pub fn new(
> +=C2=A0=C2=A0=C2=A0 /// Constructs a new lock initialiser with a custom n=
ame.
> +=C2=A0=C2=A0=C2=A0 #[inline]
> +=C2=A0=C2=A0=C2=A0 #[track_caller]
> +=C2=A0=C2=A0=C2=A0 pub fn new_with_name(t: impl PinInit<T>, name: &'stat=
ic CStr) ->
> impl PinInit<Self> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let key =3D LockClassKey::fro=
m_caller();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self::new_with_lock_class(t, =
name, key)
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Constructs a new lock initialiser with a custom n=
ame and
> lock class key.
> +=C2=A0=C2=A0=C2=A0 #[inline]
> +=C2=A0=C2=A0=C2=A0 pub fn new_with_lock_class(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t: impl PinInit<T>,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name: &'static CStr,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key: Pin<&'static LockCl=
assKey>,
> diff --git a/rust/kernel/sync/lock/mutex.rs
> b/rust/kernel/sync/lock/mutex.rs
> index cda0203efefb..3675ce244e08 100644
> --- a/rust/kernel/sync/lock/mutex.rs
> +++ b/rust/kernel/sync/lock/mutex.rs
> @@ -11,8 +11,7 @@
> =C2=A0#[macro_export]
> =C2=A0macro_rules! new_mutex {
> =C2=A0=C2=A0=C2=A0=C2=A0 ($inner:expr $(, $name:literal)? $(,)?) =3D> {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $crate::sync::Mutex::new(
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $inne=
r, $crate::optional_name!($($name)?),
> $crate::static_lock_class!())
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $crate::sync::Mutex::new_with=
_name($inner,
> $crate::optional_name!($($name)?))
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0}
> =C2=A0pub use new_mutex;
> diff --git a/rust/kernel/sync/lock/spinlock.rs
> b/rust/kernel/sync/lock/spinlock.rs
> index ef76fa07ca3a..091167ceda66 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -11,8 +11,7 @@
> =C2=A0#[macro_export]
> =C2=A0macro_rules! new_spinlock {
> =C2=A0=C2=A0=C2=A0=C2=A0 ($inner:expr $(, $name:literal)? $(,)?) =3D> {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $crate::sync::SpinLock::new(
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $inne=
r, $crate::optional_name!($($name)?),
> $crate::static_lock_class!())
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $crate::sync::SpinLock::new_w=
ith_name($inner,
> $crate::optional_name!($($name)?))
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0}
> =C2=A0pub use new_spinlock;

