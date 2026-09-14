Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACE83F6610
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375013; cv=none; b=jzTuB7scFJKZbNNRyMFu6U/y75ycLLdjkD20tqrW8oXmsGmB0pv5+VSa2ZcViv4rhXT+LxFxMEbPovmfEfS6Wpn7s3EVBcLJJPIGExpFYPquAX4KP1SmafR74nC2KVfRsV7SUdOIWNx1hDaeviUa9KOVqHQT4Q+M8I2KOdWod3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375013; c=relaxed/simple;
	bh=oAgJ7TcBXHRBfC6XxK/rYAg8L1xktq3/1pnvaa/drtU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eqrgae3udtV57nji49CdgbOzV/aPjN+A02MCfmQuP4cqDNe++UhgrYhrVqPm9C6V6YjOAASau5MhRZyoW6H3ZgRsxvEWDSY5CGmmUoPYXIPdqU69WqWnK+rsvu7TG2qjJuN2NcPoqeWc1b5p1UyZ6qn5+1KGEQ/d+wK1Q5NFhro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLESFOT7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLESFOT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6201F00899
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789375012;
	bh=oAgJ7TcBXHRBfC6XxK/rYAg8L1xktq3/1pnvaa/drtU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aLESFOT7i35Gk7B39hnIzJQFXSfb86KDbutXnCM4ho4HNwmnLTNAup3gVPzP6e7AR
	 OSeMxaeYSkI4sQJDHKzzAU5RR2YDPWOe5UBDZSsxnJG1xVBJkK4i9EsVITk2FVuban
	 PWXKIPjVSsKsRMdgycQRQrcQnXku8+2ghBZpGvsTqcOKJ95PnVWIxvyBawvkQdODcy
	 ugnZnaPdR9a4+0MhH4TffMQtISqpfePjlj+Sip7YlLnb5kgohHxCeu4kCmA81pm0iw
	 tOOHQRLYKAWVpuJBG7oYXqpQT2PzJiDeTC02ARZoT3xa27AGOzUMlABMQfq08zDdJu
	 dh3V8FpXBdoeQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so1905509e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 01:36:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwKd3vCDQizm9vi2fTRsJragJNLQNIIRQewXnL8+jx7AGjFShwax/bA3sFc9vhMAGv0AX3SbEw68e0UMkFpEQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ngb54+VP8mBy+jNaNd30E0LIKsFAVF/Xy+jszAMslfWGp4NWzQ
	LE5bnJ9gkV9Wc0M5TAuBzAoWHLo5qkyALsf1tj4H1WjVvicSRbbOz59Z+1JSiIPhI7/er5/Skt3
	vv7YhfWxt6cWDY2gu9nQo65vt3HghSGS8GVu3q8Jwew==
X-Received: by 2002:a05:6512:694:b0:5b4:5846:d925 with SMTP id
 2adb3069b0e04-5b8ae6aed82mr723421e87.21.1789375010843; Mon, 14 Sep 2026
 01:36:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 04:36:48 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 04:36:48 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DLENO35F39LL.2YNA66D9FCXYH@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
 <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
 <6aa662d7.0ca013b1.1575e3.0a60@mx.google.com> <DLENO35F39LL.2YNA66D9FCXYH@nvidia.com>
Date: Mon, 14 Sep 2026 04:36:48 -0400
X-Gmail-Original-Message-ID: <CAMRc=McV2YKgbmnknLZTSGoSa_9eCHDiOLzuPPyPHHnj=vRuvw@mail.gmail.com>
X-Gm-Features: AcwNN1VVLfuGTtur3XPTyMaKBDkD78f2n1kL95ZTX-CVn_G7t_8KIM5aEQzpLvo
Message-ID: <CAMRc=McV2YKgbmnknLZTSGoSa_9eCHDiOLzuPPyPHHnj=vRuvw@mail.gmail.com>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Kohei Ito <koheiito.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sep 2026 03:41:29 +0200, Alexandre Courbot
<acourbot@nvidia.com> said:
> On Sun Sep 13, 2026 at 5:46 PM JST, Kohei Ito wrote:
>> Hi, Bartosz,
>>
>> On Thu, Sep 10, 2026 at 12:37:17AM -0700, Bartosz Golaszewski wrote:
>>> On Sun, 6 Sep 2026 10:45:51 +0200, Kohei Ito <koheiito.dev@gmail.com> said:
>>> > Add a sample driver to demonstrate the use of the Rust GPIO APIs.
>>> >
>>> > Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
>>> > ---
>>>
>>> I don't like samples as they rarely get built or tested. We seem to already
>>> have kunit support for rust, wouldn't it make more sense to implement a kunit
>>> module for rust GPIO abstractions? If we don't have provider abstractions, you
>>> should be able to reuse gpio-sim as the GPIO controller for testing just by
>>> instantiating simulated GPIO devices.
>>
>> Thank you for your suggestion.
>>
>> I assume the kunit module you have in mind would be implemented like
>> `gpiolib-kunit.c`. Based on your comment, I agree that a kunit-based
>> approach is more appropriate than a sample driver.
>>
>> However, as far as I know, we don't yet have Rust abstractions for
>> platform_device registration and software_node, which are required to
>> implement a kunit-based module for testing GPIO consumer APIs. Given the
>> current state of Rust for Linux, I think creating a sample driver is a
>> more practical approach for now. I would like to consider migrating to a
>> kunit-based module as future work.
>
> The problem is that this sample driver never probes, so in effect it is
> only ever compile-tested. Without support for the provider API, you need
> to include a small C fixture providing a GPIO chip for it to be actually
> runtime-tested.
>
> Doing the same using KUnit would involve building the `gpio_chip` using a
> bunch of unsafe statements working with the C bindings (which would then
> in turn require `gpio/driver.h` to be added), so I guess we'll want to
> wait until we have a proper Rust provider API to go that direction.
>

No, I was thinking about the gpio-sim module which is implemented as a platform
driver which you can describe with a software node and then register to create
a simulated GPIO provider against which the consumer APIs in rust could be
tested.

To that end, we'd need to just register a platform device from rust and AFAICT,
there are already APIs for that, except for the software nodes.

Bart
