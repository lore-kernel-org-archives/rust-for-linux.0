Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096662;
	b=ZDUd+3NWXbhku9qi76Ie3a9Rg7+ox//5QCXtDjT5bjZtsyYok5yTu8eaGNT1L/nKOFb+
	 0DDowpwK+PBSuy7/M4+w8bKjr1LzZLzz4oyw3Z3ZNrN8YFivMLIu3E4wBlLJBZrVy/FFr
	 +hd/FGLmdCWAeGSG6PbT0Jeprr+1HhZc3xCthoIxLdk5S/qjpy9AIjeTOSTMpmi2j3Yo8
	 lpZehQSGiRmuSzeQmo2kgIa746FiGYyXN+HLpVdZdB24g8HM4R2asY/mHfJX3etcTnXXr
	 8pETAO3rwShcIaZPJA4dTBLaUeWaJVG+V/uO+8FKDaKmEVJFHshbyjQ+dL+vCDOCFYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096662;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=+JT0h6/LQKzOu/59CAf7m9l8pTm3b7Vc3i+I/Y4m4GI=;
	b=ZrvIa7FmWQym5rxvyb5S0EMGch2kdefXN6Oe63Z9vjU2nU4sMFy+3P6XKAri6Uyp93AY
	 328+ld6KITCEX+27XvXInBH/2XzDj5u0FelrkchBdlgdMamQwt8Nv3NaGWFZaZyIJrXAS
	 piM8XHjMlTXA8nl3qeiJU/bIxkgMEwoN3/Ff+D+xbjQJVhLInImJpFahWeXXhWecPMEkf
	 6joM0+gXs457MTcGwr+Ymt+36wbX1CL0otOyjOezeGONr/Esk0X1G47smDNWvKAeUahCU
	 1ps8rlcJK8Vn/MZs+SQDWcql01/XO7g/bIsCx5DB79EOv7mxXacQWNH/6M16xbGepQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLNmNWtJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11041606A320;
	Thu, 19 Nov 2026 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLNmNWtJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C631F000C5;
	Thu, 19 Nov 2026 13:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096661;
	bh=+JT0h6/LQKzOu/59CAf7m9l8pTm3b7Vc3i+I/Y4m4GI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=oLNmNWtJqQkZZfLwzkUWs4mib3sQJV8ReTrErMtd1T/ximqSWlZ7T7s4Ri34l69j9
	 hGkyBQBjRRimwrk+Tuvz/dsvPYesXWGt9aF3aHidteIAtRbaYsQS8I2eQJNFSeJt1D
	 2G+uTRw0wa4qRKniYRb2B0PFWvFK4Yz4fwgoWEgMPCZPnK3FA2PIU+FOMlz2Rv7z+n
	 ZFnrX+9ul23JUWLpAWxOzvKcjYem+L891mdjCuigh1n6UkKSsLy2MexeOqPvJybGVx
	 g1h/hxrKdrX4FAgQmfsNMgI+zIZNFCqxFIILHR+F1wKX3rm9x/beBiKlGyJA+lnYW1
	 A27ibuUtDuJfA==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 14:57:37 +0100
Message-Id: <DMZ8NNSPL36I.15O2JQR7M65T0@kernel.org>
Subject: Re: [PATCH 1/4] drm/tyr: name resource lifetimes after their types
Cc: <aliceryhl@google.com>, <daniel.almeida@collabora.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <lossin@kernel.org>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <tamird@kernel.org>,
 <acourbot@nvidia.com>, <work@onurozkan.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261118233727.3147222-1-dakr@kernel.org>
 <20261118233727.3147222-2-dakr@kernel.org>
 <DMYTKRS80NRC.18PBQHK9SZ8K9@garyguo.net>
 <DMZ4C3GGD9U0.360KJBSFLEK61@kernel.org>
 <DMZ5HM326EKD.1I8KUFD65L91Y@garyguo.net>
 <DMZ6RL5X2UXE.33EY9MDLO2AJA@kernel.org>
 <DMZ7CHWBWU4O.3EA040FFBVCLG@garyguo.net>
In-Reply-To: <DMZ7CHWBWU4O.3EA040FFBVCLG@garyguo.net>

On Thu Nov 19, 2026 at 1:56 PM CET, Gary Guo wrote:
> If a rule is to be established, I'd rather it being the following:
>
> - for invariant lifetime parameter, use the name of the borrowed resource
>   (because you know the exact lifetime).
>
> - for covariant lifetime parameter (especially if multiple resources are
>   borrowed and the lifetime is the shortest among those), pick a generic =
name
>
> - for covariant lifetime parameter referencing just a single resource, I =
think
>   either is fine -- (as long as it's unlikely to be used by unsafe code t=
hat may
>   assume that it covers the full lifetime, e.g. 'bound).

I think in the end it comes down to personal preference, so this is fine wi=
th me
too.

Though, I'd use a generic name in the latter case too, such that it doesn't=
 need
to be changed once a second resource is referenced later on.
