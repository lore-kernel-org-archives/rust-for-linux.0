Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116B327E1DC
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464602; cv=none; b=YhYCAzQ6vtumgwGs1uiWVxQ4aAQuWR06R84ZI+Uy48JHeJjIIYEDWU6qB2q7ZNdVLUTLo+xVNKPoDrkOiXIG7BosQsQLg/9FNH0AbRydW/ADCJV1wF51MlvN64g54LLPfsjwLqo1ZIO6eREOB02YacbJ1R8wxHd6IjI2TTP4pGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464602; c=relaxed/simple;
	bh=0RF/b45Eh5A4GLj7mHxT6rql0iVH4AcT3x7MQDPVSYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p23eiiQvQlsrbYVpT/elzgCBFwqN6hdsXj1miYmMczWFFzOLf0veamYjrT9UvjK/+t3J3pl+4sbEOKlSQlmouIU+LapKbz6nlvgO0SWFAKu232t6n5BNAuW/ukR+bln/YBFn9TLIH87kI1ShBGSaJcYeJ7AmVb3edezhfoyTpTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipVw8qxS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipVw8qxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C611F00893;
	Thu,  8 Oct 2026 13:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791464600;
	bh=0RF/b45Eh5A4GLj7mHxT6rql0iVH4AcT3x7MQDPVSYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ipVw8qxSRnyQq+QyMZBCuZXJRv0TYaErJbRyPY9N0ofL5Gx/R4rauCkmTuBjaDOvl
	 RPQ0aw0yP60x8aAyX+bbw5auykBFUqsE33oZ6C1EJ/p320tdLifreKKiThSw4/2T/P
	 TXtYBHAteNqkipHeL7ypKkUUkax2JFC5BLvpQ7p60pmfKy8kj6XgAzTv0uyMvDcIB8
	 yTUabILnDV1EJUabtbOHqQjbYfwW3UoTDHqLGsrFpZgD2a4upnwcdtCinaF5R+r6c1
	 9aKvmJQ6Nl/tQX0XbM1LcI1e/S8PVr7x32cS30yLIIoCRan3qCahb2nuZgkarKtw9M
	 gw+DPzdu5g5zw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tj@kernel.org, tkjos@android.com
Cc: acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, jiangshanlai@gmail.com,
 markus.probst@posteo.de, FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v8 0/4] rust: use Delta instead of raw jiffies for
 timeouts and delays
In-Reply-To: <20261002050428.2746277-1-tomo@flapping.org>
References: <uhEZnSETYdRTGg0YbynELBmOxAIhnGrslFSPb14RUm57hPflUhCWVyZ6zzbLwhu6_fx6hv9DSrHnMCGE3v4sIQ==@protonmail.internalid>
 <20261002050428.2746277-1-tomo@flapping.org>
Date: Thu, 08 Oct 2026 14:57:04 +0200
Message-ID: <871pa0e4f3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> CondVar::wait_interruptible_timeout() and Queue::enqueue_delayed() use
> a raw jiffies count (a plain c_ulong alias with no type safety).
> Callers have to know on their own that the value means jiffies and
> convert to/from it themselves, which is easy to get wrong (e.g.
> passing a millisecond value where a jiffies value is expected).
>
> Both APIs just take a span of time, so they can use Delta<Jiffy>
> instead. The condvar patch also updates binder's ioctl_freeze(), the
> only caller of wait_interruptible_timeout().
>
> This series is based on timekeeping-next, because the binder change
> uses Delta::to_jiffies_timeout(). The workqueue patch conflicts with
> Danilo's workqueue series [1], which also changes the signature of
> enqueue_delayed(). The conflict is trivial.
>
> Binder and workqueue maintainers, could you take a look at the changes
> to your code? Andreas and Boqun, which tree should this series go
> through?
>

For the future, I would prefer if you can submit timekeeping changes as
a separate series.

Best regards,
Andreas Hindborg



