Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869FC34AAFB
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080822; cv=pass; b=Z8mhyoL9vO8SIFU7Dp1asESAEPEkeLzX+bEiYCOFjRtTQBl2a+D648CfcesSCXphhlgnS85uc/mTwnvPtmn7znuHnim7uC6qCB4jp361QAEZ67Y1iuwDnZNVRNJyhtaCynokh2Kpg3Ps8YDzXkmLLO33b5ZTJ+Fug5pHWsYPg9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080822; c=relaxed/simple;
	bh=wsa27znHBAUHp3OIpLAQxkyOqaNhIm4N6p/y9qoJ8l8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ni0i0xWpMclgUuYQqlASXIzFGZuEXoKVXHRTtF1urywWPGcoiPmK6y45SkibL1UVG2OTAHAh35JBZLa0Okq3mDD6w7dxoM9PwzEyIp8fFUaXnOzykPXlfWanFb6HADV+skuKcw+iTEOPCZNNjafuF/M1YCfKmKToM5PUh6p/REA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gexmmJpG; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gexmmJpG"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b8c248bc7so421a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 10:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766080819; cv=none;
        d=google.com; s=arc-20240605;
        b=Wg0Z8x34v+7CqbZB2UhrX/6ja72yu7MkDbqZ8iyf7wvW3MPeH/xKPLnNXl/Briag06
         3Ej3GyRkPYIMFfWRWoiDuyqgqtlJoNXm848w+sUD6nOWJmQwuqagP09oZ8yMkvMPfF36
         14W/N1avb5Jhd0j44HGAtXGzaYLg1ChiyWXJ5iSb95QmKQjuAdt2/xiiTNO9ujpJ15Ld
         nBOWnn7/NyFMwggDhSuZLKYdmE72I4bjX2wzOTghE3i9WTefCNQhwygMy/j2XSkjn3+e
         nQd/zFekKO80Roz8Tnjk6f9pzRTEbGxRithnYS0VdUYdaFYPvr/7GLvubGJE4nj7RkXg
         8fZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RkOFOrNDQ6sl7Mqdc1VhggmfNaVju147chi0D9kqqyk=;
        fh=A5vXMf4WLCj5OKwsVV56l7itptHU/7svE99w5yaQMmQ=;
        b=V4j1mi8x9oAB+26FvOSm0Qw6JVJCBKcSXLjlavIUjL/OiAwhPahv7SuBULxkMVc45u
         a+NsRDC09R4ReqDgNVpD7ECltgO36pNK3jJOE12g5MUhLZlHPuAt5N+0QxpRVSGBnpZO
         QBGCPOx4hB2sAq8D56xN6JqsZe/CutABHrHqmhu1wARK1CHfJPqstZ0t5BBBJ5BI6BWz
         5f5MW8MMMfxxJlYVkw/6XmAFCDKT3B7OmbpTmApHNO5bzygal2ojax6aFne/f4XQQWLR
         4AV/95ZMVZhn6hbWh5smBVbniI1tCTQyov3lFJ6D30ylmWG92bUf6Zana8RnGztc8KCo
         5AxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766080819; x=1766685619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkOFOrNDQ6sl7Mqdc1VhggmfNaVju147chi0D9kqqyk=;
        b=gexmmJpGsTLsO8bAkWwBu7VBYvEjXGzgkVqu/Ur4+8bjAYAHG9TpuGOTIc7ouLTPPG
         4W5yJgbImTTLYlW34F/X0Gx/nIiY/5JjzRedU6NNxmHPV6mC8YYwD2f4D5k9BAxtsLP9
         D3lre3Vn5q5y0NcBnr7Dx8pOodVE+2uuIF8KCHYHZHzraMCFRP/5IOucLa9H7/WtcA9i
         sc7HkDVg8srlOIaHKzhD7vY+3bwa80235CtWEbJziVUT4N1dB9go3GCQjqtG/PUdwtUk
         Umpr/h42jHDDlo8jFMtirIaJUDnIESdY8ge1ftoM2vkkgE1WBH/jTniGscbf41ZzkP61
         AOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080819; x=1766685619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkOFOrNDQ6sl7Mqdc1VhggmfNaVju147chi0D9kqqyk=;
        b=K6bIVkY02ioVJLLS2kwtmSj6neB54vdtPSOJ2dbvv26+N09mV/cHKu298z621LVY7T
         5rcOc1yAjpyqhQsPxGh1N8P2CCxtuAH/Ss/G2klXdccQc5ZPG11dc7i7RZY9i4EAQ9lz
         GcsitEQiVMc10xC3ChT2XWr1aZlC0t9ji//JB6BWW617LhP2KCJ1/r/hW22nanU0KBTO
         ArgP2BMa9baNW3ocHZ23SuGWqjEEFGGgWK5iOyfejEZwcJHEKb7+r1jkmWglHIp+RqXv
         +BQyCsBbdCGEkPDTQWocs2ZDyve0Vf0d80pTXmZ2WkZAQrRAUua+2g4FGK/70IHcJTFq
         Tqfg==
