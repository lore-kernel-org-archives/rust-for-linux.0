Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B5E3D524C
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785958887; cv=none; b=bPmGBZDO96o2bbp01m/F8XRJPtP0Du3pXzenyupjdCT4DVjwS7hBu9uZGdKcfsaZevUZ4KVF5XUIbJvnnH6QTnzGoEmdfwkhKF9as6lOAZNwraGTgLGDlEf2h+bo6ASb+m3g3eIwvG+QjDIUgRBlNh1DikoM5S3ilKgbSjP/tG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785958887; c=relaxed/simple;
	bh=CI5n2jYK0hLxHj7mNWLoHp/QJtN9eTDlanQ11Coux4M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SyB8Ou2RMESW67oMPn5kpcCMZTB1yeG5llPg9sgsYuZROp+AhYdj7l1qkkI75cGJlqk4FDa37eCywab/dlmCIT6ErtJsneO/y7jRm21NbtDolKtjXfMk71VuJRYLfY7eeVtwbpWW0d3E76qBm5a0Ooj5FRx1q+O5Fni3G+AS6ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiNUCH2a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiNUCH2a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6517D1F000E9;
	Wed,  5 Aug 2026 19:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785958885;
	bh=CI5n2jYK0hLxHj7mNWLoHp/QJtN9eTDlanQ11Coux4M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KiNUCH2adqxKWIuNOjnz1WfnZIOVgC79ldgs5wkatB/y2suQg3RMjf7f4PkL12ZNW
	 SeheKrcMB5CakJOwlzsrgGj3kBUBvCdthDPGpkPyCAh5XWaLOeD3nivELGP6MQGLlX
	 3HPHxFAA5nG/WIKEVD+6bbAj2lYd6MPgqYjT1I/bSHZJ6YkQgAh7qqrEIcXr+PJghR
	 vBDd8CDPrnn0uFlvmm64sc+/WIg/GR5rH719Lz51fbXXz6xwikcbhFh3AcoMLGasCD
	 th6dLnFPOpnIWW0Q9DuHB/twKwXGt1QDeMoAYuHHg48ou+SkJjz6ZOYX6FyhHCXGyD
	 Q5ZIIRG6UZ9IA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 0/7] rust: use Delta instead of raw jiffies for
 timeouts and delays
In-Reply-To: <CANiq72m5ZWTAs8XXfPYkEfDj9CT4_N7ZShXSj33WqcWwNV=NWA@mail.gmail.com>
References: <20260722214951.72941-1-tomo@flapping.org>
 <DKBXI6A044JX.3OXFT3R8DIK2K@garyguo.net>
 <FenzX1BbXwDwhxl2RJ8sf7OnFwsAi3prmxcHhYKtfyXwJ_l88xtj5rr-z8T90Dqj1Em0RGPwvxQNqlo0pl2e8A==@protonmail.internalid>
 <20260731.224825.536098581345512332.tomo@flapping.org>
 <87v79o7myg.fsf@t14s.mail-host-address-is-not-set>
 <DKH2NGL7W29L.2K5MVFFHP84JX@garyguo.net>
 <CANiq72m5ZWTAs8XXfPYkEfDj9CT4_N7ZShXSj33WqcWwNV=NWA@mail.gmail.com>
Date: Wed, 05 Aug 2026 21:41:12 +0200
Message-ID: <87h5l84ap3.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Aug 5, 2026 at 4:15=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>>
>> Ideally we can still take them this cycle so we can add users in the nex=
t one.
>> I suppose otherwise we might want a topic branch early next cycle.
>>
>> I think if you can pick timekeeping patches today or tomorrow then they'=
ll still
>> have a round or two in linux-next before rc7. Or perhaps Miguel can pick=
 these
>> instead?
>
> If it is late for timekeeping, then yeah, I am happy to help.

This series has almost no review tags and maybe also a boundary condition
bug that I flagged.

I want at least a few review tags before we do anything. When we have
that, let's see if we can make it. Otherwise we can put it in first
thing after the merge window.

Best regards,
Andreas Hindborg


