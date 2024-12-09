Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5825221DB0
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747174; cv=none; b=aClD0YF9/ekruOv9m/pIDUJNVqniZ6jU7XaQpTxyDBEZe17+VAfNK3u2EpHzvcqh9PwdwELkAj1Kz7N90clo7eBj1gVOILQOvlwaetUdWg9t46s/EY1ZuuBTYK0m1JKyJ8QajPETz14klyAZom8YmrXlPSNhdWk6c/IUClZrZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747174; c=relaxed/simple;
	bh=hDHzd+MWM08CNGht1NmIPhNrYNLWJN/0bxWK9ShQJic=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H45VTapC6YvSgtjceGA/UR1ubqow2ifRnvQgZExuY9F7TwNb3SvtXA45LmKSsMiPn8rUA+5iJHujfho9WJrYkS4keshRiUdjaJbq/fR5DElHPxZYM16b6XEdV4YzN6HiKler3MndPbAaWCBpgxbQk0uwmRKnqJuSyboQKLL9ARU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=V7CKpgWg; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="V7CKpgWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1733747162; x=1734006362;
	bh=dX/L3tG9ebTCE9rlLCPFmmXz07tPOXuCXThDtzjTYJY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=V7CKpgWgZZds64HyyKGfM463LBDmCTB3yvh4apunKjX6XBFn9XEcoymxYxGxjfElJ
	 nrwvl+6LMZVPYblSW7leWxcHpeT9ny6kbTpXsPaFBhAUpLc3bJ+ENFdi5JqCRK+Kha
	 4S0BC2cgZXYUO9eDkt5VvzD5ol1BJiYVCLiXtjlXor9R2VOXXv1ddtlKtdu+f+h03m
	 FkIlGyWqXELA/F4ClgfwkRsWwboOb3hktd3XIb7JBLCKoZ6LWGXH+z4zt+ri4N3PXk
	 FbUyJK5YAnXLooqQ+wSc6cne8xDeot0s+6nku7/7pv8g4fpLoKJJKzIHggXXrMM+oR
	 QJ15dZcMDc/HQ==
Date: Mon, 09 Dec 2024 12:25:59 +0000
To: Greg KH <gregkh@linuxfoundation.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona.vetter@ffwll.ch>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Untrusted Data Abstraction
Message-ID: <1bd50122-bd7d-462e-86e5-0d2ba040ab4c@proton.me>
In-Reply-To: <2024120512-tuition-overcome-0939@gregkh>
References: <20240925205244.873020-1-benno.lossin@proton.me> <2024120512-tuition-overcome-0939@gregkh>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 9b2b9ebcfd34db4fe5bf2323f113a4c30103fe44
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.12.24 10:06, Greg KH wrote:
> On Wed, Sep 25, 2024 at 08:52:57PM +0000, Benno Lossin wrote:
>> Enable marking certain data as untrusted. For example data coming from
>> userspace, hardware or any other external data source.
>>
>> This idea originates from a discussion with Greg at Kangrejos. As far as=
 I
>> understand the rationale, it is to prevent accidentally reading untruste=
d data
>> and using it for *logic* within the kernel. For example reading the leng=
th from
>> the hardware and not validating that it isn't too big. This is a big sou=
rce for
>> logic bugs that later turn into vulnerabilities.
>>
>> The API introduced in this series is not a silver bullet, users are stil=
l able
>> to access the untrusted value (otherwise how would they be able to valid=
ate
>> it?). But it provides additional guardrails to remind users that they ou=
ght to
>> validate the value before using it.
>>
>> There are still some things to iron out on the Rust side:
>> - allow better handling of `Untrusted<T>`, for example allow comparing
>>   `Untrusted<[u8]>` for equality (we should do this via a trait extendin=
g
>>   `PartialEq`)
>> - rebase this on Gary's patch to enable arbitrary self types.
>> - get more feedback as to what `Untrusted` should make available
>>
>> In this version I removed the API showcase using tarfs. I did this,
>> because I have added the API to `uaccess.rs`. Also, this version
>> requires [1] to compile the doctests.
>>
>> [1]: https://lore.kernel.org/rust-for-linux/DM4PR14MB7276E6948E67B3B23D8=
EA847E9652@DM4PR14MB7276.namprd14.prod.outlook.com/
>=20
> This patch series just came up again (well, to be fair I mentioned it),
> so I was curious as to what the status of it was?
>=20
> Also, I think we need to add this to the userslice stuff to mark all
> data coming from userspace as untrusted, so tieing that in soon would be
> good so we don't have to churn a lot of existing code that ends up being
> merged soon (i.e. misc drivers).

Sorry for the delay. I have been busy with a lot of other stuff, maybe
over the holidays I can work on this, but I'm not sure. If someone wants
to pick it up, I'm fine with that.

---
Cheers,
Benno

>=20
> thanks,
>=20
> greg k-h

