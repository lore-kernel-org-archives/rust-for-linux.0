Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38CF132105;
	Wed, 15 Jan 2025 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955489; cv=pass; b=XfG3HuK315o3I83ClP2L297uYzVOlfyIUILvwyYbM0fAKAnlR4j3xKH+RdLrjOu9i4ZRQy177Mn/8UTbXXFBFRhXo6BLb6AJi5bRkvw5Qyw0eD2aIv5vbaJZg7dLVvE6B5/jUaaB4WUGQoOQ8w5txWwkSd8qMBaN+/nO8PkwcK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955489; c=relaxed/simple;
	bh=e8PMTPaLpGgm5lxRW0Qe9pCsSh93hat2HNI4vQtD0P8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QERezMdESzZJQ4zziLoIvEGcbERgRCZpli5apXC1uOOADpxhtQYBX++BD8Q0YAq8qFk+YW9Ea78eC1L6/0GRSg/XXWycge+Up8qY9+2ia1SN/JQbgf+ohSlUMCoWsgJlpz5HPnfhNmB7mvRzFK9r2oOFgY78ARtUBmYHgEHz8YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=G2NriM4I; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="G2NriM4I"
ARC-Seal: i=1; a=rsa-sha256; t=1736955471; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GUdQoElhjUcn4JQkuSRobplxAXv09aJmffIzTQyl+ePr+8MaaGQBSyYAUsuJWs8FnIVf3w1SCtk83BRYRqRjUVHSMXWX7JgH4iuWR+qLLvVk8aIhz0P95t0Vpd7pZpGsOG9MkRGSvVtAoNRsJHejKJc1hOACNXsicUktSYy/rOg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736955471; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LQSAsRjVjZBhE17Y7jFCcK8kWP9IYzRXavZMEDDlMa8=; 
	b=U5jGQ3bXo70EBLazaWCAlBzrNXuhgxefXDsl/I+UBP336359JGdzYovWHEIMKa3aBn/b6iOB0EqJBdgENd3jl3+Sy96uSTKCJcM2DGvqp5b68fqeukC8fEqNzuRv7LICtVUOALx9mdHGdJXdPuWM3+yNprA3gLXFNwEHrVd/zdE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736955470;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=LQSAsRjVjZBhE17Y7jFCcK8kWP9IYzRXavZMEDDlMa8=;
	b=G2NriM4IrMLNMGxa1FvO+6vampXOuW5IQ7STyjLUfyCD8XCBcXgOhQpbzDinGpDt
	1h7jrpbOeI8dYQSd5mJdqOnBlcqrzkLHueZxmlDolghlYzdJHYFozvTlHYevZavQkto
	Gvgb9/z2DYMxx6/ilijRdocc0yoX/RSdGuZl/9FE=
Received: by mx.zohomail.com with SMTPS id 1736955467770234.65620921830487;
	Wed, 15 Jan 2025 07:37:47 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH] rust: irq: add support for request_irq()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <Z4fIi_Gr0XZog4Ye@boqun-archlinux>
Date: Wed, 15 Jan 2025 12:37:33 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F8AB1160-F8CF-412F-8B88-4C79D65B53A1@collabora.com>
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
 <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
 <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
 <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com>
 <Z4cFO5NIW-E07Vl5@boqun-archlinux>
 <CAH5fLgge1pp10a8w4xp1eDobMJUHpnM1Ezh+JHmVmfF=6_vpTQ@mail.gmail.com>
 <Z4fIi_Gr0XZog4Ye@boqun-archlinux>
To: Boqun Feng <boqun.feng@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External



> On 15 Jan 2025, at 11:39, Boqun Feng <boqun.feng@gmail.com> wrote:
>=20
> On Wed, Jan 15, 2025 at 09:27:39AM +0100, Alice Ryhl wrote:
>> On Wed, Jan 15, 2025 at 1:47=E2=80=AFAM Boqun Feng =
<boqun.feng@gmail.com> wrote:
>>>=20
>>> On Tue, Jan 14, 2025 at 03:57:57PM -0300, Daniel Almeida wrote:
>>>>=20
>>>>>=20
>>>>> It's not the pin_init! stuff, but the Opaque stuff. If it fails, =
then
>>>>> it runs the destructor of Opaque<T>, which does *not* run the
>>>>> destructor of T.
>>>>>=20
>>>>> Alice
>>>>=20
>>>> This is pretty unintuitive if you take into account trivial =
examples like
>>>>=20
>>>> ```
>>>> struct Foo(T)
>>>> ```
>>>>=20
>>>> Where dropping Foo drops T.
>>>>=20
>>>> Is there any reason why dropping Opaque<T> doesn=E2=80=99t behave =
similarly?
>>>>=20
>>>=20
>>> Because `Opaque` implies the value may not be initialized, it's =
similar
>>> to `MaybeUninit`.
>>>=20
>>> Do you really need the `Opaque` here? C code won't touch `handler` =
if
>>> I'm not missing anything.
>>=20
>> The irq callback is given access to handler, so it could touch it at =
any time.
>>=20
>=20
> You're right it could, but would it? C code doesn't know the concrete
> type of the handler, so what it usually does is just passing the
> pointers to the Rust code (again).
>=20
> A similar case the `func` field in `ClosureWork`: it doesn't need to =
be
> `Opaque`, although workqueue callback may access it.
>=20
> Am I missing something here? Daniel, why this has to be `Opaque`? =
Could
> you explain?
>=20
> Regards,
> Boqun
>=20
>> Alice

As Alice said, !Unpin is the main requirement. Although it=E2=80=99s not =
clear whether this can=E2=80=99t be
achieved through a PhantomPinned<T> instead.

Again, Opaque<T> needs to have its docs updated to more thoroughly =
explain when it should
be used. My understanding relies on what is written, i.e.: a transparent =
wrapper providing
!Unpin, UnsafeCell and a *mut T API for an owned T.

One could very well think this is the default thing to reach for to =
build anything wrapping a bindgen type.

Note that =E2=80=9Cblob of bytes that shouldn=E2=80=99t be touched=E2=80=9D=
 is not explicitly written down in the docs. What is in the docs
is a vague  =E2=80=9Cobjects that are never interpreted by the Rust =
side=E2=80=9D.


=E2=80=94 Daniel


