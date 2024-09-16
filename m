Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846FF1581F2
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726500498; cv=none; b=fyerbcejyACJ1oLEm208UYYWGvMnGhI0DwG7VnY6Ul4O88bjHdMbD93q8dNTPb1CW1aXcF5fdOfL1Oidrq65KIDqV3U2jsuLRB7mO+Eg5V2bYN4BBSH7Ljw9eKMUqUy7Q271Q6eNKeaeksP5VnnBxz7IOcOxbihOD8CJrVG0G3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726500498; c=relaxed/simple;
	bh=WlODueikdE8iNg+YcFfV4D9fBjO+4Cw1pzynCIM+K+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRx2JIPciKJt68YUSSiu8qMzqWBPdpWhWJOUrFVDpROY52NYGOxKh0U8mBHQfDTOQqccVAdAuqMiDlDyYPCy02WIGQKAh/HCmqqw0DEehYAKhs/LISIb9R6/oSaSRtO/ij8kkmwChlvtiWDG96PhRRVg2nB8JMIChE483PSGtxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=dqtLX7p6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="dqtLX7p6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37747c1d928so2210706f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1726500495; x=1727105295; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7m4daR3wtHlZl9dcuxcFnv3RNISgqsCBz2X/zdmjlr4=;
        b=dqtLX7p65/y7sBWF6zXxus+TD1RMiLVoqiWv/2oloaZUaAARl4liz+ESOOgouOpiWN
         aHEa9rIXBvPhhaaojmpJebhlcmKw/Wj+1cK7afP8xurOYyrb6dh4k+AVIRLZBs0wXgc3
         GmpqJTelWqyvUKv35J/NaRAAHtViTliLWkKho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726500495; x=1727105295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7m4daR3wtHlZl9dcuxcFnv3RNISgqsCBz2X/zdmjlr4=;
        b=rskuRYdO3vBM6/T5oMHwb+Soelk7NGWpSLxGtV/rX0LGU+/pgKgHnmvICOqVtgeR8I
         GddTOa+1DkAN/1Y4WYhIe4/0ydchK2ZhPnqODmLkuP/awcN6QBID1vV0rgk+xuqbCPuG
         inM4ZxhIU1oO5fqrTk0+GUqauwh9hVHJGHylhY+Ny6W0v7zk9HN4BpbpmesVeWktohem
         dP6Bx0nhVk1mbTOY5oWGCvh5lORu9GW4x2XadMuQJ+UizkxdCXAtsZeFLQehRbpd5EIL
         VLNQ/PFAqlGSteZnFaP/S6cD7AZ2+fEENlfQeTeKh5s1X14NIllZiTRScCBFPYR6T2Hi
         /OVw==
X-Forwarded-Encrypted: i=1; AJvYcCX5VfPScpnRMOVkX70xthxtO5li7AYU/NKAMHKVaESoKZcQ2At+1Ev/uNx7BgzxG8qW9cJvFIORkthVkb+4Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzThBq80lDYko5qTgGh9+ukcJQ94X8uW9qD9zn6H9BIowJR2Spq
	hSxk0fgiLV/7tdpu8x1JZzSCHtAT7OndDkYTsAAVCFLjRgKQetaKEgm1jcDLPZI=
X-Google-Smtp-Source: AGHT+IGWvzNIRGqBC8AGUY8qiZPWMwcVmKXq3jZ8qz07XXarJ1ziKNdbe2x93+v1ko+aFpHXY3tsYw==
X-Received: by 2002:a05:6000:120d:b0:371:82ec:206f with SMTP id ffacd0b85a97d-378d61e2871mr6466145f8f.16.1726500494626;
        Mon, 16 Sep 2024 08:28:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e78052efsm7470228f8f.97.2024.09.16.08.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 08:28:14 -0700 (PDT)
Date: Mon, 16 Sep 2024 17:28:11 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Trevor Gross <tmgross@umich.edu>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rust: sync: fix incorrect Sync bounds for LockedBy
Message-ID: <ZuhOi1xFBNtfGxn5@phenom.ffwll.local>
Mail-Followup-To: Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Trevor Gross <tmgross@umich.edu>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
References: <20240912-locked-by-sync-fix-v1-1-26433cbccbd2@google.com>
 <ZuSIPIHn4gDLm4si@phenom.ffwll.local>
 <ZuUtFQ9zs6jJkasD@boqun-archlinux>
 <20240915144853.7f85568a.gary@garyguo.net>
 <CAH5fLggoz5gdgOpEiXu7u9hPXjLLeSv9An6jaq0am0-dG7+ohw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggoz5gdgOpEiXu7u9hPXjLLeSv9An6jaq0am0-dG7+ohw@mail.gmail.com>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Sun, Sep 15, 2024 at 04:11:57PM +0200, Alice Ryhl wrote:
> On Sun, Sep 15, 2024 at 3:49 PM Gary Guo <gary@garyguo.net> wrote:
> >
> > On Fri, 13 Sep 2024 23:28:37 -0700
> > Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > > Hmm.. I think it makes more sense to make `access()` requires `where T:
> > > Sync` instead of the current fix? I.e. I propose we do:
> > >
> > >       impl<T, U> LockedBy<T, U> {
> > >           pub fn access<'a>(&'a self, owner: &'a U) -> &'a T
> > >           where T: Sync {
> > >               ...
> > >           }
> > >       }
> > >
> > > The current fix in this patch disallows the case where a user has a
> > > `Foo: !Sync`, but want to have multiple `&LockedBy<Foo, X>` in different
> > > threads (they would use `access_mut()` to gain unique accesses), which
> > > seems to me is a valid use case.
> > >
> > > The where-clause fix disallows the case where a user has a `Foo: !Sync`,
> > > a `&LockedBy<Foo, X>` and a `&X`, and is trying to get a `&Foo` with
> > > `access()`, this doesn't seems to be a common usage, but maybe I'm
> > > missing something?
> >
> > +1 on this. Our `LockedBy` type only works with `Lock` -- which
> > provides mutual exclusion rather than `RwLock`-like semantics, so I
> > think it should be perfectly valid for people to want to use `LockedBy`
> > for `Send + !Sync` types and only use `access_mut`. So placing `Sync`
> > bound on `access` sounds better.
> 
> I will add the `where` bound to `access`.

Yeah I considered but it felt a bit icky to put constraints on the
functions. But I didn't come up with a real use-case that would be
prevented, so I think it's fine.

Even the use-case below where a shared references only gives you the
guarantee something is valid you likely have additional locks to protected
the data if it's mutable.

> > There's even a way to not requiring `Sync` bound at all, which is to
> > ensure that the owner itself is a `!Sync` type:
> >
> >         impl<T, U> LockedBy<T, U> {
> >             pub fn access<'a, B: Backend>(&'a self, owner: &'a Guard<U, B>) -> &'a T {
> >                 ...
> >             }
> >         }
> >
> > Because there's no way for `Guard<U, B>` to be sent across threads, we
> > can also deduce that all caller of `access` must be from a single
> > thread and thus the `Sync` bound is unnecessary.
> 
> Isn't Guard Sync? Either way, it's inconvenient to make Guard part of
> the interface. That prevents you from using it from within
> `&self`/`&mut self` methods on the owner.

I think there's also plenty of patterns where just having reference is
enoug to guarantee access and exclusive ownership gives exclusive access.
E.g. in drm we have some objects that are generally attached to a File,
but get independently destroyed. But some of the fields/values are only
valid as long as the corresponding File is still around. Lockedby as-is
can perfectly encode these kind of rules.

So I don't think tying LockedBy to Guard, or even a specific Lock type is
a good idea.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
