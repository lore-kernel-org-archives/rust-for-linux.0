Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE174211279
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539847; cv=none; b=EXDn3XZSZwsVLYm2/0QwwxU+PAn9AY+z1VDNz470xCrUTF16GkGKbqkAoGWbXc3ndlvM2twxF9qFvBEreAF/26b+BKKZtc+j5rNWzx0bze8DR75XccN4wBQxPhmeNYB/YTfM6syoAX87SSNyJV8myehImPkTpYj+iw0SOlLVL7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539847; c=relaxed/simple;
	bh=YOpvFFX+xcnYwT63VlOnnOXClUb5kQrvmoNbF+YKzGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FxOnH1q7LzqCMoflRLYLWeNvDf2jei2EyuOfgVI5UMQTYT/qIAsifdcro8CO8aSX3A1LEF8dIFsgMecEW5/iuubVB5o0KKii7HlyONYftljjLjkEGCAjjiUW8AV4O7B9O0fJ0mMz9NVdt/DkAUfX9+p5eDX7oexrNHc7JS1L3/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=f0KHVXNZ; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="f0KHVXNZ"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1737539840; bh=J9cNniBQeIP5fLkGLTZOYmAwU5o8CN8x8IOhlj31cHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f0KHVXNZwfYqQ0riYB+symiHYkTmTxcNJopFQHYWU+gt/Uy2e12IskoCZcXeXx+FG
	 WffYZYrjqJrnvBsAu5XLKOBzU4wl1XhEhGfzlh4zDyGqaFlgizagwG9IQWqkyz4Wqn
	 CLPrjLfB6e76zjalywOrXBrBr3vQURD01LR51XCk=
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, daniel@sedlak.dev,
 aliceryhl@google.com
Subject: Re: [PATCH v4] rust: error: Extend the Result documentation
Date: Wed, 22 Jan 2025 10:57:18 +0100
Message-ID: <DFB88CA7-B9B9-4007-BFFB-02E624BA7ED3@kloenk.dev>
In-Reply-To: <20250122054719.595878-1-dirk.behme@de.bosch.com>
References: <20250122054719.595878-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 22 Jan 2025, at 6:47, Dirk Behme wrote:

> Extend the Result documentation by some guidelines and examples how
> to handle Result error cases gracefully. And how to not handle them.
>
> While at it fix one missing `Result` link in the existing documentation=
=2E
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSj=
iD710v=3DhQO4xi+5E4xNALa6cA@mail.gmail.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>
> Changes in v4:
>  * Drop the expect() example and put the slightly rephrased
>    unwrap()/expect() description below the ?-operator example
>    (Alice & Miguel)
>
> Changes in v3:
>  * Slight rephrase regarding panic() vs BUG(), whitespace and
>    newline fixes, use srctree/ syntax, add Rust reference link
>    for Result(), evaluate the result of the examples etc. (Miguel)
>
> Changes in v2:
>  * Improve the linkage (Daniel & Alice)
>  * Reformat the examples, add if let, drop "automatically",
>    call the example(), improve the formatting, etc (Miguel)
>
>  rust/kernel/error.rs | 113 ++++++++++++++++++++++++++++++++++++++++++-=

