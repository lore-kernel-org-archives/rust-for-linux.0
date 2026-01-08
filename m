Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB304A22EE;
	Thu,  8 Jan 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869714; cv=none; b=T34qg5rDCaesF7lW2M05iATA722VROT3eSCc1wRO+vRY6MtUUldzmhDj65jJlGIFTnwooZCGTDQb6iAUHUiAqiB7HowwZ/hXGtqzHVS5T4CtsYDastlJTQOk338ZVl0jdIonHQL+TslZfQY0YzTTx6/9+YkAf7sibqUB5CFZWLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869714; c=relaxed/simple;
	bh=zfQHoWZE0pHEsfXJM0wYBSYaBVcWFjHQJKgSiUYz2zQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=AATg3musNnTdV3Ae25k2nOTb6sh/WTTDGfqERBZ3drjhuXwrDWsqEgZgEdzYCB/Ky0YZlVI2nlT8MqHcV/0FczTqDUYbk6X1W1vbIspYv2S3ksEM0uYHBZ9M7R3kz5+0g+V2dB9pgUndt/+/pZtVMdkdn9vedTJLxoI/7MNo39g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZstwBio; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZstwBio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79942C19422;
	Thu,  8 Jan 2026 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767869714;
	bh=zfQHoWZE0pHEsfXJM0wYBSYaBVcWFjHQJKgSiUYz2zQ=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=uZstwBioB7kPVUrm40cBfMX4ED5B8g8ie2UmnbVRS6qRTVoNP/XWk3Ljlu1VemKVK
	 KRAFOQA3VUaV2PLOGatd8WFvptH+UbmyVvtwdGTxBv7bVJ8ytVvpVMt3yRLblSHF9X
	 JuHaCWlN0wfUU4yzcKoIHALa5WRV4IdF/7cxwlFBZX3CfTso4df3Y1bBy1d/mpeb41
	 Nlv0+OtndBqLgg0LEWW8bPzx/Y3PMzKTRmKMJdMmB8AQA1vUQOIQubsygrwJ9/oJCu
	 DJ8JK7PgT8jdbP6znelQJ09r05k1PRflv9BJ7CpvqrE+zEanV8+ToCCyc09o0PXIWR
	 /lCz3604y1isw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 11:55:09 +0100
Message-Id: <DFJ5ICRD3YFF.XCSV3CJCDORA@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: device: add platdata accessors
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "pengfuyuan" <pengfuyuan@kylinos.cn>
References: <20260108085545.333676-1-pengfuyuan@kylinos.cn>
In-Reply-To: <20260108085545.333676-1-pengfuyuan@kylinos.cn>

On Thu Jan 8, 2026 at 9:55 AM CET, pengfuyuan wrote:
> Implement generic accessors for the platform data of a device.

As Greg already mentioned, please provide provide a user for the API. Even =
an
RFC is fine for me as long as it is not too far from an upstreamable state =
and
the corresponding subsystem maintainers show willingness to take the code.

> Platform data is typically set by platform code when creating the device
> and points to platform-specific data structures. The accessor provides
> type-safe access to this data without requiring unsafe code at the call
> site.

That seems wrong; at least with the current implementation this method is u=
nsafe
for two reasons:

  (1) The caller has to assert that T is in fact the type of the data set b=
y the
      platform code.

  (2) T is (most likely) a C type, which does not guarantee that it is vali=
d to
      create a reference, i.e. &T, of. For instance, it might not be proper=
ly
      initialized.

I think (1) is not fixable (at least as long as the platform code is in C),=
 so
it unfortunately has to be unsafe.

As for (2), I'd just return an &Opaque<T> instead and then have an FFI wrap=
per
in the driver.

> The accessor is implemented for Device<Bound>, allowing drivers to access
> platform data during probe() and other device lifecycle callbacks. Unlike
> drvdata, platform data is managed by platform code and has a lifetime
> tied to the device itself.

I don't think this accessor has to be on Device<Bound>, as you say platform=
 data
is always valid.

- Danilo
