Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559A524A7D5;
	Wed, 15 Jan 2025 18:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736967200; cv=none; b=uOyWlyY3PAg9uygAqjbkFIYfwWaMsLyf8xqfGEbWW8C6YYLgzED8jyNfn935AEfdS3ka/NgGiSYlsqny885yTUI6hXFgOBtkUJ0EVjzhTE3ojqLDS/x0TOqkteHr1ViViFRNf8HgOIAvK/7mFk3Ghzeva0gm/mIU/T1VkD+ApQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736967200; c=relaxed/simple;
	bh=rnpmFGKwy1JEAJdyKRREr2Lkx9FCNYXNwuJpd0bxkM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVwixsVLIA5WZoD5n8e8dAcanNLFdl6Yy878smHbDgfEReGGYOgGendeW0oqywIJu6Gern8Q8bDpYIMUrNIJS6upjWZBlkJD99tKpf31FvcWwudCqkhNAqt5I7qG020xwb65cL5BEWA97bsqEuEuS74TkcXkbSuU8XBEPB1mG+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWQEpFNm; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWQEpFNm"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so1634176d6.2;
        Wed, 15 Jan 2025 10:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736967198; x=1737571998; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CK8NLy/FIs3dxNk9nw+pqfZZfgHqZ+rsTM+Gr9reXDk=;
        b=iWQEpFNmkvQ974mhvfx63CVKsjrtYAJy4woMjsp6aWW9/nos8iR3sP91v2mC6N4aWk
         uO8EmDyNUgUOXH7WDl4AQ7SmZ3+ox5etLOsdZQuveQ1D9wZN8YH8s9sdf32u9rrv3RtW
         x3kj4qbBNL2FQe/rm+3P3W6NjUIkzNairJK/1mikt73uwTD3LRixbNsYwX2BpOuLgNjo
         OlTjT8YVcDJc07CrnaqIf8bYY8HzycTB7634OgEMwjtdjZsAZzkNAOSHUmCRwxL8RqO9
         TxGpXe5J6lPnikHavYejdcjy1wewVhwp9hTuUtphm/5FAK8xasq/Pfja/DdunHqCiYoM
         S0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736967198; x=1737571998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CK8NLy/FIs3dxNk9nw+pqfZZfgHqZ+rsTM+Gr9reXDk=;
        b=VDvQNyO6CZDkUFDovYGnZEk7zNEpEe70Gfr50dER/3rQ2G+MQpKeGXU+h2cd0RjANi
         B+az8WFqq4N25bMJqUftauAAsUs3ZZkx/VtOTTvN/KMHiUMgS4VMU3Hiv/j7r20/0TS8
         WUfzMVS+Mm2Lfu+gOF3BdiZqQ8xWgvW6KeuLv4X0xvwcd7GesEh1migoi1qQDQcyTfF+
         GuFXZ+S9QQ71Is8V+djwmEk+j9pcNVUPMa3Bfn+dMbbBMGFLDa5X8YJeskFqHR+OrY4Y
         HmI60/P67i6v5PA1Si+I7F6gS4gOLJp1T7Y+ntinZUnaQI7R/yX+aHafbCXB4I7Kchej
         e5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU0tP0iPNWy4a8ZUBbR4jYJD5yLKytRYB7Os1uJeUI5icnlxnPoUEaYrg78lP/KoshzaBSS+zWdGKhUc/UfbkU=@vger.kernel.org, AJvYcCUck9njKDnJn38tAqr8l6wUYEGXaswvrrbEWJBhf9D+/pNkyGTSRulu3afGX6RF5TeCvbKKgrZ6gQ+MU0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhzRs43O7DzPEXxYJmBCxkDIJ/cZ35t1241IrbhOOLRfJCItx
	kV85by4vFuol4NtXS5P1JCnuflbvq9Aedu40kIusl6wH5QOmcRl4
X-Gm-Gg: ASbGncsOoVJTAz9PHvt980HCOzRxVwIE1NCyLUfoyiYGGsQOW4j5n5PG+h8ky8w7ZQk
	f5urkWqExrHqWf4L/24xsiNlx+N/rl1Ayqjy4cgFTrLBrdXxwi7ZYIKjuctKveePgujB0fADhwm
	cvF0ZRjep/idfx5LHXhuVxtgmCy38V1pDk2bzYy+TVhK/kc1ByWx0SQDdPTl1spJ+RForZlWCnY
	77gGf/YzCQkqSmi7fqBdZ6jprT3DRjucJLGQ6zohdF6elsVN8VCj84DfgYvpr3xBQ732TNkGN63
	IYtXEf0pILxY/RaQ4iAq3CqSk9T7Bx83sViVRFPx76NGkh0=
