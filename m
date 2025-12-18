Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2970D1624DF
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766044731; cv=none; b=K2UolGkSzpkHmYK9zwPlZ/A7+3czdlgBOP3FdGW7znLUIuu5zJVPQrm3UpsYpFRiJPYuWNDm4FwJXtaKYOO7UBwCVzPETnxtLLcnBgks0d1nG0TjVLza4fiX5BTD+3W/kP1irYqERYzuv5KEz8ZBHpgUVb0gzbXjy9zB7mVQzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766044731; c=relaxed/simple;
	bh=ad4JtdXB10kqAwoic4P8PTyGVURX0Aky+Y9cfkr+8hM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sjj+KnfE5fQKHOItMK3GzTg/6UpX/jHe5tvifX9CQtMNky7baODGl++NfcDqkrAOnbamx4Jj9adMaSYCqkiJ2b6/6JVrTSodOpMW9rkDGkXYDSTLQTktb/O7XhUUHzKTfWCifI/ilTXkHBj5dNxa908sx0UPeaoZK38T0FPwUbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SdEdXNmV; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SdEdXNmV"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477cf25ceccso3540895e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 23:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766044728; x=1766649528; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=md62W1YsJCgLupdlzTMxr2/ROOaivn6j126LqmfDgw8=;
        b=SdEdXNmVx66xKqdkBEVLZT3eB3kxCKWVa82X+lKSn9iDPaYzH6lCnck4XGRjRm1zu0
         8AdSwOeWFCQLa/a0CD3pI3EsvUIfrrf3wERyP8T99w0jeEkn5kZX3Easu3DfYviXn2U1
         Ubgk0mh2kkUWhe7jYgt7jgWR5B7VBxhHE/X3UW6qrcNJxs+Vc5dT1rdmNXiAa+Yefna3
         DueNy/ZjL2mf9MeIryrBw5tHa2YVZcJSJNWg+CePTAXlgvIJdkzyMgrZGol9ZsO0t7oU
         dL8z+D3u4nISKVI+TQ2634vBQ85yd2rev/AdG3e+pfzw7qcXQcK2gEx/heEQ1EZWr1Cp
         SDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766044728; x=1766649528;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=md62W1YsJCgLupdlzTMxr2/ROOaivn6j126LqmfDgw8=;
        b=BU9fa59u4LPQMG0mk2d2jVUKR8fURhwmC0H8l6V2ACxqLqxMRWSTPD7MZ8SQGo8Gde
         RQcM4xQmAmHxRPKNW4mxrGY/CuVDIYGpVbx37kPBZWjQUx9emyXRqI0JsHjGWSmxdUls
         gTOziOLo5c+rv5ovxpGGa2DYxZ1OjieL9MEKDpuGKniKt4t/kifrpQEExcvHcfjTnwBc
         E/Y4s5xug+HdZf6m78EpdaVRLDXHk1ucgcxHxuuO1Q4KYrHaC+L90Ze3hmqXhnAUtk/i
         AgoYnwVp5AWhL12ZkXWGMLjvBw7qL2PI6z74NWCEXAumKdWS5co34jbBYDsyEXojVXZk
         9dwA==
X-Forwarded-Encrypted: i=1; AJvYcCWPUtQTJFi0cdtt68MMUUjhxRnAzoR3YZwKL16LSHrO199nbSyRrb+Z4wxDRnkKyGeI9RuBxRmhqYQocn3RDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs2+A2GUST6lr0G2nXupscCnTQmYoxAEFqjH8ikxjd+kDz/2o+
	ZNp1oGIK7Nu5L+drumIVP5odiizUS+nkE9bvrmdJfMqAOHDThuvgCedXu6+miRiZDB3Cuci5DRX
	XqS3p3Go9WwXrTAE9ow==
