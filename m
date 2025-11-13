Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5EF2E0413
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763063544; cv=none; b=jhFGFTwVnTWkBjxtloBjCbM0fhq+upFR4r8BM3jUnX65+HaWFYQA4vnAHaZGLz1+yMg37kzRmT/BQmIqq8Kyx2FMkjH5tu/3e+Rwd+ulbXj4QQ3bN6XZ3FuBckHJEEhNNdMnzC2erwCm2C7v2kCJxFZ/Q9o3sziFvNseMdVvDMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763063544; c=relaxed/simple;
	bh=80+zjvaX2qO4f+Y31OXuCP1gEDwOlyuj1cQYc0Nf9is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBPHZHW1u9vt+7oD6OM3Y8doaxFqR6XzDV15F0tConMzykzZuf5mzkgzMYlmFNpvou7hj/kmVqdNWjhpV6IOmp1TG083zZ35ugapqqkY91mciOF3hFja1oLG8RvgAYdKoApixGH6XRPBdwZdjabXyrkq4uFasXZXGskKNn1JIjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKPYWzez; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKPYWzez"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b1e54aefc5so110956985a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 11:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763063541; x=1763668341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR/MEkphg0MwG1zZxDDHky+VLxNEFrdvh5uHMFRGrFw=;
        b=YKPYWzezMYJCAWLjufpCh8fJxYDJ/3uHkMpIm9TMqQ6bdwuzJqa0fIgx0cnsC4M8++
         y0Uq77McGkRUB8+ZKIjIxqQnS+QiMGjsy1IVQteof62O5IP0JmB8owN9ytcKecBZcGVJ
         hLHwx1ASHbKkeXpQLC/iQz4TXcGzCOcRyW9tEQoy5WNs1nhNUv4xbN3ajtGeNty6RRvg
         rO39IvE27dtt4S7US7ha614qT08eL2Wja2PxNOJSn0kyuQL97vNelXdIHTmhyngo4HgN
         KNx7x0XHQBdy5/mqS4tk0U4pNFZ9Cs9JbFxRuguuEAwTFPeQyPP52buGsHBatprxhNCp
         p7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763063541; x=1763668341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nR/MEkphg0MwG1zZxDDHky+VLxNEFrdvh5uHMFRGrFw=;
        b=lVTV6qrC2C6O365eU7PX0n9ny/tegGO+OStHkc30mXgsjekAX+0WklKTd2Qklxqfgo
         dG7uR46tKa4y0ekaPXDVg8gW3YjBunNcnt1C0xjNLqJjq3vO7nj2HN/EpS7Ai2xjtap4
         5oJc8VnzV8cSLKtn6udI1sbuj8yqXlypgsDYXPGQxwJKj2l6/GRwgnBwT/IuBJXnXpTt
         hSsvnTUcgJ1FAwOICfS7pZ2NLsvdtCwMPs1vaLqeXzZhteXRbLGcX8ZA926WD6Ms/ptN
         z4P+mYlxpqCwBwg5htctVdbbzPpysL0Rx0DSjNHn45ASsWpAjlLosdqmJ9Jq8MyjfNIf
         7a4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV31PfoRPdkTckyM6XeMTmHs4SVmKvtJDDIL87/HrxAGY2Zd7EgEAGiFSPuZn8M1S2BbNhlPZgZ4sxxNNtq1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVemihPhoIB32snvL9P9pLeg8fSfTtdUrS7VKN4IxmOwtGmNUk
	PCJshd1QQLgCWmOme4BjZNrCCp6P5IdKAJEHSs0ztzHFnfuWxAnw2FZJ
X-Gm-Gg: ASbGncupCkUMJK2YRlxnl7RceWzS/ugsu2GAYwEWZqGEcwrgg/xnirnXSOY3Lt3+Twf
	yqc67ves6fZwldRov52LGEVjEJgXcpT+Zc3vnnLEacSc4loRHGJENJmHn3kj1m356DIeyGmMzQQ
	Io/QnTAT4PQRe8VDKdWHmHNeB33yvoFt+jLGRPwi1OapkebJT67W1WaRXtMHPdc0HyGr4PwAs93
	JBG4Qp5E3pa767wfyMAvt0i7YvOk8Ul8tn09OICIgDMpOMYROTHSk86kiYpCydzOxcRbHEXJuSi
	B88TxcXc1v3mxBqpiv/NpgQcq/m42Or/54ePvnDA+7A4cuukkI+kuGa2yu5txnrE4Wb5I6TCW/t
	LRVCORXEdNYYgAVnAIT0p4N7ADbZNIsoPvcmljs//BAtxKty6tnw9ih3TNnEiGBDAQTJ9xgGfGI
	XsiCPD6qZTJQw0QuSxge9LOQVORTbo6dwAQu4/7RFCfZYV2SpDGMsPTKmEZWVXaAO+TkwIDCf+6
	4paQLAHwkuhH7Q=
