Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997E4370ACD;
	Fri, 31 Jul 2026 19:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785525928; cv=none; b=FlhD/qib59sFOxuQ+C6jyXwao+2VC3Ayl8LiXLhk9KxC2sWdSSQvFVY2lR05L/pa/Ap34FzzndQihZ5WXHM9XUvfwuCAlaUdnNfTJBv7naP6Ki2dIfxf4/AimkBlVoQkq6PSkAcsxpKo70Tc3kgU/o3PFBAWHnD2uEZ570tn5eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785525928; c=relaxed/simple;
	bh=SOMAKVkwK5uEyKWROofLijVIu4/cLgW/mvWHpuERY44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmNeBthcboo8o80EXefgdZCT8yIQFeAOYbLH69bOYER0S+44Ud0WQLt5ShCwY0juiDd8lWO+GcyFhtgVkkr6o5LjkGqGjuIuM979qkjv4YtbMzoXQWum3HAqWN+ywoPQEn4Iwo9fRAo6vXJmd7Fn9HLRauCUo/eJCRUrb7It9kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyKFNXhW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyKFNXhW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F421F00AC4;
	Fri, 31 Jul 2026 19:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785525927;
	bh=dmzCi55jVBlV/spFUKbP0Wvhrn4NxGjdRSbu4p7wkxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OyKFNXhWA460/T7pn6jjM7fYDRUiN0XhjOy0MuiFLf/EnRSZriSG8foBZV8dmzS0T
	 TQDWua9YqIvEWUVtci82UMRND85EgC30iyfnxCCCOZr1HhtEMZqTacG/xxe2FdBGTx
	 g+QVuPKsoztsuIkzhis0RDLgElhkqNTD+97eUN/u6h6Okvptbp+fHs8eC1c5PeCIs2
	 nGztWqTIbTBBdioNaJRT9u8siOq7yXLJonTimpLZG6g9uQiq+nTr2ff4dFxHaAn0BA
	 tgoCJKA8nn6JzwJlWr1G35Hvzp8I8Qhc9GRRlFktrqE3jnrrWTTe5Yr7PHo7oO/nzE
	 YfUwd9VAT2rKA==
Date: Fri, 31 Jul 2026 12:25:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: Harry Yoo <harry@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org
Subject: Re: rust compile failure in next-20260730
Message-ID: <20260731192522.GA1014697@ax162>
References: <20260731122826.737703-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731122826.737703-1-spasswolf@web.de>

+ folks from e5e86df8b666

On Fri, Jul 31, 2026 at 02:28:25PM +0200, Bert Karwatzki wrote:
> With next-20260730 building a kernel with CONFIG_RUST=y fails with
> the following error:
> 
>  RUSTC L rust/kernel.o
> error[E0308]: mismatched types
>      --> rust/kernel/sync/poll.rs:175:44
>       |
>   175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
>       |                  ------------------------- ^^^^^^^^^^^^^^^^ expected `*mut kvfree_rcu_head`, found `*mut callback_head`
>       |                  |
>       |                  arguments to this function are incorrect
>       |
>       = note: expected raw pointer `*mut bindings::kvfree_rcu_head`
>                  found raw pointer `*mut bindings::callback_head`
> note: function defined here
>      --> /mnt/data/linux-forest/linux-next/rust/bindings/bindings_generated.rs:73708:12
>       |
> 73708 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut ffi::c_void);
>       |            ^^^^^^^^^^^^^^^
> 
> error: aborting due to 1 previous error
> 
> For more information about this error, try `rustc --explain E0308`.
> make[5]: *** [rust/Makefile:781: rust/kernel.o] Fehler 1
> make[4]: *** [Makefile:1420: prepare] Fehler 2
> make[3]: *** [debian/rules:80: build-arch] Fehler 2
> 
> Reverting the following commits:
> ef32a74f8f6a ("mm/slab: introduce kfree_rcu_nolock()")
> bdd0cc9f0ffc ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu batching")
>     
> make the compilation work again.   

This is a collision between commit e5e86df8b666 ("rust: poll: use
kfree_rcu() for PollCondVar") in the char-misc tree and the
aforementioned commit bdd0cc9f0ffc ("mm/slab: introduce struct
kvfree_rcu_head for kvfree_rcu batching") in the slab tree.

Something like this avoids the error for me but I am not sure if it is
a proper fix.

diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index 684dfa242b1a..5b12d5d4e9af 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -124,6 +124,9 @@ pub struct PollCondVarBox {
 struct PollCondVarBoxInner {
     #[pin]
     inner: PollCondVar,
+    #[cfg(CONFIG_KVFREE_RCU_BATCHED)]
+    rcu: Opaque<bindings::kvfree_rcu_head>,
+    #[cfg(not(CONFIG_KVFREE_RCU_BATCHED))]
     rcu: Opaque<bindings::callback_head>,
 }
 
-- 
Cheers,
Nathan
