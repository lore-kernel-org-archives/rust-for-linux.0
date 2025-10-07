Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB2120C01C
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Oct 2025 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759851667; cv=none; b=hdCfPJtoLa4YIqTpRmVKSK35pj+T4ES8ZS6V59fmSoQcz8fjDT7zz9LxoiFMhB0E7qawpMg3BeS6nfbwEoYnk+2f80tCnGmd4ub1sh7Q2H7mcwAwP11ZUXdZjW7Sg8PRVJgPX/31Syh7U4IPfShamj7oX3Ll9exZMTY8jHtXzZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759851667; c=relaxed/simple;
	bh=iNu98HKK2L57s9hGTaSY466cuEN56nDRJlrrqiSnXk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vF194dM3VvHc1CPOp1/fHpsvisNg3WNySfMQ0gUSS9MDmhkXHVeRuIBFg3HMCsYjcLbjq5vOHFWsq3x+IJOy++r65C3eIgntqNnv69/NhL0T0hGhfOQGj03D+hQua+WrLd0Xns8jwydFBFrAs7jEDfEnFTtjrgWQCWPI7cNGxWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bf4eCpGq; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bf4eCpGq"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d6051afbfso70557367b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Oct 2025 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759851664; x=1760456464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FaFNh20XxOdj2oQlwRRyR9v75gYMq+FkiOKklphUgxg=;
        b=bf4eCpGqlXhXjqnf9I7CktxuU+cC5APkWLK6ByMYmnuaN8PINFGVDr1vj8zEpgv6ET
         888M6vr4rROiBd208290slnu1cjkvLeF8P2K6cBTC52Jmm/OHUhepk3GLnzAtcBhH6c6
         lZnWtbg2TgPXr/pEZUsdDygsap3h+KHBkgqebsOe84EP1VcBHTc9PH7oR1ivCUUwhlgX
         6gsI+spiBJe6BihwUA96l1rBAy+IXkqNX9tQAaKCIldyLzB41w3t76yXiOimRk2vxPZH
         H5AzsP1XdR/HLiPgTPBeRWO7tC2F6bLYyBU1bzpfs9nYKIrQM4t+ZFKp8ihdxr5uoMV9
         YZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759851664; x=1760456464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaFNh20XxOdj2oQlwRRyR9v75gYMq+FkiOKklphUgxg=;
        b=bFFcQe5kBMvJArU1ff0EEiwUOihc0ZTZ+PNiQCotjosb4fXXqJ1l5djbtcVhea3cTR
         FdD3Rsq8Ufrew8WTto3TGCZ9aeyfigS2ckYGopRMBRtWDwLpECKIZXTfWeGrJiqcGRH1
         x5MRcYZaz0iPOsHHFJdELQA6solzAxo33+CvJfT7yQx6X5dcqp/w2jrhhO85ZDvybFJV
         o99wrmMWotODR2ZPDCcYQxs9wZb1Rycnm8Ho8c9RzVKzdWdaPeUX07owOrQ/ru97b2Bt
         s4gdTe+VxTEDF38AApZz0sSVCzkn3If0AEMXo0cmiSAhdWVOEh+H2zF1n7/p+ovLJXru
         BqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgXsNJ6yTuEHhMXAalAoO7UgnT63cOS3gjmexplOgotrhxSNhFVFZt7JBUhNuTN3kHDlK1ZySqjK+TERbwFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj08xczMmOj0ojRe3g3GRKe55FvNke3/5x1zzhOYB1TtBDsWkq
	kz56lku1mB9ZPlf6y+P7F6re3p2jxucgt0x1vsXXKZR5Dyig08pHfx7A
