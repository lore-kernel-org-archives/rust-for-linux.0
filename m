Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2F47F69
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731062420; cv=none; b=Uiha1PwsqvzOLz9OrYPsLy+5lqjidJfs0df5RD/kevfbNCW5B28w2qgWsKrFI/qJYdPAHQINjD/EhDjPsVshCa1mQV2v/v7x3bduFwpDscOhexL5Oka25YucuYvMqJjQZKXpKEGoi7ZXaic6v2p/avi4i4e6B/Dz/RErLrlELog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731062420; c=relaxed/simple;
	bh=x89MFK5Xy2/Sz9SK/FZ9+zovNeOqxXdc77uYSHG+7uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJ334F3wvfEMXJQ3uXaTL6QYI3ZPnKiaaCNQ9bhmHYiSFWTNY8TvsZNCZfI8PJtDLh5K3Z4Y3mZA2SS+Esmd950E+copNq5QRogHeORlWcWFGE5FzNkPAy8FwHbo/4DsKwQWm3Kvs14xd4QYPOjsZz8wl9xZokLxQvBwVrcL9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeQcWl9X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeQcWl9X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D8AC4CECD;
	Fri,  8 Nov 2024 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731062420;
	bh=x89MFK5Xy2/Sz9SK/FZ9+zovNeOqxXdc77uYSHG+7uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeQcWl9XJmp3eVgDXMD03UyBI9jGbFH6UYdT6yrba7ezJ+JfARx3SXb9jYmUkkRHF
	 tSu24wQcFM0obseaRY5zFttT/NN1T9ev9OXytx7mwo+MPTjbcHlw1d0KKz6yKwQQpA
	 vypOZu7Qh+mhR3FC0mXmRpTk8XCxO1vyynioC+sRzlBRC35oysaZVRFd53hQl02CIH
	 z6AjbO81hRrKJaH3U2TMOFGjUsJY2kxljKg+jDKJQHjy3Y+nlpkKbmLbIu95fxZxMw
	 U96d5AEYBw2kqXRZwd0zRwjoCaBxgKVaZPk1xTnHJ/JZgSjaLJTgHB+nvKJ93lvjPA
	 WHyOZeFm6PWlg==
Date: Fri, 8 Nov 2024 11:40:15 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Guangbo Cui <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 2/2] rust: align Debug implementation for Box with
 Display
Message-ID: <Zy3qjzm8joQzAFrt@polis>
References: <20241104140514.877185-1-2407018371@qq.com>
 <tencent_2E70D3E99973A54BB6C3590393365CFA6B0A@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_2E70D3E99973A54BB6C3590393365CFA6B0A@qq.com>

On Mon, Nov 04, 2024 at 10:06:42PM +0800, Guangbo Cui wrote:
> Ensure consistency between `Debug` and `Display` for `Box` by
> updating `Debug` to match the new `Display` style.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>

The ACK was for patch 1 -- this patch I haven't seen before obviously.

However, you can keep it. For both:

Acked-by: Danilo Krummrich <dakr@kernel.org>

> Signed-off-by: Guangbo Cui <2407018371@qq.com>
> ---
>  rust/kernel/alloc/kbox.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index a496a866d..49c24727f 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -443,7 +443,7 @@ impl<T, A> fmt::Debug for Box<T, A>
>      A: Allocator,
>  {
>      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> -        fmt::Debug::fmt(&**self, f)
> +        <T as fmt::Debug>::fmt(&**self, f)
>      }
>  }
>  
> -- 
> 2.34.1
> 
