Received: from flow-b5-smtp.messagingengine.com (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643B83C343C
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362187; cv=none; b=HcKs1gBPtUIikn9jpbqEZmGAOdb3eJLrjvrTKgyD/44J/rHsZQydfJ3L+uaRvb7Uc7khmLlsmPLoFEpwuuBgWrbyjTBBWrDCsC7TbptmYNz5Es7lu4bZ+zxSav1hlfmNBRVaXmSmSehU89w/xOWSoW0fBiKbhF2T2ea2+Qw0ATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362187; c=relaxed/simple;
	bh=Tx/FoqnxYJF/nH+zwKdwTE6vzW4px4vzg0QHoHBh/ZA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sviQ3HntuvfihpfqJTAv64xqdx8H03bsLsuoTbHE2yGQjKTZArJaHQXQSM4JNi5J8xldHC1oFIJ4VY6LNrXOa/yBCIc01KS2Xchw/2/n++ouOIF+Sf8KRmjzFbmc7ZGw4SB7vegpUtkA+9PGHpd07M5isPtLsSAGIq7yh1G+OKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=bkMb9Mzq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=STvoTww2; arc=none smtp.client-ip=202.12.124.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="bkMb9Mzq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="STvoTww2"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.stl.internal (Postfix) with ESMTP id BBC071300126;
	Mon, 10 Aug 2026 07:42:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 10 Aug 2026 07:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786362176;
	 x=1786365776; bh=dPfoatwJPakHcHAZOdORG1jpnVLV5TgVx+LqQ4H9I6E=; b=
	bkMb9Mzq1XbrOOqtQj35YdOCxHTmiB2n4+S4B3AzcScCxby5lD8+BDWhzJkftp+v
	LJmKAejKUJ9N7Mf6ycLMCb8cGJV1RFs/oDr/P5x6j4jUAY9OvrlHcQdVs6mYwnOD
	4smnpvLwdA7eYyVKwVw90+9RVWOazJnO39iCnlDhvHxWFjEyU7/wJ/LJ6Wxzsdwx
	F5hpSprUdDIRjiYQRqYKDWaRqycNlUfbMVZHpHBaekpIPHbvu0aGoDqh3HMpfM4f
	BMG9GZ/HhKORlq26ai1buYh+cNKB19TixZeoUSdkYj87PrvUcy1Fg8qA2icYKewK
	UfFu8ZMdLQoMCCfgnOI6Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786362176; x=
	1786365776; bh=dPfoatwJPakHcHAZOdORG1jpnVLV5TgVx+LqQ4H9I6E=; b=S
	TvoTww2j5W6cmnYGa0qhN1uYPGM9R0i1UQjIv0zg110TAFVnkoEVfWJ6ASq/OgEr
	sso/gKDtisg/g4oJloruPU7jjV8PsVQA3cASbKebK3V778f36qgw2SgevbqRTgw/
	gM7n7wEfCgZk1Hv2Ur8S15AhQUz6PFWVn9haVn+54v//q3n2QmnpNbasPLmqNdTB
	7ORRAcVdmIxPZKj9ZqMR51ukoVAHgroxa601koJGvYunXZmZZsz8Tcx9xl4AN+r3
	D8iQ2qwtuCVtosL5c+1Eidb3ez92j+NNbE8bbkDpLfb5UOlMCBO7TS4tLt/t/eip
	R9DFcJj4PMKt8ZSiJjE0Q==
X-ME-Sender: <xms:P7l5anbYQM8taqwaxpssxbhJKyppcv3MDP10HMFKwKmtz5wtMZSA5g>
    <xme:P7l5amzi7CsxwdM4F069DduUzwrk1q1Pz6Z50YkSIA69IpBZzVc4CwMOgmx5df2Zk
    8N1rKuNleAAnOf6fJYRB8zOk5hf7eVAuVYMNUKbIA2_KlqJlq96OaYP>
X-ME-Received: <xmr:P7l5arF9k2mC3xm4nbRUAA4E_CSWrt7xXTSwLdwV_dfaCuD2VeiHlX7drgeKrReQdqNUdTsuGr797P3Od9GEVxCW>
X-ME-Proxy-Cause: dmFkZTFPcIHusZdsyt8yeJYqHvckw2zSiWIS5ml78kRnieTJ+ioYa4Zq9F76CePrzQCp13
    YOD8c8KzknXeqDlgDtS+3CZ7ZyOYNrRqXUCjCq7vpFEVeqHlTHoxCiWc/D58GTcSo1unO4
    8m6J47DsqjjXFdyzZ5xVuWXyVWs8fxDiQDbCiTN/d+5eTJQAdM+X49bn74aIUzk7P4OlL7
    AIbhc7qKjdzWwfSjz0dptiUbx4Jkk+r0uPyUA9B/c0SZTakTS1qxRd5dndqQtqob/DmGqe
    qoxh4oESiVPytQu/02baaDzkyiIA3pcEe3lKyG+21GAcEJGXVxfM4TllrJyzHGA/PuGpCz
    bjFQwvw+krpHNqcbHDJ26YAN4fA8LD3ilFI2r56RGVqj/MrWG0KNmPCOQeqFh4JZy1xglP
    nWYfvbSCzq43I8wQMnfAUVR2TRDkOpaNhF13pUlBsN8w26Xhl++PgGvQtlit986CcOocOC
    vpUFB/KtDyaj+8BZqrU8XDwRb11txfbP6Kicc0vGKE/c1ekHRrEGTIKMTOOz8to8n1Lba0
    g7IF8X3QHCXLN80DPSHj7Lz6ivvWmL8sFcrVZ+qo5o1BPwA/4efIv4hD7aSQG0yBdNvUcc
    xA4g0mX5Mx8xqEK4ekEjBMT4fzI/fn31R/Pi1N05447ZfESC2WpEJKhv6mAw
X-ME-Proxy: <xmx:P7l5apo7t3HE7TV806g1-6zlttO1t_GW9umVyVa_abJ7SitN7UOreg>
    <xmx:P7l5ahzBtyP0xZYbFHFkVFl4Q53gmfazdfTM0J1yDcE9C_YAX4wGjw>
    <xmx:P7l5arwISEWrlXwBwr3IvqIsD71PR11IO4mOaZTkIi0Tii4tS2m6gw>
    <xmx:P7l5aoQ9-pK6yX8FHKk2iGiM5eYdDa09WfCIx1zE1ycjyOjoTA6msg>
    <xmx:QLl5avXytxc1obBwBUqN-L1dPKvuKUM6yC-r_gdyjWO9Yk61enR0-ljc>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Aug 2026 07:42:51 -0400 (EDT)
Date: Mon, 10 Aug 2026 20:42:48 +0900 (JST)
Message-Id: <20260810.204248.1426065758894654964.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, ojeda@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 2/2] rust: hrtimer: Make HrTimer repr(transparent)
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87jypy2pzr.fsf@kernel.org>
References: <SL4Oc1gdHsbIunyjsqaDTEU_0hKdwRG6rLiKtGHoNhTKHL9fEPrjgTi4J-lCGhm1vlN-5jp4NCZZmdDa5ndfZg==@protonmail.internalid>
	<20260807233039.1091842-2-tomo@flapping.org>
	<87jypy2pzr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 13:07:20 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <tomo@flapping.org> writes:
