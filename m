Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DF67A13A
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 02:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768791419; cv=none; b=g5WzTzbib36xuYn6Bg87OrRSRng0ijSnkjnXPeev4QJRJC8QoiXuXFTsACa0AArwrfvFCVSYnMYjoVR14dijAhfU/trZ2ebhZwplcoEeFEd6Rked4wKQ0s3y7BzdXi4GG82OqiALo92aorb2Z/qB+G6kLE3Ar9eyuDbGiAsQMBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768791419; c=relaxed/simple;
	bh=7ieh8bpu/47zcDqVpa34kh7zmCuxOI0aSkL/DkYVjeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ni8uyqHYVtc0oc/m1j7pmzFmiabhSnHxqmz4GsHbSUafXXq5Ws2cclXGM253ff97Egkq7YppcGg85qJzu3H6UaQRen0+WNqAobY1jLymkA26MjXI2+ueICc1Md3603vnAEVZ6gk+oyLG5WjnDHfi0L4nxWFvLlhb+bDIRQ5x3qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvM4wGGV; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvM4wGGV"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12336c0a8b6so8416807c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 18:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768791417; x=1769396217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fakORZHhU3LeknzGhGkh3JKvyYcqGqj2ajx5hHN4E8Q=;
        b=gvM4wGGVjqVblDQ2rlbaR6HzzoBszDBevgJij4UAmB9+uScdbn7W2pqHF7kA2HpDVK
         A81aktoFcCInr9SfdguOeficyQg31XKZ4HZW8p3YX3p6+zhe9nrCpiCqvzXQf4jjwhtd
         QIKAS7tF/1U4aHUL583kLJDjfQqZ3MUwZawqT128bn4cN8bPEe4dHwzzNXIMKcwiGZZI
         smoLWqzR4VT0iy+X3z9/3dJ9F9NNdrsBEU8CHAp8At6A3IVGLl6kz8A4Zu5gU1F9dJ4W
         j8rxYMYi0GMyYUgybzSB9zzQDU2zpuwCgvaPPtHBnIf1jsCZ6iO8fv1gN7amhtsC40Y3
         PORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768791417; x=1769396217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fakORZHhU3LeknzGhGkh3JKvyYcqGqj2ajx5hHN4E8Q=;
        b=er0S/8KTFuKYjK7dJWPmgS1halavGw4w2BYy1v9VAnrH5gRRTp3r92+AT5pjwy1F79
         Bk+MerhFcG1PUcDdgOhzNB5GSrFbs0u3ythfbCpPnxLMctJJs67CargE8L1XbhClJWzq
         YF25EfgIOjPo634LCXsF14iRKPSPQxshNk/4GsP8BhHQzKaJP5wZ8JH1QIdMB/Un9dUX
         6P190gNi13bSr6sxEpWwL5gtXxqSHn8Bglf9z3/JBG1MP9TVuUT2Un1QMUtMtmS+9b81
         o72kAtSpb0TWCMZ8+cszATWow3K1ae+T/1ABwBXHuUsi73JeIlc6VLfQFYxb1F0IbC1j
         AR8Q==
X-Gm-Message-State: AOJu0YzE19eM6DL3+O9GT+crnlC5uw9D4esrpKh0HMvfUV+1DpY00Ujl
	7IqhbTEqErTxnS+JMJtG/A6UCotWaLel+eGB0enHw9J30rjv5doSG1XBVc7JlW69
X-Gm-Gg: AY/fxX5EPv2FLMGbiXGsd5oX7Hsj3K2tE8aoCxqOsB768b0ofQsrwdpO2v1FSZdoMz8
	dUNELGY+XHzEk+6cP5BA8NORBiynoT61L8HJ6emalEZ/o30jo/TR47dWJZsAxvpT9xJz49BdK5g
	2KP9C9qsFPioGBtDhmx4J7Fgp4YORlO1zv5nRXkcFIJWXpPYiJPHmOYWaM7zJrNVw/lzYvZrAYl
	3lexwyzGKDruCe+9Li5VYGae44e0cvre0eoY8DjBh0C0btumoNwFiSUVOcKeXG8qqQlALf/TW8Z
	k1h47bY2Rjrmif1oBzaA26e1MX/nMiZxGh6Pa3fU8ryBp34bnLfSDinyUSzznzIXAgYgKfRHP7h
	9/X1QMdUvl+0bkFVgGTnIsEp7u+yH2XazRqW+w3fszoWrd/Vuw4KE3B6ZA8tsTZ0VsBpPA1YUP1
	JeG6ggSTbArMGTB+DPgdY+2CKhxhrWo4fJVYGtpLIArGeiGd4jIH1gS7PDD4KD5yUQAdsQEPNh0
	MUt0aqdPlZ+WBc6nCELptsp0w==
