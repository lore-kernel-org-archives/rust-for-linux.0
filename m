Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323308;
	b=xaUW1Y6l9m0AI+GR3gzaOd9Sqgs9GVwTU/qOqxs45z6C7c+xrHBKU5knSeMfh3vjh+fb
	 cKxtipmX20FRBzShHJ8qd1iS9N2bNR4TySX2HPsoOQMVlSMKIEcz/GrlwsishZiuVSAbN
	 9f2TqzHKpthJ/5cx/VU5A+7xu+FaoAm76WAmwcapWK40SXUhonOzDr57ay1mmTfwt/dIR
	 p72dHhbTA/TeOySy+0izn03MhN/beTvHNdwVDuwmtRuCydz48jZaa4w5Yu3z6OwzmUIKn
	 tIs5w25MJDVoje5cF0b4DOIeOeHHWo1o6HMrzZVtxbzz8QfFTl1NXWiUcbsLGmp5HuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=zo5hV3nq2vAzOrfwjLwLFQ7iNUuGgnQAdTEhOY7Nk04=;
	b=SbBVRwfFx/FKlw0iaCpNSGSJwKsj/vNCIkMtJqN4j4jIQiLumSNkxRZRl9DclgkDg4+I
	 cJEjx3HLEDi5n2PAfFvIu7o4cPjWeul95QqiiZkYMZNNO+me2SkMGSDnqKZ1VFYo6SeV9
	 gA+z1IOoJxzVF/GsqVSqpH5PKcG9YHjqLHNgsnBVG5cyXhfC9n0LhdwIrtCBqFCsZu3Cg
	 0BrtfAXyUySXzo77Qk4FAKhV3Z1DSuWyX/InScW6s8MHAQUNTwHicmZ8SqkvVNBIUrJam
	 xuwbJ+gClFOlJfqOEQ5QAguTL3M4+l7UQIooPb4ihMHLydJzlvFFHPVIclzHM8tzzuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTGCWyKF;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352E1606A330
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 04:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 352E1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTGCWyKF
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so6175701eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 20:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795323307; x=1795928107; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zo5hV3nq2vAzOrfwjLwLFQ7iNUuGgnQAdTEhOY7Nk04=;
        b=OTGCWyKFZuWdrwICzH5qhVzKeOyJZX3Tp/aufBzZVXieQiqgUo5wteOFtFPdjtlKok
         WtDXfQ0iE+Qn9vpdtYbTMD4dgNj21yFzDR/XE/Qz8ECFPcEDtZIQBClS4VIw5O7kIxMq
         Fnk1zdSl3DtWUqMLXE0RhM3+OCObFnUUWdAtwOEsFK1vVZn8Niho68PM2rBjXId+Mx05
         RkdBhm+QMYkUNzC+dUElcjwUtvb9BNAE+QSNkWBbO4Pe5f76LBoSj9rztyGFHKQjT7EP
         mYR7TrfjKAosJwhZGqn4k8JwtrqibMZJuSrLILemOh0b+LCjInJC/lWJ7Mh7Xjc0BJaJ
         M17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323307; x=1795928107;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo5hV3nq2vAzOrfwjLwLFQ7iNUuGgnQAdTEhOY7Nk04=;
        b=gBcTbaD8LNt2Bez5PLmsGfRQk4n5rBlbAWLe1hXCDFZdNZWKC0Ttmc5L+OmnB28h+Z
         5/NwlXZQVJ2Wvw1/8sPQH3FzBHYOJ+WnXu+EsiOWDYhyflJye83s+36mehPuYBXIcT/o
         sR+PSei/f+owJGRZSpeZq2X/A6ERpYmiOQXFMs0RBl+coD/c91gI7bnmcoWczJIgQSRn
         vmnMjXAs1hLahgcbwv1PW0OTDhn02zR0rf2As4TTM2liPdIEeaB/m9ibcJ3l+/9ReA02
         vjGdpAz18ZaZTzV942qJ43UwbmRfQnCcNzc9f5iCU+72RDJ8OdsLa4mYp92nWDxaeZTs
         le4g==
X-Gm-Message-State: APuU4Z8a6qtya7VBs6pBYk7JARTWmJBQKGiMk84upESGJmbHv4/kRO7e
	/6iweQbl/Z+kBhhyuTVZvymmXebLdE46lCQssl1pFlxhgJa4I1E4z8GB
X-Gm-Gg: AZFdTZc0OLwQaUHrg6alqYxglPEOpZJUI5vWDraYkaQOTbn1huDuIoz+l6MpamHYYnv
	wRkdO8LfUFFTa9+LOBg+HnINKBF9DRI0SbLCnXRTaBCmHgmgjyeppal1dFj15sM+KxV14FH1IRd
	8iOtyj7tEt43HZhmwp1YKwJHiTdOxEU2zHC/Ba29WydfHHzoEjfJ/aaMWnnvMhCtyZrDsURRQu9
	ChPrwpHbJujGAzxV7zsDAkT0pukl5Y9EsCGwcyR8FN14+U2e28UxNuWSXuISDhLSQtLGEb6+imk
	mJ5sb6HlP8jXastE/HyuoQf+ZHKnEnxCq2usSPsv0YeHNDO8z3xI3dOFda3JuWz7g7nn8m0QZt9
	3L5arwLCGmv7vGlO9EhE/cGggN0QnEAM/BBN0WhPFod+L1LJo3kJhnx3MTYNEKp9q0ks3C/i++O
	Sp5yNks8v/TQY9f0nvcouo+36yZULldpzAWRhnOHnLxyh9/E3QqNqZCIU0us/RNWkMHvHCgYckb
	62/+0uIXuJU2dl5vv4+6OS681azGhHq40QUH+6hqGwaS3u3dDYe/elLyyrR4eYzUQ3SbA+Wnnx5
	R9cnjrLdGWkiv3+uIMqrxI31ARajkv7Pf3v6MdHrKBO3hxuVI014J6/lxEVLrYsFJhhLNxE=
X-Received: by 2002:a05:7300:d090:b0:386:8bd2:da2c with SMTP id 5a478bee46e88-3868bd2db9amr5813273eec.2.1795323307243;
        Sat, 21 Nov 2026 20:55:07 -0800 (PST)
Received: from localhost (61-245-143-184.3df58f.per.nbn.aussiebb.net. [61.245.143.184])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm15989477eec.19.2026.11.21.20.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 20:55:06 -0800 (PST)
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
Date: Sun, 22 Nov 2026 12:54:55 +0800
Message-Id: <DN1GZS7LQ7BN.34S0SPYOQLG1M@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-leds@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v28 0/4] rust: leds: Add led classdev abstractions
From: "Nick Dowsett" <nick42d@gmail.com>
To: "Markus Probst" <markus.probst@posteo.de>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dave Ertman" <david.m.ertman@intel.com>,
 "Leon Romanovsky" <leon@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Ira Weiny" <iweiny@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113-rust_leds-v28-0-b8cf2f74fa57@posteo.de>
In-Reply-To: <20261113-rust_leds-v28-0-b8cf2f74fa57@posteo.de>

Hi Markus,

Thanks for these abstrations - I'm using `led::Normal` / `LedOps` in a
new Rust platform driver (`clevo-laptop`) for Clevo laptop keyboard
backlight, just submitted here:

https://lore.kernel.org/all/20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.c=
om/

Verified on a Clevo/Metabox NL57AU laptop.

Tested-by: Nick Dowsett <nick42d@gmail.com>

Kind regards,
Nick
