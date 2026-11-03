Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698515;
	b=2PA8EgPEcY11IHddqeqmBrlg5hm2xyVhJLu8sct3+OI2Q3xMHp0cgijn/I1owD20dPJx
	 TjHcBSp+cqHlT3mOQs22Dm16zxfqjDIZHCGFZsaDdzHU8zEoPCJ+y2sIz5pJL6/VHX+9p
	 +YuSteQnstyouatTgMvdRYZmsLhWfZ/JNLjfMe4RKUDjQDBoBrJV/unMjP6qZbw8EfJIa
	 cqlp8bZKiBf0PB3ZBue+t2CO3ceFlga1kG9OUn668+UvMg/HZ4Xf5IvwR24TW429T5Ef/
	 r/v7sOjAPnSA2hqd/uZ9D48nbmemjvhgf/N+bOJPJzPxIGs6n4SjijTosc5aNJCtaHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MqQV/dsEorHfngHDYCU99fh+ThoxmEOXgM8t5VST9dw=;
	b=q3qB490mRbGD3o1DGHkOPOwBOwsHxuh1UOVXusi0Qp/H9o3mpuBtyZJlhM0sdd2/YD5g
	 V0E15Rzb4FMVBZDae29UEio9hVk1Uq18YbaZNExdSbndW0iT+dtexDYKZaQXU/lCjfVA5
	 ydMpxbm/ys/5Jd3t4M/V4AIoPbCuqs60Ka5jaiPZQq0asIgN1ECYsMT8uxv6ma3RU3AtS
	 o23OkUD2OVNs4WkMUm6GTGc1idBigTsfrPnsyUIjERNQ11CdEuFlIMcxXm1ztLUy+Lu5s
	 dt/tFLrcLoF0yGprMggwnEehDJ8kuwfSJrtXmnMCWpByIlCKSi+WHMOA63qZF1b/XDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IH3Zj/Ic";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BC6606A326
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 09:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01BC6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH3Zj/Ic
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bb5afa736so525514eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 01:35:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698514; cv=none;
        d=google.com; s=arc-20260327;
        b=L3Ipy0RyFkyn0afKnyf3kIarT+L0Qd+9COZ0SvfLbNlKj8EWWC6aKLyWdkznbohn6D
         6KQBb2YGm7WBnzafN2vthHwCS3rzme/RPl/zBnpI/79AARXaiHI1mYHwNLaddT7NCmwl
         hCbvdURPiPXeH9q7XRIrfqwRLrMaIFtvu7GvEkJEVZlT2L26iRnK/auHPHiYMkNoeTKx
         Vc5SnBgsvRW9Vi9vV+Hbbw04F0zkipa9YSFUUPEm1RbA/05Qtm/QJFmLV4iAwPc0RnxY
         m6IK4etFHrQ4noqIPiOBaCsQS9WbmA1+IeuhUXgqYPsxFAwoNNC8XWdM6lHUqE/V2h1C
         l7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MqQV/dsEorHfngHDYCU99fh+ThoxmEOXgM8t5VST9dw=;
        fh=u/BaaUZdmvMlf+emROIiljPzO60wRdTrUibGJCtl5hY=;
        b=dXM8vGlEWzllOmKKmxfe7egzbSkvM341WqflQYtMYzNt2hXRC1qVzQ0RmX+BdyOy7B
         /lb2EBPBmf4i/EcC0IxbByT10d9ooPd83iRwhi7vm9hSRcvvJ2UXaITxGw50h/JZLvcV
         f53UbITN4g55EcKA55PWdDrsYX1PpExKNb2oEmvLwvZmHwSYOWyuh9cElZFpGs8aDpvV
         r+WTSLp8Tn8vRBhWEUtaRjaOtv4MtnlK+xdyDO0rqYElAGm80UznIS1LiWdcsMALhe0e
         gvk/ziHj9lbucPJhb/kTnoVTwcTL0G6Lo6avVX2s0sbjzBx2mibGSf1GPxcPLXwQjdWp
         opxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698514; x=1794303314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqQV/dsEorHfngHDYCU99fh+ThoxmEOXgM8t5VST9dw=;
        b=IH3Zj/IcOoFIkCq4kbnRrQQg9ZUE4ORExYgM8WXwnZY+Gel6stNzHnDkJsEqm5+KUI
         MbpCEFUIBVZKVenDkMQ36f8vr7oTgGOFML3cgz3cGX/mm4W79MR0G08n//wvUnT53XEF
         0qPnKUnoCKDPut01sSKfOKtWMPN1ERpgf2c2k5UNjASkoCi7QOOi+0l8FcTYQEPsnDHC
         YLm0O4CfVhsXdmVyWd7gphLhjtOBkLKRvoEgKXPxHlkFmIsaneSvLyGlb5+sx2RJMl6B
         xTvEqEYoaTt9Zw7Sx9hikNv9ojWXUN3JHWQtW7bYTVCEtrhkTKqNZEqu4j9d725FyiXO
         1u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698514; x=1794303314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqQV/dsEorHfngHDYCU99fh+ThoxmEOXgM8t5VST9dw=;
        b=M+klke9EmnU5kEW5u0XfHVp2wOcZK9Tv9O+8htf6oCM/Za7Y+YTPNWBVi3HVNeZcm9
         H9YftB7qMNmxXmBIZwlZ0M223I2HJNH6zKUf/grNs2ot6m8I63Pw5QdCR5euOGG+wEVi
         XtHoGA8xSvc7BmiHb/sbZjtVskcL06mSEte2C1PulcAx4GF9w20ogcHPP1gz7gdFXG0V
         +HFx8vn3kox4+dhJVZJnsTMvlnxAjdbqHvUyAG48GAUkpXh1INLd/4ZBj8R3AMgdrd69
         /iS3evYsm10sqDXtw4orVu/zk1PQtSJM2Z2tQHBKGA0BeQflv5cXaPlbYkOY4s6b6mnt
         7B6w==
