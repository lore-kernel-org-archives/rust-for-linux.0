Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC847AE77
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Feb 2024 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709116347; cv=none; b=Bd0uuBhUlq0vCQ20RmGCbfbeFabm7GraoCroLx7lkdEZKmXKCJienKP13nMVyGJtiioALujwBAiMURkiSqGyM6aMXLk/6W3Z8nCjlDt2b5ZpPyufVDJZB9b7n88duZjref768//+S6hucOj07ibX6o5P4vHvFe2JrsiAUM//cPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709116347; c=relaxed/simple;
	bh=eCOxep2JCT2PqTXZsYJ/8apV2ocu8sSoosYXQ6yO0WM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=caaY6dNmaqq/v693kiRRr+n/qZ9LZePyUtnDEdAh5UEuRiX0wz1DdK+ZRjgxQaIPKe5OAo6ewdp0vhu875t9KaD8sgdmPpskyMYIrLhIqgpSF+jPghQaC1eEyXmrgPkFEM3WAd/o6/o6vvSnp5TQSehjbB2QDJ4ubZZEQ4DxJnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D3p3Lgxj; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D3p3Lgxj"
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-2d2399a08c0so42632191fa.3
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Feb 2024 02:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709116344; x=1709721144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjKtoRx+UwcsrjRBtC9M6m/N9NX0zBaZF32zrstWcEc=;
        b=D3p3LgxjFbs3WhdtkcaogoT+eLYyFtyyUiX60lE6ckL6KIgJT4219YbXeW+EaM03r1
         4/LMgVmG6G6C9TkH8fK7QlHNvPppjBwUeK4vwwVC81/x3jp+XvtxYpn33maJIZxms3/h
         nVu+YvJfLI1zHMovWB8Lh44m9pcOFLgMtB8sJHRvG9Ct0G6pWS/S5os5tVaZ2efOC28j
         lK0BHVijjREk4WQllyLNqDWLfC36sLquRBzI7jLfKmdz1FTPeufyuOwTCxs0CgAFq/6J
         bVpquZJr3EPErelqj6IWEi/HowqYTzG7+QKj4WMUinkkU0SvEDxG/vH3oQuQMGsVgF/D
         Nctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709116344; x=1709721144;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CjKtoRx+UwcsrjRBtC9M6m/N9NX0zBaZF32zrstWcEc=;
        b=oAQV7qtEIuviVGMcAExA0laN9mIcNobsh/PdvX+Wi6TEiEiGTEqRYdZW9K2J4bS3QZ
         zjpBCNRDLJdx0P3HnOYWtK1L5q5lq6wPAcCxLoso/LKtiaW9EvgKGoH7DRd+hY7Pf/pN
         d/mt+CxekMMwsEU8uBvqXc3WWyIlzFBitd66E/DUwG9R7DMUudUCOMoCwN++vTNAHBR+
         gAonOv9ZhIOrvC//K+WsrvGiNeLzWKSBLRUjnyzCunAFdVfx8OGbYA7BuALG4TVHDV0/
         aAVx5GX5MUm3HVJBqJC77mG3iNOV6SMy6hFvVRfo/6+vCqhe4VutILalKK0Jy8xdVSqR
         5KbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfmVm7ntRenKgtlUh4QM3c4eZM8kfbKcyGOlN7R2idYTayIVfX6scGtPwtba9DKYIPvRh5YWmf2lP6xNoWPIbleouiHv70Yoh5lAvUHhI=
X-Gm-Message-State: AOJu0YzQw/q/unPpMnbwWq4xwJw309pzAhZY9/rr0RyKw92Io3zi1UxC
	1zi/DU8XfysIxmROyqg1Bnehfn7g9IeRPXj0QDckleuXGg/04QIrvCLWHeAds8bfTt60NWhPe5d
	7bEcsVlB83gdiRg==
