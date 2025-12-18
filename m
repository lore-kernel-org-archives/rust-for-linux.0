Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665EB27F4E7
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 17:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080566; cv=pass; b=ZlaHIpg5uAJnxOd4gc4/hq4cmgjQANqBFo5TwLJwinsbn2Fd3SEJDYemAvldyYscuHAYtOv7lLQHrwjSy24FCBwECyk91a3NaN3UuP8Bp/0MeG5gQW3QcyqCvXL/jprfrugxP55//JYgfLdiMc4xNlipWuzby0ovYizeFqlaky0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080566; c=relaxed/simple;
	bh=FNAd7mevUBJdzxwNVs0RB3TDha+r/kWg5FLaztaCyAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfpxpReYxvQkd/+SwsKr1BseEIIcoDcRnBZsLr+GTxRe6y2Yiw0Mh7JmKATWi3D6VNIdtxa2y3VUwL1XUc2B7Gvh7CYA1MsMimtJ6Yg7u7FD1hz80HxfsfwRZqUpRsq3lADvcWqoJFk2VDC2ws0lEg0RKOf775HCNekBAB+6+DA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M2WjVMJc; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M2WjVMJc"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b66d427e9so237a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 09:56:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766080563; cv=none;
        d=google.com; s=arc-20240605;
        b=Fzv4wK2NSa4uvQWbCrjX9CHoFIvToDFzus1VipAdC29C2xd+5HhkwbeQ3A9osTqULh
         6kYgM0wFrJGqdddQVOn7PORdkqEvcNs7yJsoa3lM1WQxyfmE9ovU6MhFr7YV8A1UE25g
         v13mfxENHreZUIfqKcIDUt3FdqmYl/54ISFSFzWCUhyU4qjUf5EE2jRBE2kU83xtzORG
         zG+4sySJ8IZ8hDnnH+KTa0jUBIKkBhhyIurzTHBxFNvA+E1OVzdIt4R4CD5lW3Bxowji
         W9bY8lSO0gH4qV7cnC6lBXRlJdUg1NzlZHeSS1dU4o9wNkfotPQmNGqYnb40VFSyALA6
         x/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6VUzMiqBHmKzNWKto2HvOLw6cqfGk8Cwe3jOAE02okU=;
        fh=aGHYEL941ptfVPla9D44WSRJO24qGc6aVsvnBArIG0s=;
        b=UhdK+viZ6lYCpbMetsLSGDqIFblky/B20rVebYTi2lOZvjqjQRm2q0FxhvZ2DApaUd
         Ml3HM55OyiamP4JGafXQ0UffKPhaOU3EWtVAX9aExwGSYMi/7F9U2yGs/53KpsWXYy/z
         sUaOO4fbNypmjyqALBFWbg8attvu9frueIL+IpjXZQF1jM5PIIsWLV33nbZ0MV+pf450
         7YM+/Vj/rec4qPJkK65jE26ik6tVrNmr2qHCj4vBK3GLStVbMBlnVbCCm9jVZfW9sqAJ
         mGgjPbovHEreVGrBB8p74QXslSShGSh2kRjgJcBx8nQQrkDmQK7gB0qU9FlMztB9S8V2
         c9Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766080563; x=1766685363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VUzMiqBHmKzNWKto2HvOLw6cqfGk8Cwe3jOAE02okU=;
        b=M2WjVMJcGoRbZew/rj+FfIPhx6vRwkd6uJE4cUPEuFpH4Eo7Gskbblt4CPSfYa8Lw8
         HZz5rdVSNf5BNzBeK4zc0qGFezujtc73efWOYf//hJx82YbYGiUOyroOHBufNbUD8weU
         TpNDIa4bjQo3+SQ45zFgqabrpsHdux/l3ID/RJJiB+d6ZvuskGgxmO6iwFe7WIA2NRYL
         fa2oxWTtD7P44cEUM+fFLIqxvWAgtsXKGzvOxvhyaG3oP3x0h8guxxKRpW+9mJ77zCjf
         ki+62v7CNdbkWJ+9xEJcY2CaTFyoCXvleQABIhX0BAebSHpIS1Y+mpXYgb2hpdYl9W7Y
         mgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080563; x=1766685363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6VUzMiqBHmKzNWKto2HvOLw6cqfGk8Cwe3jOAE02okU=;
        b=qXfRPCMDCVAVmISQvr5nNccTGVX5TkYPiIOnEaxfbRs5GirbnJPoxzJ31STHDkZC1H
         kzSyLgVDQFeoZCErMzRws6v95lylCDgXNG0ypMG+hSYw2cJmB9+Huf63rd/dVt2MNzzH
         gyuFGNwaHt1ACveuR0/DmuwWlF6v7L5OulpzJMxwjut54T620OCgH/u3tXdZVv2Rzmsn
         MdFpRARKiG+DQP+35uNYudWjWMTV8ENt5eeB3KCZt4gakvHIQ4S8ZdSjR7/Hsm68AvZU
         yztyUSBnO6907GUWOGBaYOj5ieMy3PYy/FZs2hj2f76ndxuW1w/jROWpQuxviulUAUeF
         ewZA==
