Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D4B18B0D
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="upGNc57i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720CAC433C8;
	Wed,  1 Nov 2023 18:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698862163;
	bh=AvHKWIKlJcqu+ewg1Khjlldp2ZWZLbpzH+38P5Wpzn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upGNc57ijylvIBXYPlNM9YMxzjpz9uYFphE/1uKHi5f8MdOQ9YfgjXqbScEvGROge
	 P39hh/B4nHV/RRVJOrJQFPW0+GNrQbYiwGYIp5wbf38EmYtG2XMqbuMvRWNSkTYCSM
	 5KN2GeJ1GjzuamTPXt77lEC6Yx0mYM3oty2qdJ1M=
Date: Wed, 1 Nov 2023 19:09:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matt Gilbride <mattgilbride@google.com>,
	Jeffrey Vander Stoep <jeffv@google.com>,
	Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH RFC 01/20] rust_binder: define a Rust binder driver
Message-ID: <2023110108-overarch-dumpster-5452@gregkh>
References: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
 <20231101-rust-binder-v1-1-08ba9197f637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101-rust-binder-v1-1-08ba9197f637@google.com>

On Wed, Nov 01, 2023 at 06:01:31PM +0000, Alice Ryhl wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> Define the Rust binder driver, and set up the helpers for making C types
> accessible from Rust.
> 
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/Kconfig             | 11 +++++++++++
>  drivers/android/Makefile            |  1 +
>  drivers/android/rust_binder.rs      | 21 +++++++++++++++++++++
>  include/uapi/linux/android/binder.h | 30 ++++++++++++++++--------------
>  rust/bindings/bindings_helper.h     |  1 +
>  5 files changed, 50 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> index 07aa8ae0a058..fcfd25c9a016 100644
> --- a/drivers/android/Kconfig
> +++ b/drivers/android/Kconfig
> @@ -13,6 +13,17 @@ config ANDROID_BINDER_IPC
>  	  Android process, using Binder to identify, invoke and pass arguments
>  	  between said processes.
>  
> +config ANDROID_BINDER_IPC_RUST
> +	bool "Android Binder IPC Driver in Rust"
> +	depends on MMU && RUST

Can RUST even build on non-mmu systems?

