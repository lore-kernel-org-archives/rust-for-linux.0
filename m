Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F04351C27
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Mar 2026 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773484216; cv=none; b=tWnxxP54EHWI9qFum27RnusJoZl+mBpOb6f2HrLuUAdfLrr8nGzqAvZq+1dL4xkfqtzvoZKneJ6LFotKWGy9tysZ2oykSqRpLawq+48DC5hIXKEVzmNnJNiBlUum826CaIFS0V2NBEDCFGOO3nOJ7AQizhr2pp3gCkZsuv9uNzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773484216; c=relaxed/simple;
	bh=8DtpPy2fbrgtP41hYwzlKoJDUNpXQ3ebnMBUKZf7vCc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=plDO4ZMOzeaeVusXyhedL+yFIdnVTPRK4zyBiOFd5ishHejzHk/CQBikw/0v65d7fV10iJYCGHr29vq8Xw+YI5Uwx0nxm4QN/e4KrSmxnz09KNXguTEr2lDZtTVTfo8bBaRE3LTWoqkN398OdEvofev4dKvjhuIZwoOARglsFjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JzsqZi6c; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JzsqZi6c"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so22989825e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Mar 2026 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773484213; x=1774089013; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+aMSG1gcK9FHZhc0qN6MOUQSRC1xXIxb6LZWIpdkT2o=;
        b=JzsqZi6cdoLs7qcbYMgR0Yk5pGx1JKCqYJAtc7P/MRtNWG1J0jAUQ/D7qgSQY7ZVnt
         I33wNflfO6U6Akz0k85S+QY0ObT6GsPpVWf7PfSmEBV83m+l7VKndJOhXMHJihc3lMCw
         kOPK3wu2auABM3QtBY2Hd1PnEJEigpOWGCKTUCpaw4/IhVme8nLgGD+TJyyfXr4S5uGg
         9Ab6HaI3T3ml+xfEasHHv8A/sKlsNnVK5310kDhRV1iSLhw68CtyNCLtInaqqw6OnvBp
         dMSCxXrjkbLFO78kzAnQtRq8lKZJIICQqsVksQP4BU/arHMWqZ29lj2vS9qjtSkpEIq1
         2vSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773484213; x=1774089013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+aMSG1gcK9FHZhc0qN6MOUQSRC1xXIxb6LZWIpdkT2o=;
        b=l0HakmyR2OL1AJVoA2jVY2P+PYNVdwxhLkdr1ezMOWjmTOph/zSyDcHilZ/Av1HZ9s
         QdaMKf1+KwpC41jApcNB2HRTmfmLquLbnginYH87UIbuvazOER9UE+sirYKypyK9ckzV
         VzHr5JOPB2nh0W/r42Iy7bFYPlsnnwm+s7nGD0pWMSQkdaYhId/YvLxQo6mpsPVcJzxv
         qNctWk7htpqJSUd/JUO5w99ULSbpcgwV4NGLTWAy/C9jlFOXcW6oqPbNKa2o62pyJiIa
         5fUvI0nOG61xMknKrHHxoc+M+qBttLXwVnX3ULBHmX9BsjfeMN+sEAfOT0a8n4c6s9BG
         WQTw==
X-Forwarded-Encrypted: i=1; AJvYcCXqH8f9t8HuVQckHUEpimHA1iQXV/K0Lm7zGollLfwb5zIDXiC+F5inQT25iyfKHy35A1RQMhJTaeAbA+5l3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAPB0pHoLqucVsPvnYiaT4ZvX5y2tIcJ/HuaKlsCRURr/eyvkC
	p/Q5ST1aYRnJLXNQqzQr+NuTF8rIIuZayqaayYcH1KEzcUV89BfltKStSQ7XDL3NT7c+Mww0FWJ
	nrUpw2b1jpViLWQe0Ew==
X-Received: from wmwz15-n2.prod.google.com ([2002:a05:600d:640f:20b0:483:b1c6:5b34])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b45:b0:485:39d1:b4dd with SMTP id 5b1f17b1804b1-485566d1ff7mr100520715e9.10.1773484213001;
 Sat, 14 Mar 2026 03:30:13 -0700 (PDT)
Date: Sat, 14 Mar 2026 10:30:09 +0000
In-Reply-To: <DH0ZZLC5QQE7.1I1FBK77FQHO9@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
 <20260312-create-workqueue-v4-3-ea39c351c38f@google.com> <DH0ZZLC5QQE7.1I1FBK77FQHO9@kernel.org>
Message-ID: <abU4oXeCesOJr46H@google.com>
Subject: Re: [PATCH v4 3/3] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 12, 2026 at 06:59:31PM +0100, Danilo Krummrich wrote:
> On Thu Mar 12, 2026 at 10:23 AM CET, Alice Ryhl wrote:
> > +impl Queue {
> > +    /// Build a workqueue whose work may execute on any cpu.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::workqueue::Queue;
> > +    ///
> > +    /// let wq = Queue::new_unbound().build(c"my-wq")?;
> > +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from unbound wq"))?;
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    #[inline]
> > +    #[doc(alias = "WQ_UNBOUND")]
> > +    pub fn new_unbound() -> Builder<TypeUnbound> {
> 
> Wouldn't it be more straight forward if those where constructors of Builder?
> 
> 	let wq = wq::Builder::new_unbound().build(c"my-wq")?;

Crates out there do both, but I actually like this pattern quite a lot.
After all, given 'wq::Builder::new_unbound()' and 'Queue::new_unbound()'
I think the latter is the one that makes it more clear that you are
building a 'Queue'.

Also, it avoids an extra import.

> Queue::new_unbound() suggests that it returns a new Queue object, but instead it
> returns a new Builder object.

I'm only really concerned about confusion if it falls into one of these
categories:

* You write the wrong code, it compiles, and silently does the wrong
  thing.
* You read the code, and misunderstand what it does.

I don't think this falls into either of those cases. If you forget the
.build() call, all you get is a compiler error, and it's not hard to
figure out what to do when you see the error.

Alice
