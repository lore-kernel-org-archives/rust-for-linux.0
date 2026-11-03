Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664590;
	b=joYDchbKn5AcfIbwY6Akkh9r0HGyh00CbaSf4mJITrPPL39VYI7aWuk5Xt5MZycVUrHy
	 SCNqrQ7uKSHpcgA37eBy1rBYQz6kzH3mBbf9I1hp/jpY+WVEFnA1UnwVKfCwu1njcyYvi
	 MzBKJUovsd4VCze8aBnwHsBJJF79N8TsOlfzFh3J+7sBSwlCgrzkqtwqR1HHj7yZielEn
	 23ED03eIGt8O7hr2kTbDxRwfl5TBCJKdl5vPKtDi8gsPWGe0Yic//+luAkcuQyVdHpUWP
	 eAM4I9h9qJViPSCKnz/lOWzPTOEyxYWfN+bXkLNdKO3D1Qt5Wxe5E5gOWcaISVerCUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664590;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=mDHKJyK5c1CJp4RtBvlfo+it5c3vxzVpCCGcJ32CrV4=;
	b=Bik4571IgNMUF5738iJfyQUZieT02CDASM+jm8t5BHbW0jbgQiFKtQgWR/pyvTlW0fPS
	 hlIJ3fbRW8DUx9mUXQCz3Jt1CQPSAvoLO55U96QhYJ1okKmFRf9vS66U50q3zjEIB7/Eu
	 yaFI8G7ixM5BRLDbUbHii3KdjsDhe6CQjBGBur9p0KfmhVfjytzE8U4V9yHgdiLAi94dn
	 NdTwbaEKaxN8q90GheOcIEXUAfowo5ecJQcpEyIszErAqHz5B+uTV+zkcyTwqSfV0anQC
	 28rLvQI+KFbf/VHCQQPf7rxwJB+s9QPq5pHy1+0mmVCa8sC2xAoVao+6nAXMWUrg5Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=Hp9Mrree;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=V75K01UH;
	arc=none smtp.remote-ip=103.168.172.158
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01A5606A324
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 00:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C01A5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=Hp9Mrree;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=V75K01UH
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 000BA1400238
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 19:09:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 02 Nov 2026 19:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793664588;
	 x=1793750988; bh=mDHKJyK5c1CJp4RtBvlfo+it5c3vxzVpCCGcJ32CrV4=; b=
	Hp9Mrree3VnbpxT5gxkY433aIYABxyK1h95QBeSCj09UBtA+FNtuqP29ruvoU5yj
	3477c89h4xGZ01WYyglDA9D9fpfJmKgUnL9ldlXN/mmA2DS7pGVKzdftoSnqR7tL
	dSH1k5E3Zml2JFoA1fzKLl+iu6Og6GPIYwhsL8RDygiAmE9MlGZVWsyPLJiKeKiA
	eSPABcHcQfeqsc2qjuk/V4iDOX8Hcvatd1F1mc39nfIxyCh3W6IHnER5I+w6pauo
	N0QkaYRbcvCrnuOZpXV+tgjKehg+Ndd3kgs7+cJm9v45iQHt3JpGpUTDcs4mNwPv
	3Krn3G+Gf+qphW/pbOv5sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793664588; x=
	1793750988; bh=mDHKJyK5c1CJp4RtBvlfo+it5c3vxzVpCCGcJ32CrV4=; b=V
	75K01UHIv5eCEnyst9Q8Bf1nYJCp/TZLZmCz8VZ/C0sQoV6svLJNXYgRHoZkZSX/
	h66fYFDNgHK2cU5ab1LWJt3nZ8Aam/XEL4Ow3VaRndzu8l5oc1ueQzwj2f5mz5K9
	dCsG5vg4oI1DoYOuxalPXoPPi6NNstsiugDQNji9dEx+f1wKPgK3XKxausK6Sl7N
	JRARfaZUPYiv/JzYRqg3V8+FPw3KGBgmPNdZf4QvUslwrvhNCKLGx/tPPGa2+MW2
	HeqtRW6df9Yc1guk1lPX+c1ZXyc06v37JgCirbOragGezAJoMonqdk9/Bh+Fq2ZZ
	gu++8GfQMSbtA7Em/spXA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793664588; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:h75IqoFQCDCGIrghAH7QN7myV+8rF4AmLrYzP2Q200JzKGv
	+fRNEDAL+bK+dOqZ68FQ3UvOMVy/0r6y+2Z2YfbgzXKvPKrcP0AZd/rN6embnQ6c
	d/rQrdKnpcL6dTD+ViUWre63ur/rXMiPXsvNDhw4kaqK6dWVs+od7UeH8k7B6A38
	GMgD0a3soXW69/A1N7lK0xtG8GQBxcssvtS3TXA+UJ73fkkYUJB3G68ywq8un1iD
	qs3guFD69rViy20yQS5QZpzuSHwHr10Ql5O5V9zoNK11GPy30z6DyN756TXV/ikL
	a0ycNXJzKTnDwYkc7azeSJ3yUv9xKd9UlWcF77w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aqhEssKWk1rEt2kkqV3wnQnZaFRM9Gy039LCdv9N9SE=:s04PlBV1l9I+ZNkUIn0NuF3aBDUOBu14aCARp2OF4vY=;
X-ME-Sender: <xms:TCbpage6r2MXflGVS7Z0sXAPYN4QQ6mQqwVIOzAvyuv7s6y_sOxsmA>
    <xme:TCbpavbVoPlj7lYEgyGinzUUvPAYshhj_F4BLgtQhPQ5fR1y3XFzCRYdvd_xFg6Jd
    UxlqIHudWnhuzXj22ejMmbcjAtEIGA19zWS2XyeboXAabDLgiMY-rE>
