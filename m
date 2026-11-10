Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320378;
	b=0eYNdZkOBgt/4CYWWeD2JOa+SoI0XJ1nYm0Np6/cpSIMBRoLBnQ+zopEjB4CgU+uUSY8
	 jS5zaCc/a+LjOPibvcOQz7ntIUSAWC16gWnrU9CYb0BVUDiTBAkrdDV9Tm3j0imJBi8+O
	 jlhzorm1HA6m1+j1iXAzadpRQoaz3/gCi3Pi4DKUSUisLqhpavdxAMoOaRINmQatmaFmJ
	 W2uPtnkJ8XDNRhvr3A6737D0KEL7xAON7EH6FBJx668Er8tjHzFzh7RsmzCgiueO/d1I7
	 X68xIt3G17IJAlie+UE7bQGGX2AcieOX/Wr3/cjf2QsYVCncI9linTomDcQpsEyDQSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=KgPlI63d36dkLxx70A6MO8tl7h14r+OFtgotkLmdmn4=;
	b=r+j8Kff5L30v4ONF0U2R77FOE0WT3eoHKMJMxK+8+4uDSjSBAVFIAcJ6EF0r+zeeuKxX
	 Kaa7P8X60dljaOPEGdswksm3TYr8t2smqRB8rlpSwMJ8iAivrQ82jhIB5c3fEY4QXc4Oe
	 agKaKLwrsNSOh/gCK8+Go6njDKHFQR1mL4q2wY/NxEzDRzJ3YtBT9tPbt5MREfv3uPWMH
	 I2dHizFyRJHux8NvDANRC1A+90h4JR51XNfd0srwUXeHnRNnAyl1NjIWgElCVZWmkPrxi
	 6tdjsgUz5cd90W6sR+h9MKNz51nvIt7EgZRHE1xCOOFUY/92aQutKxW3BoQGnbJaSDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cb5rpQ0S;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397E060A262B
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 14:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397E060A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cb5rpQ0S
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3720addb068so3648619eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 06:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320377; x=1794925177; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KgPlI63d36dkLxx70A6MO8tl7h14r+OFtgotkLmdmn4=;
        b=Cb5rpQ0SFbtE7iVU5JJrjmydsGk7fQZauZJUDx/CyNH+pJsYAimE8OZSEEKzT7mbFa
         BkBlXzp357MuT8HOEY+f1MmwQIAMGvzs9ADhkjTP+7AQzStaPUoa/Si/omQkovNWnZe1
         EO43/NjZJAmwyAoorZgIHLGI0GmzemVCRzQtOoo8SVBfpMnUAfE9FjDCmn/fkZFuVICR
         RjdprPYrAcq19eVR1I/8Y5vFRg5YhDuQV9i2faQy0HeOS6mxyF/zJDrQxIDyYN8yppb9
         iozLnV9ajlgDuO6ydVuz2CHNbB1DYVrBFgP1leLeULzZ8Hog2IMLowDrG32rkYtOwC6P
         R1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320377; x=1794925177;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgPlI63d36dkLxx70A6MO8tl7h14r+OFtgotkLmdmn4=;
        b=PAxrtEE7qzLdwEpf15icCilqQXNSyh1k2LdnfL3blksjCeztbuqXWOaGR9CkRhH99q
         GE3yFYQYCrknn7PosEw9WgXrIFbC6BG4HDR5wY5KVvnL7Gj9FrTB2Fn7KLcKifcFWNxx
         8CFVBZe6WrUmD5udQh2pfYUdIo2aLgvepUhVBqoM+1nqgZBFQmC2nv+LG0FoxztwvDFS
         iYhNKunuEMpIeocEgFYgfNi6WYB27pb0eZ5qYxMPjW7O9zoZ4a5YMrmR3hGGNIcQsjHA
         XgKm7Y6XRdSvyFYNmYCRwJEnNCrLTmdsvlxNDqDN4p+N8FeWJtUN5uj3FCnfVv1+Ass3
         IF6A==
