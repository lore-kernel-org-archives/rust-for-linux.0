Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05FD4028D8;
	Tue, 26 May 2026 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807681; cv=none; b=ikfmLGHgiazmNZBGW2h2ikIdIPCmEjOgr+eTReh5F5xQQ09LYsFJLigmShVfsR9u/Ta5JGIIktbveQHQxj1TL2PxFQk/Lk2OgvaRzqs+db7igvmdUrYdeL5sIi6c6LlTyOhiXdiM8fNSNlni0XDP9LAa+ba9m/0cC75/+gsSlMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807681; c=relaxed/simple;
	bh=OXKNBpPp06Zrbt9qHD2G8HN4ozH2fkusGcTHCLMC+fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnE5fmxOLyVq7QBPb4HH5UafbwuKQWZ0V/xRbpm5azBrM3+F5vUF+lIb8HTujvZ8xvTwAOJddJVARWhGDBQIKctmYr0gUmQDXn+SZSH4PGK6Z9bN6/VJNY/HUqVB4JnJamLn+b3zkQKUny6rAmP2OIvhPffYmniHC7V5/gyPtsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOh4p+M7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOh4p+M7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A001F00A3A;
	Tue, 26 May 2026 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807680;
	bh=IKjcyzIEm+VRsgDf0KwnhhGpd4c/dQAud2HhjWeTkdM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iOh4p+M7/e8yMU8lpsctqfJIC8heovThczS2iwonUqitmliIAEWBuMjVdc+xrcgSd
	 Y1D6yLm3o7iqS+MObrLOECZN2WPRHJdIuC6+rug9o6tPPQFk4tg/iBj2vCjnQHIpK2
	 bY7sdNPBtudfdDWF7lIiQGIgdqa0wOVGu7WRcUeoqc/+bRYaWIPFOTMGrjfrN5n5eH
	 8E37H3/4Ykt8fa6z/ufN+7WLEvl2U2g8UnpZ3MEpqk6S5Xiepgx5iMdbBvckqFGEKP
	 7+0bkRfMupsbYocz4ptLjZ7rNx+S/GYjQ4jk1E9ROMFptetj/ArD0h9s7YejGf+3fq
	 K/QWlBu0YuLnA==
Message-ID: <9b3d7c08-b982-4a5e-ad05-48c1ab9c09d2@kernel.org>
Date: Tue, 26 May 2026 17:01:16 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: helpers: add is_vmalloc_addr wrapper for NOMMU
 builds
To: shivamkalra98@zohomail.in
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20260523-is-vmalloc-addr-build-fix-v1-1-73c919440c41@zohomail.in>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260523-is-vmalloc-addr-build-fix-v1-1-73c919440c41@zohomail.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/26 8:54 PM, Shivam Kalra via B4 Relay wrote:
> From: Shivam Kalra <shivamkalra98@zohomail.in>
> 
> Commit 47ac2a4b5cd8 ("rust: kvec: implement shrink_to for KVVec")
> introduced a call to bindings::is_vmalloc_addr(). However, this
> fails to compile on architectures where CONFIG_MMU is disabled,
> resulting in the following build error:
> 
>     error[E0425]: cannot find function is_vmalloc_addr in crate bindings
> 
> When CONFIG_MMU is not set, is_vmalloc_addr() is defined as a
> static inline function in <linux/mm.h> that unconditionally
> returns false. Because bindgen skips static inline functions
> when generating bindings, the symbol is completely missing from
> the Rust bindings crate.
> 
> Fix this by providing a C helper wrapper, rust_helper_is_vmalloc_addr(),
> in rust/helpers/vmalloc.c. This ensures the function is reliably
> exposed to Rust regardless of the MMU configuration. On NOMMU builds,
> this allows KVVec::shrink_to() to successfully compile and correctly
> route all allocations through the kmalloc realloc path.
> 
> Fixes: 47ac2a4b5cd8 ("rust: kvec: implement shrink_to for KVVec")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605220811.LRplxeBR-lkp@intel.com/
> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

