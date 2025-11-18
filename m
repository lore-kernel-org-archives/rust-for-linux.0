Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8007334DB47;
	Tue, 18 Nov 2025 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483898; cv=none; b=eHHnbSpXbKCMye80jmubEe49/9KP7Pl+8BL8bhUhOaQT9YXSDZpjJ28cIv7zRH+QC/DiIWwNizmjWd4tLB2UP/qO1b/Ai5/isLqJMzOX067w9OW3wtjC6nWC+q6JXnKNYaReQbA66fyf1FvdQKL/lNNcbt0AtvOO/eAgxCJQ5+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483898; c=relaxed/simple;
	bh=UfkrHVio+Czb+hNRlOF8S3mEHz7UJpwxt5CAozAtf5U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Mv631mTx8A0R9B0xJd8h/wGznqaAqDGg1aEdRgXe51Wz5Nh/HAQt1/I2lY4aCNSFB8bypX6QBywpl3m0rU7G515EERmsNuPfjjC9RJ6zBePWMJoCZH9hqs+XH2FsQsFoa/gnNeoYLAAK4Zt/GI9qdr5H560mT1R8ZYdM4vWb6uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Xs9LYbGd; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Xs9LYbGd"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A2B0240C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763483896; bh=4DSR+e5zgphjkdqy1n3flsSBWx54VvMwDl5bi6C9QUg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Xs9LYbGdMAjA6L7s8EFxtA0g8bw9rWJC0l9r2iiObUTHOalpZw+hc8iPu4Qd14oZF
	 9mM8xxHEEkFXhQw3hA/WD4chNw10BH2tUbFtt7oRP2qUev1VDlYMyD4N+hIvDYKY/k
	 QdqmnBCMOZjFH21N0x2y4F1DEYBoQ7fqTCGiXMbcOxgM5rs3xAG3Q46IDFKwmKeSNU
	 cNC0xqYUwN6Wz1GJp0UXLRFJsxhtr+pqYxo7CFdBiHtqs4BTV21RmCfRDZZRS4cG/u
	 ATB+hL3/el2pV+zHdOVPVO2FEUZmRg4HDmQfJg5FYgA9nE+FUpthzP+XyF4qTSrrtJ
	 zM3lhEKgqktYA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A2B0240C3E;
	Tue, 18 Nov 2025 16:38:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>, Danilo
 Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: makefile: move rustdoc check to the build
 wrapper
In-Reply-To: <kjpquyekvw7fwrndoomtge7fnxtfefihqlikj6xcqtazrr6l77@424ufup7v45o>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
 <kjpquyekvw7fwrndoomtge7fnxtfefihqlikj6xcqtazrr6l77@424ufup7v45o>
Date: Tue, 18 Nov 2025 09:38:15 -0700
Message-ID: <87seeb47pk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> On Mon, Nov 17, 2025 at 10:20:46AM +0100, Miguel Ojeda wrote:
>> On Mon, Nov 17, 2025 at 10:13=E2=80=AFAM Mauro Carvalho Chehab
>> <mchehab+huawei@kernel.org> wrote:
>> >
>> > The makefile logic to detect if rust is enabled is not working
>> > the way it was expected. Move it to be inside the wrapper
>> > script.
>>=20
>> Hmm... Could the commit explain a bit why this didn't work and why now i=
t does?
>
> I don't know exactly why this was not working.

I would feel a lot better if we knew what the real problem is before
applying fixes for it.  Otherwise something seems certain to come and
bite us at some point.

Thanks,

jon
