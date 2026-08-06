Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA03C73C9
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002076; cv=none; b=VfwWkNFrtcyvv7ceGI9Olku5kP2c31OAqonCI4E7Bpuiwp/fedfe4gdeBp9JA0URIGVvV14hupknqoj4WCBAodE2/ebdcx2u4t/Lk2kmwXIHoUoQV1IUyPLfyagzzrZh85JTQ2e9ZzS+tm0gJliSnsuiH8wt+fjOp+koovMiBlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002076; c=relaxed/simple;
	bh=2kVvM61JvU7YH1BbMq1NCBCArFgnfsojuuZW85hlszo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UTrhCYnCAbREf4I6r5jGnr4Cb5FmuYRtHQdJGujZ0B7DLwgxVxKTJEkRvW3TXOl8FaO1VMNB75ymuwb3DKw9B8bGasWM58Y4zrqE/QRy4yS++dJZ5FEJRXboYTgqgtmI6KGElwi0VB3uu/Y8g5M0loltm3N4y9Vw3e1mfe6SIr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=BkPW1XGC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ot3zttm+; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="BkPW1XGC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ot3zttm+"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id DCBDC1380322;
	Thu,  6 Aug 2026 03:41:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 06 Aug 2026 03:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786002073;
	 x=1786005673; bh=/x7bQWuqBgM7GgPjciUiqaifHHwp6dIrnOrveypIv9g=; b=
	BkPW1XGCCGz7HyifM6hWJHXD25di/MTFPdh6DdHL8/CPyZ1HHTIcDhKSOJB4wx/i
	uPRO2Hci7YsGcoFc4BP0aWFu/rDpSj05KMMqHYIp6pTMUwp1XpvebOaPA1HyOIcv
	ABgJSToND2MUuLj7kwTlsVuod7L9p6YiQdkwp+oNfgKpQKXZnEdkoTFx3OCIQxdr
	MVC5xrJvml21IXPIPRy/mdhQgnkyjKp3kV1TyC7J6Uujpv1QYI64eum+1C/kzjlS
	EqIsq/24Hk+Rfza7lX1AqPwMa5GZdo6hLqFSeByRUJQziXNK4+zjzmR/df75LoZC
	k4DFKxGwXxDKlZKjB5V4Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786002073; x=
	1786005673; bh=/x7bQWuqBgM7GgPjciUiqaifHHwp6dIrnOrveypIv9g=; b=O
	t3zttm+dYns3SWCPZE0xFY3ZuoXb5sMVqwfSJCAuVhsOWpCK+s+2Y5p9IoGw4y9K
	crzRq/Z2aRh2OXtkENeUDP4QOj4xxXqwwyOezY7vlmo6HP6yqB0UH19BO1spNF7M
	CKxaUro7hlYUduqxrVU1tuxKQUBtEola2yV76VDZp0mBukCu0kJt8JmtoBoOduTJ
	XM6fbSHLzILk5TsVlGPR80CMzuu/DSsJhLy2GKngsBDOMNJw4ox9btc3WZylpHNj
	0yD/vh6hnZIQJu+2oGNPE4hSJJZMzrP8XwYTPT0z3BI0E8CO/gkUrEBYJWvf86Vv
	paAS7Ibhq9OUqX51pEgnw==
X-ME-Sender: <xms:mTp0anL-bT588nxncySuoAY7OvgDNRSzM0M2qEDflAPcALFGGE2uIw>
    <xme:mTp0amrJXyvxPEhGDfcB8jiV-vz4o7isYJEK4SH0mIicjzFQzZo9g0HgtFZW6X2Re
    bXfiZVaBSIBe4F9Ar7raVwQXqBCOqamqtfDc17ADGEBRmtPQofuE-M>
X-ME-Received: <xmr:mTp0alu1JggCgtl9JWj0agqLzwKugpQuos5efWjL1Og5EasIW53Wim2TlC22Ay2ifEIujdhP9KblARUPaDKMenVg>
X-ME-Proxy-Cause: dmFkZTF8oQxVkEPG29xotp+g4W365VjD7A95bLJ7p2MxTmxd2BMbdKvW1wMGv9TOjTuUNc
    N2X0QUrdHJVGdkLRoNSDcV/HbcUrbPusRLgKw/ePSSZIAq+KPjE5cBqFEa7fcaZLvfAdaE
    Ksyw8TqLs1tq7XO+Ozm3d4qwRbxrCkKs3N1Xm6iuUv0WF7lHvBe6qFYo46dH8IEynwCkT8
    57N3PAArPieiYbj3OU9cven0I+pqX79exzv3B5Z/wzLvAlWfNx0o1HUi0yntTIIXHD4sC/
    uW2s97qVguwwWOG6GAFEWBKWLHv99DDAYMgiKQ9gq1WqUAaBrrRdODWuSSYISTmtPUMvs0
    sscRODILCZpTbGiJ6xdsQgLz3EN45A/3fjMRxxPI39WWM8QdUptsljsz4b44/156dYZUny
    WyMRGT0DDHxSxBSHdN45EIYgb2oAj/5ckK7DOOPSr9U6YNwMfXo1hZt7g9Y9FDnuAteA4r
    PrgmZall5gYK0aCR9UCBn3SsgIM/TyyL499bpG+x8HxsN2n7xNbxpP3Es070zlWHHinE6o
    mGXr6UVQjfAujhIIE5s3jixomgxz0mTMAO6QpYJQvCaO8GITYQyMVuGuNI+1rLNXTOEeAd
    gGPZGq7m4PKmV0nTvDJqSdLm8lPJxx2oG+GLiqTpc0rzLI/qQF27uaQ/OH4A
X-ME-Proxy: <xmx:mTp0auLO1o-NkGpSIVAlZYbqGlrnf0JaT9bQI0l_Ow1u7nupaSWSqg>
    <xmx:mTp0ajloh0M9C9HQrwyqjjZ5-1FEvG2bSagXB9raRUASlQSj2yFKEA>
    <xmx:mTp0aupRJwlmrjhmLrBtUSlqMHQiPa7voBelbul7x_LsXEhV4DLRTw>
    <xmx:mTp0alC1UhON2PSOTdRaOxVhI4hfJHBXMwJxbvRmLeBWfziMeoh56A>
    <xmx:mTp0ag1AkWaBpap8gCT-ZA-lTEZE0sh2DzmbKrS98ssAAc_-9BImgvCx>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 03:41:08 -0400 (EDT)
Date: Thu, 06 Aug 2026 16:41:04 +0900 (JST)
Message-Id: <20260806.164104.2273622889081645445.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, aliceryhl@google.com, arve@android.com,
 boqun@kernel.org, brauner@kernel.org, cmllamas@google.com,
 gary@garyguo.net, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 3/7] rust: time: add Delta::as_millis_ceil()
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87wlu47mzx.fsf@t14s.mail-host-address-is-not-set>
References: <20260722214951.72941-1-tomo@flapping.org>
	<20260722214951.72941-4-tomo@flapping.org>
	<87wlu47mzx.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 05 Aug 2026 14:47:14 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <tomo@flapping.org> writes:
> 
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> Add a ceiling variant, mirroring the existing as_micros_ceil() since
>> the existing as_millis() truncates towards zero.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Won't this change hit the same bug you fixed in [1]?

Oops, my bad. I've just sent v5.

Thanks!
