Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEEA12B80
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Nov 2023 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.de header.i=@kloenk.de header.b="cGvzu0hp"
X-Greylist: delayed 499 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Nov 2023 03:19:47 PDT
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBCA13E;
	Fri,  3 Nov 2023 03:19:47 -0700 (PDT)
From: Finn Behrens <me@kloenk.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.de; s=mail;
	t=1699006284; bh=uFm9yTM2gNBR2nhs8DI+yEFaDN8T7d1KpWt/J5S5IsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cGvzu0hphgDT6RAtZ8NA5i5tRw4xxFLqZ/TuW8L0zuhy0d+9jKPmzBYlenR6eHCwl
	 Sv1bcfTkrVfZpXcFJyUlI6o7aQdJxhEC15cakjhCCfA/VXuuzFyK5RIEhpb+FkmxzE
	 XiYUTLxZMb084mZkRPDAvn3ypBQefW2u90F/ZkfM=
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?b?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Matt Gilbride <mattgilbride@google.com>,
 Jeffrey Vander Stoep <jeffv@google.com>, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH RFC 02/20] rust_binder: add binderfs support to Rust
 binder
Date: Fri, 03 Nov 2023 11:11:22 +0100
Message-ID: <B4D1A3E2-1AD9-434A-90AC-8D33532D4A1B@kloenk.de>
In-Reply-To: <20231101-rust-binder-v1-2-08ba9197f637@google.com>
References: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
 <20231101-rust-binder-v1-2-08ba9197f637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



On 1 Nov 2023, at 19:01, Alice Ryhl wrote:

> Add support for accessing the Rust binder driver via binderfs. The
> actual binderfs implementation is done entirely in C, and the
> `rust_binderfs.c` file is a modified version of `binderfs.c` that is
> adjusted to call into the Rust binder driver rather than the C driver.
>
> We have left the binderfs filesystem component in C. Rewriting it in
> Rust would be a large amount of work and requires a lot of bindings to
> the file system interfaces. Binderfs has not historically had the same
> challenges with security and complexity, so rewriting Binderfs seems to=

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
>  drivers/android/rust_binderfs.c | 866 ++++++++++++++++++++++++++++++++=
++++++++
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
> diff --git a/drivers/android/Makefile b/drivers/android/Makefile
> index 6348f75832ca..5c819011aa77 100644
> --- a/drivers/android/Makefile
> +++ b/drivers/android/Makefile
> diff --git a/drivers/android/context.rs b/drivers/android/context.rs
> new file mode 100644
> index 000000000000..630cb575d3ac
> --- /dev/null
> +++ b/drivers/android/context.rs
> diff --git a/drivers/android/defs.rs b/drivers/android/defs.rs
> new file mode 100644
> index 000000000000..8fdcb856ccad
> --- /dev/null
> +++ b/drivers/android/defs.rs
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::ops::{Deref, DerefMut};
> +use kernel::{
> +    bindings,
> +    io_buffer::{ReadableFromBytes, WritableToBytes},
> +};
> +
> +macro_rules! decl_wrapper {
> +    ($newname:ident, $wrapped:ty) =3D> {
> +        #[derive(Copy, Clone, Default)]
> +        #[repr(transparent)]
> +        pub(crate) struct $newname($wrapped);
> +        // SAFETY: This macro is only used with types where this is ok=
=2E
Would it make sense so also annotade this safety requirement on the macro=
 itself?
It is only file private, but could help not overlook it, when using for s=
omething new in the same file.
> +        unsafe impl ReadableFromBytes for $newname {}
> +        unsafe impl WritableToBytes for $newname {}
> +        impl Deref for $newname {
> +            type Target =3D $wrapped;
> +            fn deref(&self) -> &Self::Target {
> +                &self.0
> +            }
> +        }
> +        impl DerefMut for $newname {
> +            fn deref_mut(&mut self) -> &mut Self::Target {
> +                &mut self.0
> +            }
> +        }
> +    };
> +}
> +
> +decl_wrapper!(BinderVersion, bindings::binder_version);
> +
> +impl BinderVersion {
> +    pub(crate) fn current() -> Self {
> +        Self(bindings::binder_version {
> +            protocol_version: bindings::BINDER_CURRENT_PROTOCOL_VERSIO=
N as _,
> +        })
> +    }
> +}
> diff --git a/drivers/android/process.rs b/drivers/android/process.rs
> new file mode 100644
> index 000000000000..2f16e4cedbf1
> --- /dev/null
> +++ b/drivers/android/process.rs
> diff --git a/drivers/android/rust_binder.rs b/drivers/android/rust_bind=
er.rs
> index 4b3d6676a9cf..6de2f40846fb 100644
> --- a/drivers/android/rust_binder.rs
> +++ b/drivers/android/rust_binder.rs
> diff --git a/drivers/android/rust_binderfs.c b/drivers/android/rust_bin=
derfs.c
> new file mode 100644
> index 000000000000..2c011e26752c
> --- /dev/null
> +++ b/drivers/android/rust_binderfs.c
> diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> index 6325d1d0e90f..e5a20c1498af 100644
> --- a/include/uapi/linux/magic.h
> +++ b/include/uapi/linux/magic.h
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
> index 00a66666f00a..ffeea312f2fd 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 435d4c2ac5fc..f4d58da9202e 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index da37bfa97211..f78d2e75a795 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> -- =

> 2.42.0.820.g83a721a137-goog
