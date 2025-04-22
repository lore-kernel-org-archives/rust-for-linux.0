Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C258627C867
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327510; cv=none; b=l0SnXRhyr88nP182pibZ2FKY1NtApVHB8cSuwQUGwU785eCKxY+qOCQuwI+LpVPIMYbnVExC/WVBjAAMjmtw+K8zYCo35zM9Eew0z/F9c+WRfbG+H6SEp5dINpLglMuQin1eDBMyGydqt2MT0KHFDgUitFhSs3+kUl9eb67y4tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327510; c=relaxed/simple;
	bh=ZRnMNOhrK7zuMa9L3LX8tqtzNbpSLgHgoASW38pWZgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ihOY5ledG5cP6zhRSvxLhSnYiEKAuSGYBNS1b63LC4uJ1Rvng1kQZa0IOvvP+mJLC1JuLLd6NIERBx2yDH87aA1t39jdBY29tXr0TQcGhS1A17DQIlUH+wvopAxQuHnl2A8fUcRKxjEegBXxXL/w20SW2YPsML81Rzc67xXcEKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnsHgZ7j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnsHgZ7j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9456BC4CEE9;
	Tue, 22 Apr 2025 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745327510;
	bh=ZRnMNOhrK7zuMa9L3LX8tqtzNbpSLgHgoASW38pWZgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hnsHgZ7jPO+XpywAnQxGEcWv9qYHeLkUe/V1oks6Px9J6hyyjaAIOdQNhxnJOvGEy
	 i+7UeietRJWHz0R5pkvFqBKuB+kKjrmeZpDkTnApY7yHlO5Z9pP+nqe+/UX54dWv2U
	 2RH1V1MJFeZ0GqikP1rsJOMzb3J91MN723MKZ0RCaXRU4+W9Rt2GXMMqQ4eaoX64D+
	 q+o/DLuU4jsYikuGLigaFsBpkNFy68Jf47ySckNFmI3b52dimUPa6mq0mkXXUGkq8/
	 zyzmj4nkytz0d18h/gKm/kfZEtQQtND6j+A+yGS1WJO10I+65gwKNJN1NPR3LSu3gd
	 fBslPX3EZb/aQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  <boqun.feng@gmail.com>,
  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,  <gary@garyguo.net>,
  <bjorn3_gh@protonmail.com>,  <benno.lossin@proton.me>,
  <aliceryhl@google.com>,  <tmgross@umich.edu>,  <dakr@kernel.org>,
  <frederic@kernel.org>,  <lyude@redhat.com>,  <tglx@linutronix.de>,
  <anna-maria@linutronix.de>,  <jstultz@google.com>,  <sboyd@kernel.org>
Subject: Re: [PATCH v1 2/3] rust: time: make Instant generic over ClockSource
In-Reply-To: <20250413105629.162349-3-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Sun, 13 Apr 2025 19:56:27 +0900")
References: <20250413105629.162349-1-fujita.tomonori@gmail.com>
	<yeL5RAonA5iWV8-p-hvccynw8VTkb93O2c97FNfT0TZuHhD8n_zNmf12REZhWwcr2id8751ePrpH48LyDr8A-Q==@protonmail.internalid>
	<20250413105629.162349-3-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 22 Apr 2025 15:11:29 +0200
Message-ID: <87jz7c9w8u.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Refactor the Instant type to be generic over a ClockSource type
> parameter, enabling static enforcement of clock correctness across
> APIs that deal with time. Previously, the clock source was implicitly
> fixed (typically CLOCK_MONOTONIC), and developers had to ensure
> compatibility manually.
>
> This design eliminates runtime mismatches between clock sources, and
> enables stronger type-level guarantees throughout the timer subsystem.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

I think this patch will allow creating an `HrTimer` with one
`CockSource` and starting it with an instant that uses another
`ClockSource`. There is nothing tying the generic `U` in `HrTimer::new`
to the generic `C` in `HrTimerPointer`, right?


Best regards,
Andreas Hindborg


