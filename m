Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DD431F9B5
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 20:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785789639; cv=none; b=K1aUUEfzo9ETz//KImsdeQV4FnxAr+BZWsEvuYn9UYRIfvaDy7BkPayfivM4biVkwR8FH102RZnX1Aq+PVTc+dQS2coUv+mgsB97Bp/qkqADMDGp0hXtlDAog4wMKC/xaqt0hkGGcAtiVnEpX8d519RjoC5mxBbYMp3peVJxng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785789639; c=relaxed/simple;
	bh=ZU2foUOYpuxPGu0jIwJyjYfO4HXRgO8iO+2fhM0FC5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsIkTtsDH2jadywUY8LX+vjU9warvLzPRxEBXKbTo1vKQR0sNGSc+WOytpD7chAa3JEo/0kEfZu/YUYlcXi+Nz/sP7sD1GGTznAfC3g4ibhOk770DWwVT4bN8xUyBRP0nWOGfXjH4lSOqrl9dbr9jSyhvwQM3A7cM6EOAHvLtxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1bfOYTn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1bfOYTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E3A1F00A3A;
	Mon,  3 Aug 2026 20:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785789638;
	bh=2sranhFfPxZ2L3geVpw6WPa8fhQaNmPxNK4trsiz2ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k1bfOYTnT9CwZLj+Pi+vHTFfHj7yxjbHOzJxy5HA4Y3m6Sx3qj9bpKOw6+Ty2blV/
	 bY1mu5sZ9nY6L0LakYax/S6vBsB1lQurVMTxlNkCNJApCAPiyYD3kdM5dmiqtgD2qg
	 qdCda9JAyETCBShiyZ8AEJUo/bIWYeVEJjk3feWieGbQbjxjioAX3RE2PQmMwtqZIf
	 ZnwrlgUImeY1DG0+qoyUefJkaK5wDGfuDyr7eeofqmBn6RUm3ZYcOHaWnX1tAar7Ph
	 aQasM5Gfyqn87GFw29hK/FHCqpc8HKl6ffjhHaF6EnFJ3TwpkUCVJmyoQSefMExgyV
	 /jOyJ2k5F+76A==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id C60EEF40069;
	Mon,  3 Aug 2026 16:40:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 03 Aug 2026 16:40:36 -0400
X-ME-Sender: <xms:xPxwanpj7--_0S1-c_ID-KWL5scr8HhGLuWqVm8G0xQtBVj6auP2OA>
    <xme:xPxwasAL-kPTkAvcOgoaczUlKk-o-AGLbgq7LxpbuyO1y8FQvTyBzi427QaT2Tovv
    f2IqleJ9NaBLDdoT3wXijXV5hHaoYnBYiSCF0tiqamTxGr0iGH3TQ>
X-ME-Received: <xmr:xPxwaqUgzJlYCuzZzXJndaLucoc7-58rkUebDJqkW_dY4ulbX9YhtvJXVDbjAvVQkRkpZJEEVR8Z9dbX7qjWTn_grJtO1aiG>
X-ME-Proxy-Cause: dmFkZTGCgTtXTk7/viEBcmBjVJ7LTkBF1ur/oiArYzoURUXwZw5GPAD1e/Exa3ssnonXEr
    NUSD6UactO73lB2QsGWYs9RkzhgcTzt+XHbgNSJ3XaXUVOC9KbOt/hjDnUZFjHtmOT7Moh
    m0yxl71APx7TmWla2G353R+kcbByaYhBz+6Ue6U+rEqxYmFiVDbd8FWaGSU0Pqfyje23V/
    vfdhOzdfK6CX8PXxktWY7wUFbITeLNpg7MCKEjo1nhsiG65E+cUzyzuZ1H9TFQHz7bddf+
    UTPVVe+gDfhL/mkznLCH+QTrLnzGnekIArrDNPAYyOZvg8JKz7zV1129yu7eCtEnBWmftd
    VN6Q0MActv4YvU0a8vurPDzvDiLIS4+2XzSl+eZTN+wXv3yWBKxdtNeNXQbZ3lCwARcxu5
    hGqQqGWes05QjzFlyQzuJo0vMREGDSw6zB1JzJ5u8ZavXuSpYmmvl0pUb9QSYhtMtx7QWj
    1prLtRChmb+uySKmFJI400VZn0jonJV4O6VSesgXx0sTLdqOV4IWtjLrsLCESSEm4cPZ9g
    BLBXr1IAWfNhrS5y0bqQKZ1FCH7dIf2Gm24nrSD/ipnpqRIz7UaWlCasB+fV+LO6CfvBwb
    INH6KKLGkkEznXbxSuFyywxxrxfAKtug8RxJigC+AEWlIF5i1Gov6yjAxvyg
X-ME-Proxy: <xmx:xPxwamBIwSpwm-PCT7JMgiXG-LuVMz9EoV3P8qTnY2g1udtRDgYEvg>
    <xmx:xPxwavcV_WcXYU49sHAnVNAYNOgwVWIweoiRBWHxeJ2aHbmoU4NWdA>
    <xmx:xPxwalq33E0t2DKiQU96vopgU5tzpSpr96lrD1Zgj5w6zU-Pj30ZKA>
    <xmx:xPxwaoRdkOe4-jLJtuf2lYLX_psLq4gPslwD0EZzud-yrdPJxKNSUA>
    <xmx:xPxwatU4vlCfYWi2h-20LAImxgiVvQJ956DIoZM6HsaoyXpQhbXWaFbg>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 16:40:36 -0400 (EDT)
Date: Mon, 3 Aug 2026 13:40:35 -0700
From: Boqun Feng <boqun@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 05/24] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <anD8w80IxToGpDwr@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <anDndQlfuVIneMe4@gmail.com>
 <anDwRdepUowo-YIR@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anDwRdepUowo-YIR@tardis.local>

On Mon, Aug 03, 2026 at 12:47:17PM -0700, Boqun Feng wrote:
[...]
> > This is a very low quality patch, it should never have been included
> > and declared 'ready' for upstream. It's not even close!
> > 

And just to be clear about the 'ready' decision: I did do a thorough
test (with real workloads that I have), and tried to fix any format
issues that I could find out. The latest version of the series can be
found at:

    https://lore.kernel.org/rust-for-linux/20260605054128.5925-1-boqun@kernel.org/

Of course, there are still a few things I missed and it's sometimes hard
for one to find opportunities to simplify their own code (e.g. the
struct interrupt_disable_state you and Peter pointed out). Thanks for
taking a look! I will post a new version for review.

Regards,
Boqun

> > Thanks,
> > 
> > 	Ingo
