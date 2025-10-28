Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F12D7DDA
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 21:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761688088; cv=none; b=RaFMuJ4YrL7dXmPCr+jr2nY2chriMetFf2pUHPKy0iUgFDa08hPWxotUM8JvfIOHsZLawehcVrJI4jgGHdlumC1gD1FCdk+d163fNXoksIkIIKx6zXE2pzbQHiGDp3Kr51IwNmDohRuN1+RysPJKt3b/DsySyvJL1izof/44V2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761688088; c=relaxed/simple;
	bh=xnWAo3zUl6Gff87g0btQedPx1DAW9IRA0yDqbJp/pPI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dq+vL/NjqMbDNgUAigNQQUhy6L3H7KGyyaKhkCilK8KULuH56Y+TeNfc63vAjv+EJ6wYo2Y45hayt3QpqqsTIeAKOZOgxeav7qQkt6Ayqzihv8nzmO9MX4nHTaPxMJOIiGltIpAf/zg06A4nnMI5IcErpYoLTMyfvFe181NyzE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NblzW3VI; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NblzW3VI"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-63c588cb6d5so4293437a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 14:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761688085; x=1762292885; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a1rwNT7AoFhufoGiv/tnU9FtjWDK0AyzLDsdNZZgJak=;
        b=NblzW3VICih2GMr31DW3LWLKiKM2HAvSEzgep48yShOQUnwIkhVNZ89fs7QGXJL5Ch
         iQlz/C0z0XZOMvSRCi/dRYEkKj2BNsZ9U4OqCzkI52d+c8L4FpXRcmLrz5cOeQsAt63n
         q1A1Gl+R/Q4SC3RRczwePClycIpO2e+VojYguiRDAjFWvnjUdnLeJQzOoGPx2YXtlFo1
         cpfCL8ceJEsQlAVGdTs250UkD7vApSQsPFp5XVbhNwk16uDnHzTH/NDmuxHPhNGxaXJu
         pQOJww0yUOuD/V8Ak09p5ftsB1zi1yWQjngGR+n2XULNt8UkiNTIn0BtuQdR8OYBZSt2
         i/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761688085; x=1762292885;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1rwNT7AoFhufoGiv/tnU9FtjWDK0AyzLDsdNZZgJak=;
        b=faZB0qngPPN6OaT2TaiThD7roH01557cBg52oIRWcpSLa4lmim3qoCayoe3yfi2fmS
         A9ahFId+kKSHt9fIwhQK2c1Q0JOAL+37D0ycKUAU8YeoDURbLZgGsNrpMogN6sJDmERf
         bhadOYMDXfiYThQaCtVO9aKaedSl1jhBVeFBqMMPavygd9hJsKPPHwAIwfAWfMKfwD2P
         ABpZrWsRFUcOm3Kk33fVsQbl2pnxw1eYy9NunduL4RMyQVNuiwrfcd8CiJVjY+pniQYg
         SYxWyyTVPlnaX/5p3Q9S+edAj+3082GNyjtF8z4wEj70PTm2bi0TCdlsNNAWz167IHIQ
         Vjfg==
X-Forwarded-Encrypted: i=1; AJvYcCXKJlbESQt4wsVO5bckuNQzjDZqhSKFK9AaqtS893zqD4KeYSR75bm1aqgTcFynhq2VA03nGI3goXnv9D3k0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvhdeT0J/FKa/z5zCXRNWqIfSl7c7BKHtJU11GeXHPcKVJ5IOo
	bNndDgMZX2TcMi2fGvQkXyBtsRs63zp0P0WErYB6ihK1LNYa18sPBClN+meqePt6izgu1ysq2Xq
	8lVRAkMIcbGMYKUimmQ==
