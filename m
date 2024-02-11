Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F48E44376
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Feb 2024 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707638085; cv=none; b=camIiY9cGgb0MXaaEPvN5FniXgth1KUo1Fck89X4Fq7izL7UnSvNtb05YfWMMamFFc/QGSgzUlaOswsb3WvfnXR8GaJtygbutgpEdCXog5wuemJoHlbUxT2nJmyOz+roXViy6wmjnTMJUOCwvy9AyHK+Hvkmw2PAVymdjwGJt+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707638085; c=relaxed/simple;
	bh=PfDqTv02LPwAy0vRNcZABhl0gpI8T5A7f/W+nyYJQHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0czEvgEAdIjseMn7cClEDGiWrbM7D09/xdgL8xTJmFaToAvAINhxNHsP6IPxBQSzz6jQjUa3dNK+9J8v6sPYvKSeDIqaatrmNhuVsitZwbixAKmmBv7ycChQAg8gwmMLKqItTJg7qjaErmtKzb+y+gGCdkIw0pFzqTbnElY3l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=valentinobst.de; spf=pass smtp.mailfrom=valentinobst.de; dkim=pass (2048-bit key) header.d=valentinobst.de header.i=kernel@valentinobst.de header.b=W0L2hM4Q; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=valentinobst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valentinobst.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valentinobst.de header.i=kernel@valentinobst.de header.b="W0L2hM4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=valentinobst.de;
	s=s1-ionos; t=1707638063; x=1708242863; i=kernel@valentinobst.de;
	bh=PfDqTv02LPwAy0vRNcZABhl0gpI8T5A7f/W+nyYJQHQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=W0L2hM4QowNzPi63ZRfep8Q6PSlX47VOdrWSaGJlM7M/nMoMrb2Iox+7jQDWQOqf
	 loIqfgEy9bCyZn/Wl1RAaCf54LDMTbH3jk+rOuUHTiaVuW+qvaL0sF1FjOpmhLqRm
	 EWcyo2Qm+6fUpxPa7n60H+P6a2KRCnWk7dIZK1cBCEURPHdy1O/WgQnRRDE0Nu9fB
	 dIRYrsgVsLjBot3XFmDZLuw9lXy47fA5siwCICjuBb2mLqw5TTCp2Q7ddltEdBgIF
	 ttLm8cmylPAK9kqdwHbCMsL3yYd2NGoStSwTAfrVxREPKibBlgb6ffDFKZinhHTll
	 FYt1l1ouwvqtindhPg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost.localdomain ([217.149.160.178]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MvrRB-1qkGjI1Wop-00syhZ; Sun, 11 Feb 2024 08:54:23 +0100
From: Valentin Obst <kernel@valentinobst.de>
To: dirk.behme@de.bosch.com
Cc: kernel@valentinobst.de,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2] docs: rust: extend abstraction and binding documentation
Date: Sun, 11 Feb 2024 08:54:13 +0100
Message-ID: <20240211075413.3874-1-kernel@valentinobst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209070548.3693410-1-dirk.behme@de.bosch.com>
References: <20240209070548.3693410-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:CPk5ljFEaBSBfHHWAdV5a/N3miforEVbqlrScRyYT40/0AIkS+w
 lW3Xxh0jdhTg9jXaSPYBzfFLu74RkdLAB57REmXr0tI7pOudvKRwLbfKkSWaxM5GgsVZslK
 m0treA0E4ZcsIwbHwxM8q2QPLU12rA6fWetXpWfYkZ69anOCrqHWLk/fech+8RdYHJAu3hf
 22tcyBPd08FVJoxxAewQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fC36A8KP3SI=;UtMhLdcTMSpL5c7MdfBsseehveB
 eqmdfEF8IdCaINQhu70rkohzMC3c5p8QWI0Tf5U9h18LPE6u71G5xfdG3TDzI9zfGo/fAq1ZL
 kLMCf+IR27D5Y4p0GOuFcAsXrzwuyJIllApsKFKj5zdNEqRE+qpnMqPi0668/hsLAhO5MEcrU
 a0CiwtTIxS942LlbvIFs+ShZFdi7nNGcMvk8J7RAIIGviY+xq1YbMI/eqADqwdHae2m+ar4cs
 dRaL+rbrp/lwIDtstSmM6wtZE/wNm8yW+wsR8ARKGc9KWxTTP68P5yB7SESiK2L+oR8VDN30Q
 kMPfpHfT/P1+GES2Ei4ig1bXXH9qp5wr9I6MwcS93aFzblkXC0pYCEprqzhLIOlBZhYz1P601
 WlPFFXT1qYHML94CoiBbPtP6KOKpxcvZH9pqtrE6EFPhYJdTgatYHdL0leQTl9lQaGxN6K2KG
 UkBuV2xGJysyYkU8yqd8McYoYNiJTjef5dcVhNSwwbZZ4Yy2XG+dT9/tEcK3iVXcwwOPt/7iz
 JBsSl2erYa0IbOYfV09UGltYFOsKS6J3NewshnXWjwQs7Dhm4no9j93H8BK+iwQOqGLW1RMUr
 18/81phyT3MxsCmXE6rtYVuvd27HS4XF4qi/cnO1B6fc00mgP3ZVRSPJ8h9zWW0Mx/DlBMOP+
 d11h1v51JAMrepCGaclfpZdQtsVo4AVkzs+KK9+t4JcRjKEsDJURqGv24nVfcnNssZPFmoQM+
 QgEqGV/NJ/hzglex8luM1WsEgwtwfxQngojiDaOPzANWbgR0G7+T0Q=