X-Gm-Gg: ASbGnctoxh9sW2+tTTxz2XML+9d11vuJK0fEScAaBKS1beoKtLyEEzJDFi1aPZoZ7EF
	IkxTmjXl8jDI1kyzL74PklO5seUnVqHn8aHZ4cmswQgZV9v18RhEujyKaYaeY6SfPKQLr7OhtFJ
	nFWKiwNJJ7Z9x7JRN8cOUhcD9Zp5Yka0iQhOpI1REfVSB9TAiQNRV9EVHOlqd61OQLyNW1k8V7l
	q2CpsdDSAUJJun5m3azrPOVvhr8UAm5GOygwuVJlLLjaPnQ8UMBraNKkVDGwHn2tWF3lnDZ4lo6
	5ZiPzJRxk/jT4DM/g4T8H30YbBemUORuy4/D2miquoaxuK5WIMSXtELCb+wKuO8lp6RrPmubpNM
	tsBdpuh/sdIzhnxR0QgKUI6QviHBrjSHwnbzWQIuJ0mq0V5h76sYhlAtg9y/KwJlKA5+y3muBcw
	aHpko=
X-Google-Smtp-Source: AGHT+IEkcHgYm3I1MFNRw2OsYxWZ79jw7Dqd1n6B3m6dIb5JmohqIcLJaaJ9AQ+WvnlX2m3w3mdRiA==
X-Received: by 2002:a05:690c:688d:b0:768:70a1:46c2 with SMTP id 00721157ae682-780e15f2ee7mr2747787b3.48.1759851664152;
        Tue, 07 Oct 2025 08:41:04 -0700 (PDT)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81d342basm54065697b3.48.2025.10.07.08.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 08:41:03 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:41:02 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	dakr@kernel.org, Alistair Popple <apopple@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <aOU0joJQZiU61GBB@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury>
 <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>

On Tue, Oct 07, 2025 at 07:36:21PM +0900, Alexandre Courbot wrote:
> Hi Yuri,
> 
> On Tue Oct 7, 2025 at 7:29 AM JST, Yury Norov wrote:
> <snip>
> > Regardless, I don't think that this is the right path to move the
> > bitfields into the core. The natural path for a feature that has
> > been originally developed on driver side is to mature in there and
> > get merged to core libraries after a while. Resctrl from Intel is one
> > recent example.
> >
> > With that said, I'm OK if you move the bitfields as a whole, like you
> > do in v5, and I'm also OK if you split out the part essential for nova
> > and take it into the driver. In that case the bitfields will stay in 
> > drivers and you'll be able to focus on the features that _you_ need,
> > not on generic considerations.
> >
> > I'm not OK to move bitfields in their current (v6) incomplete form in
> > rust/kernel. We still have no solid understanding on the API and
> > implementation that we've been all agreed on.
> 
> Initially the plan was indeed to give this code some more time to mature
> in nova-core before moving it out.
> 
> The reason for the early move is that we have another driver (Tyr) who
> wants to start using the register macro. Without it, they would be left
> with the option of either reinventing the wheel, or poking at registers
> the old-fashioned way, which I think we can agree is not going to be any
> safer than the current macro. :)
> 
> IIUC your remaining concern is with the possible loss of data when
> setting a field that is smaller than its primitive type? That should be
> addressed by [0], but as it introduces a new core feature I expect some
> discussion to take place before it can be merged. In the meantime, it
> would be great if we can make the register macro available.
> 
> Because letting it fully mature within nova-core also has the drawback
> that we might miss the perspective of other potential users, which may
> make us draw ourselves into a corner that will make the macro less
> useful generally speaking. We are at a stage where we can still make
> design changes if needed, but we need to hear from other users, and
> these won't come as long as the macro is in nova-core.

Hi Alexandre,

Thanks for the broader perspective.

So if there's another user for register!(), then yeah - it's worth to
move it out of the nova earlier. It doesn't mean that we need to split
bitfields out of it immediately.
 
> [0] https://lore.kernel.org/rust-for-linux/20251002-bounded_ints-v1-0-dd60f5804ea4@nvidia.com/

This resembles the _BitInt from C23 standard, and it looks quite
reasonable to me. I'll get back to your RFC shortly.

https://en.cppreference.com/w/c/language/arithmetic_types.html

--

I'm glad that we started this discussion. From my point, what happens now
is inventing the whole new language, and basic bit operations is the heart
of it.

I would really like to avoid adopting an API that will frustrate people
for decades after invention. Please read the following rant to taste
exactly what I mean:

https://lore.kernel.org/all/CAHk-=whoOUsqPKb7OQwhQf9H_3=5sXGPJrDbfQfwLB3Bi13tcQ@mail.gmail.com/

Thanks,
Yury
