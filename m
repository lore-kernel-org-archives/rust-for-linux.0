Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D16D237713
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713277; cv=none; b=RTLOLL32bPOApkaaonKKZc00QbJJ7cQDIck3VDZgbBJ/jsNa/SNS0e9ICo9BDGX1x9dyUZ8RF5Du22KDsc3tD0hhgualLsU8DXsmbCLfOy8DUSdxgl7M9orQDQvLpFh6jGC5EodWvOVYL46IosllYUsj5S771fPhWGHtQ8z+ymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713277; c=relaxed/simple;
	bh=3lnGLctRTV1ZhP7gsANbRBWYr/uaOemWulTLa6OebJo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fU6z8vbcl450kQCtpBcOOsGjk2m01YCZRN2j6Mofr6/FHAWVqOc3rY6I0y8rPxSqCOKnXFi+GI1eMsS2ecEQzNYsJ+QkA0fbQpREmB4G4oERxYOQ/oAxJlknWsrfamk6O7i7EH/ZODVjafbvoKrA4Cfx0uKYyC+gbY0ONM05unQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EvaFxUND; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EvaFxUND"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8838f4c392so49010666b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 00:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770713273; x=1771318073; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ULYjWWC903FxjlaA/DfXcj/bqj7W1j7W1eSCTHW/xkw=;
        b=EvaFxUND285Y3oVyxjVN89cDVVKtUUnTes1vgOJYBW2C3AcXNDFEt8ikXkvM2jEKwP
         opUNVt7T4n+fgUjZ49Q8Twi7E+KB17Aqk+nlfQgA5QnBh1tVHt6/LBejIO28MqpUjHBY
         z3xp2w1lZk1GoXC8WJiGtg4mMA3LKo8aWbPocEQItu0kO+0z2i43lZyAKVk4+ZepRDNz
         GJDU8bnAwcl7Zec7S1XU0cKi7lBii9eiZ5oVlZDLAF8OnCDCprro26A1AAx6ja9775+/
         PalV8lZHRvPQdvmrnTEmIcIbqqrJswKzwvLmFg+LM8ISsbHvkx8Rhj2yin6DfvTkRWej
         cOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770713273; x=1771318073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULYjWWC903FxjlaA/DfXcj/bqj7W1j7W1eSCTHW/xkw=;
        b=BplPEaexqvk7HUUqVGtlWQ9M/niQcP1I+lAG8IqX7c1sv0aFo92HaE1GdlE9CRvF/O
         HMHUPHOj6RfuSenzl8bnjLl78SG/QdeQsVdWQJ1sOpVEqBfWum6l1Y80wbx8OLVP4KDi
         NjHrmauTRggaNX/S6e1nXzWLL6PSfbXPoPau/I7vw8O4d+cmmezaslYjRWi43hQedFlk
         4tfgw0sw5nEY4yNbRbpmb72Bpcvcd7UBnr2+JfxE81gu+gLFFH6AfuG2uY1GQW4L9kSv
         xA+Iguvij9KwiIx8qwRAOzuTywajVTc6G7HVM0sw7IIasP5mJe1cWmj2DPUWMeHbUDTy
         k2wg==
X-Forwarded-Encrypted: i=1; AJvYcCWfDKyC+W/RBE6mxUyxzomi6CrJFJkuQvEMiDFjRZKc2xnnYa406nj/f1y4ahdZ3GhV++NdfThzj1kh4fPK1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfS6Gd6D2epssTvIrA/iCcMyw2s0Q/OFlGBwCwRbEsa5EYKvEN
	Xws+0iHzRGHiSPvONwiLA0luVqyfyt2Piox/x8ar2Ycli4sAT9lDmBRGEFXl1ueVZdedBSsDpwe
	MfwcW4i0PCwm02q9uyg==
X-Received: from ejdai24.prod.google.com ([2002:a17:907:e158:b0:b8e:b3d3:3838])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3d16:b0:b88:510a:59b3 with SMTP id a640c23a62f3a-b8edf40a6a6mr848568966b.48.1770713273356;
 Tue, 10 Feb 2026 00:47:53 -0800 (PST)
Date: Tue, 10 Feb 2026 08:47:52 +0000
In-Reply-To: <df876a6e-013c-4566-890d-7c1d662fced3@lucifer.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205-binder-tristate-v1-0-dfc947c35d35@google.com>
 <20260205-binder-tristate-v1-1-dfc947c35d35@google.com> <9d0d6edd-eab4-4f31-9691-78ed48e7ad5b@lucifer.local>
 <aYSCNur71BJJeB2Q@google.com> <9a037fdf-1a98-437f-8b80-7fdc53d5b0fa@lucifer.local>
 <aYSfBJA4hR4shPfI@google.com> <df876a6e-013c-4566-890d-7c1d662fced3@lucifer.local>
Message-ID: <aYrwuPus_cOyumGo@google.com>
Subject: Re: [PATCH 1/5] export file_close_fd and task_work_add
From: Alice Ryhl <aliceryhl@google.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, kernel-team@android.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 09, 2026 at 03:21:58PM +0000, Lorenzo Stoakes wrote:
> On Thu, Feb 05, 2026 at 01:45:40PM +0000, Alice Ryhl wrote:
> > +/**
> > + * close_fd_safe - close the given fd
> > + * @fd: file descriptor to close
> > + * @flags: gfp flags for allocation of task work
> > + *
> > + * This closes an fd. Unlike close_fd(), this may be used even if the fd is
> > + * currently held with fdget().
> > + *
> > + * Returns: 0 or an error code
> > + */
> > +int close_fd_safe(unsigned int fd, gfp_t flags)
> > +{
> > +	struct close_fd_safe_task_work *twcb;
> > +
> > +	twcb = kzalloc(sizeof(*twcb), flags);
> > +	if (!twcb)
> > +		return -ENOMEM;
> > +	init_task_work(&twcb->twork, close_fd_safe_callback);
> > +	twcb->file = file_close_fd(fd);
> > +	if (!twcb->file) {
> > +		kfree(twcb);
> > +		return -EBADF;
> > +	}
> > +
> > +	get_file(twcb->file);
> > +	filp_close(twcb->file, current->files);
> > +	task_work_add(current, &twcb->twork, TWA_RESUME);
> > +	return 0;
> > +}
> 
> Would need an EXPORT_SYMBOL_FOR_MODULES(...) here right?

Ah yeah, for Binder to become a module it would need to be exported.
(Though maybe it's worth moving this logic even if Binder is not made
into a module?)

> > diff --git a/include/linux/fdtable.h b/include/linux/fdtable.h
> > index c45306a9f007..1c99a56c0cdf 100644
> > --- a/include/linux/fdtable.h
> > +++ b/include/linux/fdtable.h
> > @@ -111,6 +111,7 @@ int iterate_fd(struct files_struct *, unsigned,
> >  		const void *);
> >
> >  extern int close_fd(unsigned int fd);
> > +extern int close_fd_safe(unsigned int fd, gfp_t flags);
> 
> One nit, generally well in mm anyway we avoid the 'extern' and remove them as we
> go. Not sure about vfs actually though?

Right. Not sure about this.

> >  extern struct file *file_close_fd(unsigned int fd);
> >
> >  extern struct kmem_cache *files_cachep;
> 
> I mean this is essentially taking what's in binder and making it a general
> thing, so needs Christian's input on whether this is sensible I think :)

Yeah.

Alice