>  1 file changed, 112 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 0b01975c2286c..b4e59feb17a7f 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -254,8 +254,119 @@ fn from(e: core::convert::Infallible) -> Error {
>  /// [`Error`] as its error type.
>  ///
>  /// Note that even if a function does not return anything when it succ=
eeds,
> -/// it should still be modeled as returning a `Result` rather than
> +/// it should still be modeled as returning a [`Result`] rather than
>  /// just an [`Error`].
> +///
> +/// Calling a function that returns [`Result`] needs the caller to han=
dle
> +/// the returned [`Result`].
> +///
> +/// This can be done "manually" by using [`match`]. Using [`match`] to=
 decode
> +/// the [`Result`] is similar to C where all the return value decoding=
 and the
> +/// error handling is done explicitly by writing handling code for eac=
h
> +/// error to cover. Using [`match`] the error and success handling can=
 be
> +/// implemented in all detail as required. For example (inspired by
> +/// [samples/rust/rust_minimal.rs]):
> +///
> +/// ```
> +/// fn example() -> Result {
> +///     let mut numbers =3D KVec::new();
> +///
> +///     match numbers.push(72, GFP_KERNEL) {
> +///         Err(e) =3D> {
> +///             pr_err!("Error pushing 72: {e:?}");
> +///             return Err(e.into());
> +///         }
> +///         // Do nothing, continue.
> +///         Ok(()) =3D> (),
> +///     }
> +///
> +///     match numbers.push(108, GFP_KERNEL) {
> +///         Err(e) =3D> {
> +///             pr_err!("Error pushing 108: {e:?}");
> +///             return Err(e.into());
> +///         }
> +///         // Do nothing, continue.
> +///         Ok(()) =3D> (),
> +///     }
> +///
> +///     match numbers.push(200, GFP_KERNEL) {
> +///         Err(e) =3D> {
> +///             pr_err!("Error pushing 200: {e:?}");
> +///             return Err(e.into());
> +///         }
> +///         // Do nothing, continue.
> +///         Ok(()) =3D> (),
> +///     }
> +///
> +///     Ok(())
> +/// }
> +/// # example()?;
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// An alternative to be more concise is the [`if let`] syntax:
> +///
> +/// ```
> +/// fn example() -> Result {
> +///     let mut numbers =3D KVec::new();
> +///
> +///     if let Err(e) =3D numbers.push(72, GFP_KERNEL) {
> +///         pr_err!("Error pushing 72: {e:?}");
> +///         return Err(e.into());
> +///     }
> +///
> +///     if let Err(e) =3D numbers.push(108, GFP_KERNEL) {
> +///         pr_err!("Error pushing 108: {e:?}");
> +///         return Err(e.into());
> +///     }
> +///
> +///     if let Err(e) =3D numbers.push(200, GFP_KERNEL) {
> +///         pr_err!("Error pushing 200: {e:?}");
> +///         return Err(e.into());
> +///     }
> +///
> +///     Ok(())
> +/// }
> +/// # example()?;
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// Instead of these verbose [`match`]/[`if let`] the [`?`]-operator c=
an
> +/// be used to handle the [`Result`]. Using the [`?`]-operator is ofte=
n
> +/// the best choice to handle [`Result`] in a non-verbose way as done =
in
> +/// [samples/rust/rust_minimal.rs]:

All examples above feature a pr_err and then return the error. Then the `=
?`-operator is just called less verbose.
Maybe it makes sense to also state that it then does not print anything a=
nd possible also show that it could be
logged at this place with `inspect_err`.
Though I remember that usage of inspect_err got discussed at kangrejos (r=
fl-conference) but don=E2=80=99t fully remember the outcome,
think it was something like use it sparingly.

Thanks,
Fiona

> +///
> +/// ```
> +/// fn example() -> Result {
> +///     let mut numbers =3D KVec::new();
> +///     numbers.push(72, GFP_KERNEL)?;
> +///     numbers.push(108, GFP_KERNEL)?;
> +///     numbers.push(200, GFP_KERNEL)?;
> +///     Ok(())
> +/// }
> +/// # example()?;
> +/// # Ok::<(), Error>(())
> +/// ```
> +/// Another possibility is to call [`unwrap()`](Result::unwrap) or
> +/// [`expect()`](Result::expect). However, use of these functions is
> +/// *heavily discouraged* in the kernel because they trigger a Rust
> +/// [`panic`] if an error happens, which may destabilize the system or=

> +/// entirely break it as a result -- just like the C [`BUG()`] macro.
> +/// Please see the documentation for the C macro [`BUG()`] for guidanc=
e
> +/// on when to use these functions. Alternatively, depending on the us=
e
> +/// case, using [`unwrap_or()`](Result::unwrap_or),
> +/// [`unwrap_or_else()`](Result::unwrap_or_else),
> +/// [`unwrap_or_default()`](Result::unwrap_or_default) or
> +/// [`unwrap_unchecked()`](Result::unwrap_unchecked) might be an optio=
n, as well.
> +///
> +/// For even more details see the [Rust documentation].
> +///
> +/// [samples/rust/rust_minimal.rs]: srctreetree/samples/rust/rust_mini=
mal.rs
> +/// [`?`]: https://doc.rust-lang.org/reference/expressions/operator-ex=
pr.html#the-question-mark-operator
> +/// [`match`]: https://doc.rust-lang.org/reference/expressions/match-e=
xpr.html
> +/// [`BUG()`]: https://docs.kernel.org/process/deprecated.html#bug-and=
-bug-on
> +/// [`if let`]: https://doc.rust-lang.org/reference/expressions/if-exp=
r.html#if-let-expressions
> +/// [Rust documentation]: https://doc.rust-lang.org/book/ch09-02-recov=
erable-errors-with-result.html
>  pub type Result<T =3D (), E =3D Error> =3D core::result::Result<T, E>;=

>
>  /// Converts an integer as returned by a C kernel function to an error=
 if it's negative, and
> -- =

> 2.48.0
