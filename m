Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D572D8DDF
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791034441; cv=none; b=u2e/MQm2xqsbAd6apXLp5HcuLBmDHcFEv72aCoRENLYbSLJyO8cdCaJF8qfSWGhw3XhNyjIGgI97wmBc+ZF4+j0323CDYcoOHYjw9kPN7VZBFnBnCKFui/AterreVcPd6wtjDRN0UGoDyFasmkB5XiR0hLw7huNzt9d3IriTxuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791034441; c=relaxed/simple;
	bh=Pn2sg7weLrjzI4ECJlJfS11tPcYHTMFJ2xiA4mHDavw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PoyEbcjslNqYuUxloqQ1+/Tau1xOv+6Ede7IaEFwl7AFD+m3DcOVWyLe65n+UYiLWWDKkV9bcEKqxNLuOhP9QD53wXMCbTfQcmEMK2vuqyYdFvTjG3FT9ZAtufBnRDy4CCR7qqGCwEHgNcyRFS9q+wMEZQ8h4aApyEMtwQd0Y3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=jf9CfJca; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iNodo4Ze; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="jf9CfJca";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iNodo4Ze"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BFB0A140012F
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 09:33:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 03 Oct 2026 09:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791034437;
	 x=1791120837; bh=Pn2sg7weLrjzI4ECJlJfS11tPcYHTMFJ2xiA4mHDavw=; b=
	jf9CfJca+wFywhgYpRO5e+jwJiXXSxvMnBVDSpvHGUKBq8wLOrpMhP0XebToM2gz
	MBPtPJfdHDceWPtRsKxMsE3atdzvD3cfJl1dFsyk+cDYpglTm3wZQtrbNppIFFBe
	4NoJMekSDCgxvwbAbUJmbdh3KeEjJOVHZoTlT5MUvH7zkaRgpbzhPTHQ1gDqrRnq
	eiqIBIqBTG1+rz07w/rGAXvfsgoaf/rom5I0d8M8aQSkb4Idtp8G6mAlkrNqn80D
	tu7Vklz6XH4BHQugMyXRsto6/zUJehSyBjVW/jWfOV0MxCTYdL7SSDuF3M4Oru14
	d0iGh0FSswmBUq9eUEka+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791034437; x=
	1791120837; bh=Pn2sg7weLrjzI4ECJlJfS11tPcYHTMFJ2xiA4mHDavw=; b=i
	Nodo4ZeKd7xmcPuORk+MB9COxpvUxEjxNULZIUjDThNPirf7mpe1vmDYbFzArPIK
	5ge937aupofmsm/oYvOcDOcawG75nsRphcxYTQQBKaP1I6U1txJFqjNwbEPDvwi0
	sOOcEj1oF53uZZLOacIJvkzD+N+5bo/X7NR8v5klEPGsDLqvDcu/NPTmX2DfDk9A
	UXsO9b72EUOthlFr7zEAfHrbTVqIRKkq3X8VXLqZUHhq61xwpoCv1+HncX9alIkt
	5y6D4PwajCG4ncu8cOaTOkbr0gA2K+KBQ/6IzFJZitid/1xMoO7u0BYf1lvI334V
	GFpiRZpE9dbVMQpbEucLA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791034437; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:Nuc82FVh4yG/ODkU+9JXd2rQc+J74bYY77CZKLbxB+wucXw
	hR+KZkyfeRP5N9qGEThITl7mXg0KNqPrbv7qIjrsB08H3RHC1k37L7Y6XTLWnovl
	UHfUZSKdUZmIX76YmfO9237jha6kzJjPfg7+VcEzZvzqejTVPaOVnzoDq1cUyvWQ
	lL5FvCrKt/L6NHhKT+JxpiZxO7AP3tZzo5SPPTQdZQNVKuZHrgYuYmNbeIC9ECUo
	tGDyClGTr+uTejHt6fBlOaVgHDosZXSnT2oxJXuUHYSb34D3JZTOLsIjDWxFmZ0c
	YgTlZchon35r45B2n1umkrJtufV78XBi9q1MLCA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:N6mfz6FURiQZ/ii4vP0VUmv5KYBTSqzquMSlWHJRJqs=:Pn2sg7weLrjzI4ECJlJfS11tPcYHTMFJ2xiA4mHDavw=;
