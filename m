Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547D3AE187
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361400; cv=none; b=DQzP/GRNHzZFQ5+MxvGFllNsvjiXS7De3ldFmqAP+2oHgrr9G7nofjCa4bzvd/H84anYDigmJStx8yeGLAwXgGOufAtw6aHBT4jg+QMa47kAm197WBOgyeakQQc9sArVHnZetmPFQ8YNeQq2eNAUSPE7+H5GuSJxeaKLNJwbURI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361400; c=relaxed/simple;
	bh=VYoEpXHKUZRsTUqL4nEd+IYDhojgUj7sYojSRlwTuTY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YHyi59apt3bxcGawQwrAvJzSVpv2bn0gZnh2XEuDoeYcSD7HUUbdBWSm7/MBtPGM142gwQkyfmpvkUdCHGW2DT2rYooSaTVLAaJZz8v5oc7eCQVu5OxLITz/zoIeF+8rC8VG9T4GBc9mJ8lPjsVKkcTDdUVyiLuJPKbc3AjaeTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6vg38Aa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6vg38Aa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A6D1F00A3A;
	Mon, 10 Aug 2026 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361399;
	bh=VYoEpXHKUZRsTUqL4nEd+IYDhojgUj7sYojSRlwTuTY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=I6vg38AakKOybEoF6baI4rykxcjALptf9EO79PwmefNCqu/DnmxTPcSFDFNDPNTWa
	 6okJ80W8xe5YgummQnF12RI0KSzBfoBS1drfKGed/Dam+iVZocBQZEaJ0dLF4JVPZ/
	 4Q5K3eTyQoMsOEaOplvi+hkkQyIcJwyryC6Bl8ibGxAH0S1JMvK6MxXIUc9iLyJ7Qj
	 bIQlVfRQjmygZWG+4tl1JFcB7It6KNUWdkee3c6cAKkVz66R2Vn7akP5imRqsxWMlA
	 s5wZLKGJKgv1ZXemdzrjR/Py+YL8G+7BKSEmQ/tgSs10jod9LxOtkJpa2yqiCuyFlZ
	 gl1hGozj6numg==
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
Subject: Re: [PATCH v6 4/7] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
In-Reply-To: <20260808062839.1159990-5-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
 <20260808062839.1159990-5-tomo@flapping.org>
Date: Mon, 10 Aug 2026 13:27:19 +0200
Message-ID: <87y0ee1ai0.fsf@kernel.org>
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
> Add Delta<Nsec>::to_jiffies_timeout() conversion that rounds up so the
> resulting timeout is never shorter than the requested span, clamps a
> negative span to an immediate timeout, and saturates an overlong span
> to the kernel's MAX_JIFFY_OFFSET "wait forever" value.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg


