Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A51AAA1F
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716155; cv=none; b=pFwtunBjObYVt7EAab/13yWjl6W1HlcrxMrcRpqC/89IhfZskEgDP8AAxIp+KrYnKPmzsAhuvN3RdIL3dByk4Sk+N8FPo3MC1X/jrBmFqcwWIFl0Xg7Bttr4EN5DcfethkRogQxXdTIYArYDnVAopC/8LLxaaHORi1nUtCVz6X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716155; c=relaxed/simple;
	bh=/jeQZnIfpThiYHh9X0HmtQFj4BhvzZaipUw5tvNkriU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uOtD6pnpwbXSLVKygv8yVo4KhUVMryP7CNraYk1Kh2rsBmn0DsW4HEm+lf7z9IOTGadzDxHS71JuVNuwVzJXinhZU/IeecMrhPlJZaQ1nDyKCsoopcIGG98LrGdg+mFcKDZ3DwIILXnzxKov8DeHTJocfwdYqP3hi9c1jnFYShI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yZobqC+f; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yZobqC+f"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f379662cso582099f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 01:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749716152; x=1750320952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWyjynHQNpgV3HTjIQYJq/1ALGEGZYiMXXTWfwfkttE=;
        b=yZobqC+fdx+avId4OuadbxJdWQczeJB1UjAf9V7Sfz7vATwuZBH8cWm6t5OVmE6iCg
         dRdthVNbkvxYPoyKPwIS6SwHe3/vm7BQ+NXWPbZ/5mRLEDSeUQq1JbtNuf3cGVHqjtbf
         l4z1Qg4Qz+VRDQbnYSalWnkACBcS+Br5iUukglX6FYVWdsiv9K0i0DTpkSc5nJFnTO1v
         KJbf2XSO3oHKX5JvaOpF0n+jRmiXlHIdLCuSYwG9SYa6SJksiSjoY4daITlQ2w4uwh3h
         oRoh0Chyq51hMS/AB/9vKYA/C1QiTVQr8n5HO9mjyb6YgFZzX9wcJAy6FRUx7c6CfYH7
         6cWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749716152; x=1750320952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWyjynHQNpgV3HTjIQYJq/1ALGEGZYiMXXTWfwfkttE=;
        b=rvlF+wt1rPv8JkXmevakEvs9wpea+j7njCgvWZWLGDX6DqEDfTliTGF8MO00ChU3lh
         XKp3pbkiDEMJ3OWaPyjImvcBF3ENWXmZI5t86t5m1zQ8Msto67GTK5Q9ACGwu6sgl95s
         Lz2CiJ/qUsj8lMrijGyCD752bnomT+pP7E1H4QBdF8O+BkYHhTAr66n1FinAymgUb8td
         NGn3PXMmbtPIS+pYajZQrACWY/MSnuWfhppw1uP7IuGGavviKipX40LvI37NwG+shFC7
         orp4cTwf0f6wzJIEra+tdBm67bsCtPVO1T7Tc1V+V8szAd5NgEaEjLFPLRbYsCgs1DbD
         qzsA==
X-Forwarded-Encrypted: i=1; AJvYcCVyi+YrUzMRCZidNJ9vSGKY30CUFi2CB1EqHqucV4dCdNmAVyJD1pj6dIFkyszWzpY2GnbxL2OCgNs0IXMXQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn8ql9aWz4WartWbtVnN8+4TwxUfDBOATfhVQf3hUspAoX0VgQ
	8NdBaoTOZjzJcDOCR+2cCVTHKaS66sgf5mkoHS4u3hfLNmpRkoVgOYm6qOke5Og3GGY8vDZpX9b
	7/fxyEDgJe9nK69OIksHBTVGkpIJFOlKmt8z5nVtk
