Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A683533065C
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433730; cv=pass; b=WJ8aw/Gb3PVTZUMqVAVNtNttNknD74/llheDaE2tqDQMjUpTA3K+CVQD8jXfMmxoAoPYGJNqy/1IXZG30bdDQ04fHVNf/zq4wgUYvWDTftEUCdiSr5I/Gy7PoGIjIwSEMfcqtFnvcZrhslVoRbwwjMl5LDgA2ogIp+7Mn4t9MYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433730; c=relaxed/simple;
	bh=VIXhg/PMXhRQVZJXhMJ6a2TV/N2mz7vwqMBhUc4wLsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p35vTSOiIJP1k5gTrGngA9qEFmgh3ZKyYyX4/EmZttVKUAGUOEGOlTAjjgcaEvIyGEvG8xyVWZI884QqDcJ/olBdR+eXtIkMGfqozfRyROFQQo+mJKFgS0yDRdIrZVNrWUajru3yqH3mqaHo7EFXW2utObpcUJHm3RuA0uYHXpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyMOIAiI; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyMOIAiI"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5f530da3a07so3637923137.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769433727; cv=none;
        d=google.com; s=arc-20240605;
        b=RvuyKYRac1CAh80AsVpMEJlXp/4TOt3Z6IOdLgcGkoovjkQcwLJXY19mkDF898FVbr
         L7v3SfgqZjAVhJ6t6TAQCAJbJVkg8rucPuFDIWz/EnbNTMfVRZt1Wr9blTtBlV5mKpz2
         rS0auCEKnEHr9wHFgzhfYXI05eIqAi9yCtSWOdmh9N1L93/qHf2i0CkG3vk9lafPLTdf
         tzsBN0fzmFqWz6tGA8+haDMZhR1VSwsJ7wIU3yKtjDE6W4FAumMCPx83cSq2G5l7rGYZ
         ddnjGC/Y37eGSGzD3TDolhgaYjZl7nZNwOyoMVhCdaqTnAAJ+2SSFzXInL8FwTzEUWBm
         gepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OK88e7canWRzDLrzZYWFly9S3skoogQZWOuawRBAv0o=;
        fh=GiZztMnXjCGflvFrDFlmYHjKVWIL7koG614b3U0vhWg=;
        b=kjRHYwjXqq2cRVzTTcdkI2UMaBiXust2wn0/fM3BHAu+N7PRxkT+OsoqRs+Bpg4U1d
         phLqmu8h/8nFUbroF83QIkqwU21+IQupM3WSJkbyh2u2ZCj+/BJuSVZjJvoTWiNPHi1f
         CGZIakoz1608kJQKClThsUEyKPD81itG38s+WtdY2ER2ygDTX67e2KW9tVPfmlSDWsm7
         KHwj1rg7BWKjlbMKwyA7hL9z0chRs98MUtDkPfNOrdJB/E/vpzP5X9DXgKWF8inU/MFG
         Qwoi4eB0LMMZWH/9M9nuLSM82Ud52jy2763Dz+Z/EoHy3SDLmCd058VMO/W7tkJPaMZu
         UXUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769433727; x=1770038527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OK88e7canWRzDLrzZYWFly9S3skoogQZWOuawRBAv0o=;
        b=NyMOIAiIK0M4iL56foeuPRCEKiHjwiHrUm3fjn2agQf+C9mJP13QWGx8k9+3t8VrBw
         OZMgjJXqxtzvcuqn0xBMX/DTAzE3Lj9uk0hyogx/4eUGN9tDXcB4a4cIhLZzL4SFgV/c
         aYMvE9S479a4snGqUTVlRlg1IRhOBPx5B9GZULU5NILEF1ZVGeMJGs3mSnbSK1nDsU7I
         kFA3SiNseJEk9nGI+eVhyozZFfHhHaZKUaU0c7K8fuJEpZsTpEHXjfE5fp/uvd7jdWKq
         Q6PB9q5DIIzcJSYGTEEFsgvTEtPCfdDUl0Pqa2+MeMkA7o1F9IOI2hC8XTdfNlWpQ539
         0G1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769433727; x=1770038527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OK88e7canWRzDLrzZYWFly9S3skoogQZWOuawRBAv0o=;
        b=h3pvksJFmbUq9ThuP/7eSXUqje/sa9s1FETyCWjDfERFqnWQ+GaQf+NPNDaqdY6fxQ
         GRI5EIjqTTI4Hr/1Q1XjxWju2eKNUDTm71isGAOPIfSS0XYHH6pVMUyl1BFINKAl5Ics
         SRsfdXdy+tKTC7SLD25/eeBbOspcb37GHQTuDRGFLcKGCQbJcJQv7KGLiQBwOJb9/4mO
         hsoE9T9RTLCAYQ/jNKcHruqo0W2Xp/crKF2wCHHIFaQytQAAfVggtLdthERtM+PzUUNI
         eCr2A0Db81xrflBzKknnvupAcai7juIUUWZ0UrqULvjxmaklhu6OuyYzlEpbkp5IQW3u
         Io/g==
