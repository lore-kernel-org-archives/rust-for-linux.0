Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248F414D29B;
	Mon, 22 Dec 2025 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421974; cv=none; b=KAbNC9BBe0PWshcpmlmI8rf5knNO/7XcPLe4eyaNtdBTS+0zr1aSV4AGqmXH/yy3mKAcuaBXhtkBzw9e3AIZ+b9MvJ2FEFSzNFES1UdQkrwmiMbdJrdW4iv9J2dSnxeF/ym18laaTpVl0+jgym7AsTj4p51doVwcw/Lpzn9mqjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421974; c=relaxed/simple;
	bh=eGWlOdWO2OflHLELXqOh3HmoOY0aEDSov4EGldITT7s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=gpwUy4pfC2rOwXFQAwv8own2x814A0xKUbiTpIy/cXMdXLduxTE14WLp2GNed+VQNo2c4KLtiPwT/KUSgmQ4870IGGbVF+Qc8Ru5uONC5wrdSL85sVPFFtddNFnB/iCd6U+gXtQuIo4cvXiEJtifKlSZAyAoNbcINBB4xVFZyKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZT9Lk1ug; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZT9Lk1ug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52B1C4CEF1;
	Mon, 22 Dec 2025 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766421973;
	bh=eGWlOdWO2OflHLELXqOh3HmoOY0aEDSov4EGldITT7s=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=ZT9Lk1ugl6HerylMI7Ud1lZY2miJNzwnYdxepcNjf4F+1M1sK6QQwAJcM3tAws/6B
	 KahzoghgPNzH8TuZuQ5V6fRgTURhgEcjLQ3683tgxjIC8MqSsvIkcrmznlKwzDsLZ/
	 yfbGM7vbeGQkoVjX/h5IFGlbzTSQWazj78ijB/1sMiz3nn3IZSJuOqXGD1L0MmyK46
	 KyriNqoQsiYyNRXLQNovZGcTehEdyOfFJJC7MHNW1sXzhYQV4wndmMhPvlhDttW5Jt
	 BPWVHOC6S9tRQzx0w+Y6zS/X/AgjbL9V5FrDa1RvUAtvS22fZSM0Iin/qh5rr0dPUc
	 RjPT27voRHYMg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 17:46:05 +0100
Message-Id: <DF4WBS5EQVVK.3TS8CJ4XBVRNF@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/7] driver-core: rust: replace `kernel::c_str!` with
 C-Strings
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Tamir Duberstein" <tamird@gmail.com>
References: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
In-Reply-To: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>

On Mon Dec 22, 2025 at 1:35 PM CET, Tamir Duberstein wrote:

Applied to driver-core-testing, thanks!

> Tamir Duberstein (7):
>       rust: auxiliary: replace `kernel::c_str!` with C-Strings
>       rust: device: replace `kernel::c_str!` with C-Strings
>       rust: platform: replace `kernel::c_str!` with C-Strings

    [ Use kernel vertical import style; discard unrelated faux changes.
      - Danilo ]

>       rust: io: replace `kernel::c_str!` with C-Strings

    [ Use kernel vertical import style. - Danilo ]

>       rust: irq: replace `kernel::c_str!` with C-Strings
>       rust: debugfs: replace `kernel::c_str!` with C-Strings
>       samples: rust: debugfs: replace `kernel::c_str!` with C-Strings

@Tamir: Can you please send a separate patch for the faux bus?
