Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25643DEFF3
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 06:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785998501; cv=none; b=RG7QQqHhRKIz0a4ubJFeIIJNJwutesU4WNpN485hE495oP6UrgUQ5ze1YpThCjrBw3e0EPenYZQHldmi9uO77YwqGknWZvNPBSkkwmW8TM/m+UOFABgsB5NGvd9n6x33gHqJElLB29WcBtfz9O0odS/WsvcATTEp0Q9FyEwyPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785998501; c=relaxed/simple;
	bh=CfNRJZeZmqs+vpmkTIy+iPYiZj1ZA6vbNYOB8IJb70g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MN6syKsuYC1rLz+4QYuKjnPPjjzUE5wgYnSVA+l/bhHGJYDwbSElU0U+SLCeLaY9B7sJg8gwV9FsKGZM/zYsqQ/CJKRnzZTMFvTWndxeFjI60oTfb6V0wiOpy4Oe7YpSXu7PWpDaLoHOJbKyueORUe99n4JFmjB2lEcfpJT6ncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i6gG8tE2; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i6gG8tE2"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a125f5b317so1716161a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 23:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785998498; x=1786603298; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=US1i/tRbzF6S64ni7H83o50wYD7eH+0GOV1v3nMXlH0=;
        b=i6gG8tE249xI9jU1a1xvdfs3vwwm7ijRobSgdxQq9G6DtXWNXqpUEUpwBgeRws0ZLS
         NoPTvkO0CXzKiHEp6sJ/EI4+NB9yVZ+gKNjO4qPkMnH9XvGj+Qb3PU1K894vaLNlB9W1
         koD7rVr6qyCX2H7WSnhKAi6+94i8TbhOgcU2q7J9TZmmQMzJrSXgC6oEOI21K6bgUH9a
         OSRonge9lrD66SUuhkLB7zk1d3+/ivLjfwL4y5g8fVhbwpD1AMLdUqQNtfj1PfwEbEcy
         is5USgpHyncU/wTQ+PASt3rX+pTLpWEU8q+9Jd1f+DEzwcTUl0E31NCcGkw8tx5WrJGn
         Hh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785998498; x=1786603298;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=US1i/tRbzF6S64ni7H83o50wYD7eH+0GOV1v3nMXlH0=;
        b=YKWDm4DDBWCiQbsOK9g4ZRDb6LeKSzXxy1ASL4/xL4SLfmsZj0wZqgKoCP9BjCszVb
         tNLRCjDRZgDsYmRzhh7fnFY0pkx3nSZPYUpN5a+FbE0fl5Ms0sbxkvjH5k7jM+U04BcR
         GJ8TeiUJb+SQPjP6/j9x21gYYkOM9IBaxtjF0R6caGllIrcRu9rlZxAGa7HrGY7gDwuI
         /UsYYeC9I1/OOL2ETZEnOr4SLLz6HTlaq0BplhUWFWijour7dNNyxeXWVNXtiMj3/8/1
         min5xA301k4/mYfJsCplU4ybTLBg2FucbVDsyu77c7H6cJwpGxkhIwLKQYFWauTocMdJ
         0oDA==
X-Forwarded-Encrypted: i=1; AHgh+RqgAS77Oj7Nk0a+2d1Hh8f59l2nOLhiTbc1FCfjI+vw3e2JmOE3YQyr6HHg9+Jl1JcYTD3RUV6VJh5LFFqm9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGopx41vGEwuk0bXQa0fbuBTWQrTDnreu1Ab3M8ZTMbUpW0XXB
	BcHpDm9SVRpn2PPpsxw4nb79uXisZZmIPoVznocRMG9+V8XAC3l2nWicCs49LqGMDVuFaz79uT1
	0BuZxU2Dt3BwXdTdhnQ==
X-Received: from edbdm10.prod.google.com ([2002:a05:6402:22ca:b0:698:ac87:5b65])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1f47:b0:698:3602:d0d with SMTP id 4fb4d7f45d1cf-6a14f252b49mr6344045a12.17.1785998497864;
 Wed, 05 Aug 2026 23:41:37 -0700 (PDT)
Date: Thu, 6 Aug 2026 06:41:36 +0000
In-Reply-To: <anHarTAFv-c4qx4h@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260721153617.869933-1-beata.michalska@arm.com>
 <20260721153617.869933-2-beata.michalska@arm.com> <anGfGWWxiuZj4i2U@google.com>
 <anHarTAFv-c4qx4h@arm.com>
Message-ID: <anQsoIbL6dGWmzbL@google.com>
Subject: Re: [PATCH v2 1/3] rust: add runtime PM support
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 04, 2026 at 02:27:25PM +0200, Beata Michalska wrote:
> On Tue, Aug 04, 2026 at 08:13:13AM +0000, Alice Ryhl wrote:
> > On Tue, Jul 21, 2026 at 05:34:02PM +0200, Beata Michalska wrote:
> > > +define_pm_ops!(
> > > +    // PM state change
> > > +    runtime_suspend,
> > > +    runtime_resume,
> > > +);
> > 
> > I think using a macro to define this trait is overkill. Just write it
> > out:
> > 
> > pub trait PMOps: Sized {
> >     /// Type of a bus device
> >     type DeviceType: AsBusDevice<device::Bound>;
> >     /// Type of the data associated with a PM transitions:
> >     type RuntimePayloadType: Send;
> > 
> >     fn runtime_suspend<'a>(
> >         _dev:  &'a Self::DeviceType,
> >         _payload: Option<Self::RuntimePayloadType>,
> >     ) -> Result<Option<Self::RuntimePayloadType>, (Option<Self::RuntimePayloadType>, Error)> {
> >         build_error!(VTABLE_DEFAULT_ERROR)
> >     }
> > 
> >     fn runtime_resume<'a>(
> >         _dev:  &'a Self::DeviceType,
> >         _payload: Option<Self::RuntimePayloadType>,
> >     ) -> Result<Option<Self::RuntimePayloadType>, (Option<Self::RuntimePayloadType>, Error)> {
> >         build_error!(VTABLE_DEFAULT_ERROR)
> >     }
> > }
> > 
> > This is a lot easier to read.
> It is, though there are more collbacks, that I would expect to be added at some
> point, so macro is just to avoid several code blocks that would only differ in
> function name.
> But I do see your point.
> Happy to change that if you still believe there is no much point to it.

I generally believe that for traits such as this one where end-users are
likely to look up the definition, it's much more important that it's
easy to read when you look up the source, than it being easy to write.
Therefore, I think it should not use a macro, even if there are many
methods.

Alice
