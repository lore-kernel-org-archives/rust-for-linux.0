Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE17264614
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 02:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771813575; cv=none; b=aiI31mxcdbRYIDL7l2Neyt1kT8QxmtFKkas40Jn/DFQ5f1f6xb6mhzSJa2yxmq3xxzjwBASCQAlje+h91lYSG6UWfIVzI0hvSJ+115EqhoNFagT9QA5DFH9WssibMEYSpu0IzdrsYxMddZSkFZXCzKajjMFE8k8jmwmMCd9piuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771813575; c=relaxed/simple;
	bh=G4GFV+QxWjJyU8uodbcIN5Iy4j/891a6vm3BsnJgJU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOcxRDJ+8TJRuchQTwbAA2q//lNNHJcHjRzvUNZxBuB3xc8dur5ctjE+cJtRjfEqmCwphOj2g4vPeJxXSEda/KY6wyC9lU7pCo9sIlUWektsQyHbGEyXAaf6GXA7BxJR6UVWmQI8hXyc/L91A6stJ0DYrtQsY9YArg5VqPURtT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXx5I7iv; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXx5I7iv"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-824484dba4dso2731583b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 18:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771813573; x=1772418373; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LoSianPV+m24sY+kS7ttUM3HGhiAlDaIi5Lhm7XMZI4=;
        b=aXx5I7ivYAKRoNVB/CR6rsab0rvunJlRY1rf3nWDigqoXSX/hnvnaeGjDwRTetZeZc
         ANAvJf6wRCywTf9LPNCYqmoRb1j+04xGbOVbV/5U7TujUQ/MLylKLfUWfMp7SslCNeFV
         yCaPmUaHXAgXdwH1I+hDkjzdcodcbUHcXR6McDRkXFPsZVfOkFw+GzPlINFxd84HjqtV
         Of9SSuFwBUnln+ZAMmGBuX4Dpe9c+PjcCujp5Nc5pxIoeQ3J5OmJ0z7QQ4/vNOEHt0/W
         r6uNSbtRHc8HVz2GcneZMrOhLB6ec5xmkizsPYoBlrrldJtxi7GowPKe6UfkZExlFUJZ
         PtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771813573; x=1772418373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LoSianPV+m24sY+kS7ttUM3HGhiAlDaIi5Lhm7XMZI4=;
        b=YK8IO1dquylMGGI8Wng1W+aPgy/IZwghnbq88jwjoH3knA1Ed3M+MuhC6jbSq9SX2g
         zFe0abfHDSO6bqgc3zxUt3y6eipYv7EwkIeCIrJ02FCaqjCA+Ab14jT3QHUAUgzGkBBp
         UzIe9rPaGOAzli6Gt1ij8guFxIXb4ZcZounauqMTFx85cD2LFBz1mReLeE9g2Pahtydv
         UhyGTfroAfbfDcIuoRY9n8uGS7t4VhpyjDya2e6twm17VdtQwLnPzjPiysgIQRHPIxBp
         4XPWcE7cblvgEQkYDH4itj0rOJ5FIoMNbWLZz5TC/r/YlqicYGSeNIwGGvp1QXsnzWfw
         XYZg==
X-Forwarded-Encrypted: i=1; AJvYcCU5feAbqh62OgvB2djbV3vENg1QE9S2gjTk5Dg2OTkCCtU2iubaDsb7Hw8DkU64KU3HTC5F0Y0tAYnuB2QJ+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ZRF45nXoiMcd4tqQi8UEGUxwxnRn/+FSw+63dHoyyd7TWay6
	u0FORCTsU9oNQxiuDvymPV7zEbRRZ8+qwDJ76TNdCNaPEhvrrAU5rBcx
X-Gm-Gg: AZuq6aLQ/9s5Ll5UJVM/mtIM11CX/vqMjlNrGlfzdyQ3jgtN8qK4nP2k52L0G/dg1zk
	FihB+BuBEEbfRzkXmTo8IEt1YhhIREghu4RK/ftbRJhRdaR/hWpuhcwaDoFO7UK803aQKd2lsjL
	PfJer/CG7ImfR6Uq8Gsm1rmtfubDs10lZq0drEtgPWAhk+sGabyvdraG+44LtRa7qnI7L8cW6Tj
	arhWsh2CJcr8S9Giqi26Qjei7yJaMPOD+1Q2lPsOtaBPoJzXMNeZdyUdFvttEDA84zuFTWEGP8Q
	pQJ4MDDYqUwrXcD/I/HmDYpIwtjtZGeZ8oKjevwA4jRw1o6H5pptD5xEcf6JQKaG6KWDzw5XsmE
	Y4/bATBD8eQSoWqYko8s0h8LIyletDPCgBoSfAddiE/BP+4Ouy9ooHfkLchjANyQP5l3kpBWoby
	hqH7SlY/J7dvdFPK7gMrYjELsn930+RoitaT8QL5Oj/4jHKG5VJoPjOPxf9rsva4M02ovAIw==
X-Received: by 2002:a05:6a00:3696:b0:824:a635:4181 with SMTP id d2e1a72fcca58-826da8ee305mr6643441b3a.15.1771813573069;
        Sun, 22 Feb 2026 18:26:13 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.163.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8bc6e8sm5846159b3a.49.2026.02.22.18.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 18:26:12 -0800 (PST)
Date: Mon, 23 Feb 2026 07:56:02 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>

On Sun, Feb 22, 2026 at 08:11:17PM +0100, Miguel Ojeda wrote:
> On Sun, Feb 22, 2026 at 8:07 PM Link Mauve <linkmauve@linkmauve.fr> wrote:
> >
> > Should we come back to describing the target like I did in my first
> > patch[1] in scripts/generate_rust_target.rs, or should I bring that to
> > Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
> > is there a better third solution I’m not thinking of?
> 
> We are trying to stop using the custom target specs, so we should ask
> upstream to give you a built-in target you can use (or equivalently, a
> flag to do what you need, but I think the idea is to not have such a
> flag).
> 
> i.e. even if you used the custom target JSON, we would still need to
> ask, since the goal is to remove that script entirely.
> 
> Thanks!
> 
> Cheers,
> Miguel

Sorry for the spam, my earlier message got rejected.

I think, disabling altivec, fpu and vsx with compiler flag will work.

What are your opinion on this?

Regards,
Mukesh
