Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7884329BD8C
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 21:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766005843; cv=none; b=RpoJFHQZOjWi4DCQP0W3nV2rZc7LZm0tYEaDfzRx6HBFcXGLkYJhvyGHhDfRNvWx/nKLbxtFiKX6NUvTk+mfkECSWCAIKZxKxo+RSwvNtxAr7KyuHced4gUVc7rMBk0oax9qftWjHTXVWQ66fOeXZ0bTW3dbVVM++PRFwgim1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766005843; c=relaxed/simple;
	bh=VFBV/rg9PVwTRNSEXUZGi0Njes5qJOlCaVphTklPutM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiSJP2qwPAA6eaEz7jgU0BaWQlNq6fMR0y5c/bxLxjkM81/ZgjmM4RJJ9V5aLQatXcLi0RL/gPKIs4HbTL3C7jIQQIYDe3+3z/MgxX1RseiOpJ0jtLLkK477B2U66Jgbr6kFQjVCEtiNHRmMKWoO9BIzmOwA55QJ8f8qE3JBHEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvF2W4ow; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvF2W4ow"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a26ce6619so50447876d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766005840; x=1766610640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqkQok8yxRnD46LdCk1AOjbaX231J9uuxpT0445SX0o=;
        b=FvF2W4owm80mwQT6XmqT5Wo90Vp/kCKe5zYAIL22/3huU2VCZaK4FdS8jeB9jbUPKf
         Njao8ZlVVtEaL41OgGQRFy/SnHkiQrCk6sJJZ9Y1E/DgqjPh7opZw/ablituGe22XQMV
         cvByCmLwZ2t87zSomzAmNdcAzRcTGWARenzfF0s5hyCzQFct35qHfWA6R1GOrbCYANFg
         iVjlBlkQGpgrpPm2AyTvv1sEeqGxuGJ5zryibpDkShDcSqI38HIYEPO46RfEZGU/1m4z
         LgiecoOqVF1VsFWB2OOmfYJAu9jge+0ybSCwAULDrwiGtdHXse6Mb2H5ux+FjZdJADj5
         Eciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766005840; x=1766610640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZqkQok8yxRnD46LdCk1AOjbaX231J9uuxpT0445SX0o=;
        b=B1kNJC92GnxMFgTl/sl36qzSfjKZyoVc4Hhb2BI133pRa1sKPMj5rtAG0auqj/6tZ2
         1BBrUE4ASC28v7RDS73jRPuhoH7KfNKd/jCvUdoFisiTo4q4NX2UiioZGZ2rWrfojZxV
         +auY7ZW6pG64CyJN5Dt9Yd8nvSIN+HzsafypAIcSTokQ5xS4gA3WXZfbvJVncijECSRl
         LBnR1IGGPMkDcgIZrXwKIsqnjcdOMWU1CoQfNp3gWQ99NHgUTkrtuGlFObD30LrMaXnp
         ogyryJWLq9AGd4vmFZBupQFG6SqR323085e8uWJRwGHb3u6q+3GzWd+QpTwqxMdwVl8m
         RPUw==
X-Forwarded-Encrypted: i=1; AJvYcCWRMR+B7sTlHXZAAUvu5IAwEnYRDGjP6hR3tr5QeAcLkRt0fdZaPEtcrh9zEkRD0FlJD2dGFfgHo29nZ6UtvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+4BDDUs74SsxU8KGzceaklIHjGdNhBy1uOXKEpNhbqQVAsKNM
	9dOX4CY+323+xHDGlZ8pzVJvCMzc8LcqYD1xWU+h+TVXYfxyDy+cN8EW
X-Gm-Gg: AY/fxX4bH5aphYlpxliZKyia5yHk3QDmhwuoUeYr30zFnZKlpchRDLKwscNM9tohLxm
	8Zgsc+JJNXWbkmdQ+0LIrFVAyxALU3EW7lSI+XvlHkNBiKMBSIDWAv3rjRxSNgF+EoG4ChWYrmH
	6lapwHXPHhzsJaSJTubUxuNYsceBHu/miU+rAxzAydNc5TnZJy27F/tWyMtBNyv8BYVsUxlamCX
	F5Tx6xFnX+xsPbaVoaiNxz6qO7aqpNwr0KkJn9hRt2/7eOZO45/2C5Mv/1y+O1jR0HkdBwEeGBb
	x9JuVj5f4VvWAokUDbZM3i/hZHROjVTZVMabAc5+8WsTWRSB0SucapY0g8OsvJZI600L6xMb/NC
	J+gV4A/ltR781P509ItbkmEWaDvUE5+B2gF2k5BzrdxK9kr3AmwR4zVlYHAEduslQAP+0pqkrIS
	SeE8SbPhyT0+iBwNzeuk/KTRAEZnC5xD+KbmerM9VIknR2QUXkytbR5QtaHJvAF6SduMorXkQIH
	Y4z3zbrTu0AhIY=
