Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFDF2F7445;
	Sat, 20 Dec 2025 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766220044; cv=none; b=ID9O4SJU/FVYHRFs2FLaVg4sUw05mdi5sd/cfP23Dq6MUTFGhrWB3+wSOOIxpHKS4DmIP5Sdr0VQVmPuJd1+dL8m85A0rXjXPIIDQ/K3svB76hYIrsJ78r3BE9+kp4c8QSrg/loxAn87ZhiC8varj7Da19svRUqep2z6cIJl3IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766220044; c=relaxed/simple;
	bh=ibXe5uqNLfUAY3B2eDjyr4K0gR2q3RAuZxva6cYitVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUoGGO5luxy90/V5yRThunLYr6ppRXQJnssC9sRsZuuTvc8Q7tPSf70VMHhYSev+XPWNPTtF3eIx0V2NCOx0uMbul+np8yO15AV4tme+ajJXW5lVux2Oh1lUlAJuICzGVfuPLv4c04UE7OFB+b1/H2COvtujKWWQKpdTjotvYZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B3uRl58W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B3uRl58W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40473C4CEF5;
	Sat, 20 Dec 2025 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766220043;
	bh=ibXe5uqNLfUAY3B2eDjyr4K0gR2q3RAuZxva6cYitVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3uRl58W40r5/E4jCsng+XpaN1P3mb5K3w7X9lxoI91ZITFY2no4c+DPCxfYSCZNJ
	 48xFJR1Fg7l6JtQfb4EezJKx8gqpMaAgMYGpt7ALksjKKVXk4qltY33VlslA39XWuC
	 CQr6Wm2ACCdqigqE0NwJLu5S64auCr8pp8xhdJmk=
Date: Sat, 20 Dec 2025 09:40:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	mmaurer@google.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: debugfs: use "kernel vertical" style for imports
Message-ID: <2025122011-elves-plywood-07e5@gregkh>
References: <20251218165626.450264-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218165626.450264-1-dakr@kernel.org>

On Thu, Dec 18, 2025 at 05:56:11PM +0100, Danilo Krummrich wrote:
> Convert all imports in the debugfs Rust module to use "kernel vertical"
> style.
> 
> With this subsequent patches neither introduce unrelated changes nor
> leave an inconsistent import pattern.
> 
> While at it, drop unnecessary imports covered by prelude::*.
> 
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/debugfs.rs                   | 46 ++++++++++++++++++------
>  rust/kernel/debugfs/callback_adapters.rs | 21 +++++++----
>  rust/kernel/debugfs/entry.rs             | 14 +++++---
>  rust/kernel/debugfs/file_ops.rs          | 25 ++++++++-----
>  rust/kernel/debugfs/traits.rs            | 43 ++++++++++++++++------
>  5 files changed, 109 insertions(+), 40 deletions(-)
> 
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index facad81e8290..536a320334bf 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -8,28 +8,52 @@
>  // When DebugFS is disabled, many parameters are dead. Linting for this isn't helpful.
>  #![cfg_attr(not(CONFIG_DEBUG_FS), allow(unused_variables))]
>  
> -use crate::fmt;
> -use crate::prelude::*;
> -use crate::str::CStr;
>  #[cfg(CONFIG_DEBUG_FS)]
>  use crate::sync::Arc;
> -use crate::uaccess::UserSliceReader;
> -use core::marker::PhantomData;
> -use core::marker::PhantomPinned;
> +use crate::{
> +    fmt,
> +    prelude::*,
> +    str::CStr,
> +    uaccess::UserSliceReader, //

While I hate the // use here, I have hope that one day the compiler will
be fixed to allow this...

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
