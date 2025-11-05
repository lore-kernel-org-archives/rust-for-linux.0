Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F5C3596B
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762349898; cv=none; b=nC32/Iz7hW0opU3kLk9YA6zJDZdiO8VOmHOTaj/onGsBOwftlx5XFWbe/qUif0zxNp9SUGOVjNLJB4qotzJIun6OHKsW9XZDWiPZrvJOzVlP4zsoUPj0N2f4MgQMQMDK6L336eMF/jNuxi0lhgqYp3n02EjBPgVTkbgQ9okrSvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762349898; c=relaxed/simple;
	bh=fPyRN5C2LXdEknbgQiipHq/aLIT5GpJ1C6M6XDpNB7A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YyH+PZuTWUYdPWesWLOXratMgNet9breDyh3SLwVc+AYtajOyYtk+IFhYw7Sa57kWn45sMwFeQyFeysCZAUqTU1nZSFLh++a5hKfV8ZoMEro6DcTdeWGhqEe3KesUcHLmfHvCm/bfs75ca4YfEq3Wg6umkOJ09hvzig1km3q5QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aS2ZSsli; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aS2ZSsli"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b3cbee9769fso852905566b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 05:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762349895; x=1762954695; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JXPfS5P+i9wz2n3+/G3PDvGDksrBlOY+wEqrkoKiF2o=;
        b=aS2ZSslii6bI9lO0TeK5lz0KGYVNK13McfR+U/+6nYmLxE/WWCExbMti9KsK0we2ly
         gKtxdBr7knPhsyVnbCJUD5E7Fo/s19zBSuwwBi1u5jtMW7F0tb566LMVmn6jOyE8WOHA
         OIlKVn9yGtkAxDq2iVaPxg8wiUntRLoe0QKv1BvoZC/SyZ5eof+h37+IYCtUh+2mXUTw
         ttLEp8n2c+zaPt0t5SEv18SVh4W0gZlizSAv4d0LhcDA5h6+OyVQ89W05fF+cnbx2b+z
         CWC9Til6TI9p4gY+fgJ+9b2yIywglQhsT0ET3vdNlDoMv0Y0hA3tPo5gVUUZnYe1hfPL
         PYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349895; x=1762954695;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXPfS5P+i9wz2n3+/G3PDvGDksrBlOY+wEqrkoKiF2o=;
        b=g9YjdFfq+a54L4ptfBsWNq6KXawmV0r/+VSsXog+dJvmVy9xbslLrKin2/vJ4RulSt
         rXdgdX3PAjjrKli7HsgpR/XT4oFw7OiT+0u5ma77JrCWm66W5OjPEkFsONdO3aon+29s
         S3S0sv9XuFMUMN426q5QRAfNdhMuqUs4CCXBZonHXHc78pPgNcr2iyWcAMgCNPz3Cc/d
         g6IGQnPEn9h0oC411vPRn2MHJkLjkuR5DBssfOh4NHpg95hyxKMKiPQvlLSs9xpvzCkQ
         76tbruE8PWRUhMYixoVkAys8pN4+7IPM4ZlPJ2HrVmPBRiVZV1NBN0bH01Npi0n4O8ut
         uUMA==
X-Forwarded-Encrypted: i=1; AJvYcCXDl27fCKKZk7rA8T+wcqZmQF9SrX/GuycrwEw/Cjr9Trd/y5SCGJzSCyrSss1HJTd1Ykh5HVrZn4BwS0OeHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7xrO9iT31OUX31yOX0n32CUaBbIbcaE0Wt90zEJBPbRFN8kqN
	sD+aniTBba1dCdpBkEkRyISsOFepDX+HKDCuggRlesg7lneRHWx0ej+BpDxw9wo9SjxU2bLsFWv
	OMu59JQseo2T0dIKbJQ==
