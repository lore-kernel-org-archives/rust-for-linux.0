Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0F3C3F48
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867659; cv=none; b=lk12NhFG2xqdkXGTxjbkgQDkQsrtIGnEGZhA+YUcUEGqL1hsjvVkf8nzj3ENxYYj8okgPn7XcHkcbeS5H2nqOoBUJbQukgas+GsgH17S/ki9FTRjU6Zuss3MJESFJPcf6VzywI52tywadj9ivH3Fiw3LXUxwExAhwSq5nbQBma4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867659; c=relaxed/simple;
	bh=LYajA8kZQ0p52EF88mQr0Tn+/Qllleo2TFBDBmLZQu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ninSY5z6+9CZxjX16sCvNrOoCFMUUN+I2JJgeMP0fjZBq7z55Jt7lqDVNqMjyCXPWVfSVKIDGydLz3K9aavWFJfsRYdeVNOgP/qbTxwSAWeJRHU9dxi5xplkm8FBLw9x04HeIFNAnJ0DjstVbF1D8Vk02kk9rOgM757wXkjeVqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpfzdNrv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpfzdNrv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983B81F00A3A;
	Tue,  4 Aug 2026 18:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867658;
	bh=/PduEp27wIY0J4e11JElW/gGpP6kFUQI+EttmfZgyjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SpfzdNrvMYvSkrLxb0YuF/ZRzL9b+cRuPYN3jtJjAQI5gA56Hs5UzmBXE7cr4zrTI
	 sM6VhNZUP0PjOjHtEWVfCjuprLX3sLoDBtMGCWBl7cjigTG3NaT9JBcDMMlmWbHAf2
	 2ROA0jeeCFcOlKTFioqrVpSZx8OwqkWbJECeXY6z4AIaki1gzlk5ZLP7Woc7weVoLY
	 1KyMIgPaEGHok6uRh4gc1+ek5mnBmG63H97NZlqy3af5y0jbQ5ILb8Y7NFTDl/L4sK
	 HtL71HZKt+U20LGO33mfW9Rp+E9SJpBXUWe7nRsr1bwCoY8ZfVapvZcY5/iEZQp1BS
	 9Z36YCkB/jE7g==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id A5708F40067;
	Tue,  4 Aug 2026 14:20:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 04 Aug 2026 14:20:56 -0400
X-ME-Sender: <xms:iC1yalXE1fRO00dAI6cttTKDuRYUKWB_7sxtmAY9AnLiEI0fAhYivw>
    <xme:iC1yakF-LyGevfcaQsyhPjTveiXskxc5EBx5PFlcYdVx6QaBI1VpKW5f5wHg8BDuZ
    _V3cAzOg7xiuQ6zASOV33BzhyvKwthKN56msnfjSgwt_b3_rPoBXQ>
X-ME-Received: <xmr:iC1yas5msSyZVJSiIIOcrAgy9BnVh03RRlxw3ydmXgUyAtbNrfQeskzZFSQfqv47adyjkj4axdD_rtF-Padvdg_SJNBw0Vsa>
X-ME-Proxy-Cause: dmFkZTF88Mc2L+3qgCfuKlvkcoLsGwfg6svuMZpW6APYO+8Wl7OLIXhCq/ZIPbADoh72w6
    eRD+H+0dPNMH4XO7YYYn2IRxmZK1peA55Q2jUWl8zG1q9TM5vf2bb2P0cY+w2gAfPJb1lb
    KBjjnW4o3xtDGmbLoH8oRUKB1R97qq6viYSoMGlT+tsvh/7lzFe3Itv0wio+Ml7DqwRMbF
    maiP9tz9wYtpFzgVvSrBVwuWF+zfH5/nkon3c6zpdVdGg3YevRUMj9q3hg3FwrK1d8N4si
    HkOUDmDbUOymQviExmE4Vhzul5y7Z+MufN7Joio0DQctKkT8eYh4gwUjE2ZecbPF/la6Cq
    PNCo41v6TqQCc69aqoKD+2TagJA5vchhmtKrmCun6Cy/9wz1owDLEkZE2ZVIyIzKrdLKFf
    COkYoxd+4HsIu5jIFV/OxklFrUzaaJC11o53rQ9LHdhBwv2LrW3E1+EpP0EpY8vju5wbV0
    KO3SayG/AyEPdkiwpCX3FyvJk7gC/X4F2e3z/puDGdwIS5fHKjlgFU/5uInCSrB/Ei3i0r
    UwiKLIk/XHNrWfOC+z0HS207RnnLocpl9xGj6fl34w+ahP8H8c4bAGn7NswJj10YcM1bJ7
    mX1d8uX+TrMd9QPMyRPB4LHHnxveBso/NcEARq5gFpJkgQuGTrdJz4oGq75w
X-ME-Proxy: <xmx:iC1yaidtSbbx2z0IZ1hb_zjah1ko9AL9Iqpbf7FetHcLmrOaBNY7TQ>
    <xmx:iC1yaokDKUhKk6bB9OM_xpE06Aopy6y76UI_2LYqAd8ewq_B441A3w>
    <xmx:iC1yan8oq-ULeU00uu62h9_JmgzCXT8hKfGE8UBf4NHeBBrRMSi9WA>
    <xmx:iC1yauFsi45BnQ4hZ2JVQHprJ5yphXO3pvEAV8MuK5EyQ8623KuIWQ>
    <xmx:iC1yarIhYh8RfsDdv9tjayWPM1Yl11F6-eBNE9_wfDSsD_KpCQKnQS-c>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 14:20:55 -0400 (EDT)
Date: Tue, 4 Aug 2026 11:20:54 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 05/17] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <anIthlmR0SC5Y8GE@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-6-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804161447.84806-6-boqun@kernel.org>

On Tue, Aug 04, 2026 at 09:14:27AM -0700, Boqun Feng wrote:
[...]
> +static __always_inline bool _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
> +	__cond_acquires(true, lock)
> +{
> +	local_interrupt_disable();
> +	if (_raw_spin_trylock(lock)) {
> +		spin_acquire(&lock->dep_map, 0, 1, _RET_IP_);

This spin_acquire() needs to be removed as spotted by sashiko.

Regards,
Boqun

> +		return true;
> +	}
> +	local_interrupt_enable();
> +	return false;
> +}
> +
[...]
