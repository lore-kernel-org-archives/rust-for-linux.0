Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5C3395260;
	Mon, 16 Mar 2026 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667287; cv=none; b=iR/HtB7nOTv4mO7UJVCGOql4zNIeu9LN9ZKVWZus3lxWr5dX1CbEi9cXwecpanAc77fZmMd4rgMfxRU1uCaHRxKC0dfw5YU6Ee5fwwHmqOT6Jz7DOBd4bd/xRtMyVx3W9dnYqclPl5D0y6WsaI1dVpq9R06J4cuEou3KCnleNNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667287; c=relaxed/simple;
	bh=r8Pt+Pp2Ftl++kbOelkEcmT75Oa144vnnykFTqZCrzY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ErtklHbvqB6JEHPiqA9zlVlBBwY1knYPBmi0nW8Bp3+knF3TCWHW7GGyoS/wiWpoOzMCZjBiZDepHM/+O/UPr/c/YXBky3YlJ0G8tedLWn3USEMd6jfqXAWAZRbAd2WanbGtKqSn6fhloaDrxAZq5NJ4U7edE/qibz8KKsMoSLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgHkyyN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgHkyyN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A192C19421;
	Mon, 16 Mar 2026 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773667287;
	bh=r8Pt+Pp2Ftl++kbOelkEcmT75Oa144vnnykFTqZCrzY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=BgHkyyN1QaslyLHvC+Ve2AC/4PCTdfxBB0nQW5SmFmq4vmvgATMSTFGi2guHWHrom
	 NCwtnaRCBdxk596/kON8pWMkFEh73gt9eEsoTdPk+VjrxBlRG+6eqImRifqvZvWmrw
	 gBnaWnJSQTnjdPds6RYkcnNB/+lkWxP5GlAoWLJI0cFTEbVaX8wtdk6FV2i0EDEInk
	 B6tMCVeIEFUIyi2DnclChIItrMrXSeYxzKIKDxLdNz5Nu+Qfuh8kCS8dJ/bJbP5WHh
	 BwB7QLxdCuf1PiTV47DUnC4iG/Qy8DyOBUXzsNxS7oJrQ2lLUn9qnBdkM1SZ30Bbyy
	 GS2H+pUiOkAQA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 13:21:23 +0100
Message-Id: <DH47AVPEKN06.3BERUSJIB4M1R@kernel.org>
Subject: Re: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>, "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
 <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>
 <DGYL9FS1Z00X.2HEJ96J8R3OK4@kernel.org>
 <DH46IKESDQ3B.2GEUC479WDK3N@nvidia.com>
In-Reply-To: <DH46IKESDQ3B.2GEUC479WDK3N@nvidia.com>

(Cc: Gary)

On Mon Mar 16, 2026 at 12:44 PM CET, Eliot Courtney wrote:
> On Tue Mar 10, 2026 at 7:01 AM JST, Danilo Krummrich wrote:
>> On Mon Mar 9, 2026 at 10:57 PM CET, Danilo Krummrich wrote:
>>> On 2/27/2026 1:32 PM, Eliot Courtney wrote:
>>>> Add general `flush_into_vec` function. Add `flush_into_kvvec`
>>>> convenience wrapper alongside the existing `flush_into_kvec` function.
>>>> This is generally useful but immediately used for e.g. holding RM
>>>> control payloads, which can be large (~>=3D20 KiB).
>>>
>>> Why not just always use KVVec? It also seems that the KVec variant is n=
ot used?
>>
>> (Besides its single usage in GspSequence, which wouldn't hurt to be a KV=
Vec.)
>>
>>> If there's no reason for having both, I'd also just call this into_vec(=
).
>
> I think always using KVVec should be fine, thanks!
>
> For the naming, I think `read_to_vec` may be more conventional for this
> -- `into_vec` implies consuming the object, but if we want to keep the
> warning in `Cmdq::receive_msg` if not all the data is consumed we need
> to take &mut self.

I had another look at this and especially how the SBuffer you refer to is u=
sed.
Unfortunately, the underlying code is broken.

driver_read_area() creates a reference to the whole DMA object, including t=
he
area the GSP might concurrently write to. This is undefined behavior. See a=
lso
commit commit 0073a17b4666 ("gpu: nova-core: gsp: fix UB in DmaGspMem point=
er
accessors"), where I fixed something similar.

Additionally, even if it would only create a reference to the part of the b=
uffer
that can be considerd untouched by the GSP and hence suits for creating a
reference, driver_read_area() and all subsequent callers would still need t=
o be
unsafe as they would need to promise to not keep the reference alive beyond=
 GSP
accessing that memory region again.

(The situation is similar for driver_write_area().)

So, unfortunately, commit 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP comma=
nd
queue bindings and handling") seems broken in this aspect.

This needs to be fixed first, and I think we should probably create a copy =
in
driver_read_area() right away.

I don't want to merge any code that builds on top of this before we have so=
rted
this out.
