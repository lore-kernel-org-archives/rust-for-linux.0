Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BFF19343B
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Aug 2025 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756042153; cv=none; b=qZM7hrMWcThMH//6t20SVLrw/fRHEfZKvAaLzyAkgt6qRhOynAbv+szBBGrV86LFv/um4jhLfVQ0Wsql5+B5bvWwHEs7f4zrQSd+OzIUGd0TLoHdIJMdlnxMwHdKScuvOmhltZgMKHbdPb8b6bESm5VKFVtyY07izItezeQRlW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756042153; c=relaxed/simple;
	bh=Za5HcBGWgH59fgpcQngk4nJcZ1D4Mmel47j+ShPVRrM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Uw4u7xeXJymgS4aftUCabiAAHg3AxEPTEiHqc4quALuZz62ODC5ol0s6323ox4+gem2J0cmwVTEIofbAKfLzzQyQ+U+r102epZu895NMtOFknTFeMEX2bg1AIB5X83ndnK7+kLVvHrjxo1O+sAuV7bIHNzXO6QTS5/a0o40fnMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3J5NmeT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3J5NmeT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5B3C4CEEB;
	Sun, 24 Aug 2025 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756042153;
	bh=Za5HcBGWgH59fgpcQngk4nJcZ1D4Mmel47j+ShPVRrM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=h3J5NmeTAgHwCvms9IKXJOPBaphM0ZJfFYo2OtkdNt4eiIPFT1UGwn3I6sGWkvUot
	 xnQ9o6aEaaAyXbViHVnhBSgYxvinB7TMlMRQxKdnTSkLnMmRoHmWoan6S9nLbIJdJi
	 md6kzFhajZgKW608fuoeGZu6ljwvOBgQ3mRL/tnb9TbgDEkzb+EI6qJfMIv7w9jeit
	 bbyrxtgpboSj0alrAYNkiwHW0VBsPDu82Wc9W+mEzTPSTA24KmNb7qIWNgLG93YvAc
	 EnItGxPiMPtC5eglRnYW0UwTT9O7n6Gu3MQ+5MKUohFmd5DOEX6HvCAVolIdwpJM1K
	 zuIm0SPA+QuSA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 Aug 2025 15:29:07 +0200
Message-Id: <DCAOZLKAFK8Y.43MJ1XPUJ1OG@kernel.org>
Subject: Re: [PATCH] rust: alloc: add missing trait item MIN_ALIGN to
 Cmalloc
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-mm@kvack.org>, "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250824120656.208978-1-dakr@kernel.org>
 <CAH5fLgjkqcyzoZD7PP2i4g4r2uqpdbDKVW5hLfm6c9ysbxkPuw@mail.gmail.com>
 <DCAOH44U57K3.2CVDYWF8MJBWL@kernel.org>
 <DCAOREAIJOR9.2N5JW0SC9YT93@kernel.org>
In-Reply-To: <DCAOREAIJOR9.2N5JW0SC9YT93@kernel.org>

On Sun Aug 24, 2025 at 3:18 PM CEST, Danilo Krummrich wrote:
> In the end, just another argument for getting rid of allocator_test.rs. :=
)

Actually, I think it's better to just do it:

Miguel, mind if I just apply [1] and [2]? (Just recognizing, probably this =
was
your intention anyways?)

[1] https://lore.kernel.org/rust-for-linux/20250726180750.2735836-1-ojeda@k=
ernel.org/
[2] https://lore.kernel.org/rust-for-linux/20250816211900.2731720-1-ojeda@k=
ernel.org/
