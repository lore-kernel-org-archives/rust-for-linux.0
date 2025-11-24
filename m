Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE9626E175
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979647; cv=none; b=udpEQj+mYNvbkFz9x+ppTeDnR3f+54YhqRPYqWinJ28YLlJy4TMHyGXfAMZIzJZplxIcfedOJ8djgY3MLf7HYMmFGmxjeektpfAbCruVqFxlKXHHPRa9UrRmtY+DMJcW1kpit8I1UnycgoJ8VE8nNTz4Tv1BOu6m84IakpCLH7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979647; c=relaxed/simple;
	bh=Vq23B42YQM30fbN3a/FlljXqjGc+yzZDWoRENSi3Iok=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m51nX9K/vKaJBoSKIwUS4N6fU+GDMRaZ02HuD2IqYYic34oZv6BKc1FU4ul1BR3vK9KSCmhElSUwxZKq6y3Kvc4aA7/cVwdfZHshJckHvK6xKfaxeNUz4QKZ8HZoBbXxx50w2LbqnEkAogIvI0+lpX3uXpLMx+0vcdvCJzA8VVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MvdyvZcJ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MvdyvZcJ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477cf25ceccso6954335e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 02:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763979642; x=1764584442; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MjaxZBnZAO+RdK+lICe94+uM0QkuZZJOu84Gi7JQ2wU=;
        b=MvdyvZcJlnM+iHh8Zaw9/7h7vZtWtsn1sDKj15yYj2D28hFo3zsfDdbcIaVyx70qDf
         aCoQUrbC54znTUpTxaL9MJDozbsquYDBolSZHMl8VvWpbnbMEpRixiS2TCQp4/nY0rWp
         VPNsrkKbHQUkFlBFPQuiEidR7F1B05BodUkyPzMWIad7oSOeeDUscw+HGNEnHmQXaD5h
         7b3VLpp9ggeLAJj8x6uA8iCtJ8UInmz0XRhktS4HphSiC7qy/V4ulJ84i4CVgI32UWmy
         d7JkGuCrgvRSPFoHTm66ATiIGxY3Dms3PoW7m9JEzF0anaJfrVcgr/XDidbu0IAH0tg/
         OcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763979642; x=1764584442;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjaxZBnZAO+RdK+lICe94+uM0QkuZZJOu84Gi7JQ2wU=;
        b=VbQktRQ6e2u1gxESv6YWl+SLOjtk+iD36vNdPG42gxfrJ0t21faoa9zWyEPjV6N5Q8
         OolQ9RjUmXYmvoDKKeuhwlUVMi0Xh28jAmfc+LQolo6BGnCuj7qVzBHv/cRe4JLktjSf
         iMQ4BuCoM8cD+Jwa8crzPMfcJKl+Rg+9uG3q0Zv2PM1OiASRVfJ7mYVWv6XXHTW/dt1o
         H4k8NrlxO1rC5ybOX96US49XmTit/jwo/y5NjZlTarHXKm4dkXWnYRAroZRgstgaf3vG
         sV0tVNtCjraz8usdv6uIeaGM9rhrRagRd8vH5VIQAieECxMK2sMpEuLFWBxuImNZhIkU
         Q+pw==
X-Gm-Message-State: AOJu0YxrlYxhkr0qFHG9qZr2VH+BfWKtDTJ9ABdiOuVBdMihMIZMxaIf
	8PbK73AT5rJow4G9ZJAAU9B/x4xCrgKlirt/6NgQuw2LN3VJJ3+5ht3OklDm/kMyOdRfc0Bz1pI
	gYI2SfuERKWgvPK7aew==