> 
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> HrTimerCallbackContext acquires a &HrTimer<T> from a
>> NonNull<HrTimer<T>> while a &mut HrTimer<T> can exist at the same
>> time. This is sound only because HrTimer's sole field is
>> Opaque<bindings::hrtimer>, which puts every byte behind an UnsafeCell.
>> Adding a field to HrTimer that is not Opaque would make acquiring that
>> shared reference unsound.
>>
>> Make HrTimer repr(transparent), which prevents multiple fields, so that
>> such a refactor fails to compile instead of silently introducing
>> unsoundness. This does not guarantee the remaining field stays behind
>> Opaque, but it rules out the likely way of getting there.
>>
>> repr(transparent) cannot be combined with repr(C), so drop the latter.
>>
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/time/hrtimer.rs         | 6 +++++-
>>  rust/kernel/time/hrtimer/arc.rs     | 2 +-
>>  rust/kernel/time/hrtimer/pin.rs     | 2 +-
>>  rust/kernel/time/hrtimer/pin_mut.rs | 2 +-
>>  rust/kernel/time/hrtimer/tbox.rs    | 2 +-
>>  5 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> index 1db84cd4cbe8..04f47af3541b 100644
>> --- a/rust/kernel/time/hrtimer.rs
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -418,8 +418,12 @@
>>  /// # Invariants
>>  ///
>>  /// * `self.timer` is initialized by `bindings::hrtimer_setup`.
>> +// `repr(transparent)` is not merely about layout. `HrTimerCallbackContext` acquires a
>> +// `&HrTimer<T>` while a `&mut HrTimer<T>` may exist, which is sound only because every byte of
>> +// this type sits inside `Opaque`. Being transparent rejects a second field at compile time,
>> +// but it does not enforce that the remaining field stays `Opaque`.
> 
> Missing bullet. With that fixed:
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

This is a plain `//` comment, not documentation. Did you mean that you
want it documented as one of the `# Invariants` bullets instead?

