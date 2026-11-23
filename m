Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424723;
	b=5Y3ZfG+iXrKnHVmRe+L7EF6fhU4iN5so9mDTVjlido0NNK8RCNAau+vhkoOUDjCFlD0e
	 +shfQKDtnwR392HOh+xu0x8nG2CEE631H2hgVsTj94kzAOzbE+zuM7338nmtjtVzpnIqb
	 3q5G2doUSgQFu++a3srqSggo3C7zqS1mH3lQ+CAAI/XyJKbby5C8a6Flyvrjoj8BNejlW
	 zBV2YE8Zxd1pDEIkOe9KeQety5EexS8PSssUWEMdnIAVrwYFbwEn2DXpDIpbc9r7gTyI6
	 sHWXFDjCwAVVrp4Jjrb0DWHAC7e/p268Y2hc/TVzFa7rFmSgUIHMOOHxuC60ZTrZDzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=sdj/skV0mpKyTKeONzZHXUjijG59MmM3EwIg7zBy5qY=;
	b=M1mrOOuKML7NHXNLV+6umWq3935VyEhHkGZhsMS+IQ9gNc3XMDHTFlFTnk6iPwtN+MCd
	 y+VYgbbx4mLcHISaWXUXBdJFCk9L2imCfDljvLEWDpD5hJwsGYk44MsVmOgm0exirO/3q
	 g05qoTn3OFCtXy2HuVKwObUezDyqJgufPh3GuKyRUwm1pcPK8BESHFZG4wdr6vB6mlKdn
	 G2TTDN7kz+k0o7tS5uy9IJEPqaw0tdsqXXeu+iq5VhHIcE5QKHQJ5/flqVFxG9+WNpKra
	 /R8nlZN9I8VWuzu/eLt5zkoTO2AIP28Z5VlQ1hTEFg8cScUitxKxHbrOuxpQMXmrSJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CP5Fp1Z0;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACE2606A31A
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 09:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ACE2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CP5Fp1Z0
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1463623a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 01:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424722; x=1796029522; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sdj/skV0mpKyTKeONzZHXUjijG59MmM3EwIg7zBy5qY=;
        b=CP5Fp1Z0OTm9YV6uS9BaUVOY+zJomUbWcAMKXIzj2y612TJDfZ25vEIS+VmYWXez23
         VDnAEbDV5DpVUCZj+npRw9NNibggYayrF1QqCoXqHsCWlL40VP867e/Kl5RyRywQ8EQf
         z0YekvZWsBCJsqD3gLJtgAeTaP1ZiflXHERvK3rb8cR5+zaaG+LidlwR0bmbXJpIwaCM
         9HhWXKPnZNsTLc8m0QzUm2H335p/vt9o6Yi73YYuLEYfjSuMUTSgzZuqWJbuTF/8TPeW
         v6S5FYECOL8FBqvc17m3SsUP2yjNIWhivGAir9hbMSnHwy6yluZPABuf49zwLJBABggI
         BMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424722; x=1796029522;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdj/skV0mpKyTKeONzZHXUjijG59MmM3EwIg7zBy5qY=;
        b=my9Ephsxt0SKdL7PUZFedJjZyse6uyxgjnE++ttIQ5LE1erAXV5xGsz3mecqLCBbOp
         oZUxDCUVEl7AL+o14TA66xpzBD0X71xDdu4szt/jwkSvkHXfVjLfU7GXdGYyGs7A9skT
         fkmF7WmN6pKoRK+SnyOd/6wQiD19TsEBs7aVVKmLqWDVoOjKC6E2Uogt/Uvq6yaEapnV
         5VOqMudTUwqjsheaNd9ufZl9QEkdKXlV9zyAnQACk2PTsbJQ6aoHz9SKytElYoDcJQtY
         LvQ2d6OhE8UlX9U55Gcuj/AEyfJQuaX2dT5zPjkhJy77iwD4d03VoeDyYg77vVZcmFKH
         Xk8Q==