X-Gm-Gg: ASbGncv71GZoE7BrCTINxp94KzvJGlQp8NgmgipLQUuXgU/1ROUO3upu3CNCqfBHlQJ
	RwmUSd5I8U47ZRk/h6UUItP75eyNB978Hmh1ZS+SWdI7Wbf2xfiq28uuY0yklXV6GRVp+KmsCMC
	D81PY1DBuTPeKpTt577POJIVHJLwm4OZMuhqYCLTWsE4kKiqE5eahJG4MfsSZaLb7UAemU2jgPM
	Q==
X-Google-Smtp-Source: AGHT+IH30hgR4r6+sEqcFf/3abnlDKHzRPthg4iHGK2e9UxDCWAveCuvDarVkhtnsGCIiTfPZBrtFHOKc3CFAss+V6k=
X-Received: by 2002:a05:6000:1a8b:b0:3a4:cb4f:ac2a with SMTP id
 ffacd0b85a97d-3a561369ec6mr1620198f8f.21.1749716151578; Thu, 12 Jun 2025
 01:15:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603205416.49281-1-dakr@kernel.org> <20250603205416.49281-4-dakr@kernel.org>
 <DAKEK5YPNCAU.3LQGI98GGG4KF@kernel.org>
In-Reply-To: <DAKEK5YPNCAU.3LQGI98GGG4KF@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Jun 2025 10:15:38 +0200
X-Gm-Features: AX0GCFsoCQk7kWRWd9C3B--8QDSmH-75a87FOwEo4gnRqfgaYYHM30s6I935Ods
Message-ID: <CAH5fLgharxhAHrP6OFZxXrWKSTsMp=vY5sGvUKzca3yhRJEW7A@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, chrisi.schrefl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 10:13=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
> > In Devres::drop() we first remove the devres action and then drop the
> > wrapped device resource.
> >
> > The design goal is to give the owner of a Devres object control over wh=
en
> > the device resource is dropped, but limit the overall scope to the
> > corresponding device being bound to a driver.
> >
> > However, there's a race that was introduced with commit 8ff656643d30
> > ("rust: devres: remove action in `Devres::drop`"), but also has been
> > (partially) present from the initial version on.
> >
> > In Devres::drop(), the devres action is removed successfully and
> > subsequently the destructor of the wrapped device resource runs.
> > However, there is no guarantee that the destructor of the wrapped devic=
e
> > resource completes before the driver core is done unbinding the
> > corresponding device.
> >
> > If in Devres::drop(), the devres action can't be removed, it means that
> > the devres callback has been executed already, or is still running
> > concurrently. In case of the latter, either Devres::drop() wins revokin=
g
> > the Revocable or the devres callback wins revoking the Revocable. If
> > Devres::drop() wins, we (again) have no guarantee that the destructor o=
f
> > the wrapped device resource completes before the driver core is done
> > unbinding the corresponding device.
>
> I don't understand the exact sequence of events here. Here is what I got
> from your explanation:
>
> * the driver created a `Devres<T>` associated to their device.
> * their physical device gets disconnected and thus the driver core
>   starts unbinding the device.
> * simultaneously, the driver drops the `Devres<T>` (eg because the
>   driver initiated the physical removal)
> * now `devres_callback` is being called from both `Devres::Drop` (which
>   calls `Devres::remove_action`) and from the driver core.
> * they both call `inner.data.revoke()`, but only one wins, in our
>   example `Devres::drop`.
> * but now the driver core has finished running `devres_callback` and
>   finalizes unbinding the device, even though the `Devres` still exists
>   though is almost done being dropped.
>
> I don't see a race here. Also the `dev: ARef<Device>` should keep the
> device alive until the `Devres` is dropped, no?

The race is that Devres is used when the contents *must* be dropped
before the device is unbound. This example violates that by having
device unbind finish before the contents are dropped.

