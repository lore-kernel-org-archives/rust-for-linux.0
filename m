Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A4847F2D5;
	Wed, 23 Sep 2026 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157281; cv=none; b=MBSByRoN5MbVIU5n8IYjpIb9pUETY+VRC8d21DisXzNmS/GdBMLGbxYAvTgPWUNhFaUxDPKKn4ZZ08mctEd8ofcJ3nI1rH13FFupmKqBqV3EnRBzVTqO4Lt7+EObFq4dNiWthuci8VAp8RyUaTRvl0Srw8E8xfOsS57vVhbOh3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157281; c=relaxed/simple;
	bh=L4/n+65sMdgjRJcyuPD7nEB2hnY7edDeSQ2y+aq3guU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mDCVXTF+IvTW9FqS/d/QCISf8JQLMsvzP3nJR6JUil/QNWca754w40eP9D2VHsP966nMgMvWKx3b2dxUtMtNy+CYfsjlgjaJY0JBzP9X1HPOUYLzOn/0KVu3XfxHHGqy9ziPyjnTgknVRfAfbaiT3RqOuTOY4pPKVVAtn7qYblo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ul50Wr5G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ul50Wr5G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5441F00893;
	Wed, 23 Sep 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790157278;
	bh=k7iECOsQjJSZD5VEWOPiYHIjpbmBagUaEuQH/HWxFDc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ul50Wr5GsPkPxrF5Vw+AsiTa3MtRbd4GD7rPc4axl82bpbj8xgospZ6qvzYg5Bmu+
	 ubvrkEzIBag0RMKgcoz8/IP7HE5DVgBBzUXZZYQoxe5Iu5bxqwmtWI8vtH+CtAyfTw
	 XvJd8Tzx773MH9NF1c97LjolxrFpE66fyZQIIIlK9o+qI8WjMNG/f0yWv8+HvplJuo
	 TeNM0u3NmuxAiQHTXniD8fyY10Ys/Qk/1ueEqiyVHo0DVYa25QMuoC7GJJzeg/JDC8
	 Jn31+uZ62Zac0wEVttYYI3k95dP+V8X9aWkP2YqbiXGuHlk/VVJBMbS0UQQdx4xB73
	 Qufi1mh87gFpA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>, Breno
 Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Younes
 Akhouayri <git@younes.io>
Subject: Re: [PATCH v3] rust: configfs: fix object initialization cleanup
In-Reply-To: <20260818-fix-rust-configfs-registration-state-v1-v3-1-28b5cbfe0a72@younes.io>
References: <20260818-fix-rust-configfs-registration-state-v1-v3-1-28b5cbfe0a72@younes.io>
Date: Wed, 23 Sep 2026 11:54:27 +0200
Message-ID: <87ld8s2sz0.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org> writes:

