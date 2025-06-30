Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942C328D844
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Jun 2025 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295066; cv=none; b=q+Pg88ZOp3e2v1pBvnqV7YSA7m4AdvlT2mzb048Y1COVp9LGKnxfeeVzGJy4qxf1NamvkrT303fMRvvN97LUquVCzv4PIUZWh7/ticsX+PQv5t+WfelHNiL2cPhr3wQZx5jrinlS8zerSjCfutlriqeTFmnO/OraTVGpGxDBQ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295066; c=relaxed/simple;
	bh=AvF4LKagJ5DoTnzOZ0qip/9Tmcll8h+LSAzEXGYGWto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m25lHdBjY7/VNdoQZXBo7A0rkzpGT7NdUcNnVVX7+kbbQr2ITcl4nCYd9bgGWqyzHRDT2SFEWL/VbAz3IXSmTkzfCiXVQCJ5mLk5oQxwlt3sH7ZsJaYys14sSi5sRPoD5BH7Kx1oGP2NXBW/ip2fLuSddol5Es6hxE8UMcDF0HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lNKkY09p; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lNKkY09p"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d20f79a00dso293675585a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Jun 2025 07:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751295063; x=1751899863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifhh0Z7U9kfZ8ibHSYCRMf91ur7H8Ree4fiHnfWDjwY=;
        b=lNKkY09p8+EjKxLqvgX5udpkqqCwPqx2ngwVnd6yvAR90CXd1w3wv2oFY7rASFZeCj
         UZHk7YZDzpFVNVFYbYDuPLSk+g1EABqTw+M57vb9vd4fMi5w3lmUMfr5Ln5RZx4mtPXM
         /vYU4M6AW8L3Kta9bHa1K9TOkZPhxEPb3octmgUOaFW8fnvwMKTdGmeLuJpDkXhADHy0
         WpNk+dWry/pXTazGd4lI8fe6SyuFJXf25HaeF53upy/Qd4ImgEMXVgsjNwpwsAmM/4MD
         DzU41P77cBUHiYEm5/srfAZX0fn2LJg0ncyOtPbvptGX34MiGiRBlINqWIIaf3E4cAeL
         pB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295063; x=1751899863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifhh0Z7U9kfZ8ibHSYCRMf91ur7H8Ree4fiHnfWDjwY=;
        b=G629NWfb6yBne6ENFvvZRxVxfpbX9Q0V3xLzzVKiP41BxjhzeqLMjlIDl03Wc7Unbp
         ECCqeDW3TfAEk1NUx6Ez8XF3sY7xZlnw/sR7uORg2H6NgZ96Vvy2pmnEbseXh7ap9LkX
         +bSkbmMsEBSmj7jge7K2NLKtzlMzKmdgBLml0gM8Lb9musWmcPLPpE1cI1KQFIZW+S8s
         INLaS/2t/S6q7aphkzgN7GTuh3/23Df9+OROPO3IgLCcT9953HuHvTknEOFnAirirDIw
         JCakV5lDUfmCSo1/GGB5K7b9pZG2gUrTGmxAMHuYCrH7CoukcrJXk+9HqAOYJqePX8rP
         oORw==
X-Forwarded-Encrypted: i=1; AJvYcCXBnphgg8gsmUaOlw4G0rBnINPTeD61UZKkwrg6M562bEckURcq0ril3NCUnr5BKuOBeLzE+PIBwwfJaKEDlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCqTKgnPus8nUjMC1IEJ1TsG6p6O3A0vpNIm40oypaVaZGoHNG
	L3r8/wtfJF3h2OopYGtKZlFLiDhA5VlBFsUFeMNiWrYYRoa/Tzrh29kRKpVH4GqHPA==
X-Gm-Gg: ASbGncvu7s/uxk+1PL9ttBJ+ZC4gAzh5Og53vFgZHj1zeA4jNPzVZKR8rNIRJQiMhHG
	hX3DgTS/HkdkwaIrLOpfGBnQswjo7P2vzIwYI+EzPIn0iuCQXOnYmFWwhUpuB/v2luzKDR6dI+o
	2xv6Hhlp19qToW4bxTE7nDEx8/ZJk1+WesAavM2POOJCY9BKcJutsoaxztguEwimkAcxvxREjq9
	8zRoklE1LbQlD7nu2UMQ1U+S/v7SJZBD1pCp0BGDm6Xbgl28W7yyjujMzZjZqJ8AHDcbj7TafEh
	PG/Co3M4hreu4jPNK/u1JqBDIGZ3cZ5josp1jHGzWKn1A0ltaBkWCNWfg8B8ceZw8XnDsvFhhRJ
	TpgYi
X-Google-Smtp-Source: AGHT+IF1yKNUOiHgxQRl5AX5C7pvK8S70B1QEWwBf8quTZXAN2qBcNb7LkpKzCS9x+idNI2rKNHtfw==
X-Received: by 2002:a05:620a:7004:b0:7d4:114:f81d with SMTP id af79cd13be357-7d4438567e9mr1837297885a.0.1751295063336;
        Mon, 30 Jun 2025 07:51:03 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718d053sm67765086d6.1.2025.06.30.07.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:51:02 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:51:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>,
	Mitchell Levy <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 05/10] rust: sync: atomic: Add atomic {cmp,}xchg
 operations
Message-ID: <1cf36f94-7e70-48eb-a79f-ebde218cd716@rowland.harvard.edu>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <jBAtISwM9LKkR7KuCHEnym75NfGOM4z408pMuDfk4U8VzN8PQuk9JJfBc33Usre3YSjbgtFRj8c0ZNeeQMpZsA==@protonmail.internalid>
 <20250618164934.19817-6-boqun.feng@gmail.com>
 <87a55uzlxv.fsf@kernel.org>
 <_pLa3zqu-AHBOnxkEz7l13l9W-OsKBtuXIkjRsIJJy6EnYTrM99E8Yr24pzjqwCAj1_qs_PI-cVxRsBsbgiFdA==@protonmail.internalid>
 <aF9bmpX-i6HVMlaj@Mac.home>
 <878ql9zg90.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878ql9zg90.fsf@kernel.org>

On Mon, Jun 30, 2025 at 12:16:27PM +0200, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> > in atomic/ordering.rs, I think I can extend it to:
> >
> > //! - [`Acquire`] provides ordering between the load part of the annotated operation and all the
> > //!   following memory accesses, and if there is a store part, it has Relaxed ordering.
> > //! - [`Release`] provides ordering between all the preceding memory accesses and the store part of
> > //!   the annotated operation, and if there is load part, it has Relaxed ordering
> >
> > This aligns with what we usually describe things in tool/memory-model/.
> 
> Cool. When you start to go into details of ordering concepts, I feel
> like something is missing though. For example for this sentence:
> 
>   [`Release`] provides ordering between all the preceding memory
>   accesses and the store part of the annotated operation.
> 
> I guess this provided ordering is only guaranteed to be observable for
> threads that read the same location with `Acquire` or stronger ordering?
> 
> If we start expanding on the orderings, rather than deferring to LKMM,
> we should include this info.

The problem with the word "ordering" is that it is too general, not 
specific enough.  You need more context to know exactly what the 
ordering means.

For example, ordering store A against store B (which comes later in the 
code) could mean that the CPU executes A before it executes B.  Or it 
could mean that a different CPU will see the data from A before it sees 
the data from B.

A more explicit description would be helpful.

Alan Stern
