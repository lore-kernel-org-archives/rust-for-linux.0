Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE96C329C74
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730012; cv=none; b=Ya8h1I8OHqKeUAhcs9SQPv8ZMJMuulWKOnZvL4idrqSBYC0+fPOav0Uw4ehwjIQ3CSi8ajAYkaQWzN2TthR+Ub4tnpiGaXOJaCAFsIWuB1kAqWZAbLlOn2RPUVWNP3ZvX/NtR0a+QHGFH6TlkwRtXdaV6A+j7IVTRXxprg91fic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730012; c=relaxed/simple;
	bh=vR75fwMbIvJ+FBIzC5dmd0aaO1PZ2nI36YQLTxKU3VM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gBnGcLu30ONyOWnlaV6pXjFUp1OdzLFRZSFcS7KozBjscCpZKuWHKL+iYNe0meWJrhwFDjgmKS8JyIAR/loAjrkbe5ov6xb0BHhKo1Y4+HIb/XXn1n+o9IcD4occG3JFcahn3nFs42lq+7XEpD5va/7V1X7stXQYRk3uqZCl2mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4Yy7LRvb; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4Yy7LRvb"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-483129eb5ccso15492955e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 05:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770730009; x=1771334809; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdusrkF1rdhhHjrXLuahuHjKwfdA8TDoSd3qb4xa01Y=;
        b=4Yy7LRvbbpOdQaRlYaxRvbMbpNgwX6X3KSsieZadL+91xmUV5qPfwukfI+Cn29xHVX
         3XQY7i72cyvTpor4iArUN0VmDD7/dDDQUTfJ7tDwtMDSkvH2iah6aqlzRu4+Xewq5ShJ
         f7oqiNuPAW8hU97aCzGn+JVMCoLD8ohVjT1PNlEvvzNXA+13WB5C7NGkF3ZheJ8MgogB
         lqMlo5SmTEMCU/qTKmQEIz2pzIjIsVmVAsUUH5EeJIUJ72oWf84eAw0cvOKZrEx5PVd+
         L5fK8I0kzc6FcFbgB41+68A9Fpyx9EkXG4W0mrXUZLeHUGxcy76yyoIGIEPY1SHHwWXI
         8xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730009; x=1771334809;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdusrkF1rdhhHjrXLuahuHjKwfdA8TDoSd3qb4xa01Y=;
        b=K8SBftnmt/XHYDqHxw0LktXWGjnRLuy+5JU/whTyYkP8glts8KgYicp4xEnkU4tBAO
         ks/15h2gduKmaFJRBwFlw8Miv9FtAWMdmNPF72g5xtLA6CtSRSP7r0/CP6FZOGuL4MuE
         s4KVYJLt1dNR9I+zfV7vGzl8DS11SKvFP0W0/SVnFh61AA94kbmM/aoRBF6CFDTpSf8l
         YK78T7SYb1ULwbirNwqPcEX5I3ZQ9aLhY/G7UxgV+/qqTwESl9HB6sKMG5Go22coLRFK
         jIQs0ODZ8iaF6pa/qi0QtpjyuUuO+48DYeHW149vSg7vcdCxDYwpQA4lU6KN+7dRrC5d
         e9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUlMNQFCyh2L/ihHmR9Jzmu67axy3vo56Kr9sUiFKkJk8xUL5+GWiBghz//rrmi4GeaHrhZfz0pLLBjhlYltQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWsLOLvQd8U0EiYG0I1y4bnuH28WMdZA1ZFKL5bbE+NDyo5Am/
	pO+FSq2XBL89Sw87xmyi6rB3azH66ULufe4v/LaeZ0OD29oS6ECpg+y0TGYT3mTmjADGigyyC2D
	LGj9wtZxQdHw1aZ5EbA==
X-Received: from wmjf25.prod.google.com ([2002:a7b:cd19:0:b0:480:4a03:7b5d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b8a:b0:480:1dc6:269c with SMTP id 5b1f17b1804b1-48320231241mr195023655e9.37.1770730009431;
 Tue, 10 Feb 2026 05:26:49 -0800 (PST)
Date: Tue, 10 Feb 2026 13:26:48 +0000
In-Reply-To: <20260210134913.33cb674f@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org> <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210134913.33cb674f@fedora>
Message-ID: <aYsyGAwy4rq-H7Hd@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 10, 2026 at 01:49:13PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 10:15:04 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > /// The owner of this value must ensure that this fence is signalled.
> > struct MustBeSignalled<'fence> { ... }
> > /// Proof value indicating that the fence has either already been
> > /// signalled, or it will be. The lifetime ensures that you cannot mix
> > /// up the proof value.
> > struct WillBeSignalled<'fence> { ... }
> 
> Sorry, I have more questions, unfortunately. Seems that
> {Must,Will}BeSignalled are targeting specific fences (at least that's
> what the doc and 'fence lifetime says), but in practice, the WorkItem
> backing the scheduler can queue 0-N jobs (0 if no jobs have their deps
> met, and N > 1 if more than one job is ready). Similarly, an IRQ
> handler can signal 0-N fences (can be that the IRQ has nothing to do we
> job completion, or, it can be that multiple jobs have completed). How
> is this MustBeSignalled object going to be instantiated in practice if
> it's done before the DmaFenceWorkItem::run() function is called?

The {Must,Will}BeSignalled closure pair needs to wrap the piece of code
that ensures a specific fence is signalled. If you have code that
manages a collection of fences and invokes code for specific fences
depending on outside conditions, then that's a different matter.

After all, transfer_to_wq() has two components:
1. Logic to ensure any spawned workqueue job eventually gets to run.
2. Once the individual job runs, logic specific to the one fence ensures
   that this one fence gets signalled.
And {Must,Will}BeSignalled exists to help model part (2.). But what you
described with the IRQ callback falls into (1.) instead, which is
outside the scope of {Must,Will}BeSignalled (or at least requires more
complex APIs).

Alice
