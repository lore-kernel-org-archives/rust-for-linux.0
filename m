Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A852B14A60C
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 20:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003645; cv=none; b=AiavJscDL0+P4HT298jRtinBRalap3VXheIKcX6xJLRojQxkAg7hkuLX7y/VNpg9kIvzWDm7qHXDSYMY+ugIvBN/o40KTFENp2tLA6ZCL5DQ1/o/JUtSkCm0XZoxz1mGO60Lz2+viYAWO9RydLtVTVJiCKVStr7aQkQxgBHwLsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003645; c=relaxed/simple;
	bh=DsRGi/hSp8EK7EDmytbt+x7nTTpcnFVzpygXVzk2yGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Erh9fcpLhwhWmlQYMKEG1+tb55V659RpX0jdp1xYd3jMaiKyq/mpjROtpzpXa4ExHEqc+MMNrGSltWzlKr2iPtopW+Uh4JRFTqLH0db+pcWnzWu8yDGhnRyaDvZE/lzgZhmXlY3pnmpWmzcoAAdNibPGx8XTZzMib06rZ8yK7XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6hqdSvl; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6hqdSvl"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee1a3ef624so36303521cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 12:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766003642; x=1766608442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7QehkS426jgCW/qanvHWT74kZfdlsBIw6TFN+NiIlc=;
        b=J6hqdSvlpazaP/W2ae13lw9E/KSsnUz3QZMCP68bq77Q7JM/dCWjLB+ZNEwBejdsN/
         OosOZ2a11yx85tiMtU2igDICv3C1iuFl+3CXnFWZ0B3qUBw1g4FrlhvupGvTzahJdSSP
         bFIXKtO6wNAax8LsfY2XlBe0Qrlo0twvlkhcvlJZ2Lo8AiMY2reRnBZTHepd+vOKPOzS
         3/p5NNT+5YPYdRygjWAmxxGZqu4nQI6q+BYpzvh3GMdc65Q+y4F80rgGsAH5M9lAHVqK
         kg87n3bQN8nvUrBe4kHHlLbrYmcNRc8ERJe6dEHlTfxbvodkjxSXTqGnSShzyYCz28rj
         C29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003642; x=1766608442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m7QehkS426jgCW/qanvHWT74kZfdlsBIw6TFN+NiIlc=;
        b=SAM1ybqn0tPRxTSZ8PH9rCyA9NUFccX5RvB1nduRURSXnQCDDD/Xgq1LEUMyzCedy+
         X9jP60TUE2tqUBvM0gB2WOeKxQJ7UomMesgRUoEgyVoJY09w18I2IRpoxh5rBMHW7TF8
         AwnArWzrwAxM+qt00oPmAIotjCRAc+EWuI60tHT2UYxQj3gPYXyW1j4WofW9IyqU1DI5
         +abhUW6xY6llWIL5pNJ6fhqmDClSXoD1Y2lOVFCcDyk0CNPsDkrr9r2k/kfjvwQEVKo7
         XNr8qRDJL93nc5tgxyeLIbKuMRA2vojaMz+UR32UOanSJrCGrtpWVlBAjF85dmtwYkrc
         OStg==
X-Forwarded-Encrypted: i=1; AJvYcCXcinbT/rDBJQRp86z0nahtXZdAfCVjXe2uBkR0LJZm1MJFtVYQMeThJZpVF5C4Bvej7jVbAmIvAP23Hzmitw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO7TioJk2nJYj6RSpFcJKr6YZg+e73aS9yU6QXpNNWGKQLUrpv
	WfONlUh+T1mxlbQETLrIoTbFBFHzR2PhFSmWEzesLBhwICxhiEFe/myI
X-Gm-Gg: AY/fxX5JoewQlF0dgqRwzcbULOepSvnsR3hJjn33+Baz6yFn69ZJTvXZyyVu7HbUWOM
	4XwGh0uCTX4W8pJZGtmks6wdJcd4DP4Z2RrIkJUoa/IZhrUQDIFYwJcb7FJRk/JNqYxbpNlqwG7
	Kbz953m+3eZ67Wfb6tivUEbnl3eMLW8AksXJjTIuThHUA/+PzMl/JPEjeTq5kjyB8o1hMw/71wO
	7afHT4zywTTzn649BrFy7s5AqJ0QUZuPfm9zl+g6Pq4OCuu5jj+SUgDR+zEq0NB0JhvKhYj8crU
	KDkMKEkeRMloTOsxBDNmtIRWRlrMhN6qIqmYu7zaCT3yxjzwC1EWU8fGUXJibDawgZwDaDIIUhr
	0RCbzhPS52frmD8LIZ+DN2dcxxZGpinSKgebeY5zZACOVzjpwGHLakvMN59CLyW0QTECSxQdW51
	qq+2WbdLeLp2MNBo8vzRdgqzZU3EOgF2Ugh88oJDPcrzBFbvqw/rE9TAhR9gpOWCykoTCEeMpdx
	n6kgzQESeKB0r4=