> > Depending on the specific device resource, this can potentially lead to
> > user-after-free bugs.
> >
> > In order to fix this, implement the following logic.
> >
> > In the devres callback, we're always good when we get to revoke the
> > device resource ourselves, i.e. Revocable::revoke() returns true.
> >
> > If Revocable::revoke() returns false, it means that Devres::drop(),
> > concurrently, already drops the device resource and we have to wait for
> > Devres::drop() to signal that it finished dropping the device resource.
> >
> > Note that if we hit the case where we need to wait for the completion o=
f
> > Devres::drop() in the devres callback, it means that we're actually
> > racing with a concurrent Devres::drop() call, which already started
> > revoking the device resource for us. This is rather unlikely and means
> > that the concurrent Devres::drop() already started doing our work and w=
e
> > just need to wait for it to complete it for us. Hence, there should not
> > be any additional overhead from that.
> >
> > (Actually, for now it's even better if Devres::drop() does the work for
> > us, since it can bypass the synchronize_rcu() call implied by
> > Revocable::revoke(), but this goes away anyways once I get to implement
> > the split devres callback approach, which allows us to first flip the
> > atomics of all registered Devres objects of a certain device, execute a
> > single synchronize_rcu() and then drop all revocable objects.)
> >
> > In Devres::drop() we try to revoke the device resource. If that is *not=
*
> > successful, it means that the devres callback already did and we're goo=
d.
> >
> > Otherwise, we try to remove the devres action, which, if successful,
> > means that we're good, since the device resource has just been revoked
> > by us *before* we removed the devres action successfully.
> >
> > If the devres action could not be removed, it means that the devres
> > callback must be running concurrently, hence we signal that the device
> > resource has been revoked by us, using the completion.
> >
> > This makes it safe to drop a Devres object from any task and at any poi=
nt
> > of time, which is one of the design goals.
> >
> > Fixes: 8ff656643d30 ("rust: devres: remove action in `Devres::drop`") [=
1]
> > Reported-by: Alice Ryhl <aliceryhl@google.com>
> > Closes: https://lore.kernel.org/lkml/aD64YNuqbPPZHAa5@google.com/
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> >  rust/kernel/devres.rs | 33 ++++++++++++++++++++++++++-------
> >  1 file changed, 26 insertions(+), 7 deletions(-)
>
> > @@ -161,7 +166,12 @@ fn remove_action(this: &Arc<Self>) {
> >          //         `DevresInner::new`.
> >          let inner =3D unsafe { Arc::from_raw(ptr) };
> >
> > -        inner.data.revoke();
> > +        if !inner.data.revoke() {
> > +            // If `revoke()` returns false, it means that `Devres::dro=
p` already started revoking
> > +            // `inner.data` for us. Hence we have to wait until `Devre=
s::drop()` signals that it
> > +            // completed revoking `inner.data`.
> > +            inner.revoke.wait_for_completion();
> > +        }
> >      }
> >  }
> >
> > @@ -232,6 +242,15 @@ fn deref(&self) -> &Self::Target {
> >
> >  impl<T> Drop for Devres<T> {
> >      fn drop(&mut self) {
> > -        DevresInner::remove_action(&self.0);
> > +        // SAFETY: When `drop` runs, it is guaranteed that nobody is a=
ccessing the revocable data
> > +        // anymore, hence it is safe not to wait for the grace period =
to finish.
> > +        if unsafe { self.revoke_nosync() } {
> > +            // We revoked `self.0.data` before the devres action did, =
hence try to remove it.
> > +            if !DevresInner::remove_action(&self.0) {
>
> Shouldn't this not be inverted? (ie 's/!//')
>
> Otherwise this will return `true`, get negated and we don't run the code
> below and the `inner.data.revoke()` in `devres_callback` will return
> `false` which will get negated and thus it will never return.
>
> ---
> Cheers,
> Benno
>
> > +                // We could not remove the devres action, which means =
that it now runs concurrently,
> > +                // hence signal that `self.0.data` has been revoked su=
ccessfully.
> > +                self.0.revoke.complete_all();
> > +            }
> > +        }
> >      }
> >  }
>
