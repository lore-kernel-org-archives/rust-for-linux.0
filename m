Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72A486B86
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329175; cv=none; b=LaCLi3WrTN4jJGBpLdWIGkp9hlKKGAUsdmb2iVhyGQjSO+NejTOgNXIK/INSnuWDihp5FLnpgk+Cj2FhdByK+0P1N3tHXb0WLHMPcdFVcWHdQCvDPkDTkabdzo/SzewCH4g2Pm+i+JbNtWgVpvo/1e8MjR64knF+zqiKxDiQz8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329175; c=relaxed/simple;
	bh=YR345H/ywsl+oFNo4Rj3/0Xoxos5dcxHcZxx+iOh36I=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fcXq/phXvAt8fd+nWwUDXtXESY7kyutoMPG5G9WZ9n66jWmuMT9TmzSptQpmp4Qasg8oJ5Pt7PzxOWlcJExEYnDB5npf4new6DcdU21W4P2jlUhoPAJ+1h9/OGHELjrH/2wNfiqavLnifC/ogMN4OvcQSS4MJGLvzKMmc02ezzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=G762fKMR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dTNRp6lD; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="G762fKMR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dTNRp6lD"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 4DE4CEC0182;
	Fri, 25 Sep 2026 05:39:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 25 Sep 2026 05:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790329172;
	 x=1790415572; bh=n+WsdDR0ww7LmISG3CPUeYuIMgt8+WLPC+8Ue2l8ggM=; b=
	G762fKMRkZW735303DFQcOk6F6RrlHgDY80+Lxp/SS/y2rclTj9AeYpBNJrCd2ey
	Rus7KBHwxP4P6/vrtzbd8WWTy/BWYS7ICCTdd1i0JwDTatGi4yp88js7O9dvlrbf
	6H4bP3w0a+FRmTSOBfROCFPEuXQzFQbhycCT3Q744zA+altSlAP4fSX2bM85I23T
	7i+XUZpXonEGwguGrMWSpA9fMgfOoOrI2nG27dDyAhiCn8NRU0kN7C0zXMg54uNc
	LcO8vJ6c2A2mvBnckkPcITuOOgm2/A2ws/G3VSrSsVtJDPZszqTExya2C57OwuiW
	VrQFK1hYfP3rZrs+VsecYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790329172; x=
	1790415572; bh=n+WsdDR0ww7LmISG3CPUeYuIMgt8+WLPC+8Ue2l8ggM=; b=d
	TNRp6lDKP56BYhFfOcjkwonapLDV6JefTHMbAGJu8ifXCnJGJs1uD5heu5PosdNn
	C1lxHE1mP0IOjFniNFyyV2/YcEBh8isgvEL3h+jmha8cyEdaQuCo+YXrh2veIXS4
	GeaZmJbstogDV7u96/X4rrz+NxMOX44dIFYpCVb8N6zIo1jZn0drJZkByRIgm9km
	SH4ePT4wQu9J6CUyLmiFvJDKyYFCWGkTAnZSN1Ou7ImItri1dKsRgwcvWRxLnNqS
	Afl0LeoeBo3+9Dq6Qw18m3CDmWc7YSdpG6gefNL6gxxFzNrJ8AfQd/Mn2w+r0z6w
	ezcBhdUCZLJqt51pd2I9g==
X-ME-Sender: <xms:VEG2av0lCDJYdqqbuaZzO5li-z_J8EMRWDE0ESWwuSHbQx128UtxXw>
    <xme:VEG2aucu5NSvB7Q2QcotL6VKDmnKx38HCKFdCGtHDRfP_BUsvWKVo-TkdmJIGyk1w
    UqqxLUAHaqtzHs5hyXqnscNecPmsnIBmz4h56B4md6BsMP_gml9mhaI>