X-ME-Received: <xmr:TCbpamCWNVTUBCkbao21-ShPS68mSxU-uo4gp2xDcpgqCL7dE21BbjV4ewYPEPV4i9PYZ3kIT9B_wTs8keOhzcbZ>
X-ME-Proxy-Cause: dmFkZTE4dGC5aH3pUEK+WuNNJghp4gp1C/HfLybS5qkgQ4M/8HSC4SBwuAumiylDZsYl7h
    AceqeRoypc6ArWbSKhg8acKoNijhwLGigROiT//Du/4rVdoGWi/4MVw0CHcDKhj52DHcYR
    pgN1EiUMDwyiTLUy72R0iygDc/+QIZYydT+TYCUbneNM8BLRCLUlQv7A4BLoPPHOGpo2rC
    U3OzAHyw96aOw0JK7hi5rcV6GW+qs+sNGXWm4iEvsx9sKgoYZmfuLnO9SvcvgaQafTy0IM
    bMJ+SUsdSCmcgNb91iRRthIBujs4OsWzK31NOmhRTiuRYd46XprMdhVaVwxMSV913ZWuEv
    BsnlpmkDImtoTeHoKs2KE1/ffzMGJxP+WeB+IcXOLWRxFY5HNYn3WC+2X9fJJYh2y6l+Ib
    pFThVkMfKtIam62Ce/5uymht/rF1LHi+Q8N3t1X//FhCuJFB88XnrPaDP/lCzdQSEkS43p
    m6+sYVg+yP4f+ZXepYhTF+ieGkaYsj3z7SPiLyZm0cRNcXcQoaAUszHLvhVqcnj8sXB4aK
    zJTktCvlSh/JkdOBj1siaaagzuWo3wsHh83VDD533V64oNGprzWdob3MVx1E7a7abxxip1
    AwF1Evhh3gzJQLPmekckMBdpIYTm1hol4PPy2VY64aG2m8NoOMO+uC8mK0fg
X-ME-Proxy: <xmx:TCbpaiJONPZMkXuP_Az_axzFxLh8rF7Y34ljLP0p-oM97MS9TY0MXA>
    <xmx:TCbpatq1kbwqNVuDlQARVQk5b4tmgETJfSQbUChI71_vk1UVC0aI1w>
    <xmx:TCbparPwdapiqLmIROxXaS47rGHtQOUkRwrN4WJBta5pq6aubFuvIQ>
    <xmx:TCbpaqPqdnclNMegqznfEsgjcAodJ-ASx-qrkgpzRg7EGxh4_7Ul6w>
    <xmx:TCbpahBTwgZC23DwkB55Jr0Hbc38EpK4D-n9aMKIKFffVChCemI4PTwz>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 19:09:43 -0500 (EST)
Date: Tue, 03 Nov 2026 09:09:41 +0900 (JST)
Message-Id: <20261103.090941.728506274497185931.tomo@flapping.org>
To: boqun@kernel.org
Cc: tomo@flapping.org, aliceryhl@google.com, arve@android.com,
 brauner@kernel.org, cmllamas@google.com, gary@garyguo.net,
 gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com,
 a.hindborg@kernel.org, acourbot@nvidia.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, lossin@kernel.org,
 lyude@redhat.com, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v9] rust: sync: condvar: use Delta<Jiffy> for timeout
 and result
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <auixgbeSSfBWwVS9@tardis.local>
References: <20261102035934.711973-1-tomo@flapping.org>
	<auixgbeSSfBWwVS9@tardis.local>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 07:51:29 -0800
Boqun Feng <boqun@kernel.org> wrote:

> On Mon, Nov 02, 2026 at 12:59:34PM +0900, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> 
>> wait_interruptible_timeout() takes the timeout as a raw Jiffies, and
>> CondVarTimeoutResult reports the remaining time as a raw Jiffies. The
>> type does not show the unit.
>> 
>> Switch the parameter and the result fields to Delta<Jiffy>.
>> 
>> Delta<Jiffy> is signed, but schedule_timeout() prints an error and a
>> stack dump for a negative timeout. Clamp a negative timeout to zero, so
>> it means an immediate timeout.
>> 
>> Update the only user, binder. It now converts the freeze timeout with
>> Delta::to_jiffies_timeout() instead of msecs_to_jiffies(). Both round
>> up, so a short timeout does not become zero. They differ only for a
>> very long timeout. msecs_to_jiffies() returns MAX_JIFFY_OFFSET for
>> 2^31 ms (about 24.9 days) or more, which means an infinite
>> timeout. to_jiffies_timeout() has no such special case. It converts
>> such a value to the matching number of jiffies, so the wait is long
>> but finite.
>> 
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Thanks. Alice, any concern regarding the change in binder?
> 
> I have some naming suggestion, please see below:

[...]

>> @@ -248,11 +261,11 @@ pub enum CondVarTimeoutResult {
>>      /// Somebody woke us up.
>>      Woken {
>>          /// Remaining sleep duration.
>> -        jiffies: Jiffies,
>> +        jiffies: Delta<Jiffy>,
>>      },
>>      /// A signal occurred.
>>      Signal {
>>          /// Remaining sleep duration.
>> -        jiffies: Jiffies,
>> +        jiffies: Delta<Jiffy>,
> 
> Similar for these two: s/jiffies/remainder
> 
> Thoughts?

Sounds good to me. Now that the type shows the unit, the names should
say what the value means. I'll rename all of them in v10.

I'll wait a few days for Alice's comment on the binder change before
sending v10.
