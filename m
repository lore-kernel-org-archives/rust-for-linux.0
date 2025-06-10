Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4102719DF41
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545129; cv=none; b=Yn1JQ/aGtpDqf7xiUEF1KwwlHb9M1sLb3PwdNWCZyOL3r3Y6IozLjwbr+oSzyNCHoYsAgp6B99L7P8cR/xhfTy+xYhC03wnPKs6Nq5jq2qtdeGPI2L50MdWOBk9hoecW4JHMucGzCFKce5Gqt0wTpvPjWnMj23LYM4qIt5hbVKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545129; c=relaxed/simple;
	bh=4PmH4n3TdedzO5FGXvKX/af0LajGxn2EwMKyF9Bmgnc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=S4OiYeJV5wAmnsqNakTOdf6T94dxLDojYWvikzLEQkSEyYp7VyCdhcF9P2+vIw5I6HBTG5VFoNg9wytTVCubTvbIa08DzD6xCoNc88gk/KK7E/aIiGo8DQCRQYSUW7J1Cb6rI2PDCLa0RzhJGWiNBLAe2OiZXkgNhSy1WwN4Mh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7HaC/mo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7HaC/mo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE39BC4CEEF;
	Tue, 10 Jun 2025 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749545128;
	bh=4PmH4n3TdedzO5FGXvKX/af0LajGxn2EwMKyF9Bmgnc=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=E7HaC/mooLjPRGqG6se3xr1y2tBu4e3XjChaJwGCWww7K0U2iSCIQK7kG9Dl2uBMH
	 oK3iIzhJE32mbBu4dMm/UuGsN8P716A/WqcIlRD3brRPtGFUOGqWA2Z5LkWF5MQ8pT
	 NXTegYRETWBVAvfL6mYVJUzfsk9rl9lViT6T4pBXI0ad4U4NVvIaDtyFDFW0JE7sGL
	 pkiITj/d/GGBup0oTxRX2zooMxKXcW4sADGCuExGiUTPpRqvc7D6U1z+t+IcPLJkpi
	 BXdftlUKDM05ESmTJzXDv6pp4jxcJ9ViuRIrB7xxm00ZGT5Fmk5OegYEWezte94mxB
	 0azkUXmx3ltSA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 10:45:25 +0200
Message-Id: <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code
 tracing
From: "Benno Lossin" <lossin@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250609223606.2897030-1-ttabi@nvidia.com>
In-Reply-To: <20250609223606.2897030-1-ttabi@nvidia.com>

On Tue Jun 10, 2025 at 12:36 AM CEST, Timur Tabi wrote:
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
> The macro avoids str::rfind() because currently, that function is not
> const.  The compiler emits a call to memrchr, even when called on string
> literals.  Instead, the macro implements its own versions of rfind(),
> allowing the compiler to generate the slice at compile time.
>
> The macro also uses some unsafe functions in order to avoid indexing
> into a str, which is necessary to fully support const contexts.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/print.rs | 66 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 9783d960a97a..5b0c36481e95 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -423,3 +423,69 @@ macro_rules! pr_cont (
>          $crate::print_macro!($crate::print::format_strings::CONT, true, =
$($arg)*)
>      )
>  );
> +/// Returns the index of the last occurrence of `needle` in `haystack`, =
or zero.
> +///
> +/// Identical to [`str::rfind()`], but unlike that function, this one is=
 const.
> +/// That is, the compiler can inline it when called with a string litera=
l.

The last sentence is incorrect. The compiler can always inline the
function. `const` means that the function can be called from const
evaluation such as in constant or static definitions, const blocks etc.

I would just remove the second sentence.

Another difference between this and `str::rfind` is that `str::rfind`
takes an `impl Pattern` and not a char. Additionally, I presume that
`str::rfind` is more efficiently implemented (as it's more complex, see
[1], but I didn't benchmark the two versions :).

[1]: https://doc.rust-lang.org/src/core/str/pattern.rs.html#478

> +#[inline]
> +pub const fn rfind_const(haystack: &str, needle: char) -> Option<usize> =
{
> +    let bytes =3D haystack.as_bytes();
> +    let mut i =3D haystack.len();
> +    while i > 0 {
> +        i -=3D 1;
> +        if bytes[i] =3D=3D needle as u8 {
> +            return Some(i);
> +        }
> +    }
> +    None
> +}

This function should not be in this module, `str.rs` is probably a
better place for it.

> +
> +/// Returns just the base filename of the current file.
> +///
> +/// This differs from the built-in [`file!()`] macro, which returns the =
full
> +/// path of the current file.
> +///
> +/// Using the base filename gives you more succinct logging prints.

I would remove this sentence or replace it with something like "Useful
for succinct logging purposes.".

> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sfile
> +/// pr_err!("{}:{}\n", sfile!(), line!());
> +/// ```
> +#[macro_export]
> +macro_rules! sfile {
> +    () =3D> {{
> +        use kernel::print::rfind_const;

Please don't use `use` in macros.

> +
> +        const FILE: &str =3D file!();

Instead use absolute paths: `::core::file!()`.

> +
> +        // [`.as_bytes()`] does not support non-ASCII filenames
> +        assert!(FILE.is_ascii());

Also here.

> +
> +        let start =3D match rfind_const(FILE, '/') {

And here `::kernel::print::rfind_const` (more below).

> +            Some(slash) =3D> slash + 1,
> +            None =3D> 0,
> +        };
> +        let end =3D match rfind_const(FILE, '.') {
> +            Some(dot) =3D> dot,
> +            None =3D> FILE.len(),
> +        };
> +
> +        // The following code the equivalent of &FILE[start..start+len],
> +        // except that it allows for const contexts.  For example,
> +        //   const SFILE: &'static str =3D sfile!();
> +
> +        let base_ptr: *const u8 =3D FILE.as_ptr();
> +
> +        // SAFETY: We know that `start` is <=3D the length of FILE, beca=
use FILE
> +        // never ends in a slash.

I don't think that we should rely on that fact for unsafe code.

There is another argument for `start <=3D length`: when `rfind_const`
returns `Some(res)`, then `res < length`.

> +        let ptr: *const u8 =3D unsafe { base_ptr.add(start) };
> +        // SAFETY: We also know that `end` < the length of FILE.
> +        // If `end` < `start`, this will generate a compiler error.

No it won't generate a compiler error if used like in the example, it
will panic at runtime.

Maybe we should make this macro return a const block?

---
Cheers,
Benno

> +        let slice =3D unsafe { core::slice::from_raw_parts(ptr, end - st=
art) };
> +        // SAFETY: We know that the slice is valid UTF-8, because we che=
cked
> +        // that FILE is ASCII (via is_ascii() above).
> +        unsafe { core::str::from_utf8_unchecked(slice) }
> +    }};
> +}
>
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> prerequisite-patch-id: 4bfda16a333b9f00a139050b7c6875922961a15d

