Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18542204587;
	Tue, 14 Jan 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736881111; cv=pass; b=POJ0Iq6bDRxuQvsgrEf8wp9xKKnz4ZsTwWX2RKmqaWrfAmNS9MnoEoEtmCtMfcrs+gGoSMR3G/dTc7VifQwmaa5fFrai2QnpBTasFRAJkPj65zVzpks+CTRbGQj4qbZ/QAddXwS1lZGfzFHlsjDm32ZcoGW7iIyEh9iBKuQZwAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736881111; c=relaxed/simple;
	bh=NST1APTcfeX0zTApgvHgMHWLG0uPPTIvjh16VqnAx2o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lmyX9eE3tdO/UWuLNi1h8b0ridFjfmyuq7grJ4l6abqCUyX+QH432E607oIxrUFgKz/3XTwkDsO3PU0wmuyf4WR8FLr7u+Qry+8umSnLED90SxHS4rBobggI/Crc1l7231BpGcqxyxPxV+ePjbLY7Bmj2fNXQp2cbc4uP5X0Ijk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=JsVCb7mo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JsVCb7mo"
ARC-Seal: i=1; a=rsa-sha256; t=1736881093; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=di8NH54AiFwxUp2Dw3JPSQRtzyWmiuNTuqvysXdd05I1j6n3KZ4t/upYsXMLSbubK/PBVJ1k1tOxHEErObZkA2Pi2IhMvAjwpp8AbXlNs/3yHfF9HTeZZOVBN29TeSR7sGTM9GlVy9UWLg/mPfOlBYrmUrDOq0fd6j+/8vvD11I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736881093; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NST1APTcfeX0zTApgvHgMHWLG0uPPTIvjh16VqnAx2o=; 
	b=kUGxTE5aBWE7A3lokVaXdXjyHbumQz+HrjlDMADzd5rWfv/c/LfiQRwAuzLo0PclQbyuYECB6FE6vHPw9A07/7KXhG1r6qptHuf2OpmB5RWY+uRQmASi34wnShk3fGnYZQM3HqR2YyI2ADx8OSVltjU2zSp8aet6EgnHjOAUtrc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736881093;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=NST1APTcfeX0zTApgvHgMHWLG0uPPTIvjh16VqnAx2o=;
	b=JsVCb7movnAFs67jEdAI45IVI9dpbjLcNSYAa2RVwhzZnr5C4yL0q0pLbO09D240
	BFudXG/JOBSy3ARzK3KuesPgG8IsYeiKAxj7G/0ulg2kntkPxBiN8Y59Ki1LE8Xxnck
	qs6hewKUVcw5Srlc4iOB3k/uhHEDDNfB4MHjffN8=
Received: by mx.zohomail.com with SMTPS id 1736881092234484.31519345116044;
	Tue, 14 Jan 2025 10:58:12 -0800 (PST)
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
In-Reply-To: <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
Date: Tue, 14 Jan 2025 15:57:57 -0300
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
Message-Id: <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com>
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
 <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
 <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External


>=20
> It's not the pin_init! stuff, but the Opaque stuff. If it fails, then
> it runs the destructor of Opaque<T>, which does *not* run the
> destructor of T.
>=20
> Alice

This is pretty unintuitive if you take into account trivial examples =
like

```
struct Foo(T)
```

Where dropping Foo drops T.

Is there any reason why dropping Opaque<T> doesn=E2=80=99t behave =
similarly?

=E2=80=94 Daniel=
