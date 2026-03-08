Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0A7229B32
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772983390; cv=none; b=joOaloL4H0+/WUlMjbonMWUSfj8ZNR13C5UdGwz6SZqeAD4LWyJHVVZnDGOmXCFHiz+0a7Wpukbbm3q7e2rumr0gNdZzYfQ7DQjGJLrhcAERoG5HVL+DsFg6fDEIH/Zq0o8sILYJgU5+cXlBQ5GoFI64z5dF5zegS9p5Xi5GKTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772983390; c=relaxed/simple;
	bh=PV2KW+B+16f4whHFM1Va04VxOs8VP+ZJG+J8NyMoyP0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lZmsMvwALT3mCQA789p/1sSSOZrk7aGhlINj6bnJ4WoW5IoHlmBE5RZKD1glD4dUH9NJShf/oTDCsGsUVtWa55F0i5uuBoAa/Xyoxoks6VvxxrS/njWJNyhJgifExgoKtbpr/fUa3n9yJy+pAwZc0FLUJAYEj0gbCO6s19HsnzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g+jwepuV; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g+jwepuV"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-439b20722e3so3825297f8f.0
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Mar 2026 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772983387; x=1773588187; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxHREOl1gWgasyiRcE2Gelqt0sxFq70SlRQGJSqCTEA=;
        b=g+jwepuVw1xchO0HeC50fAoYtIbxKabUT8OuCy50lioOSlNdmi7uSTjBfe1aD/68Vs
         +1BjslUkP4MYaY8rgCbdFMVEAJUwqFr3fohmxD62tD0Zn+yh3q9yFzd1Yh9EDT42XcnB
         IuvK56rGNMBrXO3QxLIMuZK7O/AzNvrO4X8KU+fxb71meIK6IehVpmUGbbMoA2B/RqS3
         CMIgHY75tGforCiPE2+DEOf+GaujUU1YCyVR/AA1kpE40J2mmW+E6yCE14gilEnmY5vV
         gA3e2O2jrL/Eau4pmSGwbgcawpsHJPRF+tsTIdniK2xRLJn+eKahVAib5Lxv8uVm9zeO
         4GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772983387; x=1773588187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxHREOl1gWgasyiRcE2Gelqt0sxFq70SlRQGJSqCTEA=;
        b=ZUZ2NFI02XF562v1ZQsNCOSrUehC6qgAu4QMWSqTuzRDdOhIu2+Bsg1aWkGZwTjyaj
         zM05ag1XSf7q02i/mVNBfPcgN7ThpxA3+0YYveUeCwVHgb1jaRkkHyINaugZ7lhbuTPr
         FYUSlcCEamZiOGDZHrpTs/caItsz3a1ROXfAnC1cH2Yw5rRY7BMpdODM6t2Ymvy0Fmpk
         OyZUjcnF7VaAYGzKtJBYYBYNz3MDb3ssMX/d0Dep8yyL8TiWHjdy0ZAGxkj75n0r4W+4
         kRzbiwd2cHZ4qHoDKPTssEilbEzdoyVSlrbVfxKXK6hpst7+AJMzFxO5Zj6hdublDtUJ
         5RLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtY86FIF5WEXNpX9BxEEE1sYxx+NoiQjvRyyGES2gOE9PkP5aSPJy6l4bH38AVjSmjPhOIYDIaMDIaFrQkbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylDbRydrn5qkroakld9DLq+NMhpft9bz0H81pa8VlqliwqC/zb
	k1iERvz2MojVXLGOPX1n7rLXDXSfxVghy4DVBpwwLYU1qAz4AISu0bXMeZSBLH+lmcXVjQYopI9
	TnrZga6PAi8Xhq93XnA==
X-Received: from wmej4.prod.google.com ([2002:a05:600c:42c4:b0:485:2cf0:2668])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e2a:b0:483:c771:10e with SMTP id 5b1f17b1804b1-48526957d6cmr135306345e9.20.1772983387265;
 Sun, 08 Mar 2026 08:23:07 -0700 (PDT)
Date: Sun, 8 Mar 2026 15:23:06 +0000
In-Reply-To: <f93ee07b-5dfd-4748-a7f2-814539e60d81@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260306-binder-netlink-v1-0-daceb5bc83f2@google.com>
 <20260306-binder-netlink-v1-1-daceb5bc83f2@google.com> <081b1f16-5c8b-4a18-a9f1-d56e757de4c0@lunn.ch>
 <aayYhgy3pRxFWbr7@google.com> <f93ee07b-5dfd-4748-a7f2-814539e60d81@lunn.ch>
Message-ID: <aa2UWlN8waUrQ8ij@google.com>
Subject: Re: [PATCH 1/4] rust: netlink: add raw netlink abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 08, 2026 at 03:48:40PM +0100, Andrew Lunn wrote:
> > We can make a kernel::net module (rust/kernel/net/) and put it there
> > instead? I guess netlink.rs can also be a submodule of that.
> > 
> > Hmm ... but I'm currently using genlmsg_new() / nlmsg_free(), and I
> > assume the other use-cases do not go through those methods, since they
> > sound netlink specific.
> > 
> > To be honest, I'm new to the kernel's networking stack, so I probably
> > can't design Rust wrapper for sk_buff that supports all those different
> > usecases without someone walking me through how it works. It may or may
> > not be best to write a netlink-specific struct now and expand it later.
> 
> At its core, an skbuff represents a block of memory. Normally that
> memory would be packet data flowing through the network stack. You can
> append to the front and back of the data in the buffer. You can add
> the buffer to linked lists, there are reference counting operations,
> so the buffer can have multiple users, there are places you can store
> per protocol data, and places you can store data while within one
> protocol layer, etc.
> 
> When using sk_buff for packet data, you are generally on a fast path,
> so much of the code is in header files as inline functions. This is
> going to make rust binding harder, my current understanding is that it
> is hard to make use of such functions from rust.
> 
> However, for netlink, its is slow path code, it seems like all the
> functions you need to call are in object files, not inline headers.

There are several static inline methods that I need to call. Here is the
list:

- genlmsg_new
- genlmsg_multicast
- genlmsg_cancel
- genlmsg_end
- nlmsg_free
- genl_has_listeners

And on Android devices running this code, they will in fact have been
inlined into Rust code, permitting fast code without function call
overhead. Inlining happens via my other (recent) patchset [1], which the
Android kernel is already using in production.

[1]: https://lore.kernel.org/all/20260203-inline-helpers-v2-0-beb8547a03c9@google.com/

> I also suspect, but don't know, that the netlink upper API is disjoint
> to the packet handling upper API. How you allocate a skbuff for
> netlink is different to packet data. It is very likely an error if you
> try to transmit out an interface an skbuff allocated for netlink
> usage, etc.

If that is the case, then it sounds like the correct API design would be
to have a separate NetlinkSkBuff type so that you cannot mix them up
with an sk_buff used for packet data.

> So, maybe you can have a base definition of skbuff in rust/kernel/net,
> and build on top of that to make a netlink specific skbuff, with a
> limited list of methods which can access it, those needed for netlink?
> Make use of the Rust type system? And leave the messy fast path packet
> data things for somebody else.

That makes sense to me. If there is duplication between the two sk_buff
types, then one can be defined in terms of the other (or maybe it's
easier to not do that).

Alice