X-Forwarded-Encrypted: i=1; AJvYcCVvlBAwnLnXib+dJcFJxnbvhyOdpdkyuDbpAA68TLIFNUvENprAo1GBjloLqQqwhwRmqhDPTNNOiYqoIebxXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1yUUtAfe3lU2zan1pHi+yUNAFo9xD5c0YXET/X56kuPYzP8qp
	Owty2JgHSe549wLWr1wDod0FyCKxzRGVZtGiPsPWZtxj77u1vovyw+ofe4MTavugTjDofdS/PgX
	5B3UOQNAeQIwXQRpy+tXvOYoQTDne8/+0J1BCgfbG
X-Gm-Gg: AY/fxX5hagGVxtkAQlEk2PF8Cby1bJGO4y2p5AqTtBiyOWKauC56W3YzwGVZ6KobW5n
	bMmhWou41yuYpYCd7mxDD12MRxJFtCXp/JnSRg9eCt4dc0f4bceOP9gJYKK8Raa3znfPV8+uvac
	jbgkJNy8qFrWmHpMEPWuamdgMaAHE8Oo5lOqUwJM9gYtBPd3XNAHZSDd1BfDYlgYlX4MiewedQc
	TQwVSVWYPgxFpBK8/JFhJNCM0j13WlezUvatfLYS1G0kfJbHdByIxytbBf2+BJpwmwi/q0RiPDZ
	IWEvqi1J61fTFSEeWPRPROgBUg==
X-Google-Smtp-Source: AGHT+IHVyaWWgwsSupXfKFQ7OkZkgOJ7OGNJ/x6BKqBXiiPRaGYHt4hLIIWDzIyyc2mf4RPP5ex3cGFS72pQcYObF5w=
X-Received: by 2002:aa7:c45a:0:b0:64b:5799:4f76 with SMTP id
 4fb4d7f45d1cf-64b6631ff77mr32032a12.9.1766080562447; Thu, 18 Dec 2025
 09:56:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218013910.459045-1-ttabi@nvidia.com> <20251218013910.459045-5-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-5-ttabi@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 18 Dec 2025 09:55:49 -0800
X-Gm-Features: AQt7F2pzmTLtn4G7rOL2t2j2zRJQFDUmSCopvYPRXu1Ir2GTVxKnePZbh6PoAX8
Message-ID: <CAGSQo01jefDvfkUF9ScPuiX3vETtVxnebUUSSJPAiiSs+xzRgw@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] rust: debugfs: fix Dir::scope() to not borrow self
 for returned lifetime
To: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 5:49=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Dir::scope() was declared as taking &'a self, which tied the returned
> PinInit's lifetime to the Dir. This prevented using scope() with a
> locally-created Dir:
>
>     let dir =3D Dir::lookup(...).unwrap_or_else(Dir::empty);
>     let scope =3D dir.scope(...);  // Error: returns value referencing lo=
cal

