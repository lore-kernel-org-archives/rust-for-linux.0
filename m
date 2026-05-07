Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3603A782D
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148058; cv=none; b=hRYRnoXh0bWCS+vETpL162qc3eQTr/rVPBmn/RLpRmhcuyxu+3qoLxav+azztIOmoFfDnOtoAqvE9IoXcLCjH4XBl16kZuz5APiBz3fdGqX3ShkoQEWmKlx/87KT7Tds+khbNBFEzLjQFo87fI78zi/24xntU42kcTjZ/7eNg4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148058; c=relaxed/simple;
	bh=Fad51TK8t7LXJcIA8vGRouxTYYfBGTrwnyV5+Q+CSjs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IKqd89si/7e6gKZdb+EDhgsbJxfea1zEf2mlM31fLescS6tCbb1YxV+2QEVMSyg2IJNQv+XxteyRigFQyN4r9lyCtbNuZrey1Y+5QdLCHNUzgW8H2SHVZZHEFzoyf3/Yrp82U97fFXXMi83PkO5IuGZJbLzOXauzxB2fy1JgX2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FmkIbYYE; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FmkIbYYE"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-672a501ba46so818977a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 03:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778148054; x=1778752854; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WH9SSo4GccpYaiPiSUekopeXssDOSRO2Zrgq3dTy8No=;
        b=FmkIbYYEr0YB4AU54zEpxqdSCnvvK8qmOKpaJtBbjw3mKs5ta88Fn5WtmfPgTbKLB3
         e83U3rRy1jZzigWrfZDEqNI4AqwgGWWbSxJZyT/f4TziUfX2uBaA7vQEGDM58MhZnm7T
         h38JY55rzyICKiTt9EI+bg22VQ4jWBPd5qzN1wdm/x/YnBODWjcz3SL9F+sT0M2Q/TRa
         UUaA/OL1cMjjHsu5j9cJhIG9r4H8JrNBKwuImfYIVTEKf9OG9T3QbYtnfemKto8mX2hD
         4qLAMOUhe/URqvqlbgOYhAudFoBJsgiv6vesmBpkeTE7FHvLBYl9q1NDT2PYJ5OluKMX
         gRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148054; x=1778752854;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WH9SSo4GccpYaiPiSUekopeXssDOSRO2Zrgq3dTy8No=;
        b=KvqhoqX3l1XYPDOrz6Orn+bwvQf5J+EK8Qg3QvL79WCizwiZg+BwYR7g3G7XlK8kk/
         ZZE0ioUOrjlV5QeAXHsUe31KYYIgrKpQ9Ljnk+3WuGAPnFlOA4LE5nMreVt0s0S6Upbt
         slgoY67bMtVSuDPO5HRFEPegbqs0+gIzL9oUnQWRdS4nQUtMHi91avh8f6dWdjZbR8qV
         xr09R9ym2WNULPXCFvKQYxv0XtEErIhTvbENHmtwlheH4Lt1UT7wWrlFxtfQEZTn9vHV
         9O973kdGoyrldz1z59+dOu8zQFa1GKTQVO/6aev+zQ1tHWQa00jpMC4ta7oVc2whzkbC
         VQ/g==
X-Forwarded-Encrypted: i=1; AFNElJ+ZxZFA+WM4bVA6N6c3tHSaetTC2hxlW+tzHZDZowcHdHTvb3DMXsvODj5oVN/qE23L8QrFWeTAvH8zs0ndrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHwZ2+m+rRp5HYPOBxxEyMUU9KtDeD8EDq0zitoDu3+Viooyy
	IhEqBDUhyu6Sdu7tjbBBY+2xoOs/rSYwZW0IJx/GeWnM5zG1tboooSF9EI6dmK7pr1TEcQFHhLr
	Gmm0nDE+Jm4SpIBXndg==
X-Received: from edcm9.prod.google.com ([2002:a05:6402:4309:b0:67d:50a7:9bdd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:50cf:b0:670:64fd:2301 with SMTP id 4fb4d7f45d1cf-67d642b0556mr3796978a12.15.1778148054012;
 Thu, 07 May 2026 03:00:54 -0700 (PDT)
Date: Thu, 7 May 2026 10:00:52 +0000
In-Reply-To: <20260505171637.17e20b98@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504-binder-netlink-v4-0-601b41cd25b2@google.com>
 <20260504-binder-netlink-v4-2-601b41cd25b2@google.com> <20260504165858.4882730b@kernel.org>
 <afmz-dgqXjuIntRM@google.com> <20260505171637.17e20b98@kernel.org>
Message-ID: <afxi1OLZI1EksKmP@google.com>
Subject: Re: [PATCH v4 2/4] ynl_gen: generate Rust files from yaml files
From: Alice Ryhl <aliceryhl@google.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 05, 2026 at 05:16:37PM -0700, Jakub Kicinski wrote:
> On Tue, 5 May 2026 09:10:17 +0000 Alice Ryhl wrote:
> > On Mon, May 04, 2026 at 04:58:58PM -0700, Jakub Kicinski wrote:
> > > On Mon, 04 May 2026 09:04:55 +0000 Alice Ryhl wrote:  
> > > >  tools/net/ynl/pyynl/ynl_gen_c.py | 139 ++++++++++++++++++++++++++++++++++++++-  
> > > 
> > > No. Rust. In. This. File.
> > > 
> > > Just commit the artifacts. I truly hope that this is the only Netlink
> > > family we will have in Rust.  
> > 
> > There's no reason to react like this. I have not ignored your concern.
> > Last time we discussed this, the discussion ended on splitting the file
> > into ynl_gen_c.py and ynl_gen_rust.py, which you did not reply to, and I
> > actually spent some time working on that. However, I felt the change was
> > non-trivial and I wanted to discuss whether that was the correct way
> > forward before spending more time on it. Therefore, I kept this patch
> > as-is for now and noted why it was non-trivial (sharing of CodeWriter)
> > in the commit message, until we could discuss further.
> > 
> > I think you are probably right that just comitting the artifacts is the
> > simplest way forward for now. Especially since Donald is apparently
> > working on splitting up the file for strace [1]. On the off-chance that
> > a second Netlink family is ever added, hopefully Donald's work has
> > already completed and we can easily add this support in a new file when
> > the time comes.
> > 
> > I guess another way forward is to commit a copy of the python script
> > with the Rust support to drivers/android/binder/ and I can run it
> > manually if the Binder yaml file is ever updated.
> 
> Could you _please_ do what I'm asking you to do instead inventing your
> own solutions. Just commit the generated files and leave the script out.
> We lived without Netlink code gen for 30 years.

I will drop the patch in the next version.

Alice
