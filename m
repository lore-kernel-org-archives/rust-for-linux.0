Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487728;
	b=nnTV1mmFuvz6+ynS3AoSt4AsqS09pdSANXogICr5toJuHV+WvK5uqBilGIZ3XyCQBl45
	 mvhQv/aFQ7rcCHHMLj/aQELtuii4lWAnLuq29NUfe0IOe0ytrsRFK9O1eQRwEigbzT5Ku
	 KKK9K8hoiiDQswZm3gUncNGopRIlwWWyW4GIKsKOa1xEd8B7WaLv0atIG/6STgT6JC/Mn
	 tIUMWa/cf/fjWxUuDLx7oA2ehC82BH9AFp1mngK80wcV7FP2iTWWS+SWYFecD8tgh3a1R
	 8kPx3ZNmTok7fJVwQE8n0Z7lZmlmkZK/0hVdVfW1vI+xxxCueH+e6vqIxGoR19HEJNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487728;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=iaCiw9km+X2FYgMmAETwu1fup6e4I8afcx7maRDDRZ0=;
	b=a+uoH3nBE7GOcsjRvyo66NefydDb9U9uZXHV0Iiqni4O6j8cj32u+HRCS5JHKe3Jw/vO
	 cBDZk3SBlyeD95nQKIkJVwP/go/yvEecQO2vMxj5p9mIBlz5oKMGukNsRMNN0C9PQ/Y0m
	 aFdaBv49uLz4QMM84vxyx//x6rX3NouCqI3gyvy8+lSPcHzQg8O1NAs8sx7RWyCQjkSh8
	 GeNyR7jWyHm6QZdyy1wfZNlAKE8nPB2qmSRILaQ7z/knDkJIPyoh+m39H4LMAuVZdhoSy
	 e3SyVglbyOaeEfO7sOEier6g/PjYslVeTzeRbtexfKiEWezIXBcBi4KX4XAnOGbeKqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLEFUdC6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED8606A321
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLEFUdC6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D3C1F00A07;
	Thu, 12 Nov 2026 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794487728;
	bh=iaCiw9km+X2FYgMmAETwu1fup6e4I8afcx7maRDDRZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JLEFUdC6NwX9YXhg0oBygnYusvwfBdDpwKsiz4Ixxj5C92sf7OmIszJqauIVV4HqD
	 CwyxRSG8bVYUZOpYCkOmbAvh+ROTPlHgcuf+R5rJ8sLnkZxAeDHf4W3J8EMlEKnJpT
	 +FNumngBnWymHPaC7Ufu3EuVz1m9EdRl+laQ0ZGtLWBfDkA6alLsWh4w1LxqlQfSbX
	 h3kwiUk2sVdY0CAe1MkOOi6NaK570wHWDIrLnfDIjqa3TB3g3QLOy5tDmjuAf3J9Lb
	 n6mbjPXcq4mXiOuLcn8/kNlDREJSKn1VkJYFtBYWwrsvaYN6V3SuGcuuQueQaV+yqd
	 dodc+0wVLUP8Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: boqun@kernel.org, ojeda@kernel.org, FUJITA Tomonori <tomo@flapping.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com, 
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
 lossin@kernel.org, lyude@redhat.com, mike@fireburn.co.uk, sboyd@kernel.org, 
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
 rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20261031003334.4161188-1-tomo@flapping.org>
References: <20261031003334.4161188-1-tomo@flapping.org>
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
Message-Id: <179448764508.621816.5100401862628319827.b4-ty@b4>
Date: Thu, 12 Nov 2026 13:47:25 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Sat, 31 Oct 2026 09:33:32 +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Mike's series added a free function `ktime_get_real_seconds()` [1].
> Andreas and Boqun preferred a seconds based `Instant` instead. This
> series does that.
> 
> 1/2 adds a unit type parameter to `Instant`, with no functional change.
> 2/2 adds the `Sec` unit and `ClockId::ktime_get_seconds()`.
> `Instant<C, Sec>` has only `now()` and `as_secs()`; there is no
> `Delta<Sec>`.
> 
> [...]

Applied, thanks!

[1/2] rust: time: make Instant generic over the time unit
      commit: 52e953331adb68ea0f8173eacd421f8f88843c36
[2/2] rust: time: add Instant in seconds
      commit: 093d14cf49d4f33466ec41f6e7b28f365c75624a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