X-Google-Smtp-Source: AGHT+IFp8jshm5pfP8IDvuoU+SXpztplps4FbwbrmSw+vNnQt6JX7Mrm5IBZ7Fku/nIhWQk7oVR5mQ==
X-Received: by 2002:a05:622a:550f:b0:4f0:441:96be with SMTP id d75a77b69052e-4f1d05deeaemr251756561cf.51.1766003642503;
        Wed, 17 Dec 2025 12:34:02 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f35fd60ed1sm1792781cf.22.2025.12.17.12.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:34:01 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4C5B8F40069;
	Wed, 17 Dec 2025 15:34:01 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 17 Dec 2025 15:34:01 -0500
X-ME-Sender: <xms:uRNDaXp3EECddlitN_kU0DRFYX3Ebc_gHUNjtYmDvNcSlljjimrTZw>
    <xme:uRNDaQBlRVba9jRhqu5-YDdpPzLK-o6sHU3c9A6mCj4UaEQMml3GsCAtHJhutBc5d
    tnX7Ud4CadKHBy8IK3LqAoStDeHqDY1Yy-UxU581E0MXMTpOMlIiik>
X-ME-Received: <xmr:uRNDaQO6tavsCw-6LmAKW0at3KR92MMyr64kgjuoVUw3OIE7EOulzW92Qg6d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegfeehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepteffiedtiefhleetleeileehfeetudetteduheeijefggfdvhfduueevfeejffeg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprghtohhmihgtrdhrshenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghs
    mhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhe
    dvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdp
    nhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguih
    hrkhdrsggvhhhmvgesghhmrghilhdrtghomhdprhgtphhtthhopehlhihuuggvsehrvggu
    hhgrthdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrd
    guvgdprhgtphhtthhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdr
    tghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehg
    rghrhihguhhordhnvght
X-ME-Proxy: <xmx:uRNDaeB7njYGf2myzWkmV-gKlxhZuJu1-W9qNQFLrzabTV5UyianLw>
    <xmx:uRNDae8fECERdqXHkI0DiFYkpDKaw29aifMQXkJ6-sjUHqJthh1pmA>
    <xmx:uRNDafEG8QztfsPN1en00Ec2-OT6vyM1poPmBW1ggxIEFrr5uaRJLQ>
    <xmx:uRNDaVKIwvEvn_Ay5YZfPjF6RstAiwBTqWHCU46BpMs3_WDDvuaMag>
    <xmx:uRNDaSdotxs23xDnFIUyEPh0xU78C06onpmlRAaagbwlsd5hz6bAxDd5>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Dec 2025 15:34:00 -0500 (EST)
Date: Thu, 18 Dec 2025 05:33:58 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v16 12/17] rust: sync: lock/global: Rename B to G in
 trait bounds
Message-ID: <aUMTtmxJTQDkpgeL@tardis-2.local>
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-13-lyude@redhat.com>
 <08d00540-9de9-43a5-9e36-df2d575b4c24@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08d00540-9de9-43a5-9e36-df2d575b4c24@gmail.com>

On Tue, Dec 16, 2025 at 05:15:18PM +0100, Dirk Behme wrote:
> On 15.12.25 18:57, Lyude Paul wrote:
> > Due to the introduction of Backend::BackendInContext, if we want to be able
> > support Lock types with a Context we need to be able to handle the fact
> > that the Backend for a returned Guard may not exactly match the Backend for
> > the lock. Before we add this though, rename B to G in all of our trait
> > bounds to make sure things don't become more difficult to understand once
> > we add a Backend bound.
> > 
> > There should be no functional changes in this patch.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  rust/kernel/sync/atomic.rs      |  2 +-
> >  rust/kernel/sync/lock/global.rs | 58 ++++++++++++++++-----------------
> >  2 files changed, 30 insertions(+), 30 deletions(-)
> > 
> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> > index 3afc376be42d9..c07a53f8360b4 100644
> > --- a/rust/kernel/sync/atomic.rs
> > +++ b/rust/kernel/sync/atomic.rs
> > @@ -21,8 +21,8 @@
> >  mod predefine;
> >  
> >  pub use internal::AtomicImpl;
> > -pub use ordering::{Acquire, Full, Relaxed, Release};
> >  pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
> > +pub use ordering::{Acquire, Full, Relaxed, Release};
> 
> Just fyi, there is a (trivial) conflict of this with Miguel's recently
> merged
> 

I think what Lyude has here is probably automatically added by rustfmt,
rebasing on v6.19-rc1 should avoid this.

Regards,
Boqun

> commit 309e49039f124a ("rust: sync: atomic: separate import "blocks"")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/rust/kernel/sync/atomic.rs?id=309e49039f124a9dcb99c05651af8eb8fa05bc29
> 
> If I haven't missed anything this is just to fix the alphabetical
> order? So maybe this should go as an independent patch like Miguel's one?
> 
> Dirk
