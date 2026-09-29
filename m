Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1333DB626
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677236; cv=none; b=HVkOk/sbnj+IyFqGpXEC/vvyPnSFoHxk4zY2I568rhNq43U4yVpR83u68Gsqi+tsZAuLKrwP+D6Ei0d5E0bUZiu6gJDmvjuDOdNiNMVVKTamyGLfTbVbwwh01Xe1BFGJUDsh8zOu1Acw//eOmKJMg1gV7LuhWH/m6WQ3t69bFPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677236; c=relaxed/simple;
	bh=alksLLpm2+voKhGA9Vyj+EGjN0veZPaPKjtIj+pUnzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KwfH3MVXJrSoX9udscvpm8QMLElE73Gns1aRugPmJxNLbf7vv+cM//CXKMusM0r1Jy4KNEGdAdP4fe92CbK932crIljHEi/ZGebYoQqOT1t/tBkTBNEYuJDY4vtNPQEDONeRELExHv0vH2kuwrzpTDmz4EJujXb7s7cp/9pKTrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUTbQMbZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUTbQMbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4961F000FF;
	Tue, 29 Sep 2026 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790677230;
	bh=xfpLlZGQdQGn50OF3kClSamjBHIKpJyHOttGv8dNb2U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KUTbQMbZ7ILVUd6urcIee2iEuw8s7Q1YnHCiDOXR+Hg7/gaNkNYlNBx81deNHP0D4
	 blLdgKjJ4m79BfRjSoF5Snl0xq0LSQypAtleYPKRwWqwnuYUhK/ohYkKGa251agBEG
	 6GdSp4a/Qm/2hqFgbjPgcjyf3P6SbRaum295Ej2jRoZpl5zYxreWkXr57B4tFymr4a
	 z8UN8iKG+yLLWlxML9GTznm1opO9kIOmDIAWO+EBBu4WGgxH+U8t+9lCdAfgmmOi6t
	 Cybp0n/QCYQI2BIO6Q+zr/3MQYVzaEUvEAcWzxqoQbN7SYBpg+Hm+gsLpTc8EIQgKi
	 zRFN+SJpcIzdA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: ojeda@kernel.org, jstultz@google.com, 
 FUJITA Tomonori <tomo@flapping.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net, 
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
 rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20260722001050.4115708-1-tomo@flapping.org>
References: <20260722001050.4115708-1-tomo@flapping.org>
Subject: Re: [PATCH v1] rust: time: rename ClockSource trait to ClockId
Message-Id: <179067695519.2043960.3273406408175138586.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:15:55 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 22 Jul 2026 09:10:50 +0900, FUJITA Tomonori wrote:
> The `ClockSource` trait has nothing to do with the C `struct clocksource`
> in `include/linux/clocksource.h`, which abstracts the hardware counter
> used as a source of time for the majority of the clockids. The trait
> instead carries a `clockid_t` `ID`, i.e. one of the IDs of "the various
> system clocks (for POSIX.1b interval timers)" as described in
> include/uapi/linux/time.h (CLOCK_MONOTONIC, CLOCK_REALTIME, ...). It thus
> plays the role of a `clockid_t`, and the `ClockSource` name overlaps
> confusingly with the C `clocksource` concept when reading across C and
> Rust code.
> 
> [...]

Applied, thanks!

[1/1] rust: time: rename ClockSource trait to ClockId
      commit: 6a8e2c63f2fece3828ac09e4e434666de842acfe

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


