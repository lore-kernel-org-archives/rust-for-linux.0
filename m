Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7463BCD17;
	Wed, 26 Aug 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787736692; cv=none; b=IMDIbkDCXw0OlBKek2BkRwqDtwP6Fr1l9QcLII2vm+TdYBufMEoAbYNzMQ7RwgZbBUDuV9VEzg/G7z3710iFlx3kQpyS3MLuAr8hJi8SVnd++xAU4iYqiuWvInEfXn/tCn4uoV8mJDSZdDVpSCTxWQXDqc9YMIr0SO2npMsaCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787736692; c=relaxed/simple;
	bh=5jun+E2eMGR1/N67LbFf2iWsxF74r4ZAeTvmAQz6j8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V0XW6KNuX29vZtl7ez8PJ58sJ6bn4FYrpA0vOM6Pknm8sPdI4aP5B2AZF3yhW2Ex49gepYUQC2FgxKbzkbH6NBtyAM8EI1wq3Edh+B9d4GK+WdvN1GFNa5an42Zjrs+iTfyULj1pFM1+cbjXG9ZE+NLY89Jp4CgH2vmyIuWTb1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsLs3BzP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsLs3BzP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3E61F000E9;
	Wed, 26 Aug 2026 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787736690;
	bh=5jun+E2eMGR1/N67LbFf2iWsxF74r4ZAeTvmAQz6j8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GsLs3BzPHldXvItdO62wqWRV4PElfaPnzOqiGn8RAyVBp64gPgcq7mCEwSZl8wnVy
	 FWA8GQBB2ymMgKRf8Afs+vxRXmT7WLl+fxLWXBu+r6BwQIo+9YZBw2S598jSIRBwbI
	 zKFOtGlWXRCW4w9jCBJZ7yRzVITe6DUZfxUG6tOOsa6/EJ9Q46P7MxI9RIDIQ2ak51
	 lmgi4kKVav5j7qRBhy7AR0sdWCIpHN0ld1iPC7FyjTLlhyar4cfr0vVqn+SNHNIf0s
	 kPQ168qZCz4I6j1fGt0DeffmR1lcpV24uBN2tv9Za96wKgHOOxVSdhHu3C1LkvoSVP
	 owWkeBzlmENqw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lyude
 Paul <lyude@redhat.com>, John Stultz <jstultz@google.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/6] rust: hrtimer: document deadlock when starting a
 timer in its handler
In-Reply-To: <DKY292V0LWJN.1L3HG02NBW6K5@garyguo.net>
References: <20260825-expires-v2-v1-0-90411c6217c7@kernel.org>
 <20260825-expires-v2-v1-5-90411c6217c7@kernel.org>
 <DKY292V0LWJN.1L3HG02NBW6K5@garyguo.net>
Date: Wed, 26 Aug 2026 11:31:17 +0200
Message-ID: <87se411b4q.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Aug 25, 2026 at 1:16 PM BST, Andreas Hindborg wrote:
>> The state machine documentation states that for pointer types that
>> implement `Clone`, the `start` operation may be issued while the timer
>> is in the **running** state, and that it is then equivalent to the
>> `restart` operation. That only holds when the operation is issued from
>> outside the timer handler.
>>
>> The `start` operation returns a `HrTimerHandle`, and dropping the
>> handle cancels the timer with `hrtimer_cancel()`, which blocks until a
>> running handler has returned. When `start` is issued from within the
>> handler, the handle is also dropped within the handler, so the cancel
>> waits for the very handler that issues it, and the handler deadlocks.
>
> That's not always true, you can start timer and store its handle elsewhere.
>
> I think the proper wording is that "cancelling a timer from within the timer
> handler will lead to deadlock".

Right, I'll update the wording and comment.


Best regards,
Andreas Hindborg


