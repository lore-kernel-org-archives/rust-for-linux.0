Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8D7082F;
	Thu, 12 Feb 2026 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915216; cv=pass; b=X1bGlwF1YQ/gc4x7mSGDAQN1aJvZPvn2ZG7BkddB9CqomTngrqxbBaWhXt+tf/UwZWv7GcIKCB4L9tgkJxih/QPrDziw5SbcA9jc8kGfvnm+yd5UqpZdrIGMorUbh7BPlvk1krzNrjWcpA0EDDM6M7fJWHPEw9jkR4Rk9XQYSyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915216; c=relaxed/simple;
	bh=907yK7th/a5bvreZFattSHplhsUAblRhDmxV43srlMs=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=hVV5nxqf1UgjSkVTlxlnfKbwpJj3kI37LC+qyWU/Xv8KBXQSYxv7mVJ+m9lzQPPZkD+5bSDEEAxB3d/EjA7TikwKTFp4Ur58iU4LTzAI5HA8ok+2zTo4kQr15nOyr6WDSijA/E28sn/3OQhzPLr0MvByMZJbc+e9GqQMX4sOUuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ILsKUH41; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ILsKUH41"
ARC-Seal: i=1; a=rsa-sha256; t=1770915203; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F96M0Y3/1474ZyRGt8qDkhzCHywuVhAum5b2H2lmYylrqOOlaMekuAMMJlZwdmwoVcABKLGcBPfFiSpDKfKKxc2a5fs4Hy22H3uoSqrGRidBDYrA2V0iOWNksfSMFpZsfF6jrhPRfVBG2K6EGO5T/UY1HSfIrkKnqZdab6m5OUE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770915203; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D+PfstlcqBbJ10mv0FXZgbNx96RRyhd267Gn9fQOZ6U=; 
	b=CXjzVmbGfaAQsv6+BB+nLE02iqBWeGNRRIN9ak5UXN8cTsLKMzVJqRY5pa4/7wvo8+G2RYLnKENO8MOeqi4tYMzfypmJXm/SAIQwuA+rmpcYVVjKNN1ESc4/f0Yn+o++tI29LKfteUE/c4z1otYBqiWhlzEIsouQuTPyNZiESKY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770915203;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=D+PfstlcqBbJ10mv0FXZgbNx96RRyhd267Gn9fQOZ6U=;
	b=ILsKUH41njQ0gwReqwPFDYJ+35AP+D9tQlYzgJy5XYmQOCnwMsmlyqavraEvrwx4
	igwgFLyip0hXOXOx+dNNrYR2qoXum83C5mxfm8UD3kxz6mMAKpVkiQU2lKmuYaYpJLh
	Z+9BmmNyb0rbweOVv/um4eXYrPxreiYEqbYAmUPU=
Received: by mx.zohomail.com with SMTPS id 1770915201846893.105655701162;
	Thu, 12 Feb 2026 08:53:21 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] rust: impl_flags: add method to return underlying integer
Date: Thu, 12 Feb 2026 13:53:05 -0300
Message-Id: <C6A3F9D2-1FA1-42DB-9587-206A092ACF84@collabora.com>
References: <20260212-impl-flags-inner-v1-1-1e2edc96e470@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andreas Hindborg <a.hindborg@kernel.org>
In-Reply-To: <20260212-impl-flags-inner-v1-1-1e2edc96e470@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: iPhone Mail (23C71)
X-ZohoMailClient: External




> On 12 Feb 2026, at 13:03, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>=20
> =EF=BB=BFAdd a method to return the underlying integer used for flags. Thi=
s is
> useful when using the flags with C APIs.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> rust/kernel/impl_flags.rs | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
> index e2bd7639da12e..951598497de1d 100644
> --- a/rust/kernel/impl_flags.rs
> +++ b/rust/kernel/impl_flags.rs
> @@ -267,6 +267,12 @@ pub fn contains_any(self, flags: $flags) -> bool {
>             pub fn contains_all(self, flags: $flags) -> bool {
>                 (self.0 & flags.0) =3D=3D flags.0
>             }
> +
> +            /// Return a copy of the inner representation of the flags.
> +            #[inline]
> +            pub fn into_inner(self) -> $ty {
> +                self.0
> +            }
>         }
>     };
> }
>=20
> ---
> base-commit: b8d687c7eeb52d0353ac27c4f71594a2e6aa365f
> change-id: 20260212-impl-flags-inner-c61974b27b18
>=20
> Best regards,
> --
> Andreas Hindborg <a.hindborg@kernel.org>
>=20
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=

