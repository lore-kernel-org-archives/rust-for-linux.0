Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5361F18952C;
	Tue, 14 Jan 2025 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879740; cv=pass; b=gUxHMbDuP5Ox/yccCwpCsZEG05tJDZm7aiPCGCjJasmAicOyxZjTAfwg0YoORrm5lJUf05qO4xfHBpAzeAsQBfcGigIC13StYBSkpSIU4oqX7TLkEWdnd4TZJLpszCkf9WbKEwBeQV/GeEnpEnwNJE8QHqyq/MDQPfpeoXPLpjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879740; c=relaxed/simple;
	bh=ZvpPH7nDu9JN/Adq5BM8r904dVXoEKaxJBeB/snJOco=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=P/vIXuj1IE3BmemXbP5oN1j/a9ptCKLUhVhcBe6xXhCpdM5tc41qmnYcHQvaHSjnIqvvtyWCDJFMSW6HgC3nG2eNsUhq8gfgh8tEHS5b/9gnud0I1Ex7YHH5r0ntGpnkuWa2RLTnf8S/l0COOSXVWPcDbEjyfCmnMpl3hSw3XuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=lCLwQ4gX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="lCLwQ4gX"
ARC-Seal: i=1; a=rsa-sha256; t=1736879714; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hOgZOX6CR6rtvRSUhxRa/sxG7BzoyMh1ANi4DYoKDvHrlE3DVNTSykXZfuTFolXGVxc+I8X0aovCXutP+XnoQg0LZ2xMijRZQQj8m9G34FS2N82aZByTzVR3lGJAysq37xjcl1d4UIRQsh6H5B5BMiaeU4Y4zNFI6cnlvR2I40s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736879714; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QMGV4ISAS45VBctJkrm+593eB2VFHDKOzOQuZxLy1FY=; 
	b=ENeZMPiWqp4R+AM7BDVPwQCtJLyJf6IOLKZZqLZhKbNjbqMRCTM5tWodQ/RITvDTA+qF5ZpQ3sXsnRU4kGLn7fFcxC44PE0t+9YBEJs+OoRdo3tRmxucLJqMtmTQlW/9bLVcMKwABZ0xfvTcBQgMkd1EDN/Whs7/rEnkQ/G8cQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736879714;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=QMGV4ISAS45VBctJkrm+593eB2VFHDKOzOQuZxLy1FY=;
	b=lCLwQ4gXO//SGLpsLflLU9ifJSqRwVbjYg6xg47icU4C4MExxfsm8SOzFUYMXpCm
	MHZRG27+oFqtm8o0SBXGpsjZpQOj6TnaVBketn374rV9V3s0L+yE4/MH9qiGFo9DWE+
	ax44UOEaHZekGpnDjcZcyS0CTcm37R12iZc40v3E=
Received: by mx.zohomail.com with SMTPS id 1736879712257954.5708857779471;
	Tue, 14 Jan 2025 10:35:12 -0800 (PST)
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
In-Reply-To: <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
Date: Tue, 14 Jan 2025 15:34:56 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Alice,

> On 13 Jan 2025, at 11:42, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Thu, Oct 24, 2024 at 4:20=E2=80=AFPM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
>> +impl<T: Handler> Registration<T> {
>> +    /// Registers the IRQ handler with the system for the given IRQ =
number. The
>> +    /// handler must be able to be called as soon as this function =
returns.
>> +    pub fn register(
>> +        irq: u32,
>> +        flags: Flags,
>> +        name: &'static CStr,
>> +        handler: T,
>> +    ) -> impl PinInit<Self, Error> {
>> +        try_pin_init!(Self {
>> +            irq,
>> +            handler: Opaque::new(handler)
>> +        })
>> +        .pin_chain(move |slot| {
>> +            // SAFETY:
>> +            // - `handler` points to a valid function defined below.
>> +            // - only valid flags can be constructed using the =
`flags` module.
>> +            // - `devname` is a nul-terminated string with a 'static =
lifetime.
>> +            // - `ptr` is a cookie used to identify the handler. The =
same cookie is
>> +            // passed back when the system calls the handler.
>> +            to_result(unsafe {
>> +                bindings::request_irq(
>> +                    irq,
>> +                    Some(handle_irq_callback::<T>),
>> +                    flags.0,
>> +                    name.as_char_ptr(),
>> +                    &*slot as *const _ as *mut core::ffi::c_void,
>> +                )
>> +            })?;
>> +
>> +            Ok(())
>> +        })
>=20
> I think this does not run the destructor of `handler` when
> `request_irq` returns an error.
>=20
> Alice

How? T is passed by value, so if request_irq() fails and thus =
Registration::register() returns Err,
I assume T is dropped.

Or is the pin_init! stuff somehow special here?

=E2=80=94 Daniel

