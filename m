Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE2F29AB1A
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430279; cv=none; b=hTnUE6CeCPd6kY3R1bL0ppn2S6Dh/Ib7isSsIN1n7B5Kf7SecaTmTWyR/HJZ/cStuDmJ73eNuNmj4OyM3+wW3BruZfWjShztoYc1xCWPshn2tBG6IlU3eL5BgcX9pTO7Jjb9Tm27xkaW0okhfwouWq9Z6z5r9AegeLz95E8aRzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430279; c=relaxed/simple;
	bh=tAMUXcmv/xhf2xPlTN+bLmugvCtqb6Rh4aDlsSZNEwQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hk2c7oUL7/avHg+fNMUcDfB0Q1mIegMPFxQCz53b9hGqG35yHY9rcmpn9E272e1J1oUyRGV1bvXzk/SEEGIF9stZFPHgrTdGwKoJ1SkVWo2ddhc9j+IKw8RA5BkeKHXvw2rZREOZxmwEv6joymD9ky16V9dYbNu4MOksB4FVU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T3Ns3QcT; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T3Ns3QcT"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-698b38a49fcso4257670a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783430276; x=1784035076; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kzxK+arJ9J97K1TUSriH2dwU/5+hYBpsdZm0cvYaBMY=;
        b=T3Ns3QcT9VqfK31DMsl0HBSu4ouRdF8ME2TG/Mfc777JsndPGwTiqRP+tQZyDgJyfu
         UxXtKLpa1Nc2WA4h56s/12eNUFLR1YlPtpoMd1swJAECKsoaBUFIxMM6CguMedOI0QjO
         OE77yUKqgFUXPHuhmQ2pX+5VxT6ARgh/hClmUJd3anOEKz2J2g/BUsHsv2PII1lGbzp5
         uTF2x123Im/sHTUKZt2Q78oDrR4CkQu6SZ9RCOzLebCtIIG3dmXkpon2e4hFY9ZaOm9Y
         JsLewTn3cwmLCDbae1BcHr9ByPRb1jjEp6VlvJ6Qwqz/KLqLk6JXlxYCUoqla3yI+m+v
         zNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430276; x=1784035076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzxK+arJ9J97K1TUSriH2dwU/5+hYBpsdZm0cvYaBMY=;
        b=g1AA1Y5DPHdDkyN98QC+vgOubJZ+6xRnosXLDkc8z+9h616oVWUDYDy3kUzzt6VwcN
         3UvCMe8p4ZCDu2vbjMHISOuqSAK6j/WJxCPV2ekIa5c+ZqPvkXJ7YFxUqCvpKktkkOVQ
         eILEzx4TlbLdQ2/NxeYSPKp5wMx5UEFloC4Me9RQkeJU0LZUsnVCMPuRliMiPht4FMeD
         x0Zlk74ak62HJ92QXPM1t9YxRSdxbIJoN7zMBlZV/KEShVhZoKJxk15JPl7k18wSgiBQ
         7TfgXmEG5AVeemJ6C9ldUcjnZvjeaClF7E8cH4Wnqv0uL2laHAcjJOc7eAyHxLWgihyN
         yFZg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZM6vUaDnor9AlqPuXRPVLSOYptd5MKKPcTjfCkrKo4SQtI+selEuHJ8w7VJ1qqEZlsR8SPubNmM7HzJ+UdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoyT5gCPy4FUuq8P3ODQEWWC1EhdBK4+7zBgxb6/p16n/v9Q7x
	HeY0gl3nn7gagRDHlfuGvfYCWjI+gVScXwfcui1c8c11SFKQnaF+gl4Hre+bt/KxNEuMIr0JQLL
	lcLqVopilEGxwRTt0XQ==
X-Received: from ejcer3.prod.google.com ([2002:a17:907:7383:b0:c12:8073:a083])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:97ce:b0:c0c:b5ca:931 with SMTP id a640c23a62f3a-c15a68c53cdmr281610566b.31.1783430276051;
 Tue, 07 Jul 2026 06:17:56 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:17:55 +0000
In-Reply-To: <DJNDAQX71WG8.3UILF89WQD532@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-2-cc922f544dc0@google.com> <DJNDAQX71WG8.3UILF89WQD532@garyguo.net>
Message-ID: <akz8g-zAeNuvBiF3@google.com>
Subject: Re: [PATCH 2/5] rust: sync: add const constructor for raw_spinlock_t
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jul 01, 2026 at 05:15:55PM +0100, Gary Guo wrote:
> On Tue Jun 23, 2026 at 4:38 PM BST, Alice Ryhl wrote:
> > The abstractions for pr_*_ratelimited! need to construct a global
> > `struct ratelimit_state`, which contains a `raw_spinlock_t` field. Thus,
> > add a const constructor for the `raw_spinlock_t` type.
> >
> > The SPINLOCK_OWNER_INIT constant isn't mirrored via a const helper
> > because bindgen generates a 'static mut' instead of a constant from the
> > pointer constant.,
> >
> > The __ARCH_SPIN_LOCK_UNLOCKED constant cannot be translated by bindgen
> > because it's a define for a struct without type annotations, so it's
> > explicitly declared in Rust.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>

> > +/// Helper for creating a raw unlocked `bindings::raw_spinlock_t`.
> > +///
> > +/// For use in statics containing raw spinlocks.
> > +pub const fn raw_spin_lock_unlocked(name: &'static CStr) -> bindings::raw_spinlock_t {
> 
> These functions (incl. raw_lockdep_map) should really be private functions.

Hmm, I think there could be cases where a driver needs to interact with
C code directly where this is useful. Even if use from drivers is
discouraged, I don't think we need to go out of our way to prevent it.
It's like the bindings crate.

Alice
