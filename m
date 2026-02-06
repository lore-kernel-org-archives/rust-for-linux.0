Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6040B275AFD
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390552; cv=none; b=QartO2QWhemKk/YvPDmim8IXRQKaEOZY14zVTdetiemD5tEfLxIprE2YUfyaptufPmfq/jzRF0ySbC3a2PcZq5w5b4rv9FCtvjVqRV8CaMJ5T9/1mLXC7bfqsUXSkZXApVhycvMQOsZJc2svVscKgjBcxLmZMlK6k+N8blMl1tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390552; c=relaxed/simple;
	bh=sePmmgijUQGCxRJ8YWd0pLqDOUOLq1jd5KdGiyMAHNY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I+geTj5TQiYeCgG0braIcYiNJoYRBL30RR2oYCZcd0iQAT6iOU72wb4AWU6IpCnYl0Q1rKfFje7bLutsIBiUtFs0FW+NBtyt8xwKvRijj43+GV2pQfw54fRhSucUhCFxI5QDTLb4rIbS/CfvBiG4TRj3uQ8F5JWVzWOhi2YSz3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DwfEs+uI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DwfEs+uI"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4801d21c280so19978365e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 07:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770390551; x=1770995351; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8anP+U2cWYN4xpLiUspPGH/QeZSFPYAkk4xHbjSWBvQ=;
        b=DwfEs+uI0HMZCQ5/G2Z0RxZtqNdvK2tO6JzYGd3jHwNCH45/6SatZB5PDFMO7Ing4s
         4OjYnGZUIivqUd4QVEDaNdZn/iuK6fg9fZ9GLQLCDgUBI1VPz174azeDXNK8TTBiAibh
         cxAwM0qyCf4HxCDUxcwwEeNHxOcYqeOBGiguyJ3O5KF+qRnlsrB25KqmvC3z/swjt635
         K/nlahhthFAoXFW1M9bY1kJRLCz0YAQ06Vn4+Ghn4pHwOjGBlpnibgFGHUE0GcU1ac9s
         bPCM6YJu1bCT0uUvlZ6um65SP+kNx6pioy3pYNLNcRKgdy2rbIXre5V+Mf0WNslDSW1F
         TQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390551; x=1770995351;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8anP+U2cWYN4xpLiUspPGH/QeZSFPYAkk4xHbjSWBvQ=;
        b=sceFH4Rq6YhpLu1FFjUhI3+XyPJHf0WQyqZxDpqYP28yrW4Mzo2nnsG6hLbbiSNd8f
         I+ln1mMRkYV5oe/BhOtKpiqSoPjiLdQyzjf28U3hl0lEAjOVzYfIvcS4Etiz3XkXfGTb
         eaRzVFpB0bqEe6+Rrdc4ISqtZCLjlHvYB7052a4YthrhZ/m/UteIccfn4s5BHOUL2HPl
         wwDS07YOiZA0e9DTRhPoDVbncSeqpCd0+BocjqJ5g6/FGNWljiMXXKbAMZAEUdKXPq9/
         xldybhXNLpXmrulu+CN62ifqcNMPMdkP1AEHOR2CZejq1S+K4EGCyLcTXd3M5OU8kK5Y
         T4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWxcRauZNTgV3q8smTh5DSIK3zBX/SAEqFcAAtSCqedCayPiE1zwF+SITjacQW8AkJw9E4zzEqzAPWZIpIQyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf2YPBznyKH6MBLKR6rdVWqV0y/AbmyQwlONtVP5dObDhJ1+YX
	n6y90aVhki8x4QyvAMNGs7rCPg4bM7RB7NI+xKn76cU3RvX5Z/j9EAuR0i/hYAHHAPYLYiH/2j5
	7spB4kjkPhqzhoxHjeg==
X-Received: from wmj4.prod.google.com ([2002:a05:600c:244:b0:480:6b05:6b9a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8116:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-483209b06d8mr38753915e9.30.1770390550899;
 Fri, 06 Feb 2026 07:09:10 -0800 (PST)
Date: Fri, 6 Feb 2026 15:09:09 +0000
In-Reply-To: <2026020633-foe-etching-e464@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205224706.91996-4-dakr@kernel.org> <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh> <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh> <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <2026020616-hardhat-french-4dac@gregkh> <aYXtwXYAELSIoxXE@google.com> <2026020633-foe-etching-e464@gregkh>
Message-ID: <aYYEFRwotF5AL_Ch@google.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 02:55:50PM +0100, Greg KH wrote:
> On Fri, Feb 06, 2026 at 01:33:53PM +0000, Alice Ryhl wrote:
> > On Fri, Feb 06, 2026 at 02:22:42PM +0100, Greg KH wrote:
> > > On Fri, Feb 06, 2026 at 02:16:05PM +0100, Danilo Krummrich wrote:
> > > > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at all.
> > > > Hence, we could do something like in [1] instead. I don't know if there are
> > > > other options that may be better though.
> > > > 
> > > > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/
> > > 
> > > That's a start, but still messy.  There's no compiler options to prevent
> > > this "lifting" of the code out of devres.rs?  If not, this is not going
> > > to be the only problem that drivers run into like this in the future.
> > 
> > Because of how monomorphisation, as-is the code actually lives in the
> > module to begin with.
> 
> Ok, but again, that is going to cause all sorts of "the symbol is
> undefined" type of problems going forward as a developers just "assumes"
> that the place where the symbol is exported will actually have the
> symbol exported from it, not that this place will be copied inline into
> somewhere else.
> 
> Think about the interaction between module symbol namespaces here.  This
> isn't going to scale, and will trip people up and cause us to be forced
> to export way more than we really want to (like this patch series shows,
> I don't want to export any of these...)

Hmm. I don't know how to reconcile namespaces operating on symbols with
monomorphisation.

We should probably think about what to do about ... :)

Alice
