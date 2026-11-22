Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366911;
	b=yP0F5iFc9HInqGd2COQSed6AZFvfACLNi/5AdjekeVrwi0BGDpIkN9SZiCRTqfP4/QOu
	 kx+UKajFtAPww786KVQX5aTByddxF0od8Nj/ceNRT4DTxojc+sp6Cd0yrYlQWY8jxyZDp
	 GsWPCokS5aJ9fdOxzayJ7Plp9Ybu/C1f07kzJOjPIJFUkdHg07868ca7il4lZfuzcpA5T
	 yCtiLY0rMg4zAleYkOwOsuCfM0qzQ9nwlVLIBShF9PMInFhRmj9GYvTTmpMnF4GhIl8VT
	 /vWMh9qEgSOMhrdbPslTdkUyZKJiHHZaUR7d9mlwRSGuhZ7gi2EZJrgt4E+bHk6xZCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366911;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8CLyexFisr+loo6bQvDGwbW36TVAaUmS+iGfQnY7nTc=;
	b=kuAS7XjuKymOVTOJDrGeAuc1QFj4uqT0ov6R3q1RxbvDv7UuhU7OBZvoERRAgdSNXj/t
	 Q0wwNkz3oeOvgeQ5M6WNKsyAeJYi5FHYgzqZoAUb19EM/YV8AmKUei1mCX88BcoboAGsc
	 rCVM/e6E5IofMY1BTXtO/FPp4PDgB27eiryHYayOBT7W5F7n11VJ4537+s9e/bgm8PD1u
	 Jxn4dtPUu+apK7pPU/ir5C7gU7HxSP0g6zEr1jW3MQsQ4Glo1Woplia7YS0EOZC0GwXTk
	 GXCOVvJoakKHDHjxGGETAlUu/Ut12AuuAvCkI5mgrGYm/Xq89q+O0THvl1QTcsfWfFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9f+nPtu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A65606A320;
	Sun, 22 Nov 2026 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9f+nPtu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B071F000C0;
	Sun, 22 Nov 2026 17:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795366910;
	bh=8CLyexFisr+loo6bQvDGwbW36TVAaUmS+iGfQnY7nTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a9f+nPtuAyQAL94oZ1wEVUqzWGO2nfPTX+iFKSatnP584WS9kVpUUcTodjjVVZPvv
	 5uSO9nv7sJga5PadnTVro7+Y8/Llh9aCLiYbTmjrrBerHqevmnq3j/vdvFmAam7ZEQ
	 B5KUrAQVwIo8eyxI98ju7kq1EBVv9U0VCQrnDE7Teo2ftDCZr7KazbaN1o9kqBcF96
	 otSl42mgUtuZe/rz5Hjak6vtvSkmJycjvjVj9egU6c2fvcHH/YHcjOjjXCw8Qcdin3
	 R87u3+RiYhTlVyi9zWrCSMPel80juwi75GMETbVoQJBB8+g5qT1VimKnjPolPWxBJ5
	 mthIC6VrvY6UA==
Date: Sun, 22 Nov 2026 18:01:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com, 
	liviu.dudau@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gary.yang@cixtech.com, fugang.duan@cixtech.com, daniel.almeida@collabora.com, 
	aliceryhl@google.com, p.zabel@pengutronix.de, daniel@fooishbar.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
	robin.wang@cixtech.com
Subject: Re: [PATCH v3 5/7] dt-bindings: gpu: Add CIX Sky1 Mali support
Message-ID: <20261122-efficient-lobster-of-foundation-abd517@quoll>
References: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
 <20261119123850.2994625-6-cunyuan.liu@cixtech.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119123850.2994625-6-cunyuan.liu@cixtech.com>

On Thu, Nov 19, 2026 at 08:38:48PM +0800, Cunyuan Liu wrote:
> Describe the Mali CSF GPU on CIX Sky1. It uses core and stacks clocks,
> an external reset and a GPU power domain.
> 
> Add the compatible string, resource requirements and an example. Require
> the system-cache allocation policies needed by the Sky1 integration.
> 
> Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)

So what changed here exactly that you decided to drop review? I run b4
diff and there is no relevant difference.

Best regards,
Krzysztof

