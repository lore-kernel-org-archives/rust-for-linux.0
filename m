Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C913D810B
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361254; cv=none; b=uTVmcySkR1Wi6hSIKfCtWdfqm8Aj7oITfODSvxHaPzsdpRkW689RkjM6ld4otyPbH+v1TofnpBlI/rqPq7jamzGlK+QfVbcV7kId75M/XF2nnbzWOKeCHuVn5bZqAmsi9iSEcxewDKwEP48pBd/5LtSKHcK0i+DJ2+/EMT4fkEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361254; c=relaxed/simple;
	bh=693gKCvsQebogFSjkeu/TlT4l+DVpZjtq4arGDyZnB4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kr6lfN6r3nLZAFboAt+JXWEW1jAlAP4+wecV1P0gn+Ym9HcaQPZXIFTNHPZjXjvH0E1RgGP7KnWFNX/xYIQq30lNwnjVYguHZ0aXUGeWzy6sW5o6MntkwtHSc7PX5jz80ONrPya/ntSXmJu37xUrlwP2I2bCa4rXjC7k8OXpNrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=StcKujr7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="StcKujr7"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-488c0120047so65281125e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 00:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777361251; x=1777966051; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ASgHMcdyOja+UjLvOYvO8yAVY8BVDfvhmJ8EyJFi69s=;
        b=StcKujr79HC+jJ9gMZ3UNKAWKTa/RmnOShMGx0crIC0Vb+lgotQG1lQMyeRIG9hW6m
         gCxPzlrHA0k/ZvtfDN78DSs0AvLA26wc5/zSHlzwqMMOsEqara++TKcNKDdeQwpr6ukl
         HSGwjaXI0+teTiw8URBjpFqHgxC7yY4jKsTzwrOx2arOIHwv8ycTj40MEK0EuXqHyDPE
         rAN6xhfn/XGneYBp9GSLfZ/rp3ByopTwctAcq2VTMAt4XuJap2Y3gfHU9ySqQXdGOLeP
         kPN/d6p/32DO3eoOT+kzotIUZfF/0yDYwv3401g6WRTQRFr85GrcNxK1TxlRIZBYtdYo
         B0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777361251; x=1777966051;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASgHMcdyOja+UjLvOYvO8yAVY8BVDfvhmJ8EyJFi69s=;
        b=eQHvDXNOOYB/yNSXsJhALSe10rrW2EaYPEBmlvKNmXkDKWGrBlFOGxs8f2yDi3RO/0
         0O9OQnRhWjioRhtw2/TzM0yNmPAMyfbp9fCweE2a5HTkVtSHsLKixmcv8P9RMD8PtZ+Z
         JZdY59OKcFGbd9GodgUPJdcvoPSGMkrExR8rsFLyP1R/6qOnpqZGZ1mDD61YhDcsSV5F
         4Fp4P8n3T+kPz2GFIOdL1i3bt7OAxQqFgTbiTq9OJhezPLcKrqMfMXBEyT/VrD9p5R2e
         0jQZdoYRUqsHPbQ3dkGLAGzqvqDjJaudc/x4M0u0gGr7Ahc6xJBFGk4IVHYw8cKUfVIm
         AdPg==
X-Forwarded-Encrypted: i=1; AFNElJ8ueQfagbyRuaeeW6plUwtqkf/DhLRgLdweuFt35E2GU2C5Dc/0jkssFWzi3umkFU1mRzP03139uzTL2c7B+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPCurwd2K+xtqzVJ0VXju4Vrkn1kIrCE1x0a5s60XbDzXgL1In
	JXIuK/7OjiArF3QHmoI2/3TKP5M1ewzHFWRWttkzB+A2mT0jbGWue57aYOe6ddDTVert/N5skZx
	VMoRf4W7gwBzuZQMC6A==
X-Received: from wmna22.prod.google.com ([2002:a05:600c:696:b0:488:c011:ff58])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1a:b0:489:1c1f:35f9 with SMTP id 5b1f17b1804b1-48a77afd2a5mr27534755e9.9.1777361251160;
 Tue, 28 Apr 2026 00:27:31 -0700 (PDT)
Date: Tue, 28 Apr 2026 07:27:30 +0000
In-Reply-To: <DHMWK36LPD3S.2V9DV6BT60YJ4@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch>
 <20260403220751.15374-2-t1bur0n.kernel.org@protonmail.ch> <adS9JslFrhFK57os@google.com>
 <DHMWK36LPD3S.2V9DV6BT60YJ4@garyguo.net>
Message-ID: <afBhYqOOG0H3AZkp@google.com>
Subject: Re: [PATCH 1/2] rust: list: fix SAFETY comment in List::remove
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Christian Benton <t1bur0n.kernel.org@protonmail.ch>, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, Philipp Stanner <phasta@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 07, 2026 at 12:56:52PM +0100, Gary Guo wrote:
> On Tue Apr 7, 2026 at 9:15 AM BST, Alice Ryhl wrote:
> > On Fri, Apr 03, 2026 at 10:08:15PM +0000, Christian Benton wrote:
> >> The SAFETY comment for the call to ListLinks::fields in List::remove
> >> was left as TODO. Fill it in: the call is safe because T::view_links
> >> returns a reference to the ListLinks field of item, and references are
> >> always valid and non-dangling.
> >> 
> >> Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
> >
> > Thanks. I agree that `item` being a reference is the only thing needed
> > for this to be sound, as reference implies that the pointer is not
> > dangling.
> 
> (cc Philipp)
> 
> FWIW, I want to change `item` from a reference to a raw pointer. In Philipp's
> WIP DRM job scheduler implementation, there is a case where the list is
> conceptually a list of `UniqueArc`s; each job only needs to handle that is
> sufficient to locate the item in the list and remove it.
> 
> I suggested to him that keeping a pointer and do a list iter with ptr
> comparison is sufficient to achieve that without needing to do additional
> reference counting. Of course I don't want to iterate the list when I could just
> call `remove` function on the list itself; for that use case I want to change
> the `remove` function to only require a pointer (with additional safety
> requirement that it is valid).
> 
> It's orthogonal to this change as I'll probably be more careful about pointer
> provenance too when making that change, so just a heads up.

Could you explain why? Is there any scenario where the caller couldn't
just create a reference to the value from their raw pointer?

Alice