> From: Younes Akhouayri <git@younes.io>
>
> Subsystem::new() calls configfs_register_subsystem() at the end of its
> pin initializer. If registration returns an error, release the config
> item's initial reference and destroy the initialized mutex before
> returning. Otherwise, long subsystem names allocated by
> config_item_set_name() leak.
>
> The initial reference also remains after a successful subsystem is
> unregistered. Release it from PinnedDrop before the Rust container is
> destroyed.
>
> Initialize driver data before the C configfs object in Subsystem::new()
> and Group::new(). Then failure while initializing driver data cannot
> leave an initialized config group, and its allocated name, behind.
>
> Keeping registration inside try_pin_init! also means PinnedDrop is
> installed only after registration succeeds. A duplicate name therefore
> returns -EEXIST without attempting to unregister a subsystem whose
> ci_dentry was never set.
>
> Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs=
")
> Signed-off-by: Younes Akhouayri <git@younes.io>
> ---
> Changes in v3:
> - Initialize driver data before configfs groups.
> - Release the initial group reference after registration failure and unre=
gister.
> - Link to v2: https://patch.msgid.link/20260818-fix-rust-configfs-registr=
ation-state-v1-v2-1-9acedd3070f7@younes.io
>
> Changes in v2:
> - Register the subsystem at the end of try_pin_init!.
> - Destroy su_mutex when registration fails.
> - Remove the registered flag.
> - Link to v1: https://patch.msgid.link/20260818-fix-rust-configfs-registr=
ation-state-v1-v1-1-c929990bc8ef@younes.io
>
> To: Andreas Hindborg <a.hindborg@kernel.org>
> To: Breno Leitao <leitao@debian.org>
> To: Miguel Ojeda <ojeda@kernel.org>
> To: Boqun Feng <boqun@kernel.org>
> To: Gary Guo <gary@garyguo.net>
> To: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> To: Benno Lossin <lossin@kernel.org>
> To: Alice Ryhl <aliceryhl@google.com>
> To: Trevor Gross <tmgross@umich.edu>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Daniel Almeida <daniel.almeida@collabora.com>
> To: Tamir Duberstein <tamird@kernel.org>
> To: Alexandre Courbot <acourbot@nvidia.com>
> To: Onur =C3=96zkan <work@onurozkan.dev>
> Cc: rust-for-linux@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  rust/kernel/configfs.rs | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
> index cd082b83e9e7..d28ac9a648f1 100644
> --- a/rust/kernel/configfs.rs
> +++ b/rust/kernel/configfs.rs
> @@ -150,6 +150,7 @@ pub fn new(
>          data: impl PinInit<Data, Error>,
>      ) -> impl PinInit<Self, Error> {
>          try_pin_init!(Self {
> +            data <- data,
>              subsystem <- pin_init::init_zeroed().chain(
>                  |place: &mut Opaque<bindings::configfs_subsystem>| {
>                      // SAFETY: We initialized the required fields of `pl=
ace.group` above.
> @@ -172,13 +173,23 @@ pub fn new(
>                      Ok(())
>                  }
>              ),
> -            data <- data,
> -        })
> -        .pin_chain(|this| {
> -            crate::error::to_result(
> -                // SAFETY: We initialized `this.subsystem` according to =
C API contract above.
> -                unsafe { bindings::configfs_register_subsystem(this.subs=
ystem.get()) },
> -            )
> +            _: {
> +                let result =3D crate::error::to_result(
> +                    // SAFETY: We initialized `subsystem` according to t=
he C API contract above.
> +                    unsafe { bindings::configfs_register_subsystem(subsy=
stem.get()) },
> +                );
> +                if result.is_err() {
> +                    // SAFETY: The group and mutex were initialized abov=
e, and registration
> +                    // failed, so configfs does not hold references to t=
he group.
> +                    unsafe {
> +                        bindings::config_item_put(

I think this should be `config_group_put`, although it does make a
difference in practice right now.

> +                            &raw mut (*subsystem.get()).su_group.cg_item,
> +                        );
> +                        bindings::mutex_destroy(&raw mut (*subsystem.get=
()).su_mutex);
> +                    }
> +                }
> +                result?
> +            }
>          })
>      }
>  }
> @@ -188,8 +199,12 @@ impl<Data> PinnedDrop for Subsystem<Data> {
>      fn drop(self: Pin<&mut Self>) {
>          // SAFETY: We registered `self.subsystem` in the initializer ret=
urned by `Self::new`.
>          unsafe { bindings::configfs_unregister_subsystem(self.subsystem.=
get()) };
> -        // SAFETY: We initialized the mutex in `Subsystem::new`.
> -        unsafe { bindings::mutex_destroy(&raw mut (*self.subsystem.get()=
).su_mutex) };
> +        // SAFETY: Unregistering drops configfs's references to the grou=
p, so it is safe to drop
> +        // the initial group reference and destroy the initialized mutex.
> +        unsafe {
> +            bindings::config_item_put(&raw mut (*self.subsystem.get()).s=
u_group.cg_item);

Similar, should be `config_group_put`.

> +            bindings::mutex_destroy(&raw mut (*self.subsystem.get()).su_=
mutex);
> +        }
>      }
>  }
>=20=20
> @@ -260,6 +275,7 @@ pub fn new(
>          data: impl PinInit<Data, Error>,
>      ) -> impl PinInit<Self, Error> {
>          try_pin_init!(Self {
> +            data <- data,
>              group <- pin_init::init_zeroed().chain(|v: &mut Opaque<bindi=
ngs::config_group>| {
>                  let place =3D v.get();
>                  let name =3D name.to_bytes_with_nul().as_ptr();
> @@ -269,7 +285,6 @@ pub fn new(
>                  };
>                  Ok(())
>              }),
> -            data <- data,

Without adding a `PinnedDrop` implementation, this change has no effect.
We should add `PinnedDrop` that does `config_group_put` on `group`,
right?

We could also consider adding `SubsystemInner` and `GroupInner` and
implement `PinnedDrop` on those, to handle the C interface. We would
then have fields of type `SubsystemInner` in `Subsystem` instead of
`Opaque<_>` and similar for `Group<_>`. Then we would not have to
consider the initialization ordering with respect to the `data` field of
`Subsystem` and `Group`. What do you think?

Best regards,
Andreas Hindborg