X-Google-Smtp-Source: AGHT+IG6sNmSPmKcFXlZdj3dgngB8D05Lma/jQ98WOj2PyO3cZ9dowdJElKCMB/LIJ3OmM/qTJpv1g==
X-Received: by 2002:a05:620a:4710:b0:8b2:657c:ec78 with SMTP id af79cd13be357-8b2c31ba3e3mr72591385a.75.1763063540963;
        Thu, 13 Nov 2025 11:52:20 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2af06298asm192452285a.56.2025.11.13.11.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 11:52:20 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id C2E2EF40068;
	Thu, 13 Nov 2025 14:52:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 13 Nov 2025 14:52:19 -0500
X-ME-Sender: <xms:8zYWaSlVW-2HOTrnh6B-QMZh7LNMSJ58n6uG2ZDmGvDJyaeW9zuhQA>
    <xme:8zYWaTNkmP_EzAUrpQ8c4bJRQcZuE67eOLTjF9WgmJp2g0c1tvpgga1JOs_iPxDmd
    RHrORSXWILKPiY6IfrZv0_ow3lJysZsrnO_cjpLAI3v1llrI75qidQ>
X-ME-Received: <xmr:8zYWaZK56yYyN7NlWfhuSGaoNdgu9Yn3Xmw2WRNEG892lBf6W2-4LD9Y_FHxJriwFq6Zj7xFsGr49ZFAEInh4rFd6TQblryU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejkeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtjh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepjhhirghnghhshhgrnhhlrghisehgmhgrihhlrdgtohhmpdhrtghpth
    htohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghg
    hhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
    pdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8zYWaWGt50XRVlJwySdkt4TMSLK4Bkpw5ZkXzm20Clnc5jxP_DKuqQ>
    <xmx:8zYWaSD-gruWgWFcotqZ1RycdUT-DgeED1XG39Qw7bHtP7qpEL9IsQ>
    <xmx:8zYWaY29GDra1Pu3qb8c6YNc-wEf6Yx_NBg6HPYMGpoD5ZuC3IN3dQ>
    <xmx:8zYWaXMFx7SBGBxOUHae4U8jRBosuJgpYdFSwOrP3dCkAlRFCHJ0JA>
    <xmx:8zYWad5i69Ae95T47hzr9DpQ0DlZuyQb124tfgBJXeNgGm7rSeKOit5j>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 14:52:19 -0500 (EST)
Date: Thu, 13 Nov 2025 11:52:17 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Philipp Stanner <phasta@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Subject: Re: [PATCH v2 2/2] rust: workqueue: add creation of workqueues
Message-ID: <aRY28VITGL53zenZ@tardis.local>
References: <20251113-create-workqueue-v2-0-8b45277119bc@google.com>
 <20251113-create-workqueue-v2-2-8b45277119bc@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-create-workqueue-v2-2-8b45277119bc@google.com>

On Thu, Nov 13, 2025 at 10:01:07AM +0000, Alice Ryhl wrote:
> Creating workqueues is needed by various GPU drivers. Not only does it
> give you better control over execution, it also allows devices to ensure
> that all tasks have exited before the device is unbound (or similar) by
> running the workqueue destructor.
> 
> A wrapper type Flags is provided for workqueue flags. It allows you to
> build any valid flag combination, while using a type-level marker for
> whether WQ_BH is used to prevent invalid flag combinations. The Flags wrapper
> also forces you to explicitly pick one of percpu, unbound, or bh.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
[...]
> +/// An owned kernel work queue.
> +///
> +/// Dropping a workqueue blocks on all pending work.
> +///
> +/// # Invariants
> +///
> +/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
> +pub struct OwnedQueue {
> +    queue: NonNull<Queue>,

I hope Owned/Ownable can make it just a Owned<Queue> here ;-) And
that'll make Owned<Queue> automatically Send + Sync. I think it's not a
rare ask for `OwnedQueue` to be Send + Sync.

> +}
> +
> +#[expect(clippy::manual_c_str_literals)]
> +impl OwnedQueue {
> +    /// Allocates a new workqueue.
> +    ///
> +    /// The provided name is used verbatim as the workqueue name.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::c_str;
> +    /// use kernel::workqueue::{OwnedQueue, Flags};
> +    ///
> +    /// let wq = OwnedQueue::new(c_str!("my-wq"), Flags::unbound().sysfs(), 0)?;
> +    /// wq.try_spawn(
> +    ///     GFP_KERNEL,
> +    ///     || pr_warn!("Printing from my-wq"),
> +    /// )?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    pub fn new<const BH: bool>(
> +        name: &CStr,
> +        flags: Flags<BH>,
> +        max_active: usize,

Do we need to support `max_active` as `usize` when the underlying C
code only support i32?

Regards,
Boqun

> +    ) -> Result<OwnedQueue, AllocError> {
> +        // SAFETY:
> +        // * "%s\0" is compatible with passing the name as a c-string.
> +        // * the flags argument does not include internal flags.
> +        let ptr = unsafe {
> +            bindings::alloc_workqueue(
> +                b"%s\0".as_ptr(),
> +                flags.0,
> +                i32::try_from(max_active).unwrap_or(i32::MAX),
> +                name.as_char_ptr().cast::<c_void>(),
> +            )
> +        };
> +
> +        Ok(OwnedQueue {
> +            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
> +        })
> +    }
[...]
