Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC223378806;
	Fri, 22 May 2026 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455753; cv=none; b=d6lUqn/SlrZb8+TT5qDBjRQZUmgf4Jj484ixdAfvE+bv2MpxH7iKHlgs4xY70Wzd/S5FhGh9mWwx1JOKzEyAMP6UuB0ubk7u7QTM/1AwvhLga8U1QarakasvrSm2IwieWGkko0N7KJVzanhAbJucJtxgR0GF1XklMWUbJkbVB0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455753; c=relaxed/simple;
	bh=rXfV09mhDyDE+1JjZfhLea2jPTvUiLMvDhjxdWXoJKg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EcxIuKneEEmjUl23BB/zoBRNi6UdAcIvEbTLQZD4VpI+oShGPwb6Up1oaIGQg9QZu08Kwf5in50b8U5M9KIQs3NRGSIuA7CZWFF0CqIVad9vROD9ZW3+JDZ10r/aD3/RrnnLU7n1dU5XMUlos+ZLOk5J2d1VHWZwAHOcogetH6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0BHXs8Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0BHXs8Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C861F000E9;
	Fri, 22 May 2026 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779455752;
	bh=xQ4yRsEwOBUMoyE+o8GXCAilCBHWE5IwtdUnvhr+NZk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=A0BHXs8YnUQLMdX3QCiiIEbZrQxQhweS17IscTbAINLm6RUFe2WJMFEiRith6r9Op
	 D1X+ms4+6HF6ozpFuJxdaAU3eeTMelJnQLuf4jzqchbTi0mBgHeDUJQQyLCWxc5UiM
	 ErJD8y3atsawsr3Yr+jNEovLKMMHGUaN0tAV2RtMOkyjUVN8CxS/uVMT0jQl+x48TU
	 aucnGDljrUMFXPLF6r7Yw3sVGk+l15YNlA8lLuomMWk8xC9uUX/XmjsBJnhXpxwNA+
	 bkqrEbE9Wn6HoDz0hVGN3ynY8lY/ppHtI6gj0aH2tVPUgvtRAk91JZl4krruOKV16m
	 dFdmU7fWzMJcA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 15:15:48 +0200
Message-Id: <DIP8F1CLYQ27.11XC6BW3Y3WGP@kernel.org>
Subject: Re: [PATCH v1] rust: workqueue: add cancel_sync support
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <peterz@infradead.org>,
 <fujita.tomonori@gmail.com>, <tamird@kernel.org>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260510082211.207450-1-work@onurozkan.dev>
In-Reply-To: <20260510082211.207450-1-work@onurozkan.dev>

On Sun May 10, 2026 at 10:21 AM CEST, Onur =C3=96zkan wrote:
> Drivers can use this during teardown to cancel pending work and wait for
> running work to finish before dropping related resources.

If you need this for driver teardown and the work uses device resources, yo=
u
should rather create a new type of work that internally synchronizes with d=
river
unbind.

This also allows you to provide a &Device<Bound> within the work function i=
tself
directly.

Instead you now have to fall back to unsafe code in your work callback
implementation making it a driver responsibility to call cancel_sync() at t=
he
correct point of time:

	// SAFETY: `Controller` is part of driver-private data and only exists
	// while the platform device is bound.
	let pdev =3D unsafe { self.pdev.as_ref().as_bound() };

I already mentioned this a couple of times in the past that we want "manage=
d"
work for drivers for this exact reason.

More in general, please don't use Device::as_bound() from driver code; if i=
t is
needed it implies a design issue or that we're missing a proper solution.
