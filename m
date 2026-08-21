Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B76A2F0C74;
	Fri, 21 Aug 2026 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338427; cv=none; b=EOMKEpNTJ+Gwt1VTjqRPzVVl0BOotZyMLCG1riZxI70MWv1GV5P0CL4TSvtHSNZ6CujpRXS7T/BTafIhP71VRfCU5pCn2bsI0cThVeF82hvr5liMqsbOnbN5I5j+7Go57kH68/yujVYFY4FwKlfqYl9v9LqXgy6V0Xu1XwNgpPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338427; c=relaxed/simple;
	bh=faklYvsUYtiYNNAww6C21n15COVHm0WVD3nEOm9HrwQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tlRnEenARbjL57/PYAkPpvtjeJeCja+U02RHFtqAIk6AwL4KoPXzqO29zD/m410uTmNKYIOToE8WP4KVgrH1dLsMbgyDa8996YIEDR2jX6TNCSnYimtTf8wtTriqXUoTS2v0pxdZNGN3W62z5JEN9wltAj56iNmhxjl5cSLnnyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbB/+F33; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbB/+F33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AF91F000E9;
	Fri, 21 Aug 2026 18:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787338426;
	bh=faklYvsUYtiYNNAww6C21n15COVHm0WVD3nEOm9HrwQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=lbB/+F33FXPdKhFo7wLNDZV+cRNrJLVb1ITPCDj5ZrMC2b04VPYS+9Py8bpFQoMxa
	 BsqZ/WJSb4dW/VLXpT97AlInBg2zawb2DKSdS1n0HYhj/E4yq3s9E4jTZTa4SOn7Jl
	 6wZvJ8aRvONnYU5F37+uN/haA2ycDLxJtNWpU9dbFsBFL4j6dtEd9KaszZuKz6oCF6
	 UMM8KyknLrSutiuhBIuL5Maix5lrrX4iihMmqIco6Wjt/v7n+9Lcebjpy6wgXsqwIX
	 KxGXVyaW/V7rUHcvSEC1GY0KqfEJhv3YG3N9htzJ/oOzE7DWJ1M2pgfGCtu3kISuY0
	 llODWXnsDV2AQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 20:53:41 +0200
Message-Id: <DKUULBNAMK8L.F52N7AN3QB5M@kernel.org>
Subject: Re: [PATCH v6 2/3] drm/tyr: add GPU reset infrastructure
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <aliceryhl@google.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev>
 <20260819-tyr-reset-impl-v6-2-7b4e1e041fe5@onurozkan.dev>
 <653D47F5-0AF3-44B5-9896-F0AA81F67B61@collabora.com>
 <20260821155814.980146-1-work@onurozkan.dev>
 <2AD43D0D-2B01-47E3-AACB-32032B3358C9@collabora.com>
 <DKUS768JV9RM.36WFW7QI27WKK@kernel.org>
 <74217098-8793-4701-8292-FBE0DB31FD48@collabora.com>
In-Reply-To: <74217098-8793-4701-8292-FBE0DB31FD48@collabora.com>

On Fri Aug 21, 2026 at 7:23 PM CEST, Daniel Almeida wrote:
> I agree, no argument from me there. The problem is, when the GPU is reset=
ting,
> things are far from "working". In fact, things went so bad somewhere that=
 it
> brought the device down for everybody, and the system is taking steps to =
(try
> to) bring it up again.
>
> As a user, I very much appreciated this when games went down, it made me =
think
> that the problem was important enough to report, and also likely explaine=
d why,
> in that particular hardware, things didn't really work 100% well afterwar=
ds,
> which prompted me to reboot the machine.
>
> Two outcomes could have come from that, a) filing a bug on the game itsel=
f, and
> b) telling the kernel guys that their reset code wasn't really working 10=
0%
> well either.
>
> I do agree that "Starting GPU reset" is frivolous, but at least a message
> saying that a reset took place, either sucessfully or not, is better than
> silence.

I had a brief look at panthor, and it seems to me that this reset only ever
happens when the hardware is truely malfunctioning. I.e. it never runs unde=
r
"normal" error conditions, right?

In that case, I think it's fine. But I'd still rather print where the error
occurs and about the error / recovery condition. The "Starting GPU reset" o=
ne
still doesn't seem overly useful to me.

In general, the reset prints should still hint some additional information =
that
helps to understand the root cause.
