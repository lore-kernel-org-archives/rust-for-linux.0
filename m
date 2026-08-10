Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5873C2796
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368541; cv=none; b=SZcJHjH9y7YKt24x9KjuWE8rVa9qVrDFGdMWKaRBL4fQgmyxYic0s5pYJreCGXLw7OH1/GO6spr8MLzVVjiTBzK3fGuLENLhrRYc0Y+xS0O85YVo9qly8awz0gf4g85E2IRAKZddCyOaKjgO6+aV2FQJZuo2ZFIvcvLR+mO2noc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368541; c=relaxed/simple;
	bh=Cp2MfGC3hAzVpV6UQrQQlmkmGJoNpo/8VOssLdMUF8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWI2wl710BW+jdCieJyUQHGCNXbAM1NceG+6+UGD+GUxqyqmxVVO9vTeDTgQITijbsHJzXZbbvi8qs+ARcpTtcRLxXwXyfdQT/CkWoi9HU79UKuP5E12gI26cXzuNtE9srD87wZlp71cXhy3dQW1V/icDPcnhXoU2aNPuWgBlYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YshI0+2c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YshI0+2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549EE1F00A3D;
	Mon, 10 Aug 2026 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786368539;
	bh=+6bKsFfDIiv+IduIk04mHForQDtudgwfB9t6mwUZ8MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YshI0+2ctnN/CReqj1PLZt0OqCQ0yePEocrG/FP5i11FiOCydLckUnLcWq5hRCl04
	 fRXLYjSprCdCsL95N7x0xeBr3tM0IybtaQkfi7guBAehcuTeWgbWjuXw0rOp3Y9Imx
	 auGxDYsbIUbbxu0aATPZvjfXVIUCBJarYKpA9eRAIPour+BJiyh+LHP2GQc2Y0Ve9r
	 iNu2cvsrrMMLl0SLfOXIqZLNgLYdArUXt48t/hAkaAXfbDtqL9naHxsdW8TS2u5mUr
	 x516v0NEBdtmZrhtdZz/ru7IX2axIuUXsCj3lAGpxvaEmDSJBQs+Va7DKx1Aqw7/EI
	 bjoqunBj290CA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 73D16F40066;
	Mon, 10 Aug 2026 09:28:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 10 Aug 2026 09:28:58 -0400
X-ME-Sender: <xms:GtJ5avCbefIuZhurnMdKmRtXl9BnFcJZCuincP7AA_IABAUEWawpKg>
    <xme:GtJ5asdiBHbhqTf2D_pMfLhgtqKFdI12EgGDdKrPFSX6bbXLrUXKnLKhpmC1p5E76
    ub__1ziIwhoaHPLN_853aabyArXwzFmZxHSh3JF0wF_wrCrHZQnkrU>
X-ME-Received: <xmr:GtJ5avoqAIRAr4Faru1AZOGBmoRre_74YuVHX6qBE1dn8MHlT8hM7X5gc9Vdt1IEB4laCLxTHySKR-rHYkSLsHrbmVIF5MDO>
X-ME-Proxy-Cause: dmFkZTF4UMx8RYYpmrv1dSsb9d+vasit5QxiScAo6SMSFJD4Y76OOtuMW5bUzyfkl3rz3L
    0RkmP7K5ZitnGbiSkElKfl7U+5xsqz2BlSzhiw9LrJhAJdjNpJwwFcwI748DaukKcNS8+4
    AZlA2hujd8X2jS1X3EmgqrGkIMi+v1kJ7IyljOJHno+dBxfay0ReQnGLZE27PPuHxWm+Wm
    OdNN02hDpz5vI3UhnrIHqjrJGILg4tlxDCHAonwtYWXnhxy9uoNcxPY2AEFAUOzEwHIk2n
    cZGAaDbehcagyPlX9eMcFTCGAVQv4JONczcL8ovuCvYZ/CiMMfLypMkHStWnQ+bBHZf7bF
    eR+2Uu0hlVKhDzlf0z8/7vByQy3MuSOD2x2zw07x6sL1n5QjRJg69cc+E1mhejskAhSnnY
    6WfCy1rGBhFYvPGJdcMbDqrRgT3ENkZbvX+EaFNYVlmSZZLiyMESmJkeb7f/Al9vGjOxZs
    efu0jg6fY0MZEO8BNxuxxaflvgoDDhaCRtmCwfKAfkC4r7rd1Bqd/A0VSD76PJagRQkOEA
    CGdGzEyw/uLXSkvJbkXGbNlFJ85Bqqs0pu+V5Prxd0oQcquv2NfSJjlTUle+mBfHD6PDO8
    xp0MYafVpEmXEaD1y5wYdxX1Lok9ENweTRJLvPJk/obcXWE/vBM+OVrdrX5g
X-ME-Proxy: <xmx:GtJ5ao4g3ekjvqJRAfmbK2h4qD9rEzKrD-utlFOO8Gh_OnLkkfPVEQ>
    <xmx:GtJ5avBkrX_JoaGitBjzEZdQKu8fV1R1rjp6Zr4rZOOtXR6tZaDkeQ>
    <xmx:GtJ5aqZxlc8A9eCHCfrJp1Baui23fqDUIH0adgYNC6eOPUad2bQEpg>
    <xmx:GtJ5ajLQEJMniZooZr7XOAy0FDy6J8ZnIW522AipmjCAphxJynTO2A>
    <xmx:GtJ5ajDgUN-kT1wh2yN-xJzWtwOHKp8xeSlMZ4eBGrNIbkYTwATDvkHD>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Aug 2026 09:28:57 -0400 (EDT)
Date: Mon, 10 Aug 2026 06:28:57 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: [PATCH v5 14/18] rust: Introduce interrupt module
Message-ID: <annSGYKwWXgR4VkD@tardis.local>
References: <20260807070218.27144-1-boqun@kernel.org>
 <20260807070218.27144-15-boqun@kernel.org>
 <20260810085753.GF1642880@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810085753.GF1642880@noisy.programming.kicks-ass.net>

On Mon, Aug 10, 2026 at 10:57:53AM +0200, Peter Zijlstra wrote:
> On Fri, Aug 07, 2026 at 12:02:11AM -0700, Boqun Feng wrote:
> > diff --git a/rust/helpers/interrupt.c b/rust/helpers/interrupt.c
> > new file mode 100644
> > index 000000000000..51b319bd4c00
> > --- /dev/null
> > +++ b/rust/helpers/interrupt.c
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/spinlock.h>
> > +
> > +__rust_helper void rust_helper_local_interrupt_disable(void)
> > +{
> > +	local_interrupt_disable();
> > +}
> > +
> > +__rust_helper void rust_helper_local_interrupt_enable(void)
> > +{
> > +	local_interrupt_enable();
> > +}
> > +
> > +__rust_helper bool rust_helper_irqs_disabled(void)
> > +{
> > +	return irqs_disabled();
> > +}
> 
> This last one doesn't appear used in this patch; can I remove it?

Yes. Previously this function was used for debugging, but we have moved
to lockdep_assert_irqs_disabled(), so it's no longer used.

Regards,
Boqun