This looks like you're trying to return an `impl PinInit<Scope>` from
your function (which isn't written in the example, but I assume that's
what you eventually do, otherwise this wouldn't be an error).

The generalized solution to this is to use `pin_init_scope`, i.e.

```
pin_init_scope(|| {
  let dir =3D // Generate a `Dir` somehow here
  let scope =3D dir.scope(/* Scope defining function here */)
  // Anything else you wanted to do
  Ok(scope)
})
```

>
> The borrow was unnecessary since scoped_dir() internally clones the
> Arc<Entry>. Fix this by cloning self.0 before the closure, allowing the
> closure to capture the cloned value via move instead of borrowing self.
>
> This also removes the now-unused scoped_dir() helper method, inlining
> its logic directly into scope().
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/debugfs.rs | 41 +++++++++++++++++------------------------
>  1 file changed, 17 insertions(+), 24 deletions(-)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index b0cfe22982d6..35f9cbb261e7 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -397,27 +397,6 @@ pub fn write_callback_file<'a, T, E: 'a, W>(
>          self.create_file(name, data, file_ops)
>      }
>
> -    // While this function is safe, it is intentionally not public becau=
se it's a bit of a
> -    // footgun.
> -    //
> -    // Unless you also extract the `entry` later and schedule it for `Dr=
op` at the appropriate
> -    // time, a `ScopedDir` with a `Dir` parent will never be deleted.
> -    fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir<'data, 'static=
> {
> -        #[cfg(CONFIG_DEBUG_FS)]
> -        {
> -            let parent_entry =3D match &self.0 {
> -                None =3D> return ScopedDir::empty(),
> -                Some(entry) =3D> entry.clone(),
> -            };
> -            ScopedDir {
> -                entry: ManuallyDrop::new(Entry::dynamic_dir(name, Some(p=
arent_entry))),
> -                _phantom: PhantomData,
> -            }
> -        }
> -        #[cfg(not(CONFIG_DEBUG_FS))]
> -        ScopedDir::empty()
> -    }
> -
>      /// Creates a new scope, which is a directory associated with some d=
ata `T`.
>      ///
>      /// The created directory will be a subdirectory of `self`. The `ini=
t` closure is called to
> @@ -427,7 +406,7 @@ fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir=
<'data, 'static> {
>      /// The entire directory tree created within the scope will be remov=
ed when the returned
>      /// `Scope` handle is dropped.
>      pub fn scope<'a, T: 'a, E: 'a, F>(
> -        &'a self,
> +        &self,
>          data: impl PinInit<T, E> + 'a,
>          name: &'a CStr,
>          init: F,
> @@ -435,8 +414,22 @@ pub fn scope<'a, T: 'a, E: 'a, F>(
>      where
>          F: for<'data, 'dir> FnOnce(&'data T, &'dir ScopedDir<'data, 'dir=
>) + 'a,
>      {
> -        Scope::new(data, |data| {
> -            let scoped =3D self.scoped_dir(name);
> +        // Clone the parent entry so the closure doesn't need to borrow =
`self`.
> +        #[cfg(CONFIG_DEBUG_FS)]
> +        let parent_entry =3D self.0.clone();

This isn't necessarily a show-stopper, but this lets us create a weird
intermediate state where from the user's PoV, there are no references
to a directory (they don't have the `Dir` anymore, and a `Scope`
doesn't exist yet, just a `PinInit<Scope>`), but the directory is held
alive. It feels weird, but I suppose users won't usually have a
`PinInit<Scope>` around for long.

The weirdness in debugging would look like:
1. Create dir
2. See dir in filesystem
3. Call `scope`, but don't actually activate the PinInit yet (either
due to coding error or because the target data structure won't be
available until later.
4. See no subdirectories under dir in filesystem
5. Drop `dir`
6. See dir still hanging around

This would also happen with my `pin_init_scope` suggestion, but at
least then user code would be explicitly capturing the `Dir` right in
front of them in the existing-dir case, and in the "create-or-lookup
new dir" case like you've got here, would delay directory creation
until we're actually instantiating the directory somewhere.

> +
> +        Scope::new(data, move |data| {
> +            #[cfg(CONFIG_DEBUG_FS)]
> +            let scoped =3D match parent_entry {
> +                None =3D> ScopedDir::empty(),
> +                Some(entry) =3D> ScopedDir {
> +                    entry: ManuallyDrop::new(Entry::dynamic_dir(name, So=
me(entry))),
> +                    _phantom: PhantomData,
> +                },
> +            };
> +            #[cfg(not(CONFIG_DEBUG_FS))]
> +            let scoped =3D ScopedDir::empty();
> +
>              init(data, &scoped);
>              scoped.into_entry()
>          })
> --
> 2.52.0
>
>


On Wed, Dec 17, 2025 at 5:49=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Dir::scope() was declared as taking &'a self, which tied the returned
> PinInit's lifetime to the Dir. This prevented using scope() with a
> locally-created Dir:
>
>     let dir =3D Dir::lookup(...).unwrap_or_else(Dir::empty);
>     let scope =3D dir.scope(...);  // Error: returns value referencing lo=
cal
>
> The borrow was unnecessary since scoped_dir() internally clones the
> Arc<Entry>. Fix this by cloning self.0 before the closure, allowing the
> closure to capture the cloned value via move instead of borrowing self.
>
> This also removes the now-unused scoped_dir() helper method, inlining
> its logic directly into scope().
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/debugfs.rs | 41 +++++++++++++++++------------------------
>  1 file changed, 17 insertions(+), 24 deletions(-)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index b0cfe22982d6..35f9cbb261e7 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -397,27 +397,6 @@ pub fn write_callback_file<'a, T, E: 'a, W>(
>          self.create_file(name, data, file_ops)
>      }
>
> -    // While this function is safe, it is intentionally not public becau=
se it's a bit of a
> -    // footgun.
> -    //
> -    // Unless you also extract the `entry` later and schedule it for `Dr=
op` at the appropriate
> -    // time, a `ScopedDir` with a `Dir` parent will never be deleted.
> -    fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir<'data, 'static=
> {
> -        #[cfg(CONFIG_DEBUG_FS)]
> -        {
> -            let parent_entry =3D match &self.0 {
> -                None =3D> return ScopedDir::empty(),
> -                Some(entry) =3D> entry.clone(),
> -            };
> -            ScopedDir {
> -                entry: ManuallyDrop::new(Entry::dynamic_dir(name, Some(p=
arent_entry))),
> -                _phantom: PhantomData,
> -            }
> -        }
> -        #[cfg(not(CONFIG_DEBUG_FS))]
> -        ScopedDir::empty()
> -    }
> -
>      /// Creates a new scope, which is a directory associated with some d=
ata `T`.
>      ///
>      /// The created directory will be a subdirectory of `self`. The `ini=
t` closure is called to
> @@ -427,7 +406,7 @@ fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir=
<'data, 'static> {
>      /// The entire directory tree created within the scope will be remov=
ed when the returned
>      /// `Scope` handle is dropped.
>      pub fn scope<'a, T: 'a, E: 'a, F>(
> -        &'a self,
> +        &self,
>          data: impl PinInit<T, E> + 'a,
>          name: &'a CStr,
>          init: F,
> @@ -435,8 +414,22 @@ pub fn scope<'a, T: 'a, E: 'a, F>(
>      where
>          F: for<'data, 'dir> FnOnce(&'data T, &'dir ScopedDir<'data, 'dir=
>) + 'a,
>      {
> -        Scope::new(data, |data| {
> -            let scoped =3D self.scoped_dir(name);
> +        // Clone the parent entry so the closure doesn't need to borrow =
`self`.
> +        #[cfg(CONFIG_DEBUG_FS)]
> +        let parent_entry =3D self.0.clone();
> +
> +        Scope::new(data, move |data| {
> +            #[cfg(CONFIG_DEBUG_FS)]
> +            let scoped =3D match parent_entry {
> +                None =3D> ScopedDir::empty(),
> +                Some(entry) =3D> ScopedDir {
> +                    entry: ManuallyDrop::new(Entry::dynamic_dir(name, So=
me(entry))),
> +                    _phantom: PhantomData,
> +                },
> +            };
> +            #[cfg(not(CONFIG_DEBUG_FS))]
> +            let scoped =3D ScopedDir::empty();
> +
>              init(data, &scoped);
>              scoped.into_entry()
>          })
> --
> 2.52.0
>
>