X-Received: by 2002:a05:620a:45ab:b0:8c3:87eb:f with SMTP id af79cd13be357-8c6a676dd5amr1306466485a.53.1768784635960;
        Sun, 18 Jan 2026 17:03:55 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72985a8sm693681085a.54.2026.01.18.17.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 17:03:55 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D45BCF40071;
	Sun, 18 Jan 2026 20:03:54 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 18 Jan 2026 20:03:54 -0500
X-ME-Sender: <xms:-oJtae_2LWg9BXW9ZSw9oURJdYOziSn_fFRlbzJiPDr9o8e3XnMGVA>
    <xme:-oJtacIjm-BjxKHSekluSgTHtvg-oW4gE2jtJLDnACDTJZglzS90jHoDE4HYGYP6B
    p8NcGtG-g3zOuf7KvwK4f25Bz1_UO2Vt0gd8UmsQLTk9I3cfyRK7g>
X-ME-Received: <xmr:-oJtaT9BV1WGQLx-cxULml31pE2GyW-I7kXgYoExwyhGysVXHsj4k9VD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeeivddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvdejpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopeguihhrkhdrsggvhhhmvgesghhmrghilhdrtghomhdprhgtphhtthhopehruh
    hsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpd
    hrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnug
    gsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-oJtaYH6He1PzPkL3M28LoSg-zlXbIctO9_n70CJ1d0RAKSX2gLBzA>
    <xmx:-oJtaTPng9w2VrRzYJtXT-gluuZx33z5t4xoyAfil2-OXIxdnd-wSA>
    <xmx:-oJtaXR0Q7SzfP8yxgG-mGy4kl5BzerW16D7vVKu0GY7CksfMt9zkA>
    <xmx:-oJtaaQ2GpheT3l-2fELAwR6kwSHCsXGjr-6cxYLZQSdFwG7aQkUOA>
    <xmx:-oJtaRb7fysrKnC_zWxrewj5MoO6wd0t6p2o80Deq31Qlf62JcSjFhRC>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Jan 2026 20:03:54 -0500 (EST)
Date: Mon, 19 Jan 2026 09:03:52 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 5/5] rust: sync: rcu: Add RCU protected pointer
Message-ID: <aW2C-A5a7gfNENcb@tardis-2.local>
References: <20260117122243.24404-1-boqun.feng@gmail.com>
 <20260117122243.24404-6-boqun.feng@gmail.com>
 <56d1cc0e-df60-4e2b-bfa9-b29ec48a76b6@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56d1cc0e-df60-4e2b-bfa9-b29ec48a76b6@gmail.com>

On Sun, Jan 18, 2026 at 09:28:35AM +0100, Dirk Behme wrote:
[...]
> > +    /// ```
> > +    pub fn dereference<'rcu>(&self, _rcu_guard: &'rcu Guard) -> Option<P::Borrowed<'rcu>> {
> > +        // Ordering: Address dependency pairs with the `store(Release)` in copy_update().
> > +        let ptr = self.as_atomic().load(Relaxed);
> > +
> > +        if !ptr.is_null() {
> > +            // SAFETY:
> 
> 
> Would it be an option to take an early return here and with this drop
> one indentation level of the larger `SAFETY` comment?
> 
> if ptr.is_null() {
>    return None;
> }
> 
> // SAFETY:
> ...
> Some(unsafe { P::borrow(ptr) })
> 
> Same for `Drop for Rcu<P>` below.
> 
> 

Make sense.

> > +            // - Since `ptr` is not null, so it has to be a return value of `P::into_foreign()`.
> > +            // - The returned `Borrowed<'rcu>` cannot outlive the RCU Guar, this guarantees the
> 
> Guar -> Guard
> 

Fixed! Thank you!

Regards,
Boqun
