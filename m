Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323A136606E
	for <rust-for-linux@vger.kernel.org>; Sat,  9 May 2026 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337388; cv=none; b=KLsI3UB4+LfQxx7Riyoysdol3FraLJL91N+EwwgXYf8VuhzOYWRXyYIps1SwvXkf8HJhMGJ78hBRINQF8ZwRzQOlw6fYKR11wDBthLgr/h0C/Mqf0fYAkIXsO/4nBuZFS3Gi7NHE9o4PMLDcqw0fvBMkVtlaWoFDUA2Jlp5jDWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337388; c=relaxed/simple;
	bh=EHbOAMX0IpgJWcLvh5VFCFu08o0LSteGgWmZr/QDj2E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=igU/kVJyyodWkYybYLEenfviBA7UPIg0iwkM7BA3uPMqHnkyPLe14ONCGsgGzG57apL4mCHSmK2rWrfsbVMuPhe+xXdPY6jfzYxo+dHekxV2GrAuhgvqctvgpcoxTqACrOZpJJyQpQWEKNUa60k7Tpsm8lU8faF+AEFPspwn0nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s68coel0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s68coel0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C024C2BCB2;
	Sat,  9 May 2026 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778337387;
	bh=EHbOAMX0IpgJWcLvh5VFCFu08o0LSteGgWmZr/QDj2E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s68coel0Dz5/ToVU2e5aLfKu3GeiPemuRzEZp8oIEISTn4UDnRX9RNTF8f53sR4P/
	 4IQ8y60CSrOgOe3HjL3cuCWVrGgfpzuUxCzs48NqbXjLoneD+SVavBbG/bvBASpino
	 G96mPdywaU3TbtbKnLg62i9q4Pr+f3ffYWIFAj1UqW3nSC4FHOSEsdQdTo/ob8XgbD
	 OUVKseRLPyKpnEwT8Nfx3+PAm3ILmpuSc+K/VZYfwZWGcLqwT1pQxLmJhSuOG2en+v
	 xQNI92hACdehWtRyBmAAu0VWPAUbRZsXfy9O8RzeriHHeLCzRzcqpvF95dbpOUZido
	 sVHQq7oS/S49Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Sang-Heon Jeon <ekffu200098@gmail.com>,
 boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: time: add debug assertions for out-of-range input
 in fsleep()
In-Reply-To: <DIE4WB0VE43Z.2ALSYOD50N5X7@garyguo.net>
References: <qBPUAToMpl5CvVd22lUrJOgsVSuqVYKsjEHpbs1UK-VTO-vN8UFOa35fFMsYOHoBuUp9HcP65ljAxmLQMcGS9w==@protonmail.internalid>
 <20260508173827.1123011-1-ekffu200098@gmail.com>
 <87a4u96m4c.fsf@t14s.mail-host-address-is-not-set>
 <DIE4WB0VE43Z.2ALSYOD50N5X7@garyguo.net>
Date: Sat, 09 May 2026 16:36:17 +0200
Message-ID: <87pl346466.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Sat May 9, 2026 at 9:08 AM BST, Andreas Hindborg wrote:
>> "Sang-Heon Jeon" <ekffu200098@gmail.com> writes:
>>
>>> fsleep() documents out-of-range input as a bug but does not check
>>> it, unlike udelay(). Add `debug_assert!` calls to catch it in
>>> debug builds.
>>>
>>> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
>>> ---
>>> Hello,
>>>
>>> I found this small inconsistency while reading the code. The same
>>> check was applied to udelay() [1] but does not seem to have been
>>> extended to fsleep(). Please let me know if I have misunderstood
>>> anything.
>>>
>>> [1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita.tomonori@gmail.com
>>>
>>> Best Regards,
>>> Sang-Heon Jeon
>>
>> Looks good to me. Could you add the warn_once and remove the todo as
>> well? And add the warn_once to udelay as well, so both functions have
>> same shape.
>
> If `warn_once` is added then the debug assert would be unnecessary.

It is different mechanisms in different situations, right?
`pr_warn_once` prints a warning once (and a stack trace depending on
kernel configuration?). It would be enabled in production environments,
and it allows the thread to continue executing after triggering.

`debug_assert` panics when debug assertions are enabled, otherwise is
compiled out.

I don't think one makes the other unnecessary.


Best regards,
Andreas Hindborg