X-ME-Sender: <xms:RATBarpe_3F_8YsYgIziJ_ht-quHYGa0rGulp7cymbrIGVvAwQKZlw>
    <xme:RATBam8iIDblyvcEgyv5G6npgMKmzIyskn4Q5MXVpnQAYDd9ggm8LLIqkBGW2l_lr
    bjvKOuS2b0EL35CqYqN5QzhoiuFu-Gy6Jc5ZUx8MWrEpSihrAkA5p0TOQ>
X-ME-Received: <xmr:RATBas1nIYZwPEoy5XgdDJcWis0Eifaf2p2VV4jmels8JujohLeMqo_p94PiF2cHl0opI94sPzie4uICs2q67jQx>
X-ME-Proxy-Cause: dmFkZTF1RRdeD7QT+V2/c0R644WkJQJ1dVo0BhZtSRIkSprddmPtOVPnlUaZNjvKkdaQYx
    wkNsFpvU9js3MRZRYUmLboYXfT2kL3Zl9bq8K6kYh1Zd1MHNm/9pAKasFXAa2hE4s4IswV
    Rs4RgcVbSw3sqBHMw5+y3XFv6CM7rVEBequwdJi2cqFVeIufAxgZqqZLt0UaDFfsyTriqV
    qrLKsHiw7XgMkXZgJi9mr7IK8Wb67rMu4FHN/D+lE56jZX+UPLQKnQTbmf0V6Uw4T+4RqR
    vExTwQqVkYf0RBJOVzeslp/Tow+K3oNoEjhy8rvapljhr57vZzdMw4y/4jx8pYc46sfUin
    WTaHHNoxXm6ADdV+RNbkds7wqQDGaNI9ZPC0JqfbrpuMCR6Dqp1TU5765JYgZWp749mz1l
    +etHHSx3OznD9z1HEc1wZSJ/3S0WT7qWzRu37LEGYA7cXrQ4m8hhpwWTnWJvyf7OP64L44
    4b17slaiLJPtl0CHjv0hzsb7sC9U0Lvf1xieRGafjDdk1fih8IzGc2VzDppln3StXVNrJR
    DXNnBIJZV98nIvNQunEghoPYkg76u6IBpR/80vfM8acna/B+pFsPli2QxxhM+svrgKkIXm
    R41NCqpX9c3vhg93DPxQJnLg9u6I9vEIiZMngNSQbgTiVegkjuU75JoX5Nxg
X-ME-Proxy: <xmx:RATBahkIM0HMNUw_Lg9ttbgnLVHlPWNDJdQQmYvgWAIpO6z5CdwJdQ>
    <xmx:RATBah2GMgfoYwZ1FQqyIIuyKbx-CGLHaHUHAOaztgKsYseHBRi1WA>
    <xmx:RATBaojvKVmV67CrTZubay_1YmxKacYL0-eaOZ-jUZ9kN7kIpYLCtA>
    <xmx:RATBanVwLTox6Lo5OXwgfhwi9lr_lEJKLK2wB5U2H9IBoH27cDwk9A>
    <xmx:RQTBagmpoyRG8ZXiKAIrneRvTjcYzWZK9HbPTOt5vdPmzVGflt71G4Z9>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Oct 2026 09:33:52 -0400 (EDT)
Date: Sat, 03 Oct 2026 22:33:48 +0900 (JST)
Message-Id: <20261003.223348.1401081578886692905.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: tomo@flapping.org, ojeda@kernel.org, a.hindborg@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com,
 anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net,
 linux-um@lists.infradead.org, lossin@kernel.org, richard@nod.at,
 tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: bug: update the SAFETY comment for
 warn_slowpath_fmt() on UML
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72=i189z9iKtz0x8qR2YO_R1WEPLcRGr3q3aOTwXsEQN4A@mail.gmail.com>
References: <20261002104550.2877930-1-tomo@flapping.org>
	<CANiq72=i189z9iKtz0x8qR2YO_R1WEPLcRGr3q3aOTwXsEQN4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 2 Oct 2026 12:54:47 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> (By the way, you have been authoring all the work in this file -- we
> could have an entry for the file in `MAINTAINERS` if you want it)

Thanks, let's add one. It would make sure that I am Cc'd on changes to
the file. I'll send a patch to update MAINTAINERS.