X-Google-Smtp-Source: AGHT+IFQ7VWy9R3tnMU7Z7r1BFutuiMgS7RDcATHKFeq/XKdiw0+E0YiW6CR8TImH9kk6u+zM32/YouAgDPJtgM=
X-Received: from ejcwe11.prod.google.com ([2002:a17:907:d64b:b0:b70:4324:e1d8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3da4:b0:b70:7196:c8b3 with SMTP id a640c23a62f3a-b7265607958mr284971766b.61.1762349894947;
 Wed, 05 Nov 2025 05:38:14 -0800 (PST)
Date: Wed, 5 Nov 2025 13:38:13 +0000
In-Reply-To: <b3f50745-5351-4e69-b3e2-ede99511e8dc@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <df3a68334760b2b254219a69426982bf858dee39.1762221537.git.chenmiao@openatom.club>
 <aQoIliAbrn0Re7E3@google.com> <b3f50745-5351-4e69-b3e2-ede99511e8dc@openatom.club>
Message-ID: <aQtTRUMUaaUmTAWZ@google.com>
Subject: Re: [PATCH] rust: kernel: Support more jump_label api
From: Alice Ryhl <aliceryhl@google.com>
To: Chen Miao <chenmiao@openatom.club>
Cc: ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"open list:RUST" <rust-for-linux@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	hust-os-kernel-patches@googlegroups.com
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 05, 2025 at 09:28:39PM +0800, Chen Miao wrote:
> On 11/4/2025 10:07 PM, Alice Ryhl wrote:
> > On Tue, Nov 04, 2025 at 02:04:17AM +0000, chenmiao wrote:
> >> The initial implementation of arch_static_branch was achieved by accessing
> >> the offset from the original type. However, this approach extended the
> >> path and introduced redundant calculations when dealing with types like
> >> `static_key_true/false`, as shown below:
> >>
> >> ```
> >> static_brach_unlikely(tp, tracepoint, key)
> >>    => tracepoint->key->key
> >>    => &tracepoint->key(static_key_false) == &tracepoint->key.key(static_key)
> >>    => off: tracepoint->key - tracepoint
> >> ```
> >>
> >> In practice, the implementation of `arch_static_branch` overlooked many
> >> detailed descriptions. To improve clarity, additional comments have been
> >> added to the original logic. The approach has been modified to directly
> >> locate the corresponding `static_key` instead of using offsets, thereby
> >> reducing  computational overhead.
> >>
> >> If finding the offset from the primitive type is necessary for this
> >> implementation, I will abandon this change.
> >>
> >> Additionally, support for the `static_branch_enable/disable` APIs has been
> >> introduced.
> >>
> >> Signed-off-by: chenmiao <chenmiao@openatom.club>
> >> +    ($basety:ty, $branch:expr, $key:path, $keytyp:ty, $field:ident) => {{
> >>           let _key: *const $keytyp = ::core::ptr::addr_of!($key);
> >> -        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
> >> +        let _key: *const $basety = ::core::ptr::addr_of!((*_key).$field);
> >>           let _key: *const $crate::bindings::static_key = _key.cast();
> >>   
> >>           #[cfg(not(CONFIG_JUMP_LABEL))]
> >> @@ -30,7 +71,88 @@ macro_rules! static_branch_unlikely {
> >>           }
> >>   
> >>           #[cfg(CONFIG_JUMP_LABEL)]
> >> -        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
> >> +        {
> >> +            $crate::jump_label::arch_static_branch! { _key, $branch }
> >> +        }
> > So ... this is changing from $key to _key. That's replacing the global
> > variable with a local variable holding a pointer to the global variable.
> > However, the arch_static_branch! macro uses the `sym` operand which
> > requires you to pass it the global directly.
> >
> > Did you try this code? I don't believe it will work.
> >
> > Alice
> 
> I'm very sorry for making a fatal mistake. My misunderstanding of sym led to 
> this issue, so I shouldn't make any changes to that part. However, regarding 
> the other modifications, I believe it is necessary to support the direct 
> passing of structures similar to `static_key_false`, just as in C language.

It sounds like you are adding a new use-case for this macro. Can you
provide more information for this new feature? It is currently unclear
to me exactly how this will be used.

Alice