X-Google-Smtp-Source: AGHT+IF8S0it1+GhoOO3nZ/1kXLt4XUmfk2TDfnUVhFKCQUNw3c7NJSXstpPE1SfO3stNbsOGXDZ9186zRs4lJA=
X-Received: from wmbjd14.prod.google.com ([2002:a05:600c:68ce:b0:474:979d:a20d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5252:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-477c01defd8mr118517125e9.23.1763979642501;
 Mon, 24 Nov 2025 02:20:42 -0800 (PST)
Date: Mon, 24 Nov 2025 10:20:41 +0000
In-Reply-To: <20251124120846.267078e5.zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251119112117.116979-1-zhiw@nvidia.com> <20251119112117.116979-4-zhiw@nvidia.com>
 <aSB1Hcqr6W7EEjjK@google.com> <20251124120846.267078e5.zhiw@nvidia.com>
Message-ID: <aSQxeSX0q4Z_jaAu@google.com>
Subject: Re: [PATCH v7 3/6] rust: io: factor common I/O helpers into Io trait
From: Alice Ryhl <aliceryhl@google.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dakr@kernel.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	markus.probst@posteo.de, helgaas@kernel.org, cjia@nvidia.com, 
	smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, acourbot@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 24, 2025 at 12:08:46PM +0200, Zhi Wang wrote:
> On Fri, 21 Nov 2025 14:20:13 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Wed, Nov 19, 2025 at 01:21:13PM +0200, Zhi Wang wrote:
> > > The previous Io<SIZE> type combined both the generic I/O access
> > > helpers and MMIO implementation details in a single struct.
> > > 
> > > To establish a cleaner layering between the I/O interface and its
> > > concrete backends, paving the way for supporting additional I/O
> > > mechanisms in the future, Io<SIZE> need to be factored.
> > > 
> > > Factor the common helpers into new {Io, Io64} traits, and move the
> > > MMIO-specific logic into a dedicated Mmio<SIZE> type implementing
> > > that trait. Rename the IoRaw to MmioRaw and update the bus MMIO
> > > implementations to use MmioRaw.
> > > 
> > > No functional change intended.
> > > 
> > > Cc: Alexandre Courbot <acourbot@nvidia.com>
> > > Cc: Alice Ryhl <aliceryhl@google.com>
> > > Cc: Bjorn Helgaas <helgaas@kernel.org>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> > 
> > I said this on a previous version, but I still don't buy the split
> > into IoFallible and IoInfallible.
> > 
> > For one, we're never going to have a method that can accept any Io -
> > we will always want to accept either IoInfallible or IoFallible, so
> > the base Io trait serves no purpose.
> > 
> > For another, the docs explain that the distinction between them is
> > whether the bounds check is done at compile-time or runtime. That is
> > not the kind of capability one normally uses different traits to
> > distinguish between. It makes sense to have additional traits to
> > distinguish between e.g.:
> > 
> > * Whether IO ops can fail for reasons *other* than bounds checks.
> > * Whether 64-bit IO ops are possible.
> > 
> > Well ... I guess one could distinguish between whether it's possible
> > to check bounds at compile-time at all. But if you can check them at
> > compile-time, it should always be possible to check at runtime too, so
> > one should be a sub-trait of the other if you want to distinguish
> > them. (And then a trait name of KnownSizeIo would be more idiomatic.)
> > 
> 
> Thanks a lot for the detailed feedback. Agree with the points. Let's
> keep the IoFallible and IoInfallible traits but not just tie them to the
> bound checks in the docs.

What do you plan to write in the docs instead?

> > And I'm not really convinced that the current compile-time checked
> > traits are a good idea at all. See:
> > https://lore.kernel.org/all/DEEEZRYSYSS0.28PPK371D100F@nvidia.com/
> > 
> > If we want to have a compile-time checked trait, then the idiomatic
> > way to do that in Rust would be to have a new integer type that's
> > guaranteed to only contain integers <= the size. For example, the
> > Bounded integer being added elsewhere.
> > 
> 
> Oops, this is a interesting bug. :) I think we can apply the bound
> integer to IoFallible and IoInfallible to avoid possible problems
> mentioned above. E.g. constructing a Bounded interger when constructing
> Mmio and ConfigSpace objects and use them in the boundary checks in the
> trait methods.
> 
> I saw Alex had already had an implementation of Bounded integer [1] in
> rust-next. While my patchset is against driver-core-testing
> branch. Would it be OK that we move on without it and switch to Bounded
> integer when it is landed to driver-core-testing? I am open to
> suggestions. :)

The last -rc of this cycle is already out, so I don't think you need to
worry about branch issues - you won't land it in time for that.

But there is another problem: Bounded only supports the case where the
bound is a power of two, so I don't think it's usable here. You can have
Io regions whose size is not a power of two.

Alice
