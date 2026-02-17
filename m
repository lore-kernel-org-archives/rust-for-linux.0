Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2730DD0C
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320825; cv=none; b=SfJjsqF4+fZt1UKxG46EJfJueij/P/XMBYGriMkOl7ctl/aGymVIOj0KDFM3HPO8cdCf6ak7l5k+e8BWfKmzsZqN8A0tkllOZW/HZBuvC6/oCSLO+jawIImCWFcYpTacgI4b3+1oPTqdWZEu8vkFAPC68z73zwgu209bZHNbjiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320825; c=relaxed/simple;
	bh=B07OPuUveTlk+b/va2juR1LXkVUa801jcSG6qIxxN2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N0qkVUKtSPM9CMRlegZBh3VeU6mn83bbT+mFhyqxRW7wqblbGAXYeEAmA+29z1NS7mkcxNmxtBFcpEDLh1ISKQOh8cjFls5OQFaWLkkAwhWFoxPRzO81mU7vCDw5vxwHoAMHNANu3KiZMIuSlD6aVt4s4nTCkoHtUhH9dxwy0tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZZKRyNIC; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZZKRyNIC"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso19741185e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 01:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771320822; x=1771925622; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x8U/V9GGZCQ16QVrv/ncm3L2JAXBCx3yPL1lZ3d8azI=;
        b=ZZKRyNICf4fq8KoRhHKo7iCi/OhI35Vp3+ZZSFBovS+0n+6pJ7Pv8ZueLIxETWZQoZ
         Xylv+if45N6doveO7Ou2AIodAgFVxRze1JjTh7Id1Rqjg8bAB+DBkvHl+E32JEZEdaQ8
         oUw2p3/qmZvizifSpwWePBigIvTVhuVH+XNayJBloi+cTZXgu9v/2przlodpAGsVq1iK
         jETInLLvrZHbbwDWmgP8cJb3UXaOAVuBwJtACqQPjevOzgI/+o5peb85rXxrkYeOp/Tn
         I3Y4F2rNLsUTJARIK99OBTcITUTl4bRnXACkJJfhjnCjQ6xU1htowmdl8ggyZ5OQyL+e
         J3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320822; x=1771925622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x8U/V9GGZCQ16QVrv/ncm3L2JAXBCx3yPL1lZ3d8azI=;
        b=dbrtkVAMgmdF83lckKpcMt87Lqb+KT37S9V+0FuUU9uOYHcmxrKwzHHA2cGGBAXlI5
         SinaphAfMQye8VtyKlu2ysN2+JV7mrjMbeNBjJ2douk0+TPsnuKMNBrjXtzXbrBylDo1
         DVlie+9S2Taa9Vf6gGj1nNIVLjqB9h0+te7XfTEOnCCwA4Plkvp8yaTMXbBnMQjHmbY4
         of7o9epujJ42dMW/Clfq6Pdhb8ypBMDYo94kd+ZRBydI/KLtC+Rp5GQi6+iIGZEnTGkG
         BhBz1It9e0j63J8GB53IOQj01qXNiSrSLPTfuaBtWwoaC0wsdA9iHKix8yXZsL7FOtFk
         mDjA==
X-Forwarded-Encrypted: i=1; AJvYcCWe82ifwm/N+MLE7ZTxvBOALmIJbwKacjXccyiv9WIllhNBQhcwKDdoYfJIKR1XlzcQbWavO/4GYDjy2bkg1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGrZWZIvK3Ors+xLCb67c8IvhTficYbQX8n2VD7M0nlg2f4lD/
	agfqN3FsQDwdM8T7KbkQNgky/53KeR9qeERvE+cSQS5QHe4egyz15Lhyb0QYqplcK8blGm0g1SA
	iV7GPuchHKfrtOWCyWA==
X-Received: from wmbz20.prod.google.com ([2002:a05:600c:c094:b0:47b:d5ad:dd7f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820d:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-48379b9f278mr197567615e9.10.1771320822308;
 Tue, 17 Feb 2026 01:33:42 -0800 (PST)
Date: Tue, 17 Feb 2026 09:33:40 +0000
In-Reply-To: <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <877bsgu7fb.fsf@kernel.org> <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh> <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh> <aY9HD7nH5A-DtgmR@tardis.local>
 <2026021326-stark-coastline-c5bc@gregkh> <aY9PBfx3RRV7rXZ5@tardis.local> <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
Message-ID: <aZQ19FEeGgigdwz9@google.com>
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 17, 2026 at 10:13:48AM +0100, Peter Zijlstra wrote:
> On Fri, Feb 13, 2026 at 08:19:17AM -0800, Boqun Feng wrote:
> > Well, in standard C, technically memcpy() has the same problem as Rust's
> > `core::ptr::copy()` and `core::ptr::copy_nonoverlapping()`, i.e. they
> > are vulnerable to data races. Our in-kernel memcpy() on the other hand
> > doesn't have this problem. Why? Because it's volatile byte-wise atomic
> > per the implementation.
> 
> Look at arch/x86/lib/memcpy_64.S, plenty of movq variants there. Not
> byte-wise.

movq is a valid implementation of 8 byte-wise copies.

> Also, not a single atomic operation in sight.

Relaxed atomics are just mov ops.

Alice
