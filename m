Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22083176E4;
	Tue, 10 Feb 2026 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770742162; cv=none; b=FpC/f4/8iz+dhGqIGnQWEjkhpPl0cfHUF10BHHv72X8EXwOSYm1ECci/71iRb7fzD/7+bxRILs7i0j3woc9LHV+55HzA8U+nOp80/yn6DAEQNaCxTZQKYgGMo1uZl4nkoPE7ozN1SN1bg7DE8E3l2EMyNe+3xSL7NfvvDrF4Aas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770742162; c=relaxed/simple;
	bh=qiunUbsKEW7gX0zCCMDrQrvoSAJfNHBqrIU7Es8yzS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LI/LO2HcuRdkToOKqLq1yLUOVvnFr0eU9x27aCTNEle/Bu7qfJinzbd/zSov1bPUFl+V5Dtwy3M52XM8f4PT/vZyfjGaN6MbJIDwm1k7O4T2UEghy6E9mUa1MCmcNPi59vuYdYv8K17lHQY90XpP9RsimjwRnryhpBNbJh+/9Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9vIlW6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9vIlW6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27058C116C6;
	Tue, 10 Feb 2026 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770742162;
	bh=qiunUbsKEW7gX0zCCMDrQrvoSAJfNHBqrIU7Es8yzS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9vIlW6HRyYc4jDn6t3F8VDRwTUXJ6L2WxDYx1nGhK3O2j9faUFEVV+RmNw8Y/hYC
	 5HBGHZA7wdLvjS5SbrLzXnbp/DtZbySJdS4J3u+0GRASNNkAOC/cm4fUPgTJVkEDjN
	 TPZZ5BQdL2F8iVKa+RauLwA/aem/K7ZIhZjjvUwZF1GdwqMFkN/DSImphRoNkR+GKx
	 1LUKL4FM7KR1OJW0viBvkQjPqAvmZTwiTa/4GZRt+zX9eKE1fRujNwnCeMAulHHkSB
	 UG2R/q+s3UN2fi3q2bxBuuiWxUHeXIVQVt/NbWCSuSwqSGK/gs1lC+FEkQ0sFwx7wm
	 TRv0HUkZflnWA==
Date: Tue, 10 Feb 2026 17:49:17 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v3 11/12] xarray, radix-tree: enable sheaf support for
 kmem_cache
Message-ID: <aYrsR5VYH9JHeIoZ@macos>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-11-f777c65b8ae2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-xarray-entry-send-v3-11-f777c65b8ae2@kernel.org>

On 2026-02-09 15:38, Andreas Hindborg wrote:
> The rust null block driver plans to rely on preloading xarray nodes from
> the radix_tree_node_cachep kmem_cache.
> 
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  lib/radix-tree.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/radix-tree.c b/lib/radix-tree.c
> index 976b9bd02a1b5..1cf0012b15ade 100644
> --- a/lib/radix-tree.c
> +++ b/lib/radix-tree.c
> @@ -1598,10 +1598,16 @@ void __init radix_tree_init(void)
>  	BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);
>  	BUILD_BUG_ON(ROOT_IS_IDR & ~GFP_ZONEMASK);
>  	BUILD_BUG_ON(XA_CHUNK_SIZE > 255);
> -	radix_tree_node_cachep = kmem_cache_create("radix_tree_node",
> -			sizeof(struct radix_tree_node), 0,
> -			SLAB_PANIC | SLAB_RECLAIM_ACCOUNT,
> -			radix_tree_node_ctor);
> +
> +	struct kmem_cache_args args = {
> +		.ctor = radix_tree_node_ctor,
> +		.sheaf_capacity = 64,
> +	};

Is the sheaf_capacity matching the number of slots in an XArray node? If so,
this should be bindings::XA_CHUNK_SIZE.
