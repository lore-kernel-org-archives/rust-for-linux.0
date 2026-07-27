Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF303E7173;
	Mon, 27 Jul 2026 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143127; cv=none; b=nukH/K0P9gzSeddKXiV3ycCIbIQ5JfW0S7e6EwaTWF1lBSJTPV1zArAYI0+2v9169ix3ObRtrELDmJMIanRjmE6znOTc2OBVGiif5q1B14UU2G/IA6or71d47qwmtDjQqGta4pcvOBY4i9OV6zxqYrLqh+u3Tu910X6lbUBgV2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143127; c=relaxed/simple;
	bh=jlHvCgsFY+jZZ7IF2HIiQH7RhMSnKl/GPkYcQZ2fSzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b7nY+U9wyvHSrISzr9fDgdXiF0rELzalT/U0gQ13AJ+MK3Sy3OBl67OsHGd+mKKISZjdhuqy24IGi0tDb2WhxZl1ewxexaBbAKtnhoDj17JmEjKQ/BasKzKmUxzQJrX471imwKvYL177qMEIh4p7xJj9SQLlFNRZK3cjR7mo4ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Za76bgXh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Za76bgXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785143117;
	bh=jlHvCgsFY+jZZ7IF2HIiQH7RhMSnKl/GPkYcQZ2fSzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Za76bgXha4WNY4hZdEOnPn7nrVo/Pa9/4PpNZAmCxpcAM00e1zK5TtC5bh1JdUjFa
	 Uo1OAgB5HCzdv+tdIRpn7LVDF5rb8cDp31OZAZtM6OuWnWa9qVkadTvmBnWCoyyoLB
	 rTzU7udeZVkYBmeGTDLI2+NlfVjADXhmwcHd9Fw/CzMTCHcZC0ZbhhQU6QWxzkAohF
	 dRr8KZmj7soVFaYrVWw8JEqyJTTZpUCM7+xhpe3TW53NAmLDBa6E3vYhKiGho//nNd
	 Vxe5ErN8kUJCKcaauPGhIHN3tm1OcCBk4oobpvYL9s0YHSEKK5Y4f6/SQ3eEiq8QCi
	 crgYFNRIIO7BQ==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E01D417E022A;
	Mon, 27 Jul 2026 11:05:16 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: dakr@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	airlied@gmail.com,
	aliceryhl@google.com,
	beata.michalska@arm.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	daniel.almeida@collabora.com,
	deborah.brouwer@collabora.com,
	dri-devel@lists.freedesktop.org,
	gary@garyguo.net,
	kernel@collabora.com,
	laura.nao@collabora.com,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	simona@ffwll.ch,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: [PATCH 1/2] drm/tyr: add Wait type for GPU events
Date: Mon, 27 Jul 2026 11:04:50 +0200
Message-Id: <20260727090450.16462-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <DK4CW8JXVL8M.2KKRMJVCD9AYO@kernel.org>
References: <DK4CW8JXVL8M.2KKRMJVCD9AYO@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Danilo,

On 7/21/26 17:32, Danilo Krummrich wrote:
> On Tue Jul 21, 2026 at 5:14 PM CEST, Laura Nao wrote:
>> +/// A convenience type to wait for GPU events.
>> +///
>> +/// Wraps a [`CondVar`] and [`Mutex`] pair. The mutex synchronizes predicate checks
>> +/// with wait/wake operations; the condvar provides the sleep/wake mechanism.
>> +#[pin_data]
>> +pub(crate) struct Wait {
>> +    /// The actual wait/signal mechanism.
>> +    #[pin]
>> +    cond: CondVar,
>> +    /// Synchronizes waiters with notifications.
>> +    #[pin]
>> +    lock: Mutex<()>,
>> +}
>
> This is backwards; if I get this right at a quick glance it is basically abusing
> CondVar to implement a WaitQueue abstraction in your driver.
>
> What you actually seem to look for is a proper WaitQueue abstraction, which
> could then also be used to simplify the implementation of CondVar.
>
> I'm already working on a WaitQueue abstraction, since I need it elsewhere. I can
> probably post something in a few days.
>
> (I didn't check your use-case but you may want to consider completions and
> simple waitqueue as well.)

I noticed the WaitQueue abstraction has now been sent on the ML [1]. 
I'll start reworking this series to work on top of that.

Thanks for the feedback/pointers!

Best,
Laura

[1] https://lore.kernel.org/rust-for-linux/20260726223613.1242940-1-dakr@kernel.org/
