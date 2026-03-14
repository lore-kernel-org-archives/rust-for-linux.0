Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A21284684
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Mar 2026 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773484493; cv=none; b=Jk82ygAPx3UDXfMoV0OZZaoldnvb8iGnxU0p5jzJ1ustHe2V4kgywWDgVZ7A/iX7h+ypAJ/dO4UXvlqY/qeNK92Idkg8EmAWBHUArdjmHgx1lBBuJ9ZI1dUwKeLDWAZjThoJrWavgf2IUeiWL9v604p0os57dKrvatWHeFQivcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773484493; c=relaxed/simple;
	bh=8pYlSTWQj/4mT7nDcR8AI6HrGlb8wLJXUFirubyysyI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bT5EUjnmQNZOZy7Yq5QaV62dSMGnaIi0TsadFbGKdAvottpB5IvPL20BAQP2M6GrDdYR6wcfAehxPy1CDkNHRAb/SPEzTdiKn6JhBA0wnDWV2jgHFOLlg9BzPaDUScakOu3JHCZUDzV03+2sVcLB2OMDZs0OviN7si7YI+ku+IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Si1o/QeU; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Si1o/QeU"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b934e96af9dso274202366b.3
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Mar 2026 03:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773484490; x=1774089290; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gk3LahT7LBtCClNQfo/eYL9ZNEAl8jXw+YpBWkfN1uk=;
        b=Si1o/QeUnvOxSMftTZw99EJLwZQR/m3xt+ON8SvmJeM4L3hgnX3r1kx5si+TEGSd/P
         V2izA5/NU3IsAIaqSAVIDkCdynhpMBrAgXXhIznG1U917KsXV4oeORmMJpZbn99SFaMJ
         +mEU7otf1FaY25U91taSPyde4egOcNX+IvXvneazrRPFATwngcK+pChqQ8va0nplcW69
         KcMyVXn3RBeBAKohBnMpdSFdd7GhvEgSQxuT4oEFyIWszv2wYV6dho4EUbKNWBgqYVbL
         7aMYNSjryy9c7GBovhDK11SDWqicZofzWtT3sYnBMs6TRonjisxWlwdeuZcyxxgGWfK5
         5gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773484490; x=1774089290;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gk3LahT7LBtCClNQfo/eYL9ZNEAl8jXw+YpBWkfN1uk=;
        b=k3JpN7capIuKwWvGNfwU/BAoXA5vSyAReuW0FfobYXjxjDTGG7vxYKxbiAxNWLCjGu
         PYQYl9q/E1w1VRVQAmIHrafBgmlK3DckzmIcIEzMzjNP82NKpquqTJdd20bpLwLSKbT2
         et/RSptAIpYDI7EE4DXhUx8XZnnCO6i+rLQDLn9RmD1o09EstXGLGcPIZ8WyYxy7tShs
         51vCkGQSDxOSZkqw/YpLGVdrNyBZZibYfrSdNvzRYMEnqHoyN+XoRvJ1RP2sMx/GmPFY
         QvLgz/B8sAut4UKx7jx6NW5li5WXmrdfKXVnVkf5A2PIQ4InajojwwsoIPM9cvWBvRDp
         avZw==
X-Forwarded-Encrypted: i=1; AJvYcCXfY+LvPDfOp9QjedzT+yGqgkTSWgqNzXZfhSCNKbwQYtv0zIkAtF7u5oZ9hyqYqH673MWTqMTXV0+VGi+XmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5JziH7+ssFyxelw7MQDJBxKk3h284DSDdG/M0gXXYAeZHPiY
	HJJEeejOrMf0F4MJu2mKpaDh+U5CJuUbFjNOaBDZkPTWZjKmNNmfEATcu/ZuLwk855leTB3yRaC
	t4V8jT6hnmVlVfeYkAQ==
X-Received: from edev3-n1.prod.google.com ([2002:a05:6402:a2c3:10b0:662:a1e5:d213])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3642:b0:660:f443:379a with SMTP id 4fb4d7f45d1cf-663babf5c95mr2712492a12.15.1773484489676;
 Sat, 14 Mar 2026 03:34:49 -0700 (PDT)
Date: Sat, 14 Mar 2026 10:31:43 +0000
In-Reply-To: <DH1OVJDQ3B1B.302K37FK77JPC@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
 <20260312-create-workqueue-v4-3-ea39c351c38f@google.com> <DH0Y9Y1KIOQO.MECK7D06XFXP@garyguo.net>
 <abNEoZAoRT8G1Umv@google.com> <DH1OS4RI52DR.165D2P9C5AW9Z@garyguo.net> <DH1OVJDQ3B1B.302K37FK77JPC@garyguo.net>
Message-ID: <abU5D7d7UNA8FwHm@google.com>
Subject: Re: [PATCH v4 3/3] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Mar 13, 2026 at 01:29:41PM +0000, Gary Guo wrote:
> On Fri Mar 13, 2026 at 1:25 PM GMT, Gary Guo wrote:
> > On Thu Mar 12, 2026 at 10:56 PM GMT, Alice Ryhl wrote:
> >> On Thu, Mar 12, 2026 at 04:39:00PM +0000, Gary Guo wrote:
> >>> > +    flags: bindings::wq_flags,
> >>> > +    max_active: i32,
> >>> > +    _type: PhantomData<T>,
> >>> 
> >>> Hmm, it is somewhat awkward to me that we are having a `PhantomData<T>` here,
> >>> as `PhantomData` is documented to "behave as it it owns a `T`", but all the
> >>> possible `T`s that we use here are uninhabited.
> >>
> >> I don't think this is an issue.
> >
> > Fair. I also don't think it's an issue, just awkward.
> >
> > I would rather make the uninhabited enums be just unit structs, though (like what we do
> > for atomic ordering and device contexts).
> 
> One interesting idea with unit structs, is to allow the type to be passed in as
> argument rather than having multiple new_ variants:
> 
>     Queue::builder(wq::TypeUnbound).max_active(..).build(...)
> 
> This is the trick that we use to make atomic API looks nice, although in this
> case it seems that it's not worth the hassle as it needs an extra import...

Yeah, I don't think this is worth it at all.

Alice
