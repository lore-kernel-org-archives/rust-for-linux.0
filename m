Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FCE3446C7;
	Thu, 29 Jan 2026 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769690905; cv=none; b=T2YJX7s+JWEqnTaCyonwn6ed9pV2ypE8q9OmaTrlIQF5U8Xy0lf0Zapsy95e0+Ablltipjv4AEh61nFC+pCxVA5/AR0T/0kdCpQsbqy98/mwpZBMzlk4kHy6ABgF3B9ynQJ0EwOwxJI6WojneZ+ih210Tw40LcGWKOhA6NM6J2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769690905; c=relaxed/simple;
	bh=cksqOYOQKxBhB7tvfDhTuFND7c1NM3PljhEX9VwR6ac=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=NSSViIo3WUrMsyE5q9Sm601bpgD0Ek373jjfRQXdexYxX3q2KxXaiWB2skptor5GTkUWnYjeRQ/8joope59nE3m93ZPQ7KdkAqBuDclrrWmEAcRjbVLm868RwwNsb2uDlBBXJUWxIaE+1tqvqPn71hAIQflIs7XdbZzEaF8Iydw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwTNO1mX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwTNO1mX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93223C4CEF7;
	Thu, 29 Jan 2026 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769690904;
	bh=cksqOYOQKxBhB7tvfDhTuFND7c1NM3PljhEX9VwR6ac=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=HwTNO1mXd3Pqofv5UJnvwSkGh19PR4i5oLCDWe32qQ9aFPHU+93Jvhc8N/sBxYo1q
	 IUYjPlwjULWcB3nOtkAdaZNzILxdZUXWwy0DyCw8tLwlnYf9t1F0dQ+mGCsdhyfm4+
	 MXv3flVKgyenr8bx5ItBihrFGF9C1iB3nteJo5bWLcHCv5wcseNQzeVjYf2dtqFlZM
	 ejZRtPDQru32Yo8wwyW7GK2BViWVCWirumGzxNBd15f3AZMbUVUT70f9wP28Qj23VQ
	 5hQgkwrYuQi36yXoCKnPLq+6pIErbkxk0g3GIhHH+dX2fsCmdliweTcH2M/3S3PmZO
	 JmU0sGLOB7iuQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 13:48:18 +0100
Message-Id: <DG132FH0WIZS.2CIQAPY7I1P79@kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
 <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
In-Reply-To: <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>

On Wed Jan 28, 2026 at 5:16 PM CET, Gary Guo wrote:
> On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
>> +            /// Read the register from its address in `io` and run `f` =
on its value to obtain a new
>> +            /// value to write back.
>> +            ///
>> +            /// Note that this operation is not atomic. In concurrent c=
ontexts, external
>> +            /// synchronization may be required to prevent race conditi=
ons.
>
> Given the non-atomicity, how much value does it provide compared to havin=
g the
> user write read and write themselves? I feel that people reading the code=
 may
> assume the atomicity without reading docs if they see `FOO::update`, whil=
e it's
> less likely that they do so if they read
> `FOO::read(io).with_bar(baz).write(io)`.

I think update() is fine, there are no promises about atomicity for any of =
the
I/O functions, also not for read() and write(). I.e. whether an operation i=
s
atomic or not depends on the architecture, bus and device.

We should probably document this clearly to not raise wrong expectations.

>> +            #[inline(always)]
>> +            pub fn update<T, I, F>(
>> +                io: &T,
>> +                f: F,
>> +            ) where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                F: ::core::ops::FnOnce(Self) -> Self,
>> +            {
>> +                let reg =3D f(Self::read(io));
>> +                reg.write(io);
>> +            }
>> +        }
>> +    };
