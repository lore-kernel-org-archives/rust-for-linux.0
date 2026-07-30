Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E63EDAC9
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Jul 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402713; cv=none; b=byNKEExfBhCmvUuW16BAmDJyFuHxHm6qajUwS2WgVgy/qlnFLGAaC8IF7tiC0/kKdzOGyywB8Mbl5o8YlMdpBZL7NLIYfxP+64g3eteiDYQrc8gqqtsQLC3uICzu8BHH7OA94cGJwwJJfOFb3pdaG8BEmCmuqP4sB/aVGX34YbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402713; c=relaxed/simple;
	bh=k8MrRN1zHzHirQ+riz3nZa56KdQtvZYEXwt1G83rtDE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dE/6+cLWZolfJP3CBpKPAbZuP0gdWr+6tm5m6cUw1q/lxEezaXX+JuliXcG1XqwMz55ZGkrdet5zzckSK0D6zoBDK60PV1JOhKGoen6GuZYnnlZ9vPtPs023yA7MIq/ftqjrjvqtnozIiXY9QbMarficy2/0wPlJvmn5mckusEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ija4nvhU; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ija4nvhU"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f24a50f0cso1523716f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Jul 2026 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785402709; x=1786007509; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzY0lsTJjXWVanRyLSlFEy2hFBQ+8J2ffhaSCqEExvg=;
        b=Ija4nvhUGD3duWELd8PduG2kaTNeX7BTY+MRSDaapsffIMUENv4VWXYlHZ/TAbGb65
         bZETqWwIVOjPf3pRYi3hH2+Gvt29y/iIGOwrouInStAZgCMkSeY6Zp1o0At07x9dwz/A
         71Pwvcm4Bb2j7LxhmohYvJPvRjgZKNjvhFtwX6vPeoeU36rJKbnUTtdy8OzuyiaB/NIe
         jctxoWbjc2pFnH4ywh+tZRsarcw50rgCsEz3fsIvqfx6T0S2ytGBxv4+48sl9fUm5ZMl
         59+Fw/F6TEouAsz1GEDs0WKEqAlgd3MLPhmV18Q1moe+QO+QBlqy9QYTgmX7CSVzRm7W
         SbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402709; x=1786007509;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzY0lsTJjXWVanRyLSlFEy2hFBQ+8J2ffhaSCqEExvg=;
        b=DrfHwoUagtPUZ1pGvrEOi6/KE8q5Va9FjGmURXA82VDshPdGmPu3BNSUeF6mi1POAs
         zNqOv+XxP7UOQ7levUFJ1Qsg9iTT/RJYarQB7yLcfvh9vktxpfRddaU5IWpoU9LDVL5x
         qkT9OskWVburkYqk9lu+dFEVXzZypS7t9/LS8uxiZya2UKaNb45tAOP1npifGam/r9uk
         mC52GUbNfvw1VQTHe+UhdwsllJgRdFqIrCy8DF2VyqsDlBU2eeuJst1aoB6ZgyzklHYq
         l3GEjAguQ1tgF/oPDAF1mZBvKlGaj4P0DoyPay7zA8objy2EeUy9G478XU/kTQviX1W6
         JgOg==
X-Forwarded-Encrypted: i=1; AHgh+RpbpLnVm7LoKMq7V4LFU1A41+5tBVWf/crd66cmQihILxE0FuVV9cubumANtmnyYmcLO2XQGMBjLFFDz31a8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWUMNwnqKIwn1tQW8+hRpYbPCOCuf5tKpcX8MmV74b/GsTCAnU
	Y4DsQb4XWYI0E8vP0lfT0p4+lwBEzrXo+KaiHiDIULZmCd8480s/EJTqQgdXiQuJFJoxJ5x1Wt9
	WkTC+g8koyT1v6NYk6Q==
X-Received: from wmbhn27.prod.google.com ([2002:a05:600c:a39b:b0:495:5edc:795b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1505:b0:495:4df2:b8c1 with SMTP id 5b1f17b1804b1-49800ebbf5dmr13261205e9.35.1785402709283;
 Thu, 30 Jul 2026 02:11:49 -0700 (PDT)
Date: Thu, 30 Jul 2026 09:11:47 +0000
In-Reply-To: <DKB42GHIZ8VZ.17ASJME0HTP5A@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-setonce-populate-v1-0-fa7455c26c42@google.com>
 <20260722-setonce-populate-v1-2-fa7455c26c42@google.com> <DKB42GHIZ8VZ.17ASJME0HTP5A@nvidia.com>
Message-ID: <amsVU-1o_zNOIOts@google.com>
Subject: Re: [PATCH 2/3] rust: sync: add SetOnce::try_get_or_populate()
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jul 29, 2026 at 11:05:55PM +0900, Alexandre Courbot wrote:
> On Wed Jul 22, 2026 at 6:16 PM JST, Alice Ryhl wrote:
> > +    where
> > +        B: lock::Backend,
> > +        F: FnOnce() -> Result<T, E>,
> > +    {
> > +        if let Some(value) = self.as_ref() {
> > +            return Ok(value);
> > +        }
> > +
> > +        let mut to_insert = f()?;
> 
> This means that `f` can run more than once for a given `SetOnce`, which
> can lead to problems depending on `f`'s' side-effects.
> 
> In the GEM shmem case, we would create a second `SGTableMap`, and since
> `SGTableMap` assumes it is the sole owner, the last instance to drop
> would create a use-after-free.
> 
> Now this sounds more like a problem with `SGTableMap`, but if we cannot
> avoid calling `f` at least twice then I think it would help if this was
> documented.

Hmm ... this is the behavior I want in Binder. Actually creating the
value is an allocation, but my lock is a spinlock so I cannot invoke f()
under the lock. This means that each caller will make their own
allocation, and then we throw away any extras if there are concurrent
callers.

If GEM shmem wants f() invoked under the lock, then that's just a
different operation than the one Binder wants.

Do you think we should add both?

Alice
