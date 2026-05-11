Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC5284682;
	Mon, 11 May 2026 13:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505588; cv=none; b=KLVLn/iWUS+5+oScxNM2Lho73ceFhH44zVDzBYLZDNs6wGTHzLl4LQTMvXLQXSXUmRv+ruOe85Sj566rqNDCuEQW2pBn3YMxjrmucPgkuFNv7kuPSE+i8hIUH9APkHbDQxsBxj3XPg7HJ8rEqQb/3kWP3oXPpqyhJcbkbZ1wfv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505588; c=relaxed/simple;
	bh=H1+fy4iZDYEhZY2GjzfH/emNfhvyYP0nA1cI/0uy0cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2ZHPfCnO1Y3fcpl2kWZC+zAjNbFW58ZTfhWu03+0C8OYQ7sTjhBz3TK0ZTfN9R7hsNopx2hKMs1YJAp07Ng3Ov0EI/NLXYHocQskX4cgHweBCuuX3M7fMaIcNkpeA3dZ5qdCJjP3g/yQo5tkAyin8lhNrOULOQO8/aKhpPyal0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3TH06L4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3TH06L4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E667CC2BCB0;
	Mon, 11 May 2026 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778505588;
	bh=H1+fy4iZDYEhZY2GjzfH/emNfhvyYP0nA1cI/0uy0cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3TH06L44RCzk/qacwhAzUN8yLdlJxmLUtBwrXO4bVUmJU8pb9+rw0r6DC1Ebw7zy
	 sf1AzPjVpGGttdCauWj5pjYI89B9KaYkx4bGCSZJpgTwnkvHg6jTx56smYZ49kkSV6
	 TClv8H484tr+spByrh2W0D1/wnpJCvU6uWo1k1MLw9FfbDuP2rn3jYj8SkGta6sgIi
	 l2r5afFQpF7Y3yzn/gM3FvPlQZAyA2T6oHrOAbF2flfNyN216+M6iouLrIp4He2Uza
	 16X69ZTW/ndPQZpVXcDluVZ34KI/rVYOkNpJym32ML/W/m92fVJ8x0nAP0GbGqBvBE
	 xXKWtugyCaU5A==
Date: Mon, 11 May 2026 14:19:42 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust_binder: use lock_vma_under_rcu() in shrinker
Message-ID: <agHUZ4AKQBgMecBY@lucifer>
References: <20260507-binder-shrinker-lockvma-v1-1-76e3406bbfa6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-binder-shrinker-lockvma-v1-1-76e3406bbfa6@google.com>

On Thu, May 07, 2026 at 11:07:47AM +0000, Alice Ryhl wrote:
> The shrinker callback currently uses the mmap read trylock operation to
> attempt to access the vma, but it's generally better to only lock the
> vma instead of the whole mmap when you can.
>
> When lock_vma_under_rcu() fails, there is no reason to lock the mmap
> lock instead because it's already a trylock operation that is allowed to
> fail.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

This seems similar to Dave's patch [0], not sure if it was inspired by that? :)

[0]:https://lore.kernel.org/all/20260429181957.7511C256@davehans-spike.ostc.intel.com/

In any case the general approach seems sane to me, as rust code I can't really
review it properly, but aside from the comment below (presumably that's fine) it
conceptually LGTM so:

Acked-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
>  drivers/android/binder/page_range.rs | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
> index e54a90e62402..e82a5523804f 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -705,7 +705,7 @@ fn drop(self: Pin<&mut Self>) {
>      let page;
>      let page_index;
>      let mm;
> -    let mmap_read;
> +    let vma_read;
>      let mm_mutex;
>      let vma_addr;
>      let range_ptr;
> @@ -728,17 +728,18 @@ fn drop(self: Pin<&mut Self>) {
>              None => return LRU_SKIP,
>          };
>
> -        mmap_read = match mm.mmap_read_trylock() {
> -            Some(guard) => guard,
> -            None => return LRU_SKIP,
> -        };
> -
>          // We can't lock it normally here, since we hold the lru lock.
>          let inner = match range.lock.try_lock() {
>              Some(inner) => inner,
>              None => return LRU_SKIP,
>          };
>
> +        vma_addr = inner.vma_addr;
> +        vma_read = match mm.lock_vma_under_rcu(vma_addr) {
> +            Some(guard) => guard,
> +            None => return LRU_SKIP,
> +        };
> +

One question here - are we good to do this _after_ locking the 'inner' lock
above?

>          // SAFETY: The item is in this lru list, so it's okay to remove it.
>          unsafe { bindings::list_lru_isolate(lru, item) };
>
> @@ -751,7 +752,6 @@ fn drop(self: Pin<&mut Self>) {
>          // `zap_page_range` before we release the mmap lock, so `use_page_slow` will not be able to
>          // insert a new page until after our call to `zap_page_range`.
>          page = unsafe { PageInfo::take_page(info) };
> -        vma_addr = inner.vma_addr;
>
>          // From this point on, we don't access this PageInfo or ShrinkablePageRange again, because
>          // they can be freed at any point after we unlock `lru_lock`. This is with the exception of
> @@ -761,14 +761,12 @@ fn drop(self: Pin<&mut Self>) {
>      // SAFETY: The lru lock is locked when this method is called.
>      unsafe { bindings::spin_unlock(&raw mut (*lru).lock) };
>
> -    if let Some(unchecked_vma) = mmap_read.vma_lookup(vma_addr) {
> -        if let Some(vma) = check_vma(unchecked_vma, range_ptr) {
> -            let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
> -            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
> -        }
> +    if let Some(vma) = check_vma(&vma_read, range_ptr) {
> +        let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
> +        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
>      }
>
> -    drop(mmap_read);
> +    drop(vma_read);
>      drop(mm_mutex);
>      drop(mm);
>      drop(page);
>
> ---
> base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> change-id: 20260507-binder-shrinker-lockvma-51ff7d621f25
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