X-ME-Received: <xmr:VEG2ahCQ-bQdTeFChQyIF4UXSSH7A3wOx1QfQqcthMRI39Xl8pisPevHWN5Cp7AhYpFT_-COSgwe_5gnfYHwrPRS>
X-ME-Proxy-Cause: dmFkZTG2j94dB2ag3MgBQpaMq367bNc0zH1h+KGPs02FWUvfkg+AdCX3LcqXFBiOK3L9hn
    Ccxfh7uTHML7XnXFrWuqQD+sqfo4xmWCtshdOZEah8UPUXtQrQnWarjru6yr/URdh+AyLA
    Qo1UFFW3PADcn8gEIhwpEpeHzb5rf5ZeagkJh+H97tF3xoP509EpOwBeu2W+Jk3ECemKxs
    TDK5x0wkMl+BTO4LNkkziaBSL7k6hWoG/3Z9uDB8SCdoltQUgv7LIy0rrm74ja9qWZGfNF
    pAnKn5MKe19OhO0lWkR5ik6fV2wVLReoo+zKKQlmhEMviL4irPr6s+uC6qbIDKker60Koy
    X4wjIpBJtiDmeLDKsFD385Tz7U99ynp0SSSpty6lKwyMPCCxMxNgcrmKeE6ZJ584SkVh34
    tCsO0Rqh0OwLWxu9lC8C2Cn2ez0XXqutbuZzQ5PD1+m8zRf1ZTjHTxgGPqh7xj/qxmZ/tS
    CxC1SXH9mH7Bh2TzXG4QGEYIv8VPt2MoVkhBDr8tDOy371TITTV/iPjy8pYZsF1cdVX5Ep
    Zd/mE0YbLAmNvixp7rj8gqkQVxXip5nzFrcxH5ZpLKZahYxV16lF2Y+KPwb3CD2tuAGLCp
    FKeVe1Ol10CpP6s0WEvFbpjcCtBNKxvcBKF8teqWc2xsQ3JBqPBFzuTLif1w
X-ME-Proxy: <xmx:VEG2ag1oQpJDvioLhxy3oKV7jzaKVq-q5pM01vUTNNbQfRDVyhfRSQ>
    <xmx:VEG2ahMA7by82slvPFlMWNyxjO2hBBMRrt7krX0IM5fVjDCfOhpMDA>
    <xmx:VEG2aufBOZXBMXHkDDwhj-o8ptuSkMyHYIPkjrPW4KODJf75jqQw-Q>
    <xmx:VEG2atO25sbR7jtzS6VtJNfiYX_COb2r-5Jh6RUB0hw2PuEkIwfbjQ>
    <xmx:VEG2asu1MUoU2cTjZVsnp7mp-cPUqdGZLb1CzFAbypLcSVaWUU9IN2XM>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 05:39:27 -0400 (EDT)
Date: Fri, 25 Sep 2026 18:39:24 +0900 (JST)
Message-Id: <20260925.183924.808421603238938986.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, gary@garyguo.net, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87zex52224.fsf@t14s.mail-host-address-is-not-set>
References: <N-9g7-JCEv-O-X7-hryv99BRSZvftBvpmaAmWdwRp9b9Gi64FWr6GAtnUToRHlX86lCBJgEKPQine1a1NsJcUg==@protonmail.internalid>
	<20260924232530.446588-3-tomo@flapping.org>
	<87zex52224.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 10:00:19 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
>> index e6a5c7a795f0..0087749995d2 100644
>> --- a/rust/kernel/Kconfig.test
>> +++ b/rust/kernel/Kconfig.test
>> @@ -83,4 +83,14 @@ config RUST_BITFIELD_KUNIT_TEST
>>
>>  	  If unsure, say N.
>>
>> +config RUST_TIME_KUNIT_TEST
>> +	bool "KUnit tests for the Rust time API" if !KUNIT_ALL_TESTS
>> +	default KUNIT_ALL_TESTS
>> +	help
>> +	  This option enables KUnit tests for the Rust time API.
>> +	  These are only for development and testing, not for regular
>> +	  kernel use cases.
>> +
>> +	  If unsure, say N.
> 
> Why would you gate out the tests? They do not look like they take long
> to run or anything.

Documentation/rust/testing.rst says:

  Each test suite should be guarded by a Kconfig option in
  ``rust/kernel/Kconfig.test``.

I think that the reason is the kernel image size. From commit
e74b7a3f5aee ("rust: tests: add Kconfig for KUnit test"):

  All the tests are compiled unconditionally now, which adds ~200 kB to
  the kernel image for me on x86_64. As Rust matures, this bloating will
  inevitably grow.

