Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647292C15AB;
	Mon, 22 Dec 2025 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766413662; cv=pass; b=DqEaNtnbk86p6hljYLmUKR27RH2vHcDV6Bzo55aLE+eZGPbcXMMX4WOJ7Hf5PsjDrBJuO0b3anmM7jtkx3aCy2C6cDrq6fbe4XGKaVtHcdpTwQHPe0po1HwyFEH88KE4l4HJ1gKHE2KnJmHwNAl2VIy+v9hs7uAiG+tGoer0xac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766413662; c=relaxed/simple;
	bh=5sw1reTragsqSGwYMKSai4NMDLIlB5UCWBtrJdmUdCw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=BDPpZkmfGZzGN3urUay+4KWDakh/SIZRjLYWu8E+2gUbGTwrBl4a/Cy9ZbT4GI01dfhfTU1+zLSE2Me/O6a/rQZ3Q12sPpKfebAGSU+ebh9mIL+2imVVlkp7nfgesEeexhS4b2XdbvyAmlNIySJnlDSoHvy/JNOQ0MCkRrCL2+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=POnXzzzx; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="POnXzzzx"
ARC-Seal: i=1; a=rsa-sha256; t=1766413642; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O7nGTVpth9zqaY4ftDQ0/w5VNpiCZptQeT5pby1alspmyrq8QB0c3D4gjfkMe1ZpWcfOKa0Zy1gK+mW6vCKpPeA9lodNjNh3wLbXgU1Wenkt9cCnO0xP3hffVsarnbR9SVoBdZ5+tCyelOGlZKwGaoYeFkKeqgOHzjtCGH2ARK0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766413642; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hgs8MdpPnOY6mMVSpbNghl91DexQmA1j1V6Tu0C/GYs=; 
	b=N7YVTgMIGiAQsF7BEgb9ql+h5qlXeJTBRmObCjeMRREP5DbqsPT9rtfZi4KBPy05bscPpWiYiX2V4Ks9Ffc2xYhaJBSqr+N2sqcmXDnxJfSMhSHDMPgRG6SPn+Hf5rpmJNL4Jrd2pvmyvptB9NyOVYCt6vOqRlIQU64uKAB/xkI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766413642;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=hgs8MdpPnOY6mMVSpbNghl91DexQmA1j1V6Tu0C/GYs=;
	b=POnXzzzx4+4W9rAy72oUCvo6dOEbKxqOI3xv3/vVW6wMzsM4qP+KibV0VPU/HbDx
	z51f6NsFOeEtgzV+yhS2wNwZay0FLswr4VoaGBjIeCiVWaxGHFpGyNFZv2s6Tb00dfO
	AncLLSr+2HQnJ5HDWTqijFiZA5EIuDnfejkrGnDw=
Received: by mx.zohomail.com with SMTPS id 1766413640001826.629733215712;
	Mon, 22 Dec 2025 06:27:20 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: miscdevice: replace `kernel::c_str!` with C-Strings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251222-cstr-char-misc-v1-1-d218537d28ab@gmail.com>
Date: Mon, 22 Dec 2025 11:27:05 -0300
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4FD16040-972B-4AD2-9BEA-85E5F83C71C5@collabora.com>
References: <20251222-cstr-char-misc-v1-1-d218537d28ab@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 22 Dec 2025, at 09:21, Tamir Duberstein <tamird@kernel.org> wrote:
>=20
> From: Tamir Duberstein <tamird@gmail.com>
>=20
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>=20
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> samples/rust/rust_misc_device.rs | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/samples/rust/rust_misc_device.rs =
b/samples/rust/rust_misc_device.rs
> index d69bc33dbd99..49dd5814e1ab 100644
> --- a/samples/rust/rust_misc_device.rs
> +++ b/samples/rust/rust_misc_device.rs
> @@ -98,7 +98,6 @@
> use core::pin::Pin;
>=20
> use kernel::{
> -    c_str,
>     device::Device,
>     fs::{File, Kiocb},
>     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
> @@ -133,7 +132,7 @@ fn init(_module: &'static ThisModule) -> impl =
PinInit<Self, Error> {
>         pr_info!("Initialising Rust Misc Device Sample\n");
>=20
>         let options =3D MiscDeviceOptions {
> -            name: c_str!("rust-misc-device"),
> +            name: c"rust-misc-device",
>         };
>=20
>         try_pin_init!(Self {
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-char-misc-0f4144d0a7b2
>=20
> Best regards,
> -- =20
> Tamir Duberstein <tamird@gmail.com>
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
