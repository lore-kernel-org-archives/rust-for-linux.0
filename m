Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4BB2D3A80
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766489270; cv=none; b=U5ynxK+b3/XS7xd7eW830vtT65tXRBAWHuX09RL4Jnkqhz/UD5WB43nVqQs55hURv3uW7XNkan19PXfF/ZDL7TkiB8LkC+Ff0PfMMsIB3gNTGSFnsrPjhOFg4GXc9jZLM+Cd3faoyKmz9u5w//LObQDH23LXcf/Qx+xxoxPzdS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766489270; c=relaxed/simple;
	bh=GP8hc7PHk7l2tdsDn3bUnIq4IJmCRFIih+mG7EKMHpc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Uk1h6YU5mdfvHmrtCkwuhnqL6Yw5BR1FQaZYUwNeZ2be8vB6Dctvg/TYBo4erwcFfW0JBKhW1X7Zhsi5A3qqja3Ef+s/5Gz3S2D5XqbKDv0SdH3rnrWVyt/8Kg9LW8IqVfUxXHXGRlbkxg9/YAtpQ2Ks5eeAM5eO527mCKt4brk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9QFRLRo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9QFRLRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0622C113D0;
	Tue, 23 Dec 2025 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766489270;
	bh=GP8hc7PHk7l2tdsDn3bUnIq4IJmCRFIih+mG7EKMHpc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=F9QFRLRo6RKr8nFlRqOE0KFE5u9mk3jntt4uqrqDCqedN9TTB0rzGngDxEihPQnH3
	 yDSIhsyQl3vdPjZyuBghYKtVVVjr+onRhkQC6Qr4tz0FNigvjf+LcwPGXP/zx0Sqbd
	 5c35+2YTwEuhh+mpWX10IizCCJQjycKj0O1Un8ctN+vF4je0f4kkIVrKXbAJOofhD+
	 EX+tgMKdT+Ccb+4bqZ5YoFmHPSENbmlizekJ1MvxDjO4UAcMgplNdlM7Sq2c/SToX8
	 sofE/WhQPS+I3BJeAwFHYc8SGa9GrEmQjKeIe6i/XNj3c7EEXUv4TTPUcsuZq/523O
	 rTwzjfLAZbmVw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 12:27:45 +0100
Message-Id: <DF5K6LPI70IW.VMT18WZTDLCR@kernel.org>
Subject: Re: [PATCH] rust: fmt: reject {:p} format specifier for raw
 pointers
Cc: "Ke Sun" <sunke@kylinos.cn>, "Gary Guo" <gary@garyguo.net>, "Benno
 Lossin" <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Tamir Duberstein" <tamird@gmail.com>, <rust-for-linux@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251223033018.2814732-1-sunke@kylinos.cn>
 <CANiq72nZp-ULXMV9yG_PP=gkr0HUPTcE6ZRQhtgRp5Zk5SR6sA@mail.gmail.com>
In-Reply-To: <CANiq72nZp-ULXMV9yG_PP=gkr0HUPTcE6ZRQhtgRp5Zk5SR6sA@mail.gmail.com>

On Tue Dec 23, 2025 at 7:41 AM CET, Miguel Ojeda wrote:
> Regarding the patch itself, ideally what we probably want is to do
> something similar to the C side, i.e. by default hash the pointers
> like C does, and then have an explicit way to request the real address
> when really needed.

Indeed, but I think the latter is even more important:

In C %p is commonly used for debugging when the actual address does not mat=
ter,
but a unique object needs to be identified (in quite a lot of cases to hunt=
 down
memory bugs).

In Rust we should have quite fewer memory bugs to begin with (there may sti=
ll be
ones in unsafe code, e.g. in abstractions) and we have built-in language
capabilities to easily derive debug prints for objects, which are more usef=
ul
then just a semi-unique identifier in a lot of cases.

So, what we are (mostly) left with I think are cases where we do want to pr=
int
the actual address temporarily for debug purposes, e.g. when interacting wi=
th
hardware (DMA memory, shared memory, etc.).