X-Google-Smtp-Source: AGHT+IGTqu67eIN1HJ8fHgXL55eR98piZOC+EJF0m7vgZSBOe3HdVB8AgEFQeSsbCz1VVB23W9MVhQ==
X-Received: by 2002:a05:622a:258d:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4f1d065c7ffmr267689401cf.76.1766005840311;
        Wed, 17 Dec 2025 13:10:40 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f35fc764fbsm2636861cf.5.2025.12.17.13.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 13:10:39 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7DC96F4006A;
	Wed, 17 Dec 2025 16:10:39 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 17 Dec 2025 16:10:39 -0500
X-ME-Sender: <xms:TxxDaXogrQuGCjQZQehS2Le6PmO1MkRkVTUYZMyOlHwjCsTUIXBa0g>
    <xme:TxxDaZ2AzgLqkbJw0N37_R5QzELk_usTxnJBOL2eXnhCFAYmnwIHkYa4__p1jthS-
    2x82-CkzXhEyFX84bB0psLTf1OLIuXzow__X7VHsW5XdtaVDg5eJA>
X-ME-Received: <xmr:TxxDafySsPmr_3Z-01AVN8Z3pDPi0q0PHE-KH9pyyD6PfFDIV9ivEH2FJBLZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegfeeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    uddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghr
    hiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhoth
    honhhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrh
    hoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:TxxDaViDBV9TU4uDqlIREPON76qccU0byrcu1MbmZAwYsCCrLisrGA>
    <xmx:TxxDaSpAyMXH7CZzAMsvRUGwlwvONzHdH3IMPoeSkYSv2-KNfCOINw>
    <xmx:TxxDacjghanrLb7AcDSWXJKmCgkKdUW_UcQYe4Ck04Hy3oZrofJuuw>
    <xmx:TxxDaUOAH-5eGuJSVcWyZzv7rWLkSdviJeDgQjhzxEokPCgNP0h6aQ>
    <xmx:TxxDaWw5m8W3vdnIJotUTpN--Cha4WWBe_Ull6kc5LucGNRv4KszYMDP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Dec 2025 16:10:38 -0500 (EST)
Date: Thu, 18 Dec 2025 06:10:37 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org,
	a.hindborg@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
	dakr@kernel.org, lossin@kernel.org, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: set_once: Implement Send and Sync
Message-ID: <aUMcTWJ7ag5VJxnq@tardis-2.local>
References: <20251216000901.221375-1-fujita.tomonori@gmail.com>
 <aUMWb2VvA48s0jur@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUMWb2VvA48s0jur@google.com>

On Wed, Dec 17, 2025 at 08:45:35PM +0000, Alice Ryhl wrote:
> On Tue, Dec 16, 2025 at 09:09:01AM +0900, FUJITA Tomonori wrote:
> > Implement Send and Sync for SetOnce<T> to allow it to be used across
> > thread boundaries.
> > 
> > Send: SetOnce<T> can be transferred across threads when T: Send, as
> > the contained value is also transferred and will be dropped on the
> > destination thread.
> > 
> > Sync: SetOnce<T> can be shared across threads when T: Sync, as
> > as_ref() provides shared references &T and atomic operations ensure
> > proper synchronization. Since the inner T may be dropped on any
> > thread, we also require T: Send.
> > 
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > ---
> > v2:
> >   - update the `Sync` impl to require `T: Send + Sync` with the comment adjusted
> > v1: https://lore.kernel.org/rust-for-linux/20251211230919.1303926-2-fujita.tomonori@gmail.com/
> > 
> >  rust/kernel/sync/set_once.rs | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
> > index bdba601807d8..139cef05e935 100644
> > --- a/rust/kernel/sync/set_once.rs
> > +++ b/rust/kernel/sync/set_once.rs
> > @@ -123,3 +123,11 @@ fn drop(&mut self) {
> >          }
> >      }
> >  }
> > +
> > +// SAFETY: `SetOnce` can be transferred across thread boundaries iff the data it contains can.
> > +unsafe impl<T: Send> Send for SetOnce<T> {}
> > +
> > +// SAFETY: `SetOnce` synchronises access to the inner value via atomic operations,
> > +// so shared references are safe when `T: Sync`. Since the inner `T` may be dropped
> > +// on any thread, we also require `T: Send`.
> > +unsafe impl<T: Send + Sync> Sync for SetOnce<T> {}
> 
> The reason you need Sync is because &SetOnce<T> allows you to access &T.
> It's not because atomic operations are used.
> 

I think the point here is that atomic operations contribute to the
safety of sharing &SetOnce<T> between threads, if the synchronization
part of SetOnce is not done via atomics (or any other synchronization),
then SetOnce is not Sync. In other words, making `SetOnce<T>: Sync`
requires all the following:

* The internal operation is proper synchronized
* T is Sync because a `&T` can be derived from `&SetOnce<T>`
* T is Send because copy() may create a `T` on another thread.

(hmm... the third condition does looks weird to me, because if `T` is
`Sync` and `Copy`, the copy on `T` should guarante the drop of the
copied `T` is safe, otherwise `T` itself is not `Sync`. Gary, do you
have an example in mind that requires `T` being `Send` for `SetOnce<T>`
being `Sync`?)

Regards,
Boqun

> Alice
