Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C4137FF54
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781869448; cv=none; b=qoyTUz4OMVmDyRAlkbPn/4lwtNR/xi3Sl0fAb9WToJKKjxcf8t0RrLpv9lHI4x8bDNgNc8fEOJsmEV/4sMT3ismcJqa1QoLCAI8tzjKp7FOwyoe3njtQ3rM3v5lywSORDzNqN2nDMXSa4JZ6x9k2VrhLhEPHtS8mH4b1qhNPiFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781869448; c=relaxed/simple;
	bh=+byJevz26pbC7nl69GWGGeYOV725oDvciRzox5lx4/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JqbaNhw0cafqLudvn2sAsA8WqYXlFOd13MDjQaP4EpNnOF2dGxVaSwFZfV4DOpovY0ABgGuCvUfIo8kKZ7POlaYSsLavUBp6AV0HDGZmWS2G7DZ8/UGc448qtTBwr2TWW79QMxycGV6bsdOdxEyqN3MCv+KQtUeC2gX/Ov5Nmi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1QcY8kp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1QcY8kp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220D91F000E9;
	Fri, 19 Jun 2026 11:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781869446;
	bh=+byJevz26pbC7nl69GWGGeYOV725oDvciRzox5lx4/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=E1QcY8kp0xS0sD/QZxOmNvnFj/HacXd+146hCgWCVJow93SqCwMs8H1bsjUvPY1ge
	 2/3HprdDo2vRNQzsI0UnVZnffbHeV1JONDyig+xR4bo7z77x1s8BsdYchlHRlVAFIw
	 K8bAjzcEAYfI/JPG/yF9nu77PJ1ajs5xO0Ah/r0bNup3KeDy8FcNjRdKvFx19j5B1O
	 +GiXNw/r4Vlm5b8cY5h/QOSEWFFWyXV8b/ncIW9FqPjRu26xKjHC/8c0l7uDb3E5z6
	 Melq9vrjR9m1sbxxBzlVexWWL2KmIsb9lBzW3zr0uxFaBfDA35e+AjNoO7TqttcAKR
	 P2+uwDe/v+AQA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>, boqun@kernel.org,
 fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org
Cc: rust-for-linux@vger.kernel.org, Sang-Heon Jeon <ekffu200098@gmail.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v2] rust: time: warn and assert out-of-range input in
 fsleep() and udelay()
In-Reply-To: <20260522172558.137415-1-ekffu200098@gmail.com>
References: <20260522172558.137415-1-ekffu200098@gmail.com>
Date: Fri, 19 Jun 2026 13:43:56 +0200
Message-ID: <871pe2g3gj.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sang-Heon Jeon <ekffu200098@gmail.com> writes:

> fsleep() documents out-of-range input as a bug but does not check
> it, unlike udelay(). Add `debug_assert!` calls to catch it in
> debug builds.
>
> Also add `pr_warn_once!` calls in both fsleep() and udelay() so
> the clamped path is observable at runtime.
>
> Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Looks good to me, but please follow code guidelines for imports. That
is, combine the use statements for `crate::` and add the empty comment
on the last one [1].

With that: Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg

[1] https://docs.kernel.org/rust/coding-guidelines.html