X-Forwarded-Encrypted: i=1; AL+hErFg35yD2LyUP2d2DEAOnvt5ByJdpE3RhsjJCuklgPkLic6Lwv5IZbJgHsZJgz9Io3cIluf3brnxN4idu3bTmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dOZ/dmDSbczaTUt6gjD8gw1MAoeVdXNXaC+KmZOfuzVnyYc9E
	3QAB+LVrMknEDRPX4uDftgIQS0jwl1vXX3KGCRePKb0pxsLgwEWbviw7
X-Gm-Gg: AZFdTZdS38Yf+ue8YKl5k10CdCD942EUGq8tmmfqgYA68jeToXgivxO63GhNFapWbSo
	bFwNPoU+ce/bc39YRaNOuXLKpasj8gXG8iHKW/TUT1kj3aDPRil3lu+TbugospuY5EnwEC2JcSj
	OKN+6x6i0PyfEE3gEfnZ7spI6Cklh8sckMtdwDtaHCFfjIpcQVBtp6Jpf9mvTKV+FoLmCDbRJlB
	qPoYTnVYHZpmsVn7vw/CU1aHagBjR/x/QlsKRXA1M9pOecrh1xtj9PopELBfGegQcQq+Ko2EvUp
	tNAX1hEiJ5shGBu3GxYeW/emgpFoc6pNuYTn9a2glyH0J19nNfpaQLOudqGlhlx7KAXY1yzBZBZ
	lxDhx5y1xbccdik7cdTIu2xiGzQIvIWYxIng9NdgFarcHkO5oet3nBARbKiBLStK+aFWLWm/upQ
	qjAy/D5UAzDCm/1q8Hx+a0SxYdZtYuRWPWX184/IkXk3WvB/kpW6ERlin6SeG1ICIGAKQ1ECpfC
	vM8IozJ5Jto8EIhOYu0cAYkS3R9Kk1z/xPUWIXztQyTmLKdkNLe9j8CTJOW7Wa2+P5CCdylbJAB
	kPJE91eVkFwXD1Uig26q0G8D2LI=
X-Received: by 2002:a17:90a:e70c:b0:3b1:ba59:56a1 with SMTP id 98e67ed59e1d1-3b41c939b8cmr9271983a91.39.1795424722320;
        Mon, 23 Nov 2026 01:05:22 -0800 (PST)
Received: from localhost ([2001:8004:1ef0:7a2c:4a7e:bc9b:e9d9:4205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm16760336a91.0.2026.11.23.01.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:05:21 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 17:05:06 +0800
Message-Id: <DN2GXVEC38QI.5BTEQWF3UY9C@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Jean Delvare"
 <jdelvare@suse.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: dmi: add basic DMI matching abstraction
From: "Nick Dowsett" <nick42d@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Nick Dowsett"
 <nick42d@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122-rust-dmi-v1-1-4ace9449f872@gmail.com>
 <CANiq72mFCq01A_=B0gyaut1rPWeECOdDwP6pD3FBv7n4oH6TWg@mail.gmail.com>
 <DN260E1QVCJA.2PKN1JODEAOB0@gmail.com>
 <CANiq72kRX4fECZGjEXKsSE=bwT0XsozE3+GPpvmOPZ117B1_zg@mail.gmail.com>
In-Reply-To: <CANiq72kRX4fECZGjEXKsSE=bwT0XsozE3+GPpvmOPZ117B1_zg@mail.gmail.com>

On Mon Nov 23, 2026 at 9:10 AM AWST, Miguel Ojeda wrote:
> On Mon, Nov 23, 2026 at 1:31=E2=80=AFAM Nick Dowsett <nick42d@gmail.com> =
wrote:
>>
>> Just checking here - is this still applicable for doctests? I copied
>> some of the example from another subsystem. There could be some
>> conciseness benefits from not doing this here?
>
> Yeah, it keeps the rule simple (everything does the same thing) and
> also helps others get accustomed to the style when reading examples.
> In any case, for the example above it is hidden, so it doesn't matter
> much for the rendered form.
>
> (And, ideally, one day, `rustfmt` will be able to apply our formatting
> to the examples, so it would create a bigger diff if we don't follow
> the vertical formatting anyway.)

Sounds reasonable to me, no problems. This amendment will be in v2.

Nick=20


