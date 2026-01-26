Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B927FD45
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444253; cv=none; b=MtcUWTSQQvOQX6WaYljlJYeer+q4r10Nz+SxKGOBK9Ott5h6EdSejFOukhcwAIT+C0c9NVNWVV5DLKBGjohcPypNC28yBcMq0EfSuBehxhYrZR6/+AdAA6CuXUlBmYqjU25lF7uq8Tx0cOt0DMPh7bVOp4ieANTBAY0IMSoDaP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444253; c=relaxed/simple;
	bh=rOG9FoZYFoybD9DfZu1CESGpzmVUYAGNrtJWWk0HZqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/IY6ThGL+iqdO1E6KmhGA7xlNCSM/QaR/aqrrI48hz9SvGkSsZyFQO9v20Fh+j0t9gsFsF6HVAOkRYEGK7xlzApIyRfZMG+dUCpN9ojIpE4eCOpcWdz9LpIs/CuwT2BlNx+lI1iWs4sCASQN4SzcaMwXrk0J+yeBtlJgbrCU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhlHFUhl; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhlHFUhl"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c6aaf3cd62so598371085a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 08:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444251; x=1770049051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WPusBAfPZLfB4yp0DtCCI5cKa6WeYoBYOHgHsWUCZA=;
        b=JhlHFUhlAcOAg5FGZrCraEXQeiva4F+c2jpsQO+crRl4Ej94HNOq4eSr4m+T94sS40
         Fjw4Txy0V9lQRIMzXHUELRC5lB/xETAk6SgU6XI8aBFn7GDHxcIscbidEPK4QfQbJcGc
         KMQ08hcO0AXGP2RPQPODWi9kR8gqA+avJe8O77Lrd8NQ+4ohBWFEuZEFMoGCnTPgkKpt
         FbfD73pMKlTGakdVXhVtR24HSEwCOP+EmWNcaTydE2MIc6gN4w3XPD0P90hF3xKN8yAc
         vbnikX7xXl0t2Kq+qLoUMuBBCCTNr3Gd+2DIbjTRMIDTd7zdaFmFy7ge287lrk/kDS2e
         dGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444251; x=1770049051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/WPusBAfPZLfB4yp0DtCCI5cKa6WeYoBYOHgHsWUCZA=;
        b=iiKjRwX1zZr58GtR16KDpqaZR4SvN5RMVmcBW+9Ro99OhURHD6PGCbNIHVepOfqeZ6
         g7A6yWILvxXD+/fSGaoC+UzaT1mqfoLqkTx5j2vcv1SKIEWyzez3PwFUM24mBk1K6ywH
         ibqXgpG/xmkjQ9qK5nHjVXBbmfyiNwMCxVLBymwXEnSzOTe3dGlpIky3Gs70yUpN/bam
         W0WQ5TgoJNQ7/1ZbggpevyBBLfwWwtg2Fdm1Wm1erTpryFxIFhhktzNSNlKFTKkHkl2u
         5WG+8GFtQYM1Shh5sH1gUD0dzQO3ECPMNT0wOpDGtp9R+NwtiE7PqRUs4hwtX56szN5v
         wVwQ==
X-Gm-Message-State: AOJu0YzVa3RVZKR6xK8PoP6/JWcOGOsRrqQQ0/oYm1gCE0hCFyoGH7WR
	wP1eCvNMPu7QRApqVPQMSpnT/qYERuwklmB+5WJK+xjrIDK+O7nJLQAy
X-Gm-Gg: AZuq6aLslCZDIoSXRnAB8a7yhxPCiFwiEfMns6Z02p264MwWQ7D54FNXR/5km0Tt4Z/
	FppcJr62w1IbIsl5d8n7X3MiWLmyspL6cmwFnWRjfeg7N98kZ8AMiXpnZb4lsD1AUm3/hxOE30C
	zchcVqWBI4ncm+UzFuJegXXAUO0wkgP9JME0H3QgaMTEOGevwx7xiPXfZ/ZKCMvEdcoIeEqP013
	c45mj1XFgnufcd4sgEukF4shavTi+7CmnzE9W0T5OalarTD0CPLP5LG3FOfoZlonWzsqYlnnKVM
	ClNsnJt/igyNul3u0gdU/vlC+KYUEI9uw2E7jeVA/FGTH0OPxb7Mt1hapFpTZcxCIG9WCTX+DlI
	QlCSKEnmYOmmG/MRgIkLgdKt0d22bARvmivmgCP5/h+HskAWuYVyQb3vwwdyOC61OdQljAmcaEc
	3ZLCit/93j6fBoiAIZt0JuN1fHIQe8nueGPCBU4tMSsHB6dAGLD58G79v7A1uY/SC6iQiJrX+Qf
	Chx6fyL6LjLVoA=
X-Received: by 2002:a05:620a:460d:b0:8a0:fb41:7f3c with SMTP id af79cd13be357-8c6f9590b78mr586555985a.27.1769444251202;
        Mon, 26 Jan 2026 08:17:31 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37d1f14sm995174185a.15.2026.01.26.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:17:30 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 19438F4006A;
	Mon, 26 Jan 2026 11:17:29 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 26 Jan 2026 11:17:29 -0500
X-ME-Sender: <xms:mZN3aTk-1JrINYD0I-BCoUKyNw-tNYdX_CqhjXKNX5wmnkZC2MdD8w>
    <xme:mZN3aWHsh4siOyl5qvfqtoL9i9aup-ZPNFzJdV8_9G9wG1h0SPOC5OiLorjKwL0_8
    wtmc6VgNJ8pL7_2ZnLSfoNh1r8FFrYkCouG7DalKY4Cr6JjFcFX_Q>
X-ME-Received: <xmr:mZN3ace_Camfq0QHUmKVtCdxd-8B2Nl5nmiRICGHKPTcknDncVZjDd60N8uZlL5klQXT03YM4YbjYrYkxFHBB0u6XtCuMuqD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheekudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehruhhsthdqfh
    horhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtgh
    hlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegurghnihgvlhdrrghlmhgv
    ihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjoh
    hrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:mZN3aTFJuZVl_Y7SD3ofYXBMM5faSx1YqqW6DDYiJUNo-c59Gpxk_Q>
    <xmx:mZN3aWF4HmJ8UK07v_BQSnNNqkOtK0awjpNjnXhjnHU7sDj55tXQbA>
    <xmx:mZN3aTO2jxq0MGyVv5xqr1dvnn4LhwtD9UdYy_A_B-rtsf4ItF6eVA>
    <xmx:mZN3abpM-qYulpYCKd6dKga1fuYKHSywCqG8aTY8ZQX204LJ_nspvw>
    <xmx:mZN3aUCxbFSrs571xoyT__uhSCgYYtYecj5ENLWTXfsmBF-EzXwS70c_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jan 2026 11:17:28 -0500 (EST)
Date: Mon, 26 Jan 2026 08:17:27 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
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
Subject: Re: [PATCH v17 00/16] Refcounted interrupts, SpinLockIrq for rust
Message-ID: <aXeTl7fihxD57STk@tardis.local>
References: <20260121223933.1568682-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121223933.1568682-1-lyude@redhat.com>

On Wed, Jan 21, 2026 at 05:39:03PM -0500, Lyude Paul wrote:
> This is the latest patch series for adding rust bindings for controlling
> local processor interrupts, adding support for spinlocks in rust that
> are acquired with local processor interrupts disabled, and implementing
> local interrupt controls through refcounting in the kernel.
> 

If there is no objection, I plan to queue patch #1 to #6 and patch #16
first, hence kindly ping for any review on these.

Regards,
Boqun
