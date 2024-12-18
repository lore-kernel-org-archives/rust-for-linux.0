Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F93A150980;
	Wed, 18 Dec 2024 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734526086; cv=none; b=gA/bRxjITRjo8VszJ8Ijaqr8BisCKCCScbmBqt6SMguathePU766xXQPHoUDHwxDk54YL9PV0aeM+HCpJ6utyWsjrnyYywkhnSqlYN6xWQ/Nd7FVEC4GWhLnTOZokZP5Ryy4pePPyNmUX8rktXQAWujVNH2Cgy9exr4cWKQQR6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734526086; c=relaxed/simple;
	bh=SAltdk09dCPk6IMTYNBEkKXlQMSRUHyGOVmQrT01eL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7pCP5M610qLKK1+6jPIsD3A1r/87+KvmvWnM6GboGHkB1nfs0g0oAOcqqR+/dOSnBYxDoTTaVk/RFMHhwsbGj3LtIjLjFx1xa2doFklKJ6xDEycUcOm80jyGvKk4WsjuqYGkEKENmGkzesRt15OYeZJrT40w8J/wcFfVZhDj0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aj8HzoDe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aj8HzoDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D53C4CECE;
	Wed, 18 Dec 2024 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734526086;
	bh=SAltdk09dCPk6IMTYNBEkKXlQMSRUHyGOVmQrT01eL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aj8HzoDe5pIXZ/enBhdG6zlJU9SKpcMw4dWon/+lEW7NdaKE8XPrGwLs8NS00TFOb
	 cqAZnahpia96HItfQVpT7sVhwJhZ52s4UiLCsIHKw446OeH89Knw8kgio54aNtosaL
	 yKlh2SqrmHHl8SnlLUF2XBumQppNibHJeEl2CELUMqzA7YxHB748bSze6+pbaddggm
	 Xy5fJVwYKbaQS6MDIUbvyyMEBEp/PHhzvSkHkFXTkwZwh+cvz8HMBi53Ld7/zmlYvm
	 vVXOJwAvngStKGwTWKyxP3cB/LGnTZg5ojBRH+3ODq7gn5rj5CHPq5l3xs5TFQG6vd
	 lHsk85YORiIiA==
Date: Wed, 18 Dec 2024 13:48:00 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Jimmy Ostler <jtostler1@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Filipe Xavier <felipe_life@live.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Daniel Sedlak <daniel@sedlak.dev>,
	Alex Mantel <alexmantel93@mailbox.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] rust: error: Update 'stack_try_pin_init' example
Message-ID: <Z2LEgDM53bc0bHP6@pollux>
References: <cover.1734477232.git.jtostler1@gmail.com>
 <1f19375654fa5ef4d9bc086177f05b112470ca6d.1734477232.git.jtostler1@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f19375654fa5ef4d9bc086177f05b112470ca6d.1734477232.git.jtostler1@gmail.com>

On Tue, Dec 17, 2024 at 04:23:11PM -0800, Jimmy Ostler wrote:
> Change documentation imports to use `kernel::alloc::AllocError`,
> because `KBox::new()` now returns that, instead of the 'core'
> `AllocError`.
> 
> Signed-off-by: Jimmy Ostler <jtostler1@gmail.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  rust/kernel/init.rs | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
> index 347049df556b..3d099908dbd5 100644
> --- a/rust/kernel/init.rs
> +++ b/rust/kernel/init.rs
> @@ -290,9 +290,16 @@ macro_rules! stack_pin_init {
>  ///
>  /// ```rust,ignore
>  /// # #![expect(clippy::disallowed_names)]
> -/// # use kernel::{init, pin_init, stack_try_pin_init, init::*, sync::Mutex, new_mutex};
> +/// # use kernel::{init,
> +/// #   pin_init,
> +/// #   stack_try_pin_init,
> +/// #   init::*,
> +/// #   sync::Mutex,
> +/// #   new_mutex,
> +/// #   alloc::AllocError
> +/// # };
>  /// # use macros::pin_data;
> -/// # use core::{alloc::AllocError, pin::Pin};
> +/// # use core::pin::Pin;
>  /// #[pin_data]
>  /// struct Foo {
>  ///     #[pin]
> @@ -316,9 +323,16 @@ macro_rules! stack_pin_init {
>  ///
>  /// ```rust,ignore
>  /// # #![expect(clippy::disallowed_names)]
> -/// # use kernel::{init, pin_init, stack_try_pin_init, init::*, sync::Mutex, new_mutex};
> +/// # use kernel::{init,
> +/// #   pin_init,
> +/// #   stack_try_pin_init,
> +/// #   init::*,
> +/// #   sync::Mutex,
> +/// #   new_mutex,
> +/// #   alloc::AllocError
> +/// # };
>  /// # use macros::pin_data;
> -/// # use core::{alloc::AllocError, pin::Pin};
> +/// # use core::pin::Pin;
>  /// #[pin_data]
>  /// struct Foo {
>  ///     #[pin]
> -- 
> 2.47.1
> 
