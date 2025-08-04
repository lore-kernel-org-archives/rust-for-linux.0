Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD531FDE31
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754319552; cv=pass; b=j64H6ntz4gbfX8kOBWr3wrjOguRUy60tIpJr1ex/rXrlw24CauxytqKb7Nd7zmJlceY+Bh9/wrQGs4j3KCHShwz2e25AP9gsESY3OpH6zJxvNlpSfQKgmvt5qiBHzXGGV6dT7JYbAv/3tMNLxvvdl8oaGtC5XvhXZ/YPtpDN1xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754319552; c=relaxed/simple;
	bh=ACxGvl16tgKU8wWC7rT9KkG5Cu1Mp65cS4jV2hLkoNo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QQZ9yAeclpWb1pwFAs1uNTwbew7sN5Wh65MtaSixZN1Q+S/9MjJZ06IxoUxoqJqv1WaV1u5YrL842bboeabAgOODw92AlmXvb2iuSmU1UQmXN7b/v6BODDO/9jGbWpE/XWZG3WU6gcpJ7IRLSNBUQK1Dv9uHAc86B6wusZ8GOFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=WaVSrr11; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WaVSrr11"
ARC-Seal: i=1; a=rsa-sha256; t=1754319531; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I1pV9cj5PKP5Vc2NJeCBXr7rgg7JEhhwGih9hSFtv6cgrAEZOVtkJNPdiW7+2XARcO5/yUu2jHVyI474BrXFQ3bHw+giidbfIY7Yz6tVe/3FyIVbgYoK0wyWS4nft6WOkaeQP2yef2eZKqecKoCNEq6aXH/WFZZLrf+cpkvYNdQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754319531; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aCQTtU9h+256ilCqGSlDO2PKa8F5PwgVcGkrTtblH1o=; 
	b=HO9XVifm+NWmof3ces9P+JDu2kA5t75eec3da20G5cpgJVTdnUsofkn8j+wfVZgnAEPBNpf9fCjFyTqmlI/i8D7xgqPkrks9KLO0h0eM3P+2+04O5zVbv+93hOXF67RprUK83bYXz3+lOl8UD37JRSIS/pLsJsozznEC+VQF7lg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754319531;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=aCQTtU9h+256ilCqGSlDO2PKa8F5PwgVcGkrTtblH1o=;
	b=WaVSrr11ItEKzOcozCs9Nw3a+5Inb8bJYbJzg2a1hhU/DKtzPmpboIQ+84GKrX2a
	PZjEWmhMx6H+kmWAPxqyTeri+TwV54l1LTRhYVFkYQntV4MajCxbM0DblHn48HhU+8J
	Hv2xw3jHgkWhC1VsTA6bhEOWcnuWkHBQev/qfliI=
Received: by mx.zohomail.com with SMTPS id 1754319526846257.8165581795141;
	Mon, 4 Aug 2025 07:58:46 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3 3/3] samples: rust: add Rust I2C sample driver
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <f85e1109-ee2f-4c92-bcc3-385a8c2d8727@gmail.com>
Date: Mon, 4 Aug 2025 11:58:32 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <47B78B7B-B429-4399-8C9F-E4C994F17B98@collabora.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154506.14810-1-igor.korotin.linux@gmail.com>
 <8291F536-BAAD-4F45-9072-8876CA44922B@collabora.com>
 <f85e1109-ee2f-4c92-bcc3-385a8c2d8727@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Igor,

> On 4 Aug 2025, at 11:43, Igor Korotin <igor.korotin.linux@gmail.com> =
wrote:
>=20
> Hello Daniel
>=20
> On 8/1/25 19:09, Daniel Almeida wrote:
>>> +//! - The target system must expose an I2C adapter at index
>>> +//!   `SAMPLE_I2C_ADAPTER_INDEX`.
>>> +//! - To emulate an adapter for testing, you can load the
>>> +//!   `i2c-stub` kernel module.
>>=20
>> Anything else needs to be done?
>>=20
>=20
> Sorry, not sure I understood =E2=80=94 can you clarify?
>=20
> Thank you for the review.
>=20
> Thanks
> Igor

I was asking whether you have more details on how i2c-stub can be used =
to test
your code, as I'm unfamiliar with it. Are there any more parameters that =
I need to
set up?

You probably have this written down for your own testing, so if you can =
share
more instructions on how you're doing it, I can also test it for you and =
give
you a Tested-by tag.

=E2=80=94 Daniel=
