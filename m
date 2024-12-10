Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A06E1DC997
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Dec 2024 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825651; cv=none; b=n607dWU/HopPFAqhc62Alk8Spfx60bRn8Ci1AbsuiNgpIzmMscVgMI9+jcc72q0eQaKxY1pItGS8XLq3+iDFZ2HZWaGWBR6gA8XHcRROU7E31e3Nd6Iq9EGn8x3rCPujqdXvLCbV8dsIvadIlM6/bO2KI+Wa0hhSfb0exLqg4Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825651; c=relaxed/simple;
	bh=HKFGUhgaRKP679wcEN34Ghy1oFB9oYj5KEsxLweN8XM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxeC89rzoWmJJr/5HSar5z9/2AvTGMi05eQ3uz1Dvq4gCelCnmUWQHPJMPdPjyGdD6eyW90CNC//iQ3p3Pry6BZ+l6JEG7C0iCrPL6SLcHWixqN9qJxV9Be6BZhvTRLsxiFqQNHwTTjqBBBYrCwfHrN+3TNxRBDHUQ9SJqfCzMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=rlBr8HWH; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="rlBr8HWH"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1733825635; bh=bqZsaelg2+R3Z12tHTTvUBHECNy5IttnXHMYVGwI6Vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rlBr8HWHIcUJ4qPXzGxrHWpJYpSh/uffiBq7u3C9jNrGRjpeWVQo7ybLCWoNnoZhc
	 vrWqWbpNSmFfGmbGz/4tEA1ZDxHAZ0g8RqVONOlLwMuU/pT3r3QEyCSeF7Ew6b7mSZ
	 pH+O+khbvuaJDpzAqxTl9mvPUQvL1kOsZKoNoLDw=
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Subject: Re: [PATCH v4] rust: error: modify `from_errno` to use
 `try_from_errno`
Date: Tue, 10 Dec 2024 11:13:54 +0100
Message-ID: <F3F6EC59-A4AE-4137-80C2-9048CA0EF33D@kloenk.dev>
In-Reply-To: <20241207112445.55502-1-daniel@sedlak.dev>
References: <20241207112445.55502-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



On 7 Dec 2024, at 12:24, Daniel Sedlak wrote:

> Modify the from_errno function to use try_from_errno to
> reduce code duplication while still maintaining all existing
> behavior and error handling and also reduces unsafe code.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1125
> Suggested-by:  Miguel Ojeda <ojeda@kernel.org>
> Co-developed-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@=
gmail.com>
> Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gm=
ail.com>
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

> ---
> v3 -> v4:
>      - Now everything should be rebased correctly.
>      - Link to previous version [4]
>
> v1 -> v3:
>
> Currently, there are three patches for this issue. There was a race con=
dition between
> me [1] and Guilherme [2] because we both picked it up as a "good first =
issue" without
> knowing that one of us had started working on it. We both agreed that o=
ne of us would
> be the main author and the other one would be noted in "Codeveloped-by.=
" However,
> Guilherme has kept radio silence since [3]. So, I am resubmitting the p=
atch, which
> builds on top of [3].
>
> Link: https://lore.kernel.org/rust-for-linux/20241104185135.18974-1-dan=
iel@sedlak.dev/ [1]
> Link: https://lore.kernel.org/rust-for-linux/20241104200014.12996-1-gui=
lhermev2huehue@gmail.com/ [2]
> Link: https://lore.kernel.org/rust-for-linux/20241105114819.14051-1-gui=
lhermev2huehue@gmail.com/ [3]
> Link: https://lore.kernel.org/rust-for-linux/20241123104857.49385-1-dan=
iel@sedlak.dev/ [4]
>
>  rust/kernel/error.rs | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 52c502432447..9b508f10c211 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -101,19 +101,16 @@ impl Error {
>      /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
>      /// be returned in such a case.
>      pub fn from_errno(errno: crate::ffi::c_int) -> Error {
> -        if errno < -(bindings::MAX_ERRNO as i32) || errno >=3D 0 {
> +        if let Some(error) =3D Self::try_from_errno(errno) {
> +            error
> +        } else {
>              // TODO: Make it a `WARN_ONCE` once available.
>              crate::pr_warn!(
>                  "attempted to create `Error` with out of range `errno`=
: {}",
>                  errno
>              );
> -            return code::EINVAL;
> +            code::EINVAL
>          }
> -
> -        // INVARIANT: The check above ensures the type invariant
> -        // will hold.
> -        // SAFETY: `errno` is checked above to be in a valid range.
> -        unsafe { Error::from_errno_unchecked(errno) }
>      }
>
>      /// Creates an [`Error`] from a kernel error code.
>
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
>
> Daniel
> -- =

> 2.47.1
