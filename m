Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2995A3F2100
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783538; cv=none; b=J2iU+PCTMOqgbrewe9D8jFsASKajgEPQucXRoSfSUTBc4eLBsVEgqoeyLZPWMOwhuw2qyWD90whavcg5B0aWFzIkbBK4+ObG3fp3ZJiLw0mH8/Rr2gVVWIjl709fz3GkfpJNoR5TnYqtJuH9fl+Y+5zWYfRnVpMIHKL/z2J4BOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783538; c=relaxed/simple;
	bh=7niFG9/AZ4h0fVbgmDIlzY0MiF7J4W9t/JK+zQnyxJU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bTDnIYS/eoNVQ/Ervsbu4hLKpCCwI96VPfg6ofBLKVW3i3dMrUeTJvwJbUhnBwBGtaby+bvW0HyQy1fb8K5EWMk6CA2blUbX9FEElZDeZ1S++wLC6Zo3ijSowKyqx6JTbPhoaaRHJQwUVdkZhl0OkY/CLOh0L4rSxtLE4+R7yMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vKgDeQGs; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vKgDeQGs"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-68d2339febdso1011614a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 04:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781783535; x=1782388335; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie54XBlJiwbzPpYadYFiDhi5QYnEibA9pAPd/2K7DBE=;
        b=vKgDeQGsJ4doJjEYzCRMsMCsEM59EyvlP9jLghE12tMu3AgNtm73MpBpW0No4+G3WP
         6A7HBCZDk602o918vpMgwvB6Q+guZ82D2AgaCUaQQVVz5rpNHO9TohIrIjZ+nnhYt5KZ
         EJYnS/M+5+WaT6QnFldshq2iR7dxxUpLS9NsUz54axlDiXVwkDcBe+8wxXyZgQ51kabg
         wzvQKxf38rbQ/bhkouQh/Q65fhUFt4jUp8gXgReb3BaGSNlvsK9imRO9/SVwV6GP9bIw
         1/IJjZ38iup94CPshdU9yloxtAWXeXm284I5t9HvZtYvoabsrYm/IBeTdOxy5DjQY+QH
         /x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783535; x=1782388335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie54XBlJiwbzPpYadYFiDhi5QYnEibA9pAPd/2K7DBE=;
        b=GFsjM/xZaGkGuMTiAFwr5se7syM+YzOQupZypdDe89hpnUqY1bUofoyBMz9X/xDy11
         GqlfnEMahm94tLc/x1YCWy6B2RxXvetNKskjQdpZqSM8HORrmVU/WObB+KtFn07Q6QjV
         gyP2uWHOhO6ALocDLQsmJ9slWoMcbYHCBO/Tu09AGU/GWjqXT50PQdf+j07oGfixgqn2
         IqWJ22eOjrTfCPK49m3Mdzr8inHN6vpZ5g8mim3e+gAevBt/+26hXNoRbeA91Wf/G168
         wz06g76xVgiyoLL1yRbliAkcUhDUmn6S3bgzsmB8N3tYs9g11Tf5eiMPz9uv/CYuCMph
         q+RQ==
X-Forwarded-Encrypted: i=1; AFNElJ/A/rW6gfu50b7MU4CEiSwi9TzwWGvuEECJYAsmpRaczHI4f9rfV16bUoHynbsdg11OoRWWxng4cgM7VM9UWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaKP5jt0C3fBxj2OZBfx3kV99KAVqEran7w6KGus8OKih3cQ8A
	9DCwQU/4nwRU9q2K+AQ+/KcnniDx5e7GxqUZmCT9R1h21Os/CEQItK33ah4vUBR736aIMbdw4fT
	v3BuivNFpVZFKdnWLhA==
X-Received: from edts15.prod.google.com ([2002:aa7:cb0f:0:b0:695:c34c:a390])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4498:b0:695:d60e:4efa with SMTP id 4fb4d7f45d1cf-695ed3a7890mr900361a12.24.1781783535142;
 Thu, 18 Jun 2026 04:52:15 -0700 (PDT)
Date: Thu, 18 Jun 2026 11:52:14 +0000
In-Reply-To: <2026061856-rare-envoy-d585@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260617222030.15189-1-iganschel@gmail.com> <2026061856-rare-envoy-d585@gregkh>
Message-ID: <ajPb7jLf5dkU_Amk@google.com>
Subject: Re: [PATCH] rust_binder: check context manager before creating node
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Keshav Verma <iganschel@gmail.com>, Carlos Llamas <cmllamas@google.com>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 18, 2026 at 12:27:49PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 18, 2026 at 03:50:30AM +0530, Keshav Verma wrote:
> > Rust Binder currently creates the Binder node before checking
> > whether a context manager is already registered. If a context manager already
> > exists, set_manager_node() returns -EBUSY after node state has already been
> > created.
> 
> Odd line-wrapping :(
> 
> > 
> > Add a check before creating the node to match the C Binder ordering for
> > the common already registered case. Keep the final checks in set_manager_node()
> > so races with another caller are still handled after node creation.
> > 
> > Signed-off-by: Keshav Verma <iganschel@gmail.com>
> 
> What commit id does this "fix"?

There's no need to mark this as a fix. It's nothing more than a
fast-path that does less work when exiting on error. As the commit
message notes, the existing error check after get_node() is still needed
because otherwise two threads could invoke this in parallel leading to
multiple context managers.

> > +    pub(crate) fn check_manager(&self, cred: &Credential) -> Result {
> > +        let manager = self.manager.lock();
> > +        if manager.node.is_some() {
> > +            pr_warn!("BINDER_SET_CONTEXT_MGR already set");
> 
> How can this be triggered?

If two processes try to register themselves as the context manager of
this context, this occurs. The warning should probably be using
rate-limited printing.

Alice
