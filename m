Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0A91DFED;
	Wed, 15 Jan 2025 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736944319; cv=pass; b=bftynuHtDgDiZbisz1lIkLOkYxF/N8xgKAHdQjO0JghiBUuVGX9x7Y/BcmgslbhB6pZZEoOvIUgEtORMKZ9ogDNOIbaqUm+xlNA2WLz2EOlYwSfr4rkHhbkfxIhmItNBVR7ELTSChyzx8pUAtFr+DpJPUBm3LzhyDH+QQL3WHQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736944319; c=relaxed/simple;
	bh=gq8/1ci0pGGUmQfqZ4lJBmpo7TRRsGNFCL2zUbLa/dY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=TUBpP3jZOL5+oMAaGjC/EoTQWeTzqB0x6NkUiuqBekIoWubbxmaS1hOB794w5xat+L+kHkLfFwhQY6p25IBUs4CP+i8mzfOz3QmITA8XZGCOIfekO8k0ehjIQ+ti+ZkPWOw7ejZsQARqLTkAH1wTFtVzva4XI/A9Mk9pbpFPm8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=cGzXYWOq; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="cGzXYWOq"
ARC-Seal: i=1; a=rsa-sha256; t=1736944301; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nBcL8ioRo2UTjP9wHeEZBVvRwUasKdsLIbQUxJk+6b7sg3vDgSe5A9Le/H7Sh4DSesUKHCAZTd6/FFd14DQNn8emQ22C53l2NARlW5vNAgejhdc+NZVpv9JIvUuHYX29VjhfREcNtq8Pb8sXeX1AfHt/OIAXnQhFK8WeLmjbMCg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736944301; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gq8/1ci0pGGUmQfqZ4lJBmpo7TRRsGNFCL2zUbLa/dY=; 
	b=KIMTiISzzkzGGGvS+5mpQAUuTEFNW8KRNCON50puiF+yXH2fbKU73RawiIJsAXbEDvCcVSlltNWJEwoDWcfOq9pxtNBTuChQvk1BGDevHnnzNw2TeO2dG6ZKzjfddOdrA04xnHigJxdZrYrW9Xi1rn42EgXY0IDB9MI8a2ARZdI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736944300;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=gq8/1ci0pGGUmQfqZ4lJBmpo7TRRsGNFCL2zUbLa/dY=;
	b=cGzXYWOq0A8BhlwcNQ5vows8qntAOTBBgJyt8tey9xhbEsFSR2GcahukxLR7dMaN
	0kJNImmzcYMLc93wOgH3vDGzXkP9S1sI2wFP95dGwO5L0PO/ATww86OIi0vReCd2JMh
	yPseklePbBQ28fir3ZNjtD8U5aeeIiS49Zw9gdKo=
Received: by mx.zohomail.com with SMTPS id 1736944297724681.6013028134887;
	Wed, 15 Jan 2025 04:31:37 -0800 (PST)
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
In-Reply-To: <20250115113836.18992e92.gary@garyguo.net>
Date: Wed, 15 Jan 2025 09:31:22 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <71A92388-A636-47F4-9B1C-0154D9AA9839@collabora.com>
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
 <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
 <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
 <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com>
 <20250115113836.18992e92.gary@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External



> On 15 Jan 2025, at 08:38, Gary Guo <gary@garyguo.net> wrote:
>=20
> On Tue, 14 Jan 2025 15:57:57 -0300
> Daniel Almeida <daniel.almeida@collabora.com> wrote:
>=20
>>>=20
>>> It's not the pin_init! stuff, but the Opaque stuff. If it fails, =
then
>>> it runs the destructor of Opaque<T>, which does *not* run the
>>> destructor of T.
>>>=20
>>> Alice =20
>>=20
>> This is pretty unintuitive if you take into account trivial examples =
like
>>=20
>> ```
>> struct Foo(T)
>> ```
>>=20
>> Where dropping Foo drops T.
>>=20
>> Is there any reason why dropping Opaque<T> doesn=E2=80=99t behave =
similarly?
>>=20
>> =E2=80=94 Daniel
>=20
> `Opaque` means that "this is a blob of bytes and don't touch it". It
> can be uninitialized, so no meaningful action can be performed when
> it's dropped.
>=20
> Best,
> Gary
>=20

I really think that the documentation for this type has to be improved =
somehow.

How is this a blob of bytes that can=E2=80=99t be touched, if it gives =
out a *mut T?

I think I=E2=80=99ve consistently seen code that either accesses or =
mutates the inner T through
the pointer.=
