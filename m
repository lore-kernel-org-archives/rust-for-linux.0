Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCC618023
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xT99Btqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CABC433C9;
	Wed,  1 Nov 2023 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698862212;
	bh=3NZHEsX4YnmtaYDxknYFjkreaqS3P2LL75ju5leBvWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xT99BtqreVGR7rW2IVViyuQwA+xdvX+/dQ4qq/WvIk90aZVsl2ME2R4Is/VV9kpIH
	 R0IJEZ833B6UX5KLWuJigM1KA1oX548NrU+HYN6KOsEO8o+sEfzl9+uGYjJLJjAG6B
	 bhbpZLUnQRkJO+CgOQ6ohFYbFdYEsS6Gbe9efWls=
Date: Wed, 1 Nov 2023 19:10:04 +0100
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
Subject: Re: [PATCH RFC 02/20] rust_binder: add binderfs support to Rust
 binder
Message-ID: <2023110124-enunciate-hypnotize-2ae9@gregkh>
References: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
 <20231101-rust-binder-v1-2-08ba9197f637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101-rust-binder-v1-2-08ba9197f637@google.com>

On Wed, Nov 01, 2023 at 06:01:32PM +0000, Alice Ryhl wrote:
> Add support for accessing the Rust binder driver via binderfs. The
> actual binderfs implementation is done entirely in C, and the
> `rust_binderfs.c` file is a modified version of `binderfs.c` that is
> adjusted to call into the Rust binder driver rather than the C driver.
> 
> We have left the binderfs filesystem component in C. Rewriting it in
> Rust would be a large amount of work and requires a lot of bindings to
> the file system interfaces. Binderfs has not historically had the same
> challenges with security and complexity, so rewriting Binderfs seems to
> have lower value than the rest of Binder.
> 
> We also add code on the Rust side for binderfs to call into. Most of
> this is left as stub implementation, with the exception of closing the
> file descriptor and the BINDER_VERSION ioctl.
> 
> Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/Kconfig         |  24 ++
>  drivers/android/Makefile        |   1 +
>  drivers/android/context.rs      | 144 +++++++
>  drivers/android/defs.rs         |  39 ++
>  drivers/android/process.rs      | 251 ++++++++++++
>  drivers/android/rust_binder.rs  | 196 ++++++++-
>  drivers/android/rust_binderfs.c | 866 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/rust_binder.h     |  16 +
>  include/uapi/linux/magic.h      |   1 +
>  rust/bindings/bindings_helper.h |   2 +
>  rust/kernel/lib.rs              |   7 +
>  scripts/Makefile.build          |   2 +-
>  12 files changed, 1547 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> index fcfd25c9a016..82ed6ddabe1a 100644
> --- a/drivers/android/Kconfig
> +++ b/drivers/android/Kconfig
> @@ -36,6 +36,18 @@ config ANDROID_BINDERFS
>  	  It can be used to dynamically allocate new binder IPC devices via
>  	  ioctls.
>  
> +config ANDROID_BINDERFS_RUST
> +	bool "Android Binderfs filesystem in Rust"
> +	depends on ANDROID_BINDER_IPC_RUST
> +	default n

Nit, the default is always 'n', so no need for this line.

Also, it's the middle of the merge window, many of us are busy with
other things and can't review new code until a few weeks from now,
sorry.

greg k-h