X-Forwarded-Encrypted: i=1; AL+hErEZcvFvhVFabaXvDBB6Zd8aHKj0is0gzJr7MCNmNCHtddlKi8QZEuh+y3js5xtj09XhnkXnlMmc3R99LwuakQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/N8boIFdEiMWcibnWhYMa+oVw1WB9DXgGecTiLjUPq48ISeLDt
	BcU9MZp9Hi/RkgTlDux0ZlAiDLPzErGwxHKe+28c/BXxl5DmfEJA8W0=
X-Gm-Gg: AYBFou3Be9dpkMMaqM/j7sU7JQCn1I7+fX31Rkw5DCVwXNTQgUm+56D7nU65octJVv3
	/xN20jh2dAfGD11G9lRgFOfIE1quSfJ4CA3iWdVousqUPcO0x2zRVl80fRMVpJtFNq32iT6iU1W
	/XXx66b+IlcdsNZjwj4jrWT7DOBOZ/eDHd+pDFGOQXfwvWBpb8o9FXtc5Ueit1HR16/TnV0vZ/m
	GHtxxHsA742Cbx4fF5qjs9suR2mb6tAjp0ny3VvKpsKYTieU7JU2G+JbAOykuQYoZScE42IHOb+
	S974oyZHP92bGlqI7Hp5BHTJ8ccLBDQrMd7FfGhCT2iqcKBXgE+LUbc1aQng+CT0BsJIMlvabEh
	HGQ1jo8wClGYyZUpnnDVf0jHUHb9/NGITmgY6pVzCt+fuYSc9DcGf5uh+NYrX0F1aqSPiXxtr2p
	AhdOSFetYkeogTmTMrshRPZBlFP3OIhgXI61m04rZnRny3VV7VdZZtLBeVlUFpZGsuz1BA3Y0Qr
	w7B80FVoiknN8Oj7bj6p0dZnTn61xZhyC/CgQ2oqnUv4QKokN5VN7IuKHAdM6Pa3lQprr0JUxei
	0GG3OZ309ToEE4C3T6XZ5AMtW18/IYarrZPOEa2bwQne/EGsWEJwDfkL+z99MhpwQJVyJCK9zVe
	XX4ThrmWrOA==
X-Received: by 2002:a05:7300:cf91:b0:36a:15ee:c20e with SMTP id 5a478bee46e88-375212ea575mr3560699eec.33.1794320377066;
        Tue, 10 Nov 2026 06:19:37 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm7225373eec.28.2026.11.10.06.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:19:36 -0800 (PST)
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
Date: Tue, 10 Nov 2026 11:19:32 -0300
Message-Id: <DMRLHJFMIIJF.1B1Z21J2B2J7R@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Benno Lossin" <lossin@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment
 owned_bitmap_out_of_bounds panic case
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
 <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
 <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
 <CANiq72ntU+K7JX126f3fhvW2ofK6yNDEn0RkE=r25To3cDaRMg@mail.gmail.com>
In-Reply-To: <CANiq72ntU+K7JX126f3fhvW2ofK6yNDEn0RkE=r25To3cDaRMg@mail.gmail.com>

On Tue Nov 10, 2026 at 11:01 AM -03, Miguel Ojeda wrote:
> On Tue, Nov 10, 2026 at 2:50=E2=80=AFPM Nicol=C3=A1s Antinori
> <nico.antinori.7@gmail.com> wrote:
>>
>> Yes! it was to match the other one. Since there are more tests the other
>> way (#[test] on top) I can change the one I am uncommenting! (kunit.rs
>> have also the #[test] attributes on top where a #[cfg(..)] is present).
>
> Yeah, then let's use the existing convention -- that other change can
> be done in a separate patch if someone wants to do it.
>
>> It was on purpose, I thought it looked tidier separating it (but it is
>> just personal taste :P, gonna revert this in the v3)
>
> So we generally try to avoid those unrelated changes, though sometimes
> it is just easier to do in the same patch.
>
> However, I was asking because that removed the line (and you say here
> "separating") while later you instead keep it in
> `owned_bitmap_out_of_bounds`, so I assumed it was an unexpected
> change.

I read the change wrong, it was indeed an spurous change, sorry for the
confusion!

>
> Either way, yeah, it is best to not include unrelated changes to avoid
> confusion.
>
> Thanks!
>
> Cheers,
> Miguel