X-Forwarded-Encrypted: i=1; AJvYcCWUfWYWxJrfhZ3KAZKSHHWJv8tgJQhA2xekX8d9VUBoeBqoNxZsxdit1fnCjoNYrKWMcv2kUOILpFKCQpIbIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgrzS3MCRpLQz63dq+n5sz4p8GmlrR8kltkzNjRX5qrJTubacf
	b3QLPfMg7uwA+6Vke57Tf/NsMb4dYGz/U0vFJgttkcUh09R1Yn5/Y9xJsCRdH7MRRKhCpGOZWM7
	37s5qxqpUw34zOsJsT9IDtD857PLYiqRCKgBaL1Az
X-Gm-Gg: AY/fxX6e3uPkQ2/bpFiJB5Z94fILC5sTEOTOsgC+M61LU2th/XgzR6X890KAU877jUm
	vKzJHHNd5YQo0uEB9w+JleSIx2o9r+O69Ox2TcTn9eb42MkvVRkLMVbKGpEDd7vBAJybqVuQfOE
	/NF6Gc5nEun8B0Q0TA+ln4wVCiqZhh0N/KPn4l+3Q5yzMG70SkH3wCVDX218TuOcdirvET4E6ek
	CfS48TkfvaX1i6BEAaM0rjq1DUXxvklTa9BXtshp2JyDStokg4hEAO4QshKL/fMx8GNXBAn4mD0
	HL3t3kY+rkf5jOGeVDGE/qgK/Q==
X-Google-Smtp-Source: AGHT+IHLrlyaCiPiXB+zoeHL1JoVQY7quXpfW6ET/ferqEfqVPExNhRL6m+Qn/OACk5JrhhmtH9Dy6ybDE2MOA7b1A8=
X-Received: by 2002:aa7:d991:0:b0:64b:4a02:f726 with SMTP id
 4fb4d7f45d1cf-64b6049edeemr37436a12.10.1766080818459; Thu, 18 Dec 2025
 10:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218013910.459045-1-ttabi@nvidia.com> <20251218013910.459045-3-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-3-ttabi@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 18 Dec 2025 10:00:06 -0800
