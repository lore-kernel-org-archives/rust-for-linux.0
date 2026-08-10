Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97B3AF646
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361389; cv=none; b=m8lTE9Bbc1AurO/nfAesOyO0fbY8jwA8WN+eprpzPQATHrI+shGGh/gv/K6lm0VJsB+VTlBOXLdtW9Y+A6hyj4Um+RCOLyqW4pokzs0+fZUoatqwfWrHDCelAoDabp1TvqCGEnDfK3w/o1e0BXSt2JuQN6MnERe/T6aF/iq9nNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361389; c=relaxed/simple;
	bh=rJJ+mi4Gnm62q0UtqXkhqmnEw4ca7pqsUh+gGj3U5UY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QJGAMxw2h+LIMR1bSD0+2o0scPC3a0sJ9ZnrH3deJqx25dciN+o04ZKHQg5fYdrojqjl24edkaN9ML2h9AQICNDnelmxiwbqOmtkqqV9uY8m+U+UQdAArKkbqReYzZ8kX7B9sttelrTreMaz9RVsVKZcDZqdjtOv8uisbQ1nu6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbY2AMPB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbY2AMPB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636C11F00A3A;
	Mon, 10 Aug 2026 11:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361387;
	bh=rJJ+mi4Gnm62q0UtqXkhqmnEw4ca7pqsUh+gGj3U5UY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GbY2AMPBmNHq99dZj5UyS1jKcspNpbuvLOucpVG3KsBoLgNS2LvHH2SvuFrh7SLNX
	 fmmNUqBwL7+UV7A+v/6hvftcnThWGJkenPsH8TFXXuztPdBoCzp9KQ01uF9EIDUj5T
	 mmMkXRb4OSCzpNxLlj5SgsrTQCdv8IXCuETIL0TWS2oPZRtREuRf65ug6t4QgfdQLF
	 LUXZHRoSw2x7lxf65dssynKdA2Ja35Va1QjTKHl2YJ537SckoZm4oSshcn98PffU+b
	 +XCPm+O+n2VtDUsd7Tt0q6BC5FVFBylDDF82ALSIiMTFrVEJtiwKnJ2loOUmP2eOIf
	 wBPR5mBCKJcxw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com
Cc: acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v6 1/7] rust: time: make Delta generic over its time unit
In-Reply-To: <20260808062839.1159990-2-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
 <20260808062839.1159990-2-tomo@flapping.org>
Date: Mon, 10 Aug 2026 13:25:19 +0200
Message-ID: <877bly2p5s.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Delta hardcodes its value as i64 nanoseconds. A later patch adds a
> jiffies span, whose natural representation is isize jiffies rather than
> i64 nanoseconds, and a separate type per unit would duplicate the
> arithmetic and comparison machinery.
>
> Make Delta generic over its time unit so the jiffies span can reuse that
> machinery. The nanosecond Delta keeps its current representation and API
> via the default unit parameter, so no functional change.
> users.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



