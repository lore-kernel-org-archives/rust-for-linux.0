Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61403161A1;
	Wed, 18 Feb 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771418029; cv=none; b=ZsbAHEKFD8VV+ITn+PoGA1I2zKO84YLUb3KawRPdo9af7v0fbfdgnSdIWuGTiy40ZJRiJJ76VlYBqqGbP+e5PeYWIg7Ayvd0YbABEmG8pdIl9hkVmObxuPtETJSTzqfXjUeg9hnQBUkN3QTPug/EZzRfyObDAnJ58cF0MitSh64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771418029; c=relaxed/simple;
	bh=tPRTH5D/YtLHQRbJV//XCuFvKTE73aRX+m2Us19zizE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tnz2VN1SmlsA7V5//44+MqC2Q4xfhbG89Q6gmQyWWakR3jnP3iQxRaIzhAp4CQ0mt7QtJzB+U9CsSN1XMDCUYT20bG8h2T1VnZc/gKqmI9QwPKrOzT/sKQ9cMXHrs+0OEqtuaW7FUA/vUu/GzngmK41mt/0S5hKrQV9lcL3Mc2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dW/i8orC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dW/i8orC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB5EC19421;
	Wed, 18 Feb 2026 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771418028;
	bh=tPRTH5D/YtLHQRbJV//XCuFvKTE73aRX+m2Us19zizE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dW/i8orC81AsU4bNVV5MeaYMzqX8sW/RQ/Nd21nyFtqx5GQzupMt6/ibvEQFTk3Wt
	 54LQ42QAS6mkEkVk703xT3dWEhgEoHbXxC8WLzlbdAWzrPkkMfmZwLeuKt/4sTfisb
	 XrSOAVwW7qXnHEf5z8uKTkAIXEd30JCoPOWdU2iqBqAmKbf42j8le2TUbY0/HJyNrf
	 Lsk9iRVf/smIFK4rYZMiueOBzaVCP8f747vbYXBQo8doBajY9Ai/yClmRzQRkURRqB
	 t1Junhh1cQZMLlpORdxKmAVABQUpRqzm5oaTCGyePlbefCupbmrn7C+zJHEoWbe4l8
	 kF7ugQHz6fh2g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl
 <aliceryhl@google.com>
Cc: Benno Lossin <lossin@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <CANiq72nCmZ57VmXsXdXbP9edmWYqOWCYgWNTPGKvxC30sy94KQ@mail.gmail.com>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <CANiq72=5r2miRm6GWszb2gDNi4k5-RZUzvdOdFQ3yyndvmHbAA@mail.gmail.com>
 <CAH5fLgi6NVagOPA_=r7Dmk9MFXrvZVuq85D9bsJfUqLNOZjCaA@mail.gmail.com>
 <M50jfg_TPSF2G6kHFKHc8zxjC5DT3HtgXhWFeXdZxPwnsMnjr-B9ieBi-pZAXpPcInhZ21cxtYYvSciNJRS3Vw==@protonmail.internalid>
 <CANiq72nCmZ57VmXsXdXbP9edmWYqOWCYgWNTPGKvxC30sy94KQ@mail.gmail.com>
Date: Wed, 18 Feb 2026 13:33:37 +0100
Message-ID: <87seayb59a.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Feb 18, 2026 at 1:00=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
>>
>> That's right, valid for reads implies that it's okay to read it.
>
> Great, thanks for confirming.

Cool, will adjust in next version.

>
>> valid for atomic reads?
>
> That is the one he suggested, so it is likely to be a good one if two
> people thought about it :)

Great, I like it.

This document should be in tree. It's not, is it?


Best regards,
Andreas Hindborg