X-Gm-Features: AQt7F2pc-7ddV47KGcSn-HvKuZIO6w4T0qZbwJ2Xn-u1d3wDsWJuBl-RQHd8pYY
Message-ID: <CAGSQo03HVquX1Bc7tsFjWgA-=BX=1eefXt=r-Rdtxca81QPXgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] rust: debugfs: add lookup contructor
To: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 5:40=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Add a new constructor for Dir that uses the debugfs_lookup() API to
> obtain a reference to an existing debugfs directory entry.
>
> The key difference from Dir::new() and Dir::subdir() is the cleanup
> semantics: when a Dir obtained via lookup() is dropped, it calls
> dput() to release the reference rather than debugfs_remove() which
> would delete the directory.
>
> To implement this cleanup distinction, the Entry class now includes
> an is_lookup boolean that specifies how the entry was created and
> therefore how it should be dropped.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/debugfs.rs       | 43 +++++++++++++++++++++++++++++++
>  rust/kernel/debugfs/entry.rs | 49 +++++++++++++++++++++++++++++++++---
>  2 files changed, 89 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index facad81e8290..eee799f64f79 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -110,6 +110,49 @@ pub fn new(name: &CStr) -> Self {
>          Dir::create(name, None)
>      }
>
> +    /// Looks up an existing directory in DebugFS.
> +    ///
> +    /// If `parent` is [`None`], the lookup is performed from the root o=
f the debugfs filesystem.
> +    ///
> +    /// Returns [`Some(Dir)`] representing the looked-up directory if fo=
und, or [`None`] if the
> +    /// directory does not exist or if debugfs is not enabled. When drop=
ped, the [`Dir`] will
> +    /// release its reference to the dentry without removing the directo=
ry from the filesystem.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// // Look up a top-level directory
> +    /// let nova_core =3D Dir::lookup(c_str!("nova_core"), None);
> +    ///
> +    /// // Look up a subdirectory within a parent
> +    /// let parent =3D Dir::new(c_str!("parent"));
> +    /// let child =3D parent.subdir(c_str!("child"));
> +    /// let looked_up =3D Dir::lookup(c_str!("child"), Some(&parent));
> +    /// // `looked_up` now refers to the same directory as `child`.
> +    /// // Dropping `looked_up` will not remove the directory.
> +    /// ```

This also breaks the assumption people were able to have with `Dir`
previously that if they have a `Dir` and debugfs is enabled, it's
usable for creating subdirs/files.

This might be considered an issue, but at minimum it needs to be documented=
.

> +    pub fn lookup(name: &CStr, parent: Option<&Dir>) -> Option<Self> {

We were explicitly asked by Greg *not* to expose error conditions in
directory constructors. I would expect that to extend to `lookup` as
well, so this would return a `Self`, not allowing the caller to find
out if the file was actually there. This might be a bit of a grey area
as the comment he cited on `debugfs_create_file` and friends has
explicit verbiage about it being bad form to check errors here and
`debugfs_lookup` mentions explicitly a null return for the file not
being there.

Another point in favor of just returning `Self` rather than
`Option<Self>` is that in your proposed real-world usage of this, you
create a dummy directory in the `None` case.

> +        #[cfg(CONFIG_DEBUG_FS)]
> +        {

We shouldn't need to track a parent entry here, and so shouldn't need
to do the whole cloning dance.

> +            let parent_entry =3D match parent {
> +                // If the parent couldn't be allocated, just early-retur=
n
> +                Some(Dir(None)) =3D> return None,
> +                Some(Dir(Some(entry))) =3D> Some(entry.clone()),
> +                None =3D> None,
> +            };
> +            let entry =3D Entry::lookup(name, parent_entry)?;

There's no guarantee that this lookup has returned a directory - a
lookup can return files too afaict

> +            Some(Self(
> +                // If Arc creation fails, the `Entry` will be dropped, s=
o the reference will be
> +                // released.
> +                Arc::new(entry, GFP_KERNEL).ok(),
> +            ))
> +        }
> +        #[cfg(not(CONFIG_DEBUG_FS))]
> +        None
> +    }
> +
>      /// Creates a subdirectory within this directory.
>      ///
>      /// # Examples
> diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
> index 706cb7f73d6c..455d7bbb8036 100644
> --- a/rust/kernel/debugfs/entry.rs
> +++ b/rust/kernel/debugfs/entry.rs
> @@ -18,6 +18,9 @@ pub(crate) struct Entry<'a> {
>      _parent: Option<Arc<Entry<'static>>>,
>      // If we were created with a non-owning parent, this prevents us fro=
m outliving it
>      _phantom: PhantomData<&'a ()>,
> +    // If true, this entry was obtained via debugfs_lookup and should be=
 released
> +    // with dput() instead of debugfs_remove().
> +    is_lookup: bool,

I agree with Danilo - I think this would be cleaner as a different
type (or at least an enum variant) rather than adding another field
(if we need it). Notably:

