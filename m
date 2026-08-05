Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC363E5EEA
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934101; cv=none; b=jgdn5zNr26cqb6DORTwIqq1YND7e9FJeIhuSRQWRKAhNleCcOef3L5Z6tDrbLhT6ckzxnrNayJWcaJXWvVSsS3VQ9JWEFrcDqR/UznZeFcJhEO/7kKo6Ho8K4met3aWbiIUF8P99vVhQD02FZjVhmaLqfNvGNRNBZ1ZjLzZZFfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934101; c=relaxed/simple;
	bh=SQw5wqJFwZb9+0zuw80c7fOxyDd1YgrzzmH0o1R6z+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=adp+paH5xxeffGqsLqlY9IJDWwWLQi4HwUsXhsjCwx0YXyNW8y4BAzNcT/ozWkgpbU7c3LGw+zJllTLPiTemOgxSIgsztkK7nO5R32UoBjEMjSvjjuzyIprEBnDlAv89jWDDMT/c4FPnKur82ri8MOXilIUtRuH6Yj5R6B/m2lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEoN881B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEoN881B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FA91F000E9;
	Wed,  5 Aug 2026 12:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934098;
	bh=SQw5wqJFwZb9+0zuw80c7fOxyDd1YgrzzmH0o1R6z+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NEoN881Bb2Eytok25uNaf3v5d1aww3nNSu0rL95/IKTeS1/4B0/EIHvw6R0CN5ocA
	 56qx9v4mky4xNBT387bAadRnN4DNE9+9K99xqTpB5M2CYl6fyVO/7oVZYgkhBaBBRq
	 QgFbSXNdyaXnCOcEKAzCd/WhZQpPluQipKpQxs/JmDZhYN4whfh2qT2/hiXXByjZFp
	 rm80kA8ccyPWuMNGxPumlqRJIZZxbAkhVNB7cRusiNHBmtHf6eSN9kDqztsV7yDDzg
	 biFSiqydYa1aHqLrd96I5FAog/o3Ti49Gi2+aceyeSerP9em/1xvcUfAVmr+aq0o50
	 jYIJwP8dz02tQ==
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
Subject: Re: [PATCH v4 3/7] rust: time: add Delta::as_millis_ceil()
In-Reply-To: <20260722214951.72941-4-tomo@flapping.org>
References: <20260722214951.72941-1-tomo@flapping.org>
 <20260722214951.72941-4-tomo@flapping.org>
Date: Wed, 05 Aug 2026 14:47:14 +0200
Message-ID: <87wlu47mzx.fsf@t14s.mail-host-address-is-not-set>
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
> Add a ceiling variant, mirroring the existing as_micros_ceil() since
> the existing as_millis() truncates towards zero.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Won't this change hit the same bug you fixed in [1]?

Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/r/20260723120907.209643-1-tomo@flapping.org