X-Google-Smtp-Source: AGHT+IFq7poWf2sgLrm3BVNZylI1NJluksrbA9l1DBnB4++RIDBy8ODLNpGUK+5h9JR8qw+jZ9tjisMbHT4ls6A=
X-Received: from edi25.prod.google.com ([2002:a05:6402:3059:b0:639:e051:c411])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2686:b0:639:7c6b:9745 with SMTP id 4fb4d7f45d1cf-640441c1efemr482701a12.13.1761688085213;
 Tue, 28 Oct 2025 14:48:05 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:48:04 +0000
In-Reply-To: <aQEOhS8VVrAgae3C@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251028-binder-bitmap-v3-0-32822d4b3207@google.com>
 <20251028-binder-bitmap-v3-4-32822d4b3207@google.com> <aQEOhS8VVrAgae3C@yury>
Message-ID: <aQE6FOn_9Z84NMnG@google.com>
Subject: Re: [PATCH v3 4/5] rust: id_pool: do not immediately acquire new ids
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 28, 2025 at 02:42:13PM -0400, Yury Norov wrote:
> On Tue, Oct 28, 2025 at 10:55:17AM +0000, Alice Ryhl wrote:
> > When Rust Binder assigns a new ID, it performs various fallible
> > operations before it "commits" to actually using the new ID. To support
> > this pattern, change acquire_next_id() so that it does not immediately
> > call set_bit(), but instead returns an object that may be used to call
> > set_bit() later.
> > 
> > The UnusedId type holds a exclusive reference to the IdPool, so it's
> > guaranteed that nobody else can call find_unused_id() while the UnusedId
> > object is live.
> 
> Hi Alice,
> 
> I'm not sure about this change, but it looks like a lock wrapping
> acquire_next_id().
> 
> If so, we don't protect functions with locks, we protect data
> structures.
> 
> If the above is wrong, and this new UnusedId type serializes all
> accesses to a bitmap (lock-like), or write-accesses (rw-lock like),
> then this is still questionable.
> 
> Bitmaps are widely adopted as a lockless data structure among the
> kernel. If you modify bitmaps with set_bit() and clear_bit() only,
> with some precautions you are running race-proof. The kernel lacks
> for atomic bit-aquire function, but you can implement it youself.
> 
> I actually proposed atomic acquire API, but it was rejected:
> 
> https://lore.kernel.org/all/20240620175703.605111-2-yury.norov@gmail.com/
> 
> You can check the above series for a number of examples.
> 
> Bitmaps are widely used because they allow to implement lockless data
> access so cheap with just set_bit() and clear_bit(). There's nothing
> wrong to allocate a bit and release it shortly in case of some error
> just because it's really cheap.
> 
> So, with all the above said, I've nothing against this UnusedId,
> but if you need it to only serialize the access to an underlying
> bitmap, can you explain in more details what's wrong with the existing
> pattern? If you have a performance impact in mind, can you show any
> numbers?
> 
> Thanks,
> Yury

Hi Yury,

This does not change the locking requirements of IdPool at all. Both
before and after this change, acquiring a bit from the pool uses the
signature &mut self, which means that the caller of the method is
required to enforce exclusive access to the entire IdPool (doesn't have
to be a lock - the caller may use any exclusion mechanism of its
choosing). In the case of Rust Binder, exclusive access is enforced
using a spinlock. In the case of the examples in IdPool docs, exclusive
access is enforced by having the IdPool be stored in a local variable
that has not been shared with anyone.

It's true that the underlying bitmap supports lockless/atomic operations
by using the methods set_bit_atomic() and similar. Those methods are
&self rather than &mut self because they do not require exclusive access
to the entire Bitmap. But IdPool can't provide &self methods. The
existing acquire_next_id() method has a race condition if you tried to
perform two calls in parallel. But even if we changed it to perform a
correct atomic bit-acquire, the fact that IdPool is resizable also
incurs a locking requirement.

The only purpose of this UnusedId change is to make use of RAII to
automatically clean up the acquired ID in error paths. I avoided
setting the bit right away for simplicity, but setting the bit and
unsetting it in error paths via RAII would also work. But there would
still be a lock in Rust Binder that protects the bitmap without this
change.

Alice