1. `_parent` is not required for a lookup entry - the lookup doesn't
need to keep it alive, because it's not using the "If I have the
directory handle, I can create real files in it" semantics we had
before.
2. The `_phantom` is irrelevant for a lookup entry because they can't be sc=
oped
3. The drop behavior is different (which you're gating with `is_lookup`).

Basically the only part that is the same is the presence of a dentry
pointer under the hood.


>  }
>
>  // SAFETY: [`Entry`] is just a `dentry` under the hood, which the API pr=
omises can be transferred
> @@ -43,9 +46,38 @@ pub(crate) fn dynamic_dir(name: &CStr, parent: Option<=
Arc<Self>>) -> Self {
>              entry,
>              _parent: parent,
>              _phantom: PhantomData,
> +            is_lookup: false,
>          }
>      }
>
> +    /// Looks up an existing entry in debugfs.
> +    ///
> +    /// Returns [`Some(Entry)`] representing the looked-up dentry if the=
 entry exists, or [`None`]
> +    /// if the entry was not found. When dropped, the entry will release=
 its reference via `dput()`
> +    /// instead of removing the directory.
> +    pub(crate) fn lookup(name: &CStr, parent: Option<Arc<Self>>) -> Opti=
on<Self> {
> +        let parent_ptr =3D match &parent {
> +            Some(entry) =3D> entry.as_ptr(),
> +            None =3D> core::ptr::null_mut(),
> +        };
> +        // SAFETY: The invariants of this function's arguments ensure th=
e safety of this call.
> +        // * `name` is a valid C string by the invariants of `&CStr`.
> +        // * `parent_ptr` is either `NULL` (if `parent` is `None`), or a=
 pointer to a valid
> +        //   `dentry` by our invariant. `debugfs_lookup` handles `NULL` =
pointers correctly.
> +        let entry =3D unsafe { bindings::debugfs_lookup(name.as_char_ptr=
(), parent_ptr) };
> +
> +        if entry.is_null() {
> +            return None;
> +        }
> +
> +        Some(Entry {
> +            entry,
> +            _parent: parent,
> +            _phantom: PhantomData,
> +            is_lookup: true,
> +        })
> +    }
> +
>      /// # Safety
>      ///
>      /// * `data` must outlive the returned `Entry`.
> @@ -76,6 +108,7 @@ pub(crate) unsafe fn dynamic_file<T>(
>              entry,
>              _parent: Some(parent),
>              _phantom: PhantomData,
> +            is_lookup: false,
>          }
>      }
>  }
> @@ -97,6 +130,7 @@ pub(crate) fn dir(name: &CStr, parent: Option<&'a Entr=
y<'_>>) -> Self {
>              entry,
>              _parent: None,
>              _phantom: PhantomData,
> +            is_lookup: false,
>          }
>      }
>
> @@ -129,6 +163,7 @@ pub(crate) fn file<T>(
>              entry,
>              _parent: None,
>              _phantom: PhantomData,
> +            is_lookup: false,
>          }
>      }
>  }
> @@ -140,6 +175,7 @@ pub(crate) fn empty() -> Self {
>              entry: core::ptr::null_mut(),
>              _parent: None,
>              _phantom: PhantomData,
> +            is_lookup: false,
>          }
>      }
>
> @@ -157,8 +193,15 @@ pub(crate) fn as_ptr(&self) -> *mut bindings::dentry=
 {
>
>  impl Drop for Entry<'_> {
>      fn drop(&mut self) {
> -        // SAFETY: `debugfs_remove` can take `NULL`, error values, and l=
egal DebugFS dentries.
> -        // `as_ptr` guarantees that the pointer is of this form.
> -        unsafe { bindings::debugfs_remove(self.as_ptr()) }
> +        if self.is_lookup {
> +            // SAFETY: `dput` can take `NULL` and legal dentries.
> +            // `as_ptr` guarantees that the pointer is of this form.
> +            // This entry was obtained via `debugfs_lookup`, so we relea=
se the reference.
> +            unsafe { bindings::dput(self.as_ptr()) }
> +        } else {
> +            // SAFETY: `debugfs_remove` can take `NULL`, error values, a=
nd legal DebugFS dentries.
> +            // `as_ptr` guarantees that the pointer is of this form.
> +            unsafe { bindings::debugfs_remove(self.as_ptr()) }
> +        }
>      }
>  }
> --
> 2.52.0
>
>
