Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A2412BF3D
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714568806; cv=none; b=ERWtqPYChrNvanuxL/Fumq9ab28PsKDV9vCvzLAz4dPsvp3O9JCc4w/JFtheJzRy+79KnafQZAUyX76R3ujZpaq/mibIfWuqj4+vy2Hmx746RmfcJF5GmPLkA5zeRgcN0A7Zy10ZyEr4slootW95wkRn6lkOY19D1+Ohhlic59o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714568806; c=relaxed/simple;
	bh=4iGsERVzt+NJaiGG4A+F18S3PZrt12/An4GpEAAAv0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qWcc/jW+ha/yP4sMEAq8uP7rZRd1bMz4SKayJJDxNIakMatZdiPVGMNTNzGfqlttPsBd4v36aht0eJkCaC1i1bm9svFOF6BCfi+9/BzSzl0GdaNn0VCNU2BZ5vFCOFOKg6q2qJ/G06u4fWzP97g0oTmSSPAcwGg0txdZMdIkSCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BkfAs+g1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BkfAs+g1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714568803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=krnr5Qo/7vMYNStSyVGLykr39iG7Fm8ZSrrY7WxAyVE=;
	b=BkfAs+g11f7aNHQjQX6H+t+QTkxVdDcypVmwNcKnP13TFIGu7AnJvjU0nAIjA6vt/KNASt
	1y+Cw/SO6NqcFSCnwwzQtx3Ww6Gxn5TRHqy6EQq1mJHp7GJujso7zfNuTGOAxFN2ch0bD2
	eC2u82bG0anKieZBelC7UxzwhioHrBg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-lqhhxZAlNb-_bUXQ7pIfCw-1; Wed, 01 May 2024 09:06:42 -0400
X-MC-Unique: lqhhxZAlNb-_bUXQ7pIfCw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34dc7b83209so583299f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 06:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714568801; x=1715173601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krnr5Qo/7vMYNStSyVGLykr39iG7Fm8ZSrrY7WxAyVE=;
        b=Q1tFvS1yW+S5fIti1OtDPhE4OkQot+j8gwb1dNSUsVyrorAov40+i/3tAkKZOtkMQB
         RxCcOywVYlOwBorJnZqC0GQ+v3dx4q3mvcqajFHRQuxlQUy/ED2NAbhfuvfYM3SdS7nQ
         ua1V9zAlBbKsfy31VRC6MLYav7NcIEWOyPQBqcU2XJMYmJJOBHtzK/SXZe8+1Ya+bZef
         sWNETOqn/fxtvTIIV2e711VfHgGGopi+eDRy9Gq9TALYzA7zBi6XnDbZDlbxG1bEmint
         Ron6FXcDdUaItBafgcWZ+0VK4flwyjjOtCB5heISkbo5ml9Ae/C6g332LKBHgHuCqizc
         6LNw==
X-Forwarded-Encrypted: i=1; AJvYcCVHOQR40++LJhx8fJp8/lt5Stig5SJNjezUJ4WU0qiXA8kbcoh4NKRmMVMdzJ0C3WRVfv7uTx33C/hQVnC7lRliaXA9Q8SP8siwe5BlRUQ=
X-Gm-Message-State: AOJu0YzKinwmAFxqH/8gGCP4yHyMfd1TDfEBj31Zd6UEZIn2jafYKdw2
	WzZ1vfxhKracUIyss20Ui8zHNFHcGyzgZQ63qqeP9uUk7HADHVijOwPuQlpYa8sLocOhOGXCZhf
	cXWto7CGX5TQbTnClvFNpgzdFm6vbsjEmf3ZKU38xnV4kaquEP4YQB4xJSorOVhrg
X-Received: by 2002:a5d:4d8f:0:b0:34d:9089:6bd0 with SMTP id b15-20020a5d4d8f000000b0034d90896bd0mr1573511wru.40.1714568801468;
        Wed, 01 May 2024 06:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfe5MiznJFmXgCjf1iaOK/IvqLpitThUpI7fBUGHQ5/X/uPMQFgoB+L2QcGQis692JuJ5Ldw==
X-Received: by 2002:a5d:4d8f:0:b0:34d:9089:6bd0 with SMTP id b15-20020a5d4d8f000000b0034d90896bd0mr1573487wru.40.1714568801039;
        Wed, 01 May 2024 06:06:41 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id m7-20020a5d64a7000000b0034a710b6360sm31717869wrp.6.2024.05.01.06.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:06:40 -0700 (PDT)
Date: Wed, 1 May 2024 15:06:38 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	a.hindborg@samsung.com, aliceryhl@google.com, ajanulgu@redhat.com,
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
	jhubbard@nvidia.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 6/8] rust: alloc: implement BoxExtAlloc
Message-ID: <ZjI-XkWfMfozaQ4F@pollux>
References: <20240429201202.3490-1-dakr@redhat.com>
 <20240429201202.3490-7-dakr@redhat.com>
 <2324d22f-984d-4f92-8302-5c866f3387ac@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2324d22f-984d-4f92-8302-5c866f3387ac@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 01, 2024 at 08:53:51AM +0000, Benno Lossin wrote:
> On 29.04.24 22:11, Danilo Krummrich wrote:
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/kernel/alloc/box_ext.rs | 40 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 39 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/alloc/box_ext.rs b/rust/kernel/alloc/box_ext.rs
> > index 76653d6f4257..74d6bb24e965 100644
> > --- a/rust/kernel/alloc/box_ext.rs
> > +++ b/rust/kernel/alloc/box_ext.rs
> > @@ -2,7 +2,7 @@
> > 
> >  //! Extensions to [`Box`] for fallible allocations.
> > 
> > -use super::Flags;
> > +use super::{AllocatorWithFlags, Flags};
> >  use alloc::boxed::Box;
> >  use core::alloc::AllocError;
> >  use core::mem::MaybeUninit;
> > @@ -21,6 +21,19 @@ pub trait BoxExt<T>: Sized {
> >      fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError>;
> >  }
> > 
> > +/// Extensions to [`Box`].
> > +pub trait BoxExtAlloc<T, A: AllocatorWithFlags>: Sized {
> 
> I think it would be better to put all of this stuff into the `BoxExt`
> trait. Otherwise we will end up with even more extension traits...

That was my inital idea as well, but it wasn't quite obvious for me how to make
this happen.

I think for BoxExt<T>, it's rather easy, since we don't need an implementation
for Box<T, A>. What do you think about this [1]?

For VecExt<T>, I'm not quite sure how this can work though, since we'd need to
implement VecExt<T> for both Vec<T> and Vec<T, A>.

For instance, VecExt<T>::reserve() needs to be implemented for both Vec<T> and
Vec<T, A>, but VecExt<T>::with_capacity() can only be implemented for Vec<T> and
VecExt<T>::with_capacity_in() can only be implemented for Vec<T, A>. But we have
to implement all trait functions for both types.

Do I miss something here?

[1] https://gitlab.freedesktop.org/drm/nova/-/snippets/7784

> Ditto for `VecExtAlloc`.
> 
> -- 
> Cheers,
> Benno
> 
> > +    /// Allocates a new box using a custom allocator.
> > +    ///
> > +    /// The allocation may fail, in which case an error is returned.
> > +    fn new_in(x: T, alloc: A, flags: Flags) -> Result<Self, AllocError>;
> > +
> > +    /// Allocates a new uninitialised box using a custom allocator..
> > +    ///
> > +    /// The allocation may fail, in which case an error is returned.
> > +    fn new_uninit_in(alloc: A, flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError>;
> > +}
> > +
> 
> 

