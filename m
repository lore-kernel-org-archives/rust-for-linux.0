Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346F0393DC5;
	Wed,  7 Jan 2026 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799133; cv=none; b=Z53Q/LBDaFgYHFwwOW0tTu6t/qnuvcxB9nAu7hjbGxQCZ5FUOEpN1w9mZusS0dXaQE3breVaWgxwHS04WodjS9ohXu9iTUch7+czPdPyOMJ3tJcreQFUXwmU2vV4NXk0t//egbzOGP0YKym4tnh2YzpaerwTKqa8ZZXtHhxg45g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799133; c=relaxed/simple;
	bh=xPL3Fpbo/v10fWIshMmR+kr1gDEFucXCaY5JfO1sMMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+OuXxaPCA8jA7Mxd6Ldf1U2hfvd+Ld+K2l48UWQ4yoggKsXxOuRs0+PkTplf0flFFsAlKsnogfI81RKz51UVEf+1bMmRKmt0cR18tlUxwEEj7AoBtf9CI7FWlZB01NP7XOg72T06yxHC3hB0q7CAaRP76kgmJkC/OuIQ+XRt7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKo9VFoF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKo9VFoF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E0AC4CEF1;
	Wed,  7 Jan 2026 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767799132;
	bh=xPL3Fpbo/v10fWIshMmR+kr1gDEFucXCaY5JfO1sMMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hKo9VFoFYLXs2IVNwu3AXqcLPdopcfM+7h7i1AcM4SEzMXY/jcKTyc3vnNPvsrsNb
	 4w6GT5HorsbuBTVaLehKcGcCy/wCNXbGjsydW/MDnU1Wi72qBxsl8RqXl5bwSmM2wO
	 kPvdRtILXgmS9p1xEoMMLewjrs7GMEkgUIKYy8ARAgMTyUMywU3XEnuyeCv0LbSId1
	 ZPYlHz31xfJLEHGkj5+Hxc1Ru0UKv+UGzbD0URy8eBo4iagBLpUjA9D1JM5kxlo/Zw
	 dWB4xgZrmA0DjOpnIgCGnx4cNDte1KoUOT1il+pJqN62HbnmEpR3kw+xEEUxe5v7xS
	 Yn1SysxrDOp7g==
Message-ID: <01d6b029-e641-4029-86cb-43e7de42814c@kernel.org>
Date: Wed, 7 Jan 2026 16:18:48 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vmalloc: export vrealloc_node_align_noprof
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260107-export-vrealloc_node_align_noprof-v1-1-a581bec13054@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260107-export-vrealloc_node_align_noprof-v1-1-a581bec13054@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/7/26 4:16 PM, Alice Ryhl wrote:
> This symbol is used from the Nova driver, so it needs to be exported to
> avoid a build failure when building Nova as a module.
> 
> ERROR: modpost: "vrealloc_node_align_noprof" [drivers/gpu/nova-core/nova_core.ko] undefined!
> ERROR: modpost: "vrealloc_node_align_noprof" [samples/rust/rust_dma.ko] undefined!
> 
> This error is only triggered if helpers are inlined into Rust.
> Otherwise, Nova will call the exported symbol
> 
> 	rust_helper_vrealloc_node_align()
> 
> instead. There is no Fixes: tag as that feature is still WIP.
> 
> I used non-GPL EXPORT_SYMBOL to match the rest of the file, but let me
> know if I should use EXPORT_SYMBOL_GPL.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
