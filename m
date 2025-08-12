Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04EA2D6E6E;
	Tue, 12 Aug 2025 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985961; cv=none; b=JISHl5r7K6ptwni9zWY9HDsMKPSB0A2W5mPsbTTQR4xi36D3YH42eXJtRpTVmUjE3+h6c18KoQEJI0UXVwxIMEAqenF+WPAYqadtL0WUXdtlq23ciHm5CVP4AUj/gOwH0LyqyyQ1wzbbDJvtoqcu9t84POsN+/GKjuwGJp2tNJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985961; c=relaxed/simple;
	bh=5DpB1j/jjDtQv09u4mMfcNessE849li59iNJC0nJX5k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=t2WT2X0skDi11ecjHt49hq6eVogIiiXK+UZB/LvOoij7HOu2WYRtm7Bk7PMXpU13UNTZEDOa4c4y2Tkkt2zQatC02TmlZpfyse2ndLxA1BXKuvrHxuLUKzouR7wEHgi0yxf2N2r1ipemleuEzYerksEL8v1K7mHsIgYHMrCdZ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efxkhYBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efxkhYBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE3FC4CEF0;
	Tue, 12 Aug 2025 08:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754985959;
	bh=5DpB1j/jjDtQv09u4mMfcNessE849li59iNJC0nJX5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efxkhYBx+bTd0OVA2m5bYYxoikgZjzv1kduRKgsI6EU066GKfQT5pQ+Muv2+/3Y+g
	 S3KzeO06BLtKYwOJK2CmkirRrfNsB5Nscq6woJ3bJwoAd+6PiIsAhlQ1TM9e1jG7sd
	 xA5+suaAA4+Yu1/1NdDNCjIDSxn53QpxqXY3X6UnMEA7c04d+jIP8xCS/xOb6FY68q
	 tneT0Vku0uevWSWPFAunoRxYKz8UQNrzN1P4IVn5j3lJ/KUHlBaKwHecsDBM2UggmT
	 XoXt4kbGq67UYGbG8nl31qEioWKtEjV30gIHBP7eRiMVVIWKfIgt8HjJ8+wmZn2lLh
	 M5DMI/tP/U/0A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 10:05:55 +0200
Message-Id: <DC0ALLZU4B8V.31REA4LHMQ6JL@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] rust: sync: clean up LockClassKey and its docs
X-Mailer: aerc 0.20.1
References: <20250728-lock-class-key-cleanup-v2-0-ad02b80c69e1@google.com>
 <20250728-lock-class-key-cleanup-v2-2-ad02b80c69e1@google.com>
In-Reply-To: <20250728-lock-class-key-cleanup-v2-2-ad02b80c69e1@google.com>

On Mon Jul 28, 2025 at 11:42 AM CEST, Alice Ryhl wrote:
> Several aspects of the code and documentation for this type is
> incomplete. Also several things are hidden from the docs. Thus, clean it
> up and make it easier to read the rendered html docs.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/sync.rs | 55 ++++++++++++++++++++++++++++++++++++++---------=
------
>  1 file changed, 40 insertions(+), 15 deletions(-)
