Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B1840861E;
	Wed, 12 Aug 2026 22:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786572770; cv=none; b=gnvKBaRYaxRh5cqMTyFoBDgcodmzJAriPeFu8DpaEzgdgfNEWAE+LJ+NzOyKY1fg/dxW6f9u8TSzDY+zNEqOlptoSBc8epfFDBFgeeKIoHZK6UEtn671iBKUKkio/y5bQAJ8GJ8MGAyDKkAocsi8HaFr2FP8o0M1RuMhu323R2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786572770; c=relaxed/simple;
	bh=N9+gZ4TkQHwnmYCBAqTmXp3nBUZMcCZXzYw0myj4R8c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=dXmoN9pytxJefcGo36/JtmH2hhMSeersItBEG/r7nhv7A8v3pk/CkbUJjCfh2j0GZk+jSdETo5IizMZ739wUpt0Liys4DGQdmt5cgR0+2uTtkxdkfZizcdUIeYWnZfg0pj3vTAUSkdBG+reI7GvqT3BGn5ieT8EAylVzMQrVvMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P644Nls0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P644Nls0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F771F00A3A;
	Wed, 12 Aug 2026 22:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786572769;
	bh=N9+gZ4TkQHwnmYCBAqTmXp3nBUZMcCZXzYw0myj4R8c=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=P644Nls0Do/32PGE/bbOpoFaQrD1sE8w5VrcTzxQEfQT7P9zOrIlY0BaYTdNesgb7
	 gmZCUY2uCpm1Wn7i564t34i+Ni8162dNjJtMyflPQgIsgVd/f2jw74fcEk/Ev+xscS
	 /todQ7pLPtV9giSHPWvW0O5EgjIG/01NJY9+SO7wR0KggzuXbp2cvCO9ag7GSVYPwZ
	 FrBHHgC6Hp4U33basSH02k55Prfs6o1PZK21/aAoylIG3YEJyQyD1Fcn4EdYGlMs7J
	 coZ4MT/c/xPmzq7cdhuo0JW8ZkkLJJ3htF2Fg8BhQKt6Pv8CkxPFypK14Y2EBMbWYz
	 mRoH+YmIEdFCA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 00:12:45 +0200
Message-Id: <DKNB6TU3BKUL.2ZELJAMKX3FK6@kernel.org>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <aliceryhl@google.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 3/3] drm/tyr: add GPU reset infrastructure
References: <20260708114358.957305-1-work@onurozkan.dev>
 <20260708114358.957305-4-work@onurozkan.dev>
 <D388C501-9903-44A7-BFD9-3BFD91502FAC@collabora.com>
 <DKLM34SJR4GR.11ABPWKZJSTK8@kernel.org>
 <8BA7474C-3D1B-4C61-89B7-156A98AB63EE@collabora.com>
In-Reply-To: <8BA7474C-3D1B-4C61-89B7-156A98AB63EE@collabora.com>

On Tue Aug 11, 2026 at 11:47 PM CEST, Daniel Almeida wrote:
> We have a lot of places in our downstream driver where it's not really cl=
ear
> whether an &IoMem<'bound> and etc will be available.
>
> E.g.: places like the submit path or the async vm_bind path, both invoked=
 from
> the JobQueue, which runs on its own workqueue in our downstream implement=
ation.
>
> i.e. when the JobQueue calls the driver's "submit to hardware" handler, T=
yr needs an
> IoMem to perform the mapping in the vm_bind case, or to write the doorbel=
l
> register in the submit case. Also places using delayed work, which is sti=
ll
> restricted to 'static workqueues IIUC.
>
> That's what I meant by "Devres we will eventually need in the future". Pe=
rhaps
> there is a plan to relax the 'static requirement like what happened recen=
tly to
> the IRQ code? Because otherwise my suggestion would be try_access().

Yes, all driver API primitives will properly support this. Having to use
try_access() would be an indicator that something is wrong and we should
probably just remove it.

For instance, workqueue is already being addressed with scoped variants [1]=
;
JobQueue should not have an unbounded lifetime either.

[1] https://lore.kernel.org/all/20260807165252.3849875-1-dakr@kernel.org/
