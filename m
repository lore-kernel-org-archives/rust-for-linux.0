Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802A014A62A
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 19:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729713083; cv=none; b=LMn3DaS32Rk6fU9i0fhE2b+hFauZP3OAnJj2VylfRt5NnJl2gVDhnZ0K6XcVxszR7ytK+PP4bcXB7FRURxtK+cX+htUgjIcO4dRlOTUgeY+VpBSZ6SymjI4do0myqD7mCkePXFqZ7JF3GUwDNMfL2sovnlbeircDT2rR3CH54G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729713083; c=relaxed/simple;
	bh=XGHEe5rM0A26uQ4DtcESOpz4L+iI4KcJJWZIxJpt6wc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B8NLsOXSs6fw+p8MT68ExmdbFg7XZvyXrHoda64h4/NbasYQd5cAo4knIPQ7W+0JqgmgWH/dccKOz8RnzIspE37gqncjlGiaRp1KIwmA3bpL74+o5t54BJm0L+WWs2xVdMzWwF6bICEYYX1RLnMNnA2An4iCwMZz+PPLRtTEDgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=dDiKGZto; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="dDiKGZto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1729713074; x=1729972274;
	bh=5gl5rX8a3hs+xgXtF32k8w4jMMMQDTmRjC0W5Kfzh8c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dDiKGZtoL/1nd2931NeWt+lDg0O0THWDrnDXlgw+xm4Ymgpbuf3tK7Bzyc1mQWkj5
	 HBnLXU2Nweb6JQZ10vMNACAYt5ijlLUV/exAbbyJpeAUkIyNKWW0oiLL5U8/OL5Fuv
	 0dZtItS/UihG2NaSPEXcZiIJQVKVrG3gQeqN7WUcGYloHIyQnRjDr7AKC3uGjUrMAh
	 myD6DY7pwsYATp58s0LC3CEiCIQgrWzh4/QTWWIkbgCLYu1WPKthVxG6zO4DbnrTOc
	 ow4bFpoeBD8Wg2ElVUyIOlHRpALF1hJ4VjIzYzA3WpEyI6U0Cwrt/ZrRGjG4Ys6ztq
	 Uxn06PGwXI4/Q==
Date: Wed, 23 Oct 2024 19:51:09 +0000
To: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nell Shamrell-Harrington <nells@linux.microsoft.com>
Subject: Re: [PATCH v2] rust: types: extend `Opaque` documentation
Message-ID: <f7f65b97-2921-4a7d-b564-ff7479cad1ec@proton.me>
In-Reply-To: <20241002050301.1927545-1-dirk.behme@de.bosch.com>
References: <20241002050301.1927545-1-dirk.behme@de.bosch.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 53cb22c32c233fc568c9b85f4d4680707faf8566
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02.10.24 07:03, Dirk Behme wrote:
> Update the `Opaque` documentation and add an example as proposed by
> Miguel Ojeda in [1]. The documentation update is mainly taken from
> Benno Lossin's description [2].
>=20
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Cc: Benno Lossin <benno.lossin@proton.me>
> Cc: Nell Shamrell-Harrington <nells@linux.microsoft.com>
> Link :https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/top=
ic/What.20to.20work.20on.20next.3F/near/467478085 [1]
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/top=
ic/What.20to.20work.20on.20next.3F/near/470498289 [2]
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>=20
> Changes in v2: Correct typos and formatting. Drop non-camel-case.
>                Add SAFETY comment.
>=20
>  rust/kernel/types.rs | 45 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 10e3b1a999f4c..5e96f2c46f9fd 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -290,7 +290,50 @@ fn drop(&mut self) {
>=20
>  /// Stores an opaque value.
>  ///
> -/// This is meant to be used with FFI objects that are never interpreted=
 by Rust code.
> +/// `Opaque<T>` is meant to be used with FFI objects that are never inte=
rpreted by Rust code.
> +///
> +/// It is used to wrap structs from the C side, like for example `Opaque=
<bindings::mutex>`.
> +/// It gets rid of all the usual assumptions that Rust has for a value:
> +///
> +/// * The value is allowed to be uninitialized (for example have invalid=
 bit patterns: `3` for a `bool`).
> +/// * The value is allowed to be mutated, when a `&Opaque<T>` exists on =
the Rust side.
> +/// * No uniqueness for mutable references: it is fine to have multiple =
&mut `Opaque<T>` point to the same value.

The "`" should be in front of the "&mut".

> +/// * The value is not allowed to be shared with other threads (i.e. it =
is `!Sync`).
> +///
> +/// This has to be used for all values that the C side has access to, be=
cause it can't be ensured
> +/// that the C side is adhering to the usual constraints that Rust needs=
.
> +///
> +/// Using `Opaque<T>` allows to continue to use references on the Rust s=
ide even for values shared with C.

Miguel already mentioned this: could you add my Co-developed-by, since
most of this stuff is from me. Thanks!

---
Cheers,
Benno

