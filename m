Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4370D1DF25A
	for <rust-for-linux@vger.kernel.org>; Thu, 29 May 2025 20:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748549689; cv=none; b=b1iDd6HPn4WHRrvxFd7nHEoYrsNBagbNlf8CQxpw35VxvCma/vfgqOVEKk9BUo9gBYvnWtqjRg9VxpGaEeG4uVkWlHNIPezisaVIVZEwFqcEhl5juJIpD0hxDORF2y+Wr6GpluBPQRNzY207y62DmWG0a1IysRcrLsuyZCooXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748549689; c=relaxed/simple;
	bh=G6E6iPk6oP3Kz2G2KOKj2S2+QHTGbYKunzX6mVx+H6I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=smSSgdlFo8L8PEUrFd3ykQ8ESu5kGCcVtSkVQlw2qUchcpRx9D/+/NUfU6DdbrJb+IhEWDS5vhA2ZK/HUpRJPzaIlXhH41PqeDKyKGaQ9Nhlxdo3py7BAl4X/vshOO3bmsM6ANxn8nGir6INIfuwFA10lWfSRAH9Zy3T25BXIlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SX1mDbGn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SX1mDbGn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7BCC4CEE7;
	Thu, 29 May 2025 20:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748549688;
	bh=G6E6iPk6oP3Kz2G2KOKj2S2+QHTGbYKunzX6mVx+H6I=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=SX1mDbGnFXNp+pZ49ZPP8Jqin6MDV5d+y6pO2sB4mfiYEs1tC3xgh4RYHcU8KiAvX
	 4I4VjaB4Ji/mQOv/K911aX6z930FUUOz1rxzfgp2/mwK/O7haEYgm2+0ak6r2Nt6EZ
	 IMPE9o/tQe8wEt0mM8+0iSoXpKXHhi7KlbB4k+J4pPODAJc//GEzT5yGOy38e7rYvy
	 p9AK5YHaBO1rRslsg4E9h3LOpwCFkLKVil3v4IAq9SYhMvPZ8AgITHvILG7yLqZel3
	 K4F/oRi6jb9CQZGwiw3RzK0NHiwxh0nXDU4+1u5iSD9baap2K/r91H4Ab/Dt0qYmaC
	 7F7KkrQ2daX0Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 22:14:44 +0200
Message-Id: <DA8X4RXQKX5J.N4S9TWX90OU9@kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
From: "Benno Lossin" <lossin@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250529184547.1447995-1-ttabi@nvidia.com>
In-Reply-To: <20250529184547.1447995-1-ttabi@nvidia.com>

On Thu May 29, 2025 at 8:45 PM CEST, Timur Tabi wrote:
> Introduce the sfile (short file) macro that returns the stem of
> the current source file filename.
>
> Rust provides a file!() macro that is similar to C's __FILE__ predefined
> macro.  Unlike __FILE__, however, file!() returns a full path, which is
> klunky when used for debug traces such as
>
> 	pr_info!("{}:{}\n", file!(), line!());
>
> sfile!() can be used in situations instead, to provide a more compact
> print.  For example, if file!() returns "rust/kernel/print.rs", sfile!()
> returns just "print".
>
> The macro goes avoids str::rfind() because currently, that function is no=
t
> const.  The compiler emits a call to memrchr, even when called on string
> literals.  Instead, the macro implements its own versions of rfind(),
> allowing the compiler to generate the slice at compile time.
>
> Unfortunately, Rust does not consider the .. operator to be const either,
> so sfind!() cannot be assigned to consts.  For example, the following wil=
l
> not compile:

This is not the `..` operator, but rather the index operation of a str
(`&FILE[start..]`). It can be made const by using `from_utf8` [1] and
manually creating the correct byte slice using `unsafe` [2] instead.

[1]: https://doc.rust-lang.org/std/str/fn.from_utf8.html
[2]: https://doc.rust-lang.org/std/slice/fn.from_raw_parts.html

> 	const SFILE: &'static str =3D sfile!();
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/print.rs | 48 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index cf4714242e14..3c7b0c74bfb9 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -414,3 +414,51 @@ macro_rules! pr_cont (
>          $crate::print_macro!($crate::print::format_strings::CONT, true, =
$($arg)*)
>      )
>  );
> +
> +/// Returns just the base filename of the current file.
> +/// file!() returns the full path of the current file, which is often to=
o long.
> +/// Use this macro to trace your code:
> +/// pr_err!("{}:{}\n", sfile!(), line!());
> +/// Note: Avoiding rfind() allows this macro to be evaluated at compile =
time
> +/// in most situations, such as the above pr_err!() example.  However,
> +/// because .. is apparently a non-const operator, the following will no=
t work:
> +///     const SFILE: &'static str =3D sfile!();
> +#[macro_export]
> +macro_rules! sfile {
> +    () =3D> {{
> +        const FILE: &str =3D file!();
> +
> +        /// Return the index of the last occurrence of @needle in @hayst=
ack,
> +        /// or zero if not found.  We can't use rfind() because it's not=
 const (yet).
> +        const fn find_last_or_zero(haystack: &str, needle: char) -> usiz=
e {
> +            let bytes =3D haystack.as_bytes();

Using bytes doesn't consider non-ascii filenames (which I think we don't
have), but we could enforce that by checking `is_ascii` and panicking
otherwise.

---
Cheers,
Benno

> +            let mut i =3D haystack.len();
> +            while i > 0 {
> +                i -=3D 1;
> +                if bytes[i] =3D=3D needle as u8 {
> +                    return i;
> +                }
> +            }
> +            0
> +        }
> +
> +        /// Return the index of the last occurrence of @needle in @hayst=
ack,
> +        /// or the length of the string if not found.
> +        const fn find_last_or_len(haystack: &str, needle: char) -> usize=
 {
> +            let len =3D haystack.len();
> +            let bytes =3D haystack.as_bytes();
> +            let mut i =3D len;
> +            while i > 0 {
> +                i -=3D 1;
> +                if bytes[i] =3D=3D needle as u8 {
> +                    return i;
> +                }
> +            }
> +            len
> +        }
> +
> +        let start =3D find_last_or_zero(FILE, '/') + 1;
> +        let len =3D find_last_or_len(&FILE[start..], '.');
> +        &FILE[start..start+len]
> +    }};
> +}

