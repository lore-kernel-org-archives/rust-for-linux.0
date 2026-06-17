Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D0430B501;
	Wed, 17 Jun 2026 03:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781666346; cv=pass; b=MhjpdWVgkSLBl18kcJ+a3VSvcqc2R4WYKcsLaz25UsrjUGx4pAjeyftPBe7rV1k08nKfKu6Zohp/gfCYQcw0ym+ZT5iNQrUD30+rVBUKlk680Eax879x0X/O7y/5aQ9U1pjCZFq/0eYrBBW1JHT7zeFqJtm0jzk1nbcUvHsLwnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781666346; c=relaxed/simple;
	bh=As/OYRmDRQeeEEyY9JPteOXJwaf7/p4cnVfFxvK960U=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Fb0sUYKthGVt4HYNXmqjyc+3B2hXJihG6xyxqW6AU0cenNVfP5ZQ4QSA3WwKKdATzct/Oj/6pGo9+WIEtnuFEx9Jp4cPg3Vum+pITRAX5RA6IEEUt2zN/chkklEBoY3oMh7i7YcyZTXCBTSDbw/QC2AeeCkYVW1LA1W/0Vz75aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Uko+vrlR; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Uko+vrlR"
ARC-Seal: i=1; a=rsa-sha256; t=1781666312; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gqzy+CAt9KPM9lz3sNdFpPZs/drbXSFOTr5dWLxkLxnfWk3fwypoMNSuBW1n0X0K4+NyjhpHEmtJophDp1iyzmvBV2CZFZGqsJP1tmiakaiaZWHnfFtGo7i4cMdDnmjPV4+EdWvtKjjVmktqQFPvQrm03e0RsTh8gwRT5FOoWEo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781666312; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SKRJlpRkL9FI3myjW9Ab+zQ3ZYFtMYfDVHaW7LEnSNM=; 
	b=efnXMhMRByjPVgf8cRTXwAI1zG0OMSvs6dqsdZlD5baELbCFxUhwSLu+WgpVKI26SZukaqzhlmDHxd72bFjyCAHyxlt3lXs2zlXehpnbvN4vqTNNpF4fWYMay3YwOPqreOn+tmC5tK4bouMNNyY0AWZLp8ATxiYgagCi3mdyvbc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781666312;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=SKRJlpRkL9FI3myjW9Ab+zQ3ZYFtMYfDVHaW7LEnSNM=;
	b=Uko+vrlRprwJhusCVbWOB66Y/+98KoGCPnPCOE24RLDBi4SnA5XXRGre12RYeSUI
	58nrolDdQgWLEMo46RkD6msrBSw8VMf8+t86chGEMqbkrx10AEQixa8Oc2ztVtIIxpF
	4UvEPwvW7v1/HKpgYKMbhcEX1kJiS+4Ud4rq+nvk=
Received: by mx.zohomail.com with SMTPS id 1781666310399651.7240345470009;
	Tue, 16 Jun 2026 20:18:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] usb: rust: mark Device and Interface methods as inline
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260616223614.16444-1-nico.antinori.7@gmail.com>
Date: Wed, 17 Jun 2026 00:18:09 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Benno Lossin <lossin@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <684C71F0-8C6A-4E73-9DF1-586DA5AE6C47@collabora.com>
References: <20260616223614.16444-1-nico.antinori.7@gmail.com>
To: =?utf-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 16 Jun 2026, at 19:36, Nicol=C3=A1s Antinori =
<nico.antinori.7@gmail.com> wrote:
>=20
> When building the kernel using llvm-19.1.7-rust-1.85.1-x86_64, the
> following symbols are generated:
>=20
> $ nm vmlinux | grep ' _R'.*usb.*Device | rustfilt
> ...
> ffffffff823f2490 T <kernel::usb::Device as =
kernel::sync::aref::AlwaysRefCounted>::dec_ref
> ffffffff823f2470 T <kernel::usb::Device as =
kernel::sync::aref::AlwaysRefCounted>::inc_ref
> ...
>=20
> $ nm vmlinux | grep ' _R'.*usb.*Interface | rustfilt
> ffffffff823f2450 T <kernel::usb::Interface as =
kernel::sync::aref::AlwaysRefCounted>::dec_ref
> ffffffff823f2430 T <kernel::usb::Interface as =
kernel::sync::aref::AlwaysRefCounted>::inc_ref
> ...
>=20
> However, these Rust symbols are trivial wrappers around the
> `usb_get_dev`, `usb_put_dev`, `usb_get_intf` and `usb_put_intf`
> functions. It doesn't make sense to go through a trivial wrapper
> for these functions.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> ---
> rust/kernel/usb.rs | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
> index 7aff0c82d0af..efbbee319b1a 100644
> --- a/rust/kernel/usb.rs
> +++ b/rust/kernel/usb.rs
> @@ -393,6 +393,7 @@ fn as_ref(&self) -> &Device {
>=20
> // SAFETY: Instances of `Interface` are always reference-counted.
> unsafe impl AlwaysRefCounted for Interface {
> +    #[inline]
>     fn inc_ref(&self) {
>         // SAFETY: The invariants of `Interface` guarantee that =
`self.as_raw()`
>         // returns a valid `struct usb_interface` pointer, for which =
we will
> @@ -400,6 +401,7 @@ fn inc_ref(&self) {
>         unsafe { bindings::usb_get_intf(self.as_raw()) };
>     }
>=20
> +    #[inline]
>     unsafe fn dec_ref(obj: NonNull<Self>) {
>         // SAFETY: The safety requirements guarantee that the refcount =
is non-zero.
>         unsafe { bindings::usb_put_intf(obj.cast().as_ptr()) }
> @@ -444,6 +446,7 @@ fn as_raw(&self) -> *mut bindings::usb_device {
>=20
> // SAFETY: Instances of `Device` are always reference-counted.
> unsafe impl AlwaysRefCounted for Device {
> +    #[inline]
>     fn inc_ref(&self) {
>         // SAFETY: The invariants of `Device` guarantee that =
`self.as_raw()`
>         // returns a valid `struct usb_device` pointer, for which we =
will
> @@ -451,6 +454,7 @@ fn inc_ref(&self) {
>         unsafe { bindings::usb_get_dev(self.as_raw()) };
>     }
>=20
> +    #[inline]
>     unsafe fn dec_ref(obj: NonNull<Self>) {
>         // SAFETY: The safety requirements guarantee that the refcount =
is non-zero.
>         unsafe { bindings::usb_put_dev(obj.cast().as_ptr()) }
> --=20
> 2.47.3
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