X-Google-Smtp-Source: AGHT+IFw33aMgISUv1AuO62yzLKJGOLFribtjM3JjoifAhhjILOt1o93zREKql7/vqOneQJ7FTT1vj957zJB/m8=
X-Received: from wmbd24.prod.google.com ([2002:a05:600c:58d8:b0:46e:4c7c:5162])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8115:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-47a8f8a9c26mr206893945e9.3.1766044728614;
 Wed, 17 Dec 2025 23:58:48 -0800 (PST)
Date: Thu, 18 Dec 2025 07:58:47 +0000
In-Reply-To: <aUMcTWJ7ag5VJxnq@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216000901.221375-1-fujita.tomonori@gmail.com>
 <aUMWb2VvA48s0jur@google.com> <aUMcTWJ7ag5VJxnq@tardis-2.local>
Message-ID: <aUO0N4s2ksf0cotX@google.com>
Subject: Re: [PATCH v2] rust: sync: set_once: Implement Send and Sync
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org, a.hindborg@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, dakr@kernel.org, 
	lossin@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Dec 18, 2025 at 06:10:37AM +0900, Boqun Feng wrote:
> On Wed, Dec 17, 2025 at 08:45:35PM +0000, Alice Ryhl wrote:
> > On Tue, Dec 16, 2025 at 09:09:01AM +0900, FUJITA Tomonori wrote:
> > > Implement Send and Sync for SetOnce<T> to allow it to be used across
> > > thread boundaries.
> > > 
> > > Send: SetOnce<T> can be transferred across threads when T: Send, as
> > > the contained value is also transferred and will be dropped on the
> > > destination thread.
> > > 
> > > Sync: SetOnce<T> can be shared across threads when T: Sync, as
> > > as_ref() provides shared references &T and atomic operations ensure
> > > proper synchronization. Since the inner T may be dropped on any
> > > thread, we also require T: Send.
> > > 
> > > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > > ---
> > > v2:
> > >   - update the `Sync` impl to require `T: Send + Sync` with the comment adjusted
> > > v1: https://lore.kernel.org/rust-for-linux/20251211230919.1303926-2-fujita.tomonori@gmail.com/
> > > 
> > >  rust/kernel/sync/set_once.rs | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
> > > index bdba601807d8..139cef05e935 100644
> > > --- a/rust/kernel/sync/set_once.rs
> > > +++ b/rust/kernel/sync/set_once.rs
> > > @@ -123,3 +123,11 @@ fn drop(&mut self) {
> > >          }
> > >      }
> > >  }
> > > +
> > > +// SAFETY: `SetOnce` can be transferred across thread boundaries iff the data it contains can.
> > > +unsafe impl<T: Send> Send for SetOnce<T> {}
> > > +
> > > +// SAFETY: `SetOnce` synchronises access to the inner value via atomic operations,
> > > +// so shared references are safe when `T: Sync`. Since the inner `T` may be dropped
> > > +// on any thread, we also require `T: Send`.
> > > +unsafe impl<T: Send + Sync> Sync for SetOnce<T> {}
> > 
> > The reason you need Sync is because &SetOnce<T> allows you to access &T.
> > It's not because atomic operations are used.
> > 
> 
> I think the point here is that atomic operations contribute to the
> safety of sharing &SetOnce<T> between threads, if the synchronization
> part of SetOnce is not done via atomics (or any other synchronization),
> then SetOnce is not Sync. In other words, making `SetOnce<T>: Sync`
> requires all the following:
> 
> * The internal operation is proper synchronized
> * T is Sync because a `&T` can be derived from `&SetOnce<T>`
> * T is Send because copy() may create a `T` on another thread.
> 
> (hmm... the third condition does looks weird to me, because if `T` is
> `Sync` and `Copy`, the copy on `T` should guarante the drop of the
> copied `T` is safe, otherwise `T` itself is not `Sync`. Gary, do you
> have an example in mind that requires `T` being `Send` for `SetOnce<T>`
> being `Sync`?)

I guess in general safety comments for Send/Sync are a bit tricky ...
you really need to argue that the entire API is designed correctly to
show that having &SetOnce<T> on multiple threads in parallel is sound
(in the case of Sync).

Alice