> +.. code-block::
> +
> +	                                                rust/bindings/
> +                                                       (rust/helpers.c)
> +
> +                                                          include/ -----+ <-+
> +                                                                        |   |
> +         drivers/              rust/kernel/              +----------+ <-+   |
> +           fs/                                           | bindgen  |       |
> +          .../            +-------------------+          +----------+ --+   |
> +                          |    Abstractions   |                         |   |
> +       +---------+        | +------+ +------+ |          +----------+   |   |
> +       | my_foo  | -----> | | foo  | | bar  | | -------> | Bindings | <-+   |
> +       | driver  |  Safe  | | sub- | | sub- | |  Unsafe  |          |       |
> +       +---------+        | |system| |system| |          | bindings | <-----+
> +            |             | +------+ +------+ |          |  crate   |       |
> +            |             |   kernel crate    |          +----------+       |
> +            |             +-------------------+                             |
> +            |                                                               |
> +            +------------------# FORBIDDEN #--------------------------------+
> +
> +The main idea is to encapsulate all unsafe handling in carefully reviewed
> +and documented abstractions. These are then considered to be sound. With this model
> +it is ensured that users of the abstractions ("my_foo driver") can't do anything
> +unsound if
> +
> +#. the abstractions are sound
> +#. they don't use ``unsafe()``

I'd like to follow up on some of the things that Miguel mentioned in his
earlier message:

- To make it clearer what is meant by "unsafe handling": One could say
  "... encapsulate all direct interaction with the kernel's C APIs ...".
  This requires using unsafe Rust, but also leaves the door open for
  drivers to use unsafe Rust, e.g., for performance optimizations or to
  call unsafe abstractions.
- To avoid saying that "... [abstractions] are considered to be sound
  [after review] ...": One could say "The goal must be that users of
  these abstractions cannot introduce undefined behavior as long as:
  1. The abstractions are correct, & 2. they uphold the preconditions
  of all unsafe operations that they perform."

> +
> +Bindings
> +~~~~~~~~
> +
> +By including a C header from ``include/`` into ``rust/bindings/bindings_helper.h``
> +the ``bindgen`` tool will auto-generate the bindings for the included subsystem.
> +See the ``*_generated.rs`` output files in the ``rust/bindings/`` directory.
> +
> +For parts of the C header ``bindgen`` doesn't auto generate, e.g. C ``inline``
> +functions or macros, there is the option to add a small wrapper function
> +to ``rust/helpers.c`` to make it available for the Rust side as well.
> +
> +Abstractions
> +~~~~~~~~~~~~
> +
> +Abstractions are the layer between the bindings and the in-kernel users. For example
> +the drivers or file systems written in Rust. They are located in ``rust/kernel/``
> +and their role is to encapsulate the unsafe access to the bindings into a safe API
> +that they expose to their users.

I'd think one should keep the "as-safe-as-possible" aspect here, as
there will always be cases where it is not possible to provide safe
abstractions.

Another aspect about these APIs that I don't see mentioned here is that
they should be "ergonomic", in the sense that they turn "C-ish"
interfaces into something that allows you to write "idiomatic" Rust
code. Basic examples would be to turn resource acquisition and release
into constructors and destructors or integer error codes into Results,
and so on. I'm not entirely sure to which extend this is covered by the
safety aspect (they have a non-zero overlap), but perhaps it is
something that could be mentioned here.

	- Best Valentin

> +