X-Forwarded-Encrypted: i=1; AKwUvBz7saR7MnkNUpEqM0q0gfakBXGPA+O60K50oL5AXB4wzqIBVBT/bJhbTymdoyAgfuhtHwD5qaNkDz3grCKYRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wt+9sdaGP2hV1rxbAIfPMvGGKyiwee3fZoHwrdGsZp/jZhg12
	oha+pA2f3AtPOzmsg1LjNEglAYRiet9txt5Cm6ddDbR0i5qlZfNZXWjsSwcvkq4O0yhNNDd3Hfp
	ZlS+18d2RCNCfuVmYY/8UplaSFuDlVKA=
X-Gm-Gg: AYBFou31Iu5TngV5BduL7eOGjxvjrj2tqFQLMqhqjeS35QrxgTWJnD/RhoAo5aP9p8o
	pr68vMLMMK2Wb/ey9WwLzquCPAH38oqE/0AQZeczwFPTk9qtDzFgb/flzk37jlqu4RbcdFhR+kq
	CCqEoRSWcVORd1yqH6kIXWYV6K/czZpgxIlcwsYZokiwTfge5ic1SFvB8kpPvIIOIa6Cd/ZhK7G
	iMK8M60VMjEPAU3qCnPFD5uFkrdUPYi0xDWNQgFgoHYxvBba4KTMJkr8wylHySLM7yoMJPqKjpl
	yf3tlEZfKR5/mxGEvL2/NikKPnmKREuJ6ug/qNkH7SS78p88mZXfweOaFUJv2trSA3LtIVCU73r
	BoeCo/Kx1Px8zb7DpzvAD6bs8H34ChOdUad5UynhJcnsOU+tHtaxBSX/H3q23Wn8b2rPMNXcXkT
	6RZw4pHsdlM4R62M7QDx+GZ7UlhtrRchklYRChnqRtJoTCoNaq3vp0jit1zCMfXt9Iup8AFCVOp
	j6c014rM9CfLfSy1gm0lsdoa6mIoc43rMU9
X-Received: by 2002:a05:7300:7a9f:b0:36a:143d:98db with SMTP id
 5a478bee46e88-36a4234fc7fmr27905252eec.1.1793698513831; Tue, 03 Nov 2026
 01:35:13 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009124124.1176706-1-tomo@flapping.org> <20261103.182511.1470121559944018656.tomo@flapping.org>
In-Reply-To: <20261103.182511.1470121559944018656.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 10:34:59 +0100
X-Gm-Features: AclHuK8BV1waRmFXx_MF81hHdz6lT065iynp_Uw6trJe76whSB8KZg68Mak_W9E
Message-ID: <CANiq72=Mb7Vn9O0baOJFRf68UiZoxK0RjdXBFLw_hCHcqCkZ_g@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: rust: Generate unwind tables for Rust code with ARM_UNWIND
To: FUJITA Tomonori <tomo@flapping.org>
Cc: linux@armlinux.org.uk, ojeda@kernel.org, ardb@kernel.org, 
	chrisi.schrefl@gmail.com, linux-arm-kernel@lists.infradead.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com, 
	Rudraksha Gupta <guptarud@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:25=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> Gentle ping. The patch still applies cleanly on top of v7.4-rc1.
>
> Which tree should this go through?

I guess arm's ideally, but I am happy to take it with their OK (do you
want this Cc: stable@?)

A review/test by Christian would be nice. Rudraksha may want to test too (C=
c'd).

Thanks!

Cheers,
Miguel
