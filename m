Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795403528;
	b=223L/Z0Lwg8KWhVYmxqxdpOC4j3qM3CNZvl9ugMA5T3esZpsq3veP/UvkmrhJqmcTiGv
	 /l2bqOrjdgDrZURVCyvYU2vQ3EkF5005r1mwmkkeLHjVQaR3Iv6sCGuxn34PytUTjPtoP
	 mIFaZLSHKqOyo8vfmL2qV7+gXw3nbg3tlqOO0FAf/5WdGMwGzhyfuBlT4O32P69ndB1Ex
	 yrHDZ6teYAqs6C0ojtLMEdIBEzf0IsiCewDj4WZTPdX4h8PDvGvSceButIrDrlLtCW8nR
	 NCX9KkK5yV9UjHtYS1lZABt/AQxO3PEA1u7kte3LSRGleLH4MLTtA1b5HwZ9VU4A1CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
	b=VHl5/ZTUieTiGe2sA29EphQvsOyP7Aoc5eRT6uSziLuXs986vr1+FHibdy3kyNHbj3Om
	 WEF47lTSWxeSctSJLJ3DzL+YQt+i6Yft01KEAZVfunPl6SoF2jTh4UybBkiE3/knIizMQ
	 GEkdor0K7wq3JqAUGSJ6h+B5DT4/UvPcEI4yBPlq2zAEIRgeNaw4DFDBrEy1c3xYcCXGO
	 s428mfMcPLdEn1PM2Eov9ZlUV6DR5zZB5rK1E+ekf4vLeKJIz0sa/DvRWNy940/wQi09p
	 J2PSpIdtaU+1bikrvO1QU8zjjGcrdWY18jmo0b36turjo+CawbXWHQ04ov01ak8VXIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jARPTXN+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404E5606A31E
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 03:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 404E5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jARPTXN+
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1754305eaf.1
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 19:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795403527; cv=none;
        d=google.com; s=arc-20260327;
        b=hxp6aW7fetCTzuH90Bmcya7PWoNEBxpgi2OmIHzZQ0dJ6MCGcj+RnQymntLMQq0UDA
         WYq6I0kh5m8oe0X2wjiEn1fa0R/m8UP0dFJ6QBbOWYDF4zEnkPdSawie2Ii+ma2UGZto
         YNtypjdgFpOgDNsh4JdqGwXHqVWoyXLPcL7s99igYFJeDJZPsq7a46VAVV9tDDPh96fP
         OVzemJLHRGMBG2ScPSrGZlAswjCWvrZB+LEXatJ1hflY52WsXRT/KoNW76ve7ELmWCst
         jqYoCqlcBysTCqhiD6X2h8OtNH+gBy6Rgbuevwg/SJDnu55PjPMgulXCyycUhx3wDdwr
         17mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
        fh=yJ0YPIk4j41jY5cmyaH+ppIDG0MRLGVHpacMpgwFvBs=;
        b=jKRiqoX6WRUWg0Dtc39sP0GaXTlIIG4puyMDB7Hm5BL5ziR7DIeU4SZW0h1m6Cj4P7
         9a+EQnOZq2SwiLyjVQN+pMdLDSSS8RAgSQqXORW4wc4FKYJfKbnYzvyeFglKWQ9f+xim
         fXingAt+FBnNEXeoo34XM9gfj5ztJMG3XnfqWTrq2jgDIUwD5K4VFHG7+Tu+KXpIrxwb
         cnJzvujhpWbjDNcqLrbumRKkEE3NYNpivv0VhZV/bvLLN9Iob1Rz4rstD+cVSyXENHpl
         ThmunuPxj5QeUJ7XZYQWLb71QI8ffFkEvtAxVuayKwMm+b71WjBpVK0+RKyREus5Sz/1
         hATw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795403527; x=1796008327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
        b=jARPTXN+jk/1Wht2ZzTp8EPu1BBNoMz8Qsz7W+XMEPM4qSPogqmAhgHzkL3bS3CdKw
         1kHeeRhiAkiYQo4Z+K/Z25frEAf/LavMCOkJXzpO31iKPz5HzqF5nmHu/qcU6t3ESDsn
         Z9CaV0FKSVnPjA9srIhsNTPdEN0OQCKAQT3iZvIjsuFXgpsnVHfL0Z9rEHcHp9moy8Ez
         nVnTp0fXXEZbfbN2PlDtbnFmwWp3wDXlA+bnCUC/B4Tf0MwAk3qRs0qSkebtH1UpKJt0
         iCveyniyziPI5rq5Vli46XCg4DJH6uNLrKEcoUpsIJCpabtQgkBAW9v6TH6yxKbwqv36
         tnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795403527; x=1796008327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
        b=VnHSTsQj47zWzQzIq/MVy3q9O8/UDJ3FEXNa+1ZpxbRFeclk1hMvUu9eXm0BSpD7vd
         rlffLfgvIxSAMHGEYiTr+ueDKmSvu3oL9bzE3WRdCHIS21ulAgZOf1rnFXZu9JdRmip/
         Tc3ySPeGdwF96cQ48KwpE4kCpPOJnnFAacIzXpiH5j+D5qwqy+agbKTERdExs5SNRa/S
         GdKYgIp44rMmeriHdN3SwLzUMRNd2ZFHJCfzQV+2Ip+TGZuupk8pWugIhuNvXbMqvsbG
         cLxVyCSSQoX3uKfUdX1y6sjvThAktMxPUXUn7TMyXO1miTiAMEUbf+L2OT6Mc9xRdARK
         yCGg==
