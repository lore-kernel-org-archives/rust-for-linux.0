Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE7C3A8741
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576177; cv=none; b=KGsxjZu0JCQ+pJvUROsoRdhH1jp4myzCFakHpEq9O0IWypzlYolXRcUq9WjwWq4+vCbLYcT04nfVE+YLWxMmTCROu7CoDBaaC726n+AcPZt+mt/LfOnXuVNDMZM6b0fkoO+xpPX3ilqPIQtgHdRZr3nhV1vlACyvbq1bbZnNBdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576177; c=relaxed/simple;
	bh=8PHvvWnA2xfWNKBWqrxiJicyqwOVu4z9LDpwhzltEOQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VhyOiJ7GeM8kiql2cm93gOAySoJCr1aVcqVqKFpWFfi2kWCRpDRzhdRpeIspx6yV7SMhC1vdfPtFYALaRERR07kPS3sbx1oDWwbU+BbmVT3GDptqFNsc3kbrvr6FOQC4pU6tYyWGkC1QToey98P4iublgh5sSDiA2FgZ7a8tWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tN1UcPGT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tN1UcPGT"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48a7994e8ddso34159485e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 01:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778576164; x=1779180964; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yKt1aQHWlToSTBHmH9DUCE51K0B4uRuyfHpEOr+ZBb4=;
        b=tN1UcPGTrBRuUCLadbZqVvsLzJSfHNlTY4yyKUfJ1imTVdu2VbbCktERWCeot/xBJP
         NOos57tAnhGDxQxOMdDi4zm80Q2tKRbYkiqWChgQnJwPfBbgOUKSy/eLAhZJM+4jaEBo
         IzGEDMMYRny9qk+UwSzRKpL9bzlyDi29TUYVmwDkApT9YpmiGQ19LDJlQVMVsLbR6688
         FWhmFDvu2oKJj0urSUSjF2aUXIg9Uw9xH2MeXaCdSEWCjuhsuCT5ClR5MrHKUFQdFFvZ
         /a8JTO8opXGZqct6YZLDZbHvnx73lTAkvDTw75d8kqfGVYr76sDuymuyAtX6PGW3j5fM
         mz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576164; x=1779180964;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yKt1aQHWlToSTBHmH9DUCE51K0B4uRuyfHpEOr+ZBb4=;
        b=Lf5aEyrBugi6D9OfeGy7Kna9RmZESqh63CRT8yYhbLmRIsLDXVNL1rG6+vYhs5haOa
         m9mWev/aEe7lHhj7KohYTAjNPaKq21TYUpC7OT/i6b4nbR3/gmQWUycWULkVmymLNNI4
         UEYKQJhLcOZRk2+JAoi0HI6duZJBt9dARBV3Z1rqOFAvBb5QV3fkum2fwtkF7xyL1671
         mvaLi5NdKt2v6Iip5k7INoEEt12RWj5mPi7pYIKflOie/fdzCBsX9BiwFj5qg+oN7gXL
         D95FDv/mLN2OXh31Aml2L4nqWFhANZ4y7ehby2ItX4wy+HalJrUHlMQEn0c1T73qQXiB
         c/zA==
X-Forwarded-Encrypted: i=1; AFNElJ848+j3KHHDz1Txfxvaz96DYu88CZFmO02JPe0+NDlk8ll1T2TrlndX2FQW0C2WEZgm19JbXU4DklGe48PUag==@vger.kernel.org
X-Gm-Message-State: AOJu0YydSHuQsxsvEG2qJ36z3d46q/P0c5q6pU42wMKGPX9fW24iCA2/
	JWEPSF6kc2LSKS8t+7vkcgwRzdwR8/5HehJSoaOTFEC6OeioIdAmmpjPZw46RyHsjXf8Bqxmd3c
	IcverZU9c63ZE5b4MFQ==
X-Received: from wmbdn18.prod.google.com ([2002:a05:600c:6552:b0:489:1f67:5a81])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:698d:b0:489:1ba8:5be9 with SMTP id 5b1f17b1804b1-48e706f0e53mr217152875e9.29.1778576163910;
 Tue, 12 May 2026 01:56:03 -0700 (PDT)
Date: Tue, 12 May 2026 08:56:02 +0000
In-Reply-To: <agHUZ4AKQBgMecBY@lucifer>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260507-binder-shrinker-lockvma-v1-1-76e3406bbfa6@google.com> <agHUZ4AKQBgMecBY@lucifer>
Message-ID: <agLrItFpcWD0N0pO@google.com>
Subject: Re: [PATCH] rust_binder: use lock_vma_under_rcu() in shrinker
From: Alice Ryhl <aliceryhl@google.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, May 11, 2026 at 02:19:42PM +0100, Lorenzo Stoakes wrote:
> On Thu, May 07, 2026 at 11:07:47AM +0000, Alice Ryhl wrote:
> > The shrinker callback currently uses the mmap read trylock operation to
> > attempt to access the vma, but it's generally better to only lock the
> > vma instead of the whole mmap when you can.
> >
> > When lock_vma_under_rcu() fails, there is no reason to lock the mmap
> > lock instead because it's already a trylock operation that is allowed to
> > fail.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> This seems similar to Dave's patch [0], not sure if it was inspired by that? :)
> 
> [0]:https://lore.kernel.org/all/20260429181957.7511C256@davehans-spike.ostc.intel.com/

I was reminded by that change, but it's been on my list since commit
a0b9b0f1433c ("rust_binder: use lock_vma_under_rcu() in
use_page_slow()").

> In any case the general approach seems sane to me, as rust code I can't really
> review it properly, but aside from the comment below (presumably that's fine) it
> conceptually LGTM so:
> 
> Acked-by: Lorenzo Stoakes <ljs@kernel.org>
> 
> > ---
> >  drivers/android/binder/page_range.rs | 24 +++++++++++-------------
> >  1 file changed, 11 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
> > index e54a90e62402..e82a5523804f 100644
> > --- a/drivers/android/binder/page_range.rs
> > +++ b/drivers/android/binder/page_range.rs
> > @@ -705,7 +705,7 @@ fn drop(self: Pin<&mut Self>) {
> >      let page;
> >      let page_index;
> >      let mm;
> > -    let mmap_read;
> > +    let vma_read;
> >      let mm_mutex;
> >      let vma_addr;
> >      let range_ptr;
> > @@ -728,17 +728,18 @@ fn drop(self: Pin<&mut Self>) {
> >              None => return LRU_SKIP,
> >          };
> >
> > -        mmap_read = match mm.mmap_read_trylock() {
> > -            Some(guard) => guard,
> > -            None => return LRU_SKIP,
> > -        };
> > -
> >          // We can't lock it normally here, since we hold the lru lock.
> >          let inner = match range.lock.try_lock() {
> >              Some(inner) => inner,
> >              None => return LRU_SKIP,
> >          };
> >
> > +        vma_addr = inner.vma_addr;
> > +        vma_read = match mm.lock_vma_under_rcu(vma_addr) {
> > +            Some(guard) => guard,
> > +            None => return LRU_SKIP,
> > +        };
> > +
> 
> One question here - are we good to do this _after_ locking the 'inner' lock
> above?

Well, it's a spinlock so unless lock_vma_under_rcu() can sleep it should
be fine. Though we also hold *another* spinlock here, so if it can
sleep, we couldn't take it before `inner` either.

Alice
