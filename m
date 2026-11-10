Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298078;
	b=uOFzGVREU7mUvzySnaRPUXB9DDm9gNu1GdBwaqkldHDuT+c/+Xg76O4V6x9enlxApGRL
	 pnoRRAuO5vr8QlgyXZEEygz66TtyMLGeTcqp8o41vL+Xkvtv0Mt7S5VPwF7G20P22859w
	 Iy4o8YoGLnxQ227OzGugWgh0p7ZUY2Uuj2O9pILV7KBfG2oJcDVczWm1QTj1LghcJr7lS
	 sCkXU9r1mZFFCNpp2zqVcK4Y7n11731WeILruG8yJWtqBVfJ8yiLoCiJL6DdWWZ5unf0c
	 k79TWvm9j/nGq3k16RHNdS/zggV/5n3L3O55r8wMtnZ/2B0eZIoj0tBh4QFMsGsHloQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298078;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=bIQ1XGg/Lq1ppVRS0y1xt4VLyyU3xPEc9jxagqiKYNI=;
	b=bEC9TI5eMCJBxnuCKuR8KHH/ApuQhb1dX8plv5dIOCgILNnvElaLcLMVIjMzxAeCrl7A
	 KCTkMhXkVrlaA2HMbjrfEOxVKG8LmJmLkx9uSPaHa5xHlvYPEu3/Ckg+STSOcphtgLE0t
	 CnTrcU40c+b4ve/dhYnN0A35EqCf2hhB4KT56lnI+6MXxKuntEdGjqFWqszWD80CfUpor
	 TTMZMj1ENuTl35N7vC2ZXr5LcN8LdTGGWE0GXfCCsWNdpdL04FK3RB0OhpnMT+4EV2Q5g
	 uwYY1YYp1JYZ+gpt+jxDZpaIz98SPkzHQQY953aeHnEB8/p8mJWr78pvt7tzA4ZPyag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDBb6M+r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A35C606A31C;
	Tue, 10 Nov 2026 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDBb6M+r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CF81F0089F;
	Tue, 10 Nov 2026 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298077;
	bh=bIQ1XGg/Lq1ppVRS0y1xt4VLyyU3xPEc9jxagqiKYNI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=aDBb6M+rqnzZ1hzeDzZg0e7bL6DaJ1PzD8qB3eb+JZLNJARUnhI8Zqz3z+twgexGx
	 PujYgg/p1ZLrf25Dt2TrDlvXo6SlgcZLdHrbn4VmWwX+FjPkKF4DDjJ7SItxZd8/5q
	 uoxebaznGXXlcJKbA3ef4VO5uscEw+3bk1ck/pdr112hhq9VK19wv7DZd3OZ/YEHmF
	 uqftyPowKnQ/HZNWh/Ub3jElQShL6pzLK/nuqk6zAWLXan7Albh5p6epk3eq7tc++u
	 5feiWVNUzA07NritRAmrhBYByVDz9YhChWAC35jPr5dUQtFLRTHxeNryRCpUccQUDy
	 00EENENDLqjkg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: tomo@flapping.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, boqun@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: time: implement `Display` for `Delta`
In-Reply-To: <20261110.075758.247487148810717068.tomo@flapping.org>
References: <20261103-time-delta-display-v2-1-b01b1fe9ff9f@kernel.org>
 <I_BPRv0XwpoRCf2AG4Ot12JnHyqvdM9lb_wF0sZMixc0UIoaBb-aeNWYuff1oe4_X1m5SpCTcZp9woOg-dt9Eg==@protonmail.internalid>
 <20261104.180854.547774168466136920.tomo@flapping.org>
 <8733tgnc41.fsf@t14s.mail-host-address-is-not-set>
 <20261110.075758.247487148810717068.tomo@flapping.org>
Date: Tue, 10 Nov 2026 08:44:41 +0100
Message-ID: <87se19qgeu.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Wed, 04 Nov 2026 11:07:42 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> We can also change it to be a `Debug` implementation. I was not aware
>> about the stability requirement. But I guess that is mostly a user space
>> thing? In the kernel we can change stuff as we see fit, as long as we do
>> not interfere with the uapi.
>
> Right, in the kernel we can change the format as needed.
>
> Still, I think it is easier for users if the kernel crate follows some
> rule about when to implement Display and when to implement Debug.
>
> As Miguel's suggestions in v1 show (12_345ns, 12.345ms, 12.3ms), Delta
> does not have a single obvious format. In the kernel crate, other
> types with a unit, Hertz, MicroVolt and MicroWatt, implement only
> Debug, not Display. Display for Delta would be the first exception.
>
> So I would prefer Debug.

Ok, I can respin it as Debug.

>
> Maybe we should also write such a rule down in
> Documentation/rust/coding-guidelines.rst.

Good idea, I suggest you submit a patch, then general discussion can
happen in that thread.

Best regards,
Andreas Hindborg



