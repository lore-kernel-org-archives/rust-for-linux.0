Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AB72F363F
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 08:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783845111; cv=none; b=uCQHgOB5gEc/2h93u33ykp3dFsdqqR7YJ6k/ntfW+iOmiT7Lfmn3R3EiaJPY/3FHH/7S/+Q9uPl6Y1HJb3RzGrtsnbrdKqgJZ9+OP5SabfzikfVHTPeiI23OEvuKYu+icCh9pfpE5Rw1tZLxfNEMLA91SppQzAU9gOIKg75k/40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783845111; c=relaxed/simple;
	bh=4NvJa/NyVgyiaM2aSl+GkHkxDA0TJTJ2Kcoeh+Q4Fwo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aPp5YE8VlBqTHJkeSC7t+7cC88kHzV0t+HJcY7dUtkWzwOIWGvGabCwMiSvH/4xqO4S7I3mkU3LAyL1MiJfGSfjaPWsRf0s46tAmud1w53LVInhBV/RBivisrvNA9NmOJBGj7iFZVO/d8HJ1EYIAEHEq8LP2mZHW39++o7Y1f54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NLS7jzu7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NLS7jzu7"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-493ce4b7777so16122565e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783845108; x=1784449908; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6nI1V0RHF6gUcKFQz9c1yEULGss/rP9N3DVh8v8d/Y=;
        b=NLS7jzu73EwKJh0lf6BoF7mRsjypLIodox2HHjKDq9NAkuLf7WVszUnjO6tN5fr/3R
         6lfsmqRVGHpGOJH1LBftx7xtEiQUQQaixCkxpJXleX4Xg1zxk3phy00sIty3LNPxL87h
         qLobT+wmaevhnMhEvC5HWSphXvvhAFa8aTYLk8UaDTIFfc17x1N8gR/tNrd4ZNq7yvmq
         o2+DPyAh7RymuCpFKlgdzuSTZFArxT9/lCdaLHTFXq/nAMHgj0ACH0vBxnMnP0B0hlpK
         kaG+SIbaqBH1yGslIX/w7CF/TZ2Zy554vU1wimbiOshKQjTkTgKyMOuOSYEq5YA1nq5x
         XEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783845108; x=1784449908;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6nI1V0RHF6gUcKFQz9c1yEULGss/rP9N3DVh8v8d/Y=;
        b=QkkCDz41wpsZUsebL7f6/Sqe9AMfPZMQFKqGz66XOf0uTAkgOFXwZ7XtU9747Qrca2
         m67YKVMKz5HIKmZ2VDzQB8sm/Pm3J/kWVV1ORpQhJdmb6/Mywp4/xg0NSyvaHkTCIRhs
         tv80E53ZT5ND2M12GrnRu8zy8PrzoI8BuYe4skxz+PSVn5CRRrV4zCFxA//HFcHpLmuW
         7OsuqLnPUuC3bpcnyUQD3aZ12mB4r62Z2/HVjVD6Bsjr3LrPi34f3xGF98vnzEycbd7P
         HCFeLnVptK6j5AdqNe3Kk9oVtK3OAYrP79+F13VOOjqo/VQgRknDG9dmn6UWISVwlerF
         Tkzg==
X-Forwarded-Encrypted: i=1; AHgh+RoOMRMthNWnXiiRzU8gjlXN3u+4ulhbFnJAWENO7eaXWNuOImmMnpKFp7JNzLYgh563N0g13HA6LcbcXL036A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx27DbuQNOA5foZPsdqOG0e+Y2kfFkOi2vzwC69PehJjXO7FEfL
	xf05x+ItGhdTkXOeAXCY3zz34m+D8/iYD4VhMV28xOX1Ic8O9mOkZOMknHwZfFZ4/qZRuqIYMd9
	VUSRhx30ak4o8Vv2i0Q==
X-Received: from wmrk19.prod.google.com ([2002:a05:600c:b53:b0:493:c111:8ed4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1394:b0:493:bb45:d54d with SMTP id 5b1f17b1804b1-493f883c8f2mr44015885e9.37.1783845107868;
 Sun, 12 Jul 2026 01:31:47 -0700 (PDT)
Date: Sun, 12 Jul 2026 08:31:46 +0000
In-Reply-To: <alFuU1Uek6t9v_tZ@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-1-2846410e3ae6@google.com>
 <alFMOYlB24vuOxP2@google.com> <DJV6AD2E0WK3.BFCKB6AM6A79@garyguo.net> <alFuU1Uek6t9v_tZ@google.com>
Message-ID: <alNQ8pqlDzf3gQXJ@google.com>
Subject: Re: [PATCH v2 1/7] rust_binder: Add dynamic debug logging mask
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Gary Guo <gary@garyguo.net>, jahnavimn@google.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 10, 2026 at 10:12:35PM +0000, Carlos Llamas wrote:
> On Fri, Jul 10, 2026 at 09:27:37PM +0100, Gary Guo wrote:
> > On Fri Jul 10, 2026 at 8:47 PM BST, Carlos Llamas wrote:
> > > On Fri, Jul 10, 2026 at 02:32:52PM +0000, Jahnavi MN via B4 Relay wrote:
> > >> +kernel::impl_flags!(
> > >> +    /// Represents multiple debug mask flags.
> > >> +    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
> > >> +    pub struct DebugMasks(u32);
> > >
> > > Where is this being used? I can't find it on subsequent patches.
> > > Maybe leftover from previous implementation?
> > 
> > impl_flags macro requires a type for a single flag and a type for flag masks.
> 
> Oh I see. I was expecting the bitops to be peformed on this type
> somewhere. I guess the reason it wasn't is because of the issue with
> module parameters and their C macros.

I suppose we could implement debug_mask_enabled() like this:

	/// Checks if the given debug logging category is enabled in the mask.
	pub(crate) fn debug_mask_enabled(mask: DebugMask) -> bool {
	    let current_mask = unsafe { core::ptr::read_volatile(&raw const rust_binder_debug_mask) };
	    DebugMasks(current_mask).contains(mask)
	}

By wrapping the value from the volatile read (or atomic read) in
DebugMasks, we do actually make use of the DebugMasks type too.

Alice