X-Google-Smtp-Source: AGHT+IES6rAcCkmc4wG6UsFZKuwU47RDINdYd53eIctneIw/XlcbBtlnpOrLBuenHe1mzmxTBd64HBNpF8CmfKs=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:aa14:0:b0:2d2:5a1c:700c with SMTP id
 bf20-20020a2eaa14000000b002d25a1c700cmr13274ljb.10.1709116343735; Wed, 28 Feb
 2024 02:32:23 -0800 (PST)
Date: Wed, 28 Feb 2024 10:32:20 +0000
In-Reply-To: <20240209223201.2145570-4-mcanal@igalia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240209223201.2145570-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240228103220.3941367-1-aliceryhl@google.com>
Subject: Re: [PATCH v7 2/2] rust: xarray: Add an abstraction for XArray
From: Alice Ryhl <aliceryhl@google.com>
To: mcanal@igalia.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, kernel-dev@igalia.com, lina@asahilina.net, 
	linux-fsdevel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

> From: Asahi Lina <lina@asahilina.net>
>=20
> The XArray is an abstract data type which behaves like a very large
> array of pointers. Add a Rust abstraction for this data type.
>=20
> The initial implementation uses explicit locking on get operations and
> returns a guard which blocks mutation, ensuring that the referenced
> object remains alive. To avoid excessive serialization, users are
> expected to use an inner type that can be efficiently cloned (such as
> Arc<T>), and eagerly clone and drop the guard to unblock other users
> after a lookup.
>=20
> Future variants may support using RCU instead to avoid mutex locking.
>=20
> This abstraction also introduces a reservation mechanism, which can be
> used by alloc-capable XArrays to reserve a free slot without immediately
> filling it, and then do so at a later time. If the reservation is
> dropped without being filled, the slot is freed again for other users,
> which eliminates the need for explicit cleanup code.
>=20
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Co-developed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Sorry for the delay in reviewing this.

I have one important comment (the first one), and the rest are nits that
are not so important.


> +pub struct Guard<'a, T: ForeignOwnable>(NonNull<T>, &'a XArray<T>);

This stores a pointer to a `T`, but really it's the pointer returned by
`into_foreign`, correct? So e.g. in the case of `T =3D Box<U>`, you have
an `NonNull<Box<U>>`, even though the pointer actually points at an
`U`, not a `Box<U>`.

I think it's better to keep this as `NonNull<c_void>`, since that's the
type used by `into_foreign`. That also lets you remove a bunch of calls
to `.cast()`.

> +/// INVARIANT: All pointers stored in the array are pointers obtained by
> +/// calling `T::into_foreign` or are NULL pointers. By using the pin-ini=
t
> +/// initialization, `self.xa` is always an initialized and valid XArray.

Nit: usually invariants listed on structs use this heading:

/// # Invariants
///=20
/// All pointers stored ...

Nit: You also do not need to mention that you use pin-init to make
`self.xa` be initialized and valid. It's enough to explain that it is
always initialized and valid - the *how* is not necessary in this type
of comment.

> +/// Represents a reserved slot in an `XArray`, which does not yet have a=
 value but has an assigned
> +/// index and may not be allocated by any other user. If the Reservation=
 is dropped without
> +/// being filled, the entry is marked as available again.
> +///
> +/// Users must ensure that reserved slots are not filled by other mechan=
isms, or otherwise their
> +/// contents may be dropped and replaced (which will print a warning).
> +pub struct Reservation<'a, T: ForeignOwnable>(&'a XArray<T>, usize, Phan=
tomData<T>);

Nit: I don't think the PhantomData is necessary here.

> +            if !new.is_null() {
> +                // SAFETY: If `new` is not NULL, it came from the `Forei=
gnOwnable` we got
> +                // from the caller.
> +                unsafe { T::from_foreign(new) };
> +            }

Nit: Adding a call to `drop` here makes the code more clear to me.

> +        unsafe {
> +            bindings::xa_destroy(self.xa.get());
> +        }

Nit: Moving the semicolon outside of the unsafe block formats better.

Alice