X-Forwarded-Encrypted: i=1; AL+hErEAgfZFePgsBDwyT7PKJXip29KOCm4u+l8p4LOEsy+lNGssQF1Hk+SE2JeCm5/njcA6Ipt5C1lo6f0pyNwPDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+C0SennYsRfuTlW4PzkN9AqweG5gnxl9NiTs7eZNGDFKMjLqfz
	hzFgKbNkyvHjk2KPB7GyALvkoih4TjxcUFZKpK5ynSOJ/ko1MTAj5GVuCVZOlb+1565V5t9CiXV
	jC+aqep8BtpTJZ7IK2d2aefjjTkAW5ww=
X-Gm-Gg: AZFdTZe+JblFAaFmM8v/feZBohgh4uYXHrnYgV66knRdpBZD10Yc+KB1S2oH4Da0wKy
	SEupHSYSfgzcrpGspO7YR2MJFlhG0Mjfolxcq50TRKa/exNpcNOh9p7RZpGPgo207fCB9ZVAELp
	sj595cPdHigIMO2fCKlPpJFm58GsJYNdhJFhMV7I5ar8T803EbCGI3eTmMKC9wwkibN5qzB28yo
	1p1dj3aR1brWkqDz7SdaYwOyYFVU8bkhCQKVulY+7qWNgzX+40DBeiZfjhyJ2T+iLcj06FVWnhZ
	MkSAgTFQBXKhnAcVxPyr1ubqfA0ZeC2+08gnjzpa/zz3uileq2yUhKZEUl+fBsyGn0HUJ1x7eqk
	3RJzzUYECaGDhu4B5sbt8lQi53BvvHk4AXU1wCsu5smqOpdhyyCRU9ALtt8AVAu0lImTu7VmrmO
	bdaUhOomVYjtRdFqBf5trK0lCHwJkVoEgYhAW3l7sVc7WOs9E56AAg0TzH
X-Received: by 2002:a05:6820:809:b0:714:b51d:f512 with SMTP id
 006d021491bc7-71b39400ef8mr8589110eaf.17.1795403527106; Sun, 22 Nov 2026
 19:12:07 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-exp-phy-rs-maybelocked-v3-2-4e183a7366a7@gmail.com> <179513866237.3136.3197734576083995986@kernel.org>
In-Reply-To: <179513866237.3136.3197734576083995986@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Mon, 23 Nov 2026 12:11:55 +0900
X-Gm-Features: Aa3M54ounNdHIeJr4P5hKagxZM-CAo0cFkrf6E_mlmmljBCkgRjNgLAoGrLJ10M
Message-ID: <CAGAB667HcHxS-XboSz559SG3tT-RhVmZKt5McWoez8iwuUGq5A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] rust: net: phy: make Device generic over
 a lock context
To: netdev-bot+sashiko@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 20=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 10:37,=
 <netdev-bot+sashiko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:


> [Severity: Medium]
>
> Does this SAFETY comment justify the from_raw() call?
>
> The new Locked invariant says that no other thread accesses the
> lock-protected phy_device state for the lifetime of a &mut Device<Locked>=
.
> from_raw() now also requires the caller to be in the Ctx context.
>
> However, this comment and the Locked docs above both say that
> phy_mii_ioctl() reaches this callback without phydev->lock while the
> state machine may be running.
[...]
> Would one of these work instead?
>
> - take phydev->lock around phy_init_hw() in phy_mii_ioctl()
> - weaken the Locked invariant and drop the accessors that rely on it
> - give soft_reset a context that does not claim exclusive access

This is why the Locked docs list these exceptions. Taking phydev->lock
around phy_init_hw() in phy_mii_ioctl() does not look safe as is:
vsc85xx_config_init() takes the lock itself through vsc85xx_mac_if_set(),
so it would deadlock. Fixing that race belongs in phy_mii_ioctl() and
seems separate from this patch.

The other two options would change drivers: ax88796b_rust's soft_reset
needs genphy_soft_reset(), and the Locked callbacks need set_speed() and
the other field accessors. Documenting the exception is the minimal
compromise that keeps the abstraction usable without changing driver
code.

This series only separates the methods by lock context. Other contexts,
such as the device contexts (Bound, Core) of device::Device, are a
follow-up.

Best regards,
SeungJong Ha