X-Forwarded-Encrypted: i=1; AJvYcCXslI+epIWQCZFe9igdDpVmQ8oeRDpTWwQkUmkK0V/yZIcynWWsz0yTe0jw7thcQYk3+a+3v9YT7Jvr5r9iIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBC8VRRJT/uekwFupZJ+1sJ4EAMZrC724Q0ojZGXvGxQA3UvVZ
	VsVkD1SvvbljRRffjUwBD5gO15X3ZXM3yT0mrFL7m+uRRwNCMhbf+WZ6uNOQ/ce2LTP7m2ewPTx
	EAeJ9KWFpFFa3MiZ0slWvx23VGU7Ie3Q=
X-Gm-Gg: AZuq6aKWJNcvbuucDdmTIp9JBtDTioqkrEUOIpWsaJFriLEigJ00P8wFtscgquB8Fjg
	FUbPsBHg1OAYZNMk6bZ6Pu31G5b7WwVYt0aBcGaqWyaKQ97Ar8s310C2g9h83Ba6TNzsDyZQJ8R
	kT4EDJI5DCZIBV4tUntqklaZqTH62WloRk2Owk6No/kcqSzReISDwi+EUqs0wpNDkphyEw8bq2P
	4SgtreVxapV4mj1aI46+T/k6RGMKSAgQop4rDXQp15nQ8HsysA24twzeqfZmEGZFCAsbxYPhYM0
	Un/+r1gIsEyXjB3KgH5m7+GNDu7kolgYbN5X++arvHqmNVMDdka4IsQBwctnatMd285wNXBbT5T
	J1opZOxqnAzXi
X-Received: by 2002:a05:6102:4410:b0:5ed:d33:a65d with SMTP id
 ada2fe7eead31-5f5764cb7c5mr1459095137.34.1769433727559; Mon, 26 Jan 2026
 05:22:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>
 <20260126-rust-tty-printk-driver-v1-3-28604e7e100e@gmail.com> <2026012603-flail-explore-f8e7@gregkh>
In-Reply-To: <2026012603-flail-explore-f8e7@gregkh>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Mon, 26 Jan 2026 22:21:56 +0900
X-Gm-Features: AZwV_QiTxcwLfojShs6MxDsEF3mIDJ10hE4d3rS6IOWsQGymqPJLESvvx4fw-6Y
Message-ID: <CAGAB667MERYcWT0OrxUVrna60nKamtkrFeGGZZZwcCiGSKXTEQ@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] char: rttyprintk: add Rust TTY printk driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 1=EC=9B=94 26=EC=9D=BC (=EC=9B=94) PM 9:53, Greg Kroah-Hartma=
n <gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Jan 26, 2026 at 12:22:10PM +0000, SeungJong Ha via B4 Relay wrote=
:
> > +        let opts =3D tty::Options {
> > +            driver_name: c_str!("rttyprintk"),
> > +            name: c_str!("rttyprintk"),
> > +            major: tty::TTYAUX_MAJOR,
> > +            minor_start: 4,
>
> You are not documenting the "take over" of this minor number under this
> major number anywhere, which isn't ok for using a static minor number.
>

You are correct. I should have explicitly documented the takeover
of the static minor number. I'll change it dynamic.

> And while I understand the need for an example driver, the ttyprintk
> driver is a very trivial one overall, we don't need another one in the
> system as one is enough :)
>
> thanks,
>
> greg k-h

I also agree that a duplicate driver is unnecessary. It was selected only
as the simplest candidate to validate the abstractions. I agree that
a sample driver implementation (e.g. in samples/rust/) would have
been more suitable for this purpose.

Thanks,

SeungJong Ha
