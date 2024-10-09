Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CD31DD545
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Oct 2024 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728491769; cv=none; b=salFPKWAMASHP8Xnp3I2SyD671d0k/m81c0sdjWr8yRqc8+z0JT5u+J+XoD7rIOpQ/IHZkuvlh21/g56LYksCdP2sJexJkACgTykknbfHqNFUuwVHscqULOSPyhfROGU2PK/HGyfn4lbvYxMvo3Ea7C0gOKYMv9xH1kyFSnJZTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728491769; c=relaxed/simple;
	bh=8HKJlWSSCHdy6qITFYkhu5cddwy+nQ1ZeYduwDm6hjo=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QT1wPS2GGwgDDZWNIPK7F6b4cmoTBBy0IRCtdJ3fH5LNOpV4Lz5pw8qzLw5kdBssZbfSFMchR9+e4wcyRKpGeRpRcLXWtz7OCawww3SzHooUfjOlPIz8DCXffnLiXykd24NFYUXa9tCpZ9br5M2oQ6sk7n7c6u2A5hhup0+ZLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=bCup32UD; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="bCup32UD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1728491760; x=1728750960;
	bh=zmN7XVnDiHBQMiossOz4+ICOWo+68Q9zVw+WfEF1/vU=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bCup32UDoeCdBJCu6ZCjcNjQ2Hsq5Weuaqt6jIOUGZnszZJXqPveUf1xNVnfHL+bB
	 c7dfkT0j5/G3rWv1kb4tpYwly7HEaAByfw5LDpbZ27L4V2GiUALqvZuvTQT4PSFnVp
	 BIa53l8rtBNRugCCh21l4xn4OR/Lbm9jTWCrmbBtj0j/ty9o8zrXybtgc6ZLODorqk
	 iqvEOlPPTxIQPstp8hy2aJzk4oGvs/fDlldTqyO0p6ngBCGcdB++zJsu3c8mWAFkhD
	 vQ+hLahEMGNn9Ip0MCcIfeQGUdIbVWO3smVT7GNWBuoFUlaYeSGLJywRScNAca1R5j
	 XLSq/e3ZqJkMw==
Date: Wed, 09 Oct 2024 16:35:55 +0000
To: Dirk Behme <dirk.behme@gmail.com>, Christian dos Santos de Lima <christiansantoslima21@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH] rust: transmute: Add implementation for FromBytes trait
Message-ID: <cf317f8a-e67c-4c33-a16e-74f7ef9ef96f@proton.me>
In-Reply-To: <da18f77e-3ac3-4222-9ceb-72e2955472a7@gmail.com>
References: <20241009014810.23279-1-christiansantoslima21@gmail.com> <da18f77e-3ac3-4222-9ceb-72e2955472a7@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: f7b7b0c10724306e0770a16aea16d3835fcdcb90
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09.10.24 15:03, Dirk Behme wrote:
> Am 09.10.24 um 03:47 schrieb Christian dos Santos de Lima:
>> Add implementation and documentation for FromBytes trait.
>>
>> Add new feature block in order to allow using ToBytes
>> and bound to from_bytes_mut function.
>>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1119
>> Signed-off-by: Christian dos Santos de Lima <christiansantoslima21@gmail=
.com>
>> ---
>>   rust/kernel/lib.rs       |   2 +
>>   rust/kernel/transmute.rs | 302 +++++++++++++++++++++++++++++++++++++--
>>   2 files changed, 290 insertions(+), 14 deletions(-)
>>
> ...
>> --- a/rust/kernel/transmute.rs
>> +++ b/rust/kernel/transmute.rs
> ...
>> +unsafe impl FromBytes for u8 {
> ...
>> +unsafe impl FromBytes for u16 {
> ...
>> +unsafe impl FromBytes for u32 {
> ...
>> +unsafe impl FromBytes for u64 {
> ...
>> +unsafe impl FromBytes for usize {
> ...
>> +unsafe impl FromBytes for i8 {
> ...
>> +unsafe impl FromBytes for i16 {
> ...
>> +unsafe impl FromBytes for i32 {
> ...
>> +unsafe impl FromBytes for i64 {
> ...
>> +unsafe impl FromBytes for isize {
> ...
>=20
> Asahi Lina's device tree code which reads the device tree node's data
> as a byte slice and then has to convert it
>=20
> https://github.com/Fabo/linux/blob/9e496b356ee8e25f9bee9258491aa6ae3a4f1d=
df/rust/kernel/of.rs#L390
>=20
> uses macros to avoid code dublication:
>=20
> prop_int_type!(u8);
> prop_int_type!(u16);
> prop_int_type!(u32);
> prop_int_type!(u64);
> prop_int_type!(i8);
> prop_int_type!(i16);
> prop_int_type!(i32);
> prop_int_type!(i64);
>=20
> Would anything like this be possible here, as well? To avoid code
> dublication?

Yes please, create a macro.

---
Cheers,
Benno

