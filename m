Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65975348C5C;
	Fri, 17 Jul 2026 05:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266002; cv=none; b=uw7ab2fmYmn2aggX1TgwfA1ydZD8O8sVsFJ6zBagf2YEbi0NJX6FnaT8xeNifzztEUyyraDKhCh0VIC1kHgILJkT6F/hF/Nsgsijp40BUqK/cTVG+kpUhjOdlWyg6jRdfCCB6YwaSsxMSDAurUAHb9Ow90HTmP0TJptyQ3gmi2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266002; c=relaxed/simple;
	bh=aYdmbiYgfzabb+Jtp7lmGzJm++XbTK1lygVIvpxg7yo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=AMHvD75xmQj9AWi1N4TWBVRtj45QITKAwXIZcFpv1gxiJOGC4wkBqdPfCiuGFm8W/0LLPWGbNXM3n3LJcl2Ko2Gd3QhNpwMRVTA1goTkxsWIflmfVe9QPjR1ic+Oh/T5SD26L+86XOPosbOPUeyQ13Aqdecs4WUX1bQtgiDuzXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=GApejy3x; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GCdWDCMW; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="GApejy3x";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GCdWDCMW"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 65D51138017C;
	Fri, 17 Jul 2026 01:26:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 17 Jul 2026 01:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784265999;
	 x=1784269599; bh=Ax+qGMYKjfrbFs/pjSCiRYgOGySQj7u4MmqAhdG2lVg=; b=
	GApejy3xqNl2AS5O1O0uwTHt5hh9VuDjhll0IMCTdjB+E9vD2KyOJixoS7wI9xei
	uUATAvMWvXLe/e6fuKDz/w77pAcfv7s9Enwr5KQymIvwr2af9qakPauAbs25IcRQ
	o0ezgc+UrpENMArdEfGhL1w8gJwoDa+Cb1PXPzzJYGOnVE0XhO5MFxJuIQv/aX2B
	QGLcglw8BPqVnDlbrMEqraXmtUNTgNMaWc5yyaeO7niiPUrWYettAMy/Y5q5YGX7
	zCs5Xg/Lzapw711GEyZqQ5Tw0ByNZA0jRuy060yHMtmxdoKoyX7fGpmvFPjM3Tnq
	WyVglvHw5vasudtNufcVxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784265999; x=
	1784269599; bh=Ax+qGMYKjfrbFs/pjSCiRYgOGySQj7u4MmqAhdG2lVg=; b=G
	CdWDCMWy1AS7ZH6kjMuescLsodE3AE2SCF9eQ0SMZBtXyp7usKy0trmhrS934Ahn
	YMISWm12CHcTZqH8XGOQN6zd+7ndo/gRqzRajP60LELzOKD5DLtw+1hYfbQY/t4m
	TZ5R//fYPtyG5WQQ25EPkWaLwqU7Ww7bL94whBleE7AN9KPs5Uw1CbomsnqghsRR
	Ib1d1c0KnGJ/WMmRprVhc2rtd0sFNUibJ1n8oAPNJx8LCaMGV82crA1QlkSvy8mL
	yisfhYvS1UuS5MPR7GUjUL7lqDM7yEUaIKcCQwmGwiO/DR24mxIzIybhoXUNUhan
	DrhJ2sFXgeOlZqbZ/EDrQ==
X-ME-Sender: <xms:Dr1ZarPNYTkLxcXZLjaWUZOvzlHkP7VLUnsrhSl_EVa6pe7CntrDjQ>
    <xme:Dr1Zatg2CX9spIy9pv0qUWqxmXJ0Vef9-wXrHBsuNqXhYYgBQPVEPf0SG3rvTxPQZ
    6dQhnCCG3aShq3p-Uldm0RxBhrGyE6foXeNbGzjzZXbMiked4G_k2w>
X-ME-Received: <xmr:Dr1Zap50_VdSoEAafuAqUpNW7yfhaqKQh-J0hv3ImULKkybmw4UJgxH4CnG9NeSqdIL0SjI0-ZkMKpHyUD3-8Px_>
X-ME-Proxy-Cause: dmFkZTF+uTxz3DhC4t/Pizo4lQcZHesBL9Fn4GMfHD/CXTI3REB+p+xtSF4PlomA03usiy
    YZGzMuA7XZMpaeH2ERpojlVJbTkAHGe0wKxeSvi2LzwXv4F30KuvXo1lTF9dEAvRpcduAJ
    bgn6T0RpbLhtv/CMD10qD0BI4xtGdXj92CTuNlfRaEKeii+a7PMFIgj5/5IW1HSXMRKrWh
    znyWVecEbmSrmE/0XoURBx1AYqyqn4Lcon8gLLeBI5SHmfvmFuBEqqxea47tiHvkS5FGuJ
    xx4MVN7+AEJ2YZ2gAI7Y0KO59SLHWjLX9jEgtlvBs07RG/j7E+poHOaolwODGQ63LznjM/
    /DCw1p7BTB5rA5w4WHv28SiUHoMg7l32CLazy2s6tJVq5ZaoRXhGFQFSuMoI5vSJ/wyhAm
    Vcw9GgrTaDt7IItskSdQ08r0wHOz2ZoJtjeM+HyApYCW9KpF/Y45PJNOsCGUZzeWO3ZVvm
    HVsnko4czTBtLGAoTeJIvV3Q3VULVrBTvgIzX5XYDI9v04fCDdE+uJqn0qDvlgwGvC7XAF
    pH0TUd6pYzcEZYiFteyv6zPIW6Xg7IxCrvqV5L9d6xw78mPp7qpXs/Hcsxo/OvUE93wZnK
    3Dde4vVBHsV5KcusjtOX7iW2twV7QqhldmvYZY//QZ4J6JZbhjJgog3LS0vA
X-ME-Proxy: <xmx:Dr1Zasf6C2cLnqAjRozxzR0-ELbet0HD530IiLweWltBaf0m1AoTYA>
    <xmx:Dr1ZaqAYLnnKOZY2VoL6KKZJasINNgpEElyq7_7FcDoMNM90_2J1og>
    <xmx:Dr1ZajB6xlX6KqGFKKHWz5_B8HucseuP2TNO_XILoxbVKOFbHY1ZPA>
    <xmx:Dr1ZakZChZGb-pxz7fjX1kByZNEhXDrj5NMWDIO9seMldZhm3ukIUg>
    <xmx:D71ZaoFYe1JsvwezC11QDzdPG_e10tsfrwlkAg8huR2wh9WsswOQ47_l>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 01:26:35 -0400 (EDT)
Date: Fri, 17 Jul 2026 14:26:32 +0900 (JST)
Message-Id: <20260717.142632.1898078719816541234.tomo@flapping.org>
To: gary@garyguo.net, gary@kernel.org
Cc: ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: revocable: use LKMM atomics instead of Rust
 atomics
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20260716145536.3681630-1-gary@kernel.org>
References: <20260716145536.3681630-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 16 Jul 2026 15:55:35 +0100
Gary Guo <gary@kernel.org> wrote:

> From: Gary Guo <gary@garyguo.net>
> 
> Kernel code should use LKMM atomics. The existing code is `AtomicBool` with
> the need to use `xchg`, so convert it to `AtomicFlag`.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/revocable.rs | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