X-Google-Smtp-Source: AGHT+IHqFfoW5jeKEXGk4zIT6DaqgIftIUjaK0OrSCR+1DiNjT7OFIbfxpnq7WhaapiJGSU55vs5OA==
X-Received: by 2002:a05:6214:4506:b0:6d8:8874:2126 with SMTP id 6a1803df08f44-6df9b1da0dcmr421622206d6.11.1736967198143;
        Wed, 15 Jan 2025 10:53:18 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade72b59sm67403166d6.87.2025.01.15.10.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:53:17 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 70239120006A;
	Wed, 15 Jan 2025 13:53:16 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jan 2025 13:53:16 -0500
X-ME-Sender: <xms:HASIZ32ChzJMBVc-96lmgcC2-ZX6Wd0H2thdUaXmcWOxf1B9zR4iaw>
    <xme:HASIZ2H5IDym4JQnHN5sOcu6Ee7w0LjmgT4zy9pXc6RmXdi48SumVJy2l_Egw6Z7B
    o7St_amPDkWepDtEg>
X-ME-Received: <xmr:HASIZ36s4zRQkY4gQsB6spvU1vLYpUaepv_XznPHKhFNf1KUfMgir9X6Ip0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnheptedvkefgieejgfegudeludejleektedtjeei
    udelffelhfdugfffffeljeeukeeknecuffhomhgrihhnpehpthhrrdgrshenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghs
    mhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhe
    dvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdp
    nhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgrg
    hrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohho
    ghhlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghj
    ohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnoh
    drlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhg
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvug
    hupdhrtghpthhtohepfigrlhhmvghiuggrsehmihgtrhhoshhofhhtrdgtohhm
X-ME-Proxy: <xmx:HASIZ80R9Z6TwJVo0Ekfmq2QXAMiYXzEADHfQjELD1cH7OdTWyGWKQ>
    <xmx:HASIZ6GGlkcCDIxs_Uga5RqRdTru2xZfWVSnUrOMYrjojN23_EB92w>
    <xmx:HASIZ9-UXvOP5Qm3WHW72xiG20FXRs1gHAcWVkVeJtUAOCHhgtKK3A>
    <xmx:HASIZ3lON6tOAtkxUgccZobYmiDAYi7N8nHtMV1TFkoRvR6eEyfoSg>
    <xmx:HASIZ2HsSeVfhnveVg_FPl2HOu2DmBeIEJL7_MJiC0bQbUtTdxZO2suL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 13:53:15 -0500 (EST)
Date: Wed, 15 Jan 2025 10:53:14 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Alex Mantel <alexmantel93@mailbox.org>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rust: convert `Arc` to use `Refcount`
Message-ID: <Z4gEGjiloy-fNkDf@tardis.local>
References: <20241221183024.3929500-1-gary@garyguo.net>
 <20241221183024.3929500-3-gary@garyguo.net>
 <CAH5fLgjOfw2otu4FJ1XHhjsSx3Fj3iQA25Hh-Anz5jXaLamrAQ@mail.gmail.com>
 <20250115123234.6d3bba78.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250115123234.6d3bba78.gary@garyguo.net>

On Wed, Jan 15, 2025 at 12:32:34PM +0000, Gary Guo wrote:
> On Tue, 14 Jan 2025 11:02:25 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Sat, Dec 21, 2024 at 7:31 PM Gary Guo <gary@garyguo.net> wrote:
> > >
> > > With `Refcount` type created, `Arc` can use `Refcount` instead of
> > > calling into FFI directly.
> > >
> > > Signed-off-by: Gary Guo <gary@garyguo.net>  
> > 
> > [...]
> > 
> > > -    pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
> > > +    pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
> > >          // We will manually manage the refcount in this method, so we disable the destructor.
> > > -        let me = ManuallyDrop::new(self);
> > > +        let this = ManuallyDrop::new(this);
> > >          // SAFETY: We own a refcount, so the pointer is still valid.
> > > -        let refcount = unsafe { me.ptr.as_ref() }.refcount.get();
> > > +        let refcount = unsafe { &this.ptr.as_ref().refcount };
> > >
> > > -        // If the refcount reaches a non-zero value, then we have destroyed this `Arc` and will
> > > -        // return without further touching the `Arc`. If the refcount reaches zero, then there are
> > > -        // no other arcs, and we can create a `UniqueArc`.
> > > -        //
> > > -        // SAFETY: We own a refcount, so the pointer is not dangling.
> > > -        let is_zero = unsafe { bindings::refcount_dec_and_test(refcount) };
> > > +        if !refcount.dec_not_one() {  
> > 
> > This is wrong. The into_unique_or_drop function must establish an
> > acqrel ordering when a UniqueArc is created, but dec_not_one() does
> > not do so. You need to use refcount_dec_and_test() instead.
> > 
> > Alice
> 
> Ah, good catch. In this case I think an acquire fence in the unique

Note that we don't have an acquire fence in LKMM, so you may need to use
a smp_mb() here.

> path would be sufficient? Or would you prefer to use `dec_and_test` and
> `set`?
> 

using `dec_and_test()` + `set` should be cheaper than dec_not_one() +
smp_mb().

Regards,
Boqun

> Best,
> Gary
