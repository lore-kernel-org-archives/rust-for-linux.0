Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327EE25A321;
	Mon, 31 Aug 2026 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195281; cv=none; b=olnLVR9EvBOwNPMIXn5ORBiY0ZsJB/QT9QCyPLCC/gJ0GBGXYll3Wh8ijDkAIhwo9wFUku/Ar805fK6uCU9uo9fnFXxrrgCnDNcyXs++sBXaVNaVM+IfcT/4GqtkXTz/c0dxYJnRpFrZvXgxaZ0qZBvn4u6vYSWJQ3lzAKM7VxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195281; c=relaxed/simple;
	bh=sivEietVDmycUIPJcP0xDxZLVegufz7vv0MAayyfZww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SGz3PhrQR/CxkQB7vyKCMtbFDbSW7q06qcgmRBeELEX0aqnrsOaQkC42Tdy6cD46N7weuTkUyEsI+G0/mSJhDbepi4xlTf5u/HCWruik9FHsjtjpcuu8IKtbSAVCK0HkTl5FA1QNnmgxv2/KXOIzl4cendtmsE2V5sWV6S/xDdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1ehX7zY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1ehX7zY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949D51F000E9;
	Mon, 31 Aug 2026 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788195279;
	bh=sivEietVDmycUIPJcP0xDxZLVegufz7vv0MAayyfZww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=M1ehX7zYu+EycNJISErgU0WnEvgWsMkNHDFj2BL9Mq+/ZjcmDtRp1b8KzojWqG/hL
	 ZnSt2iLrFFNgiZp6t1xsCa7R1+crNvF3JXSqOQrB69aVlfVzRZanbQ/w1EP1Eez6kd
	 2KtG4NRaynfmsrhL6W1sqVZB1Q/nsK7DnnxZUVcuICLCh+o2Pcla8/ZP7iofIGXbT2
	 7iideAynbQMKfknzyzpbUZhfiWGLZc4KOZfixDAyS005Umm/GpkG3erCkvFfqNsPj3
	 reDMN68sgYWE84fH8Y5O1Eo60/TrIyUhMd68A1AoPYHwP5ifcZi9VQI9x5FDRCg18G
	 yAb/3kghlNx1Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Mike Lothian <mike@fireburn.co.uk>, rust-for-linux@vger.kernel.org
Cc: boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] rust: hrtimer: add ArcHrTimerHandle::restart
In-Reply-To: <CAHbf0-F-KNQu5NrFcUw1JOwaVQJq5hS+d9OHTmV3J2Pi+hfOqA@mail.gmail.com>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
 <PTgvpjjPiVHpV5cb5AFpiGEjRsWtsYwuSeJJ8jwp3nn0KknPmUp9oGo1V-8erfbr4OQrH0c_RPZYYJWi6yV9FA==@protonmail.internalid>
 <20260826162851.2497-3-mike@fireburn.co.uk> <87cxv31yns.fsf@kernel.org>
 <3-IkUMhanJhClxwXLNvuF1-ncsHt6uM6GRmW78t81tKgo_5IO80fRJ9HZROE5RwlmxZhufdPXswcExj5j65ejw==@protonmail.internalid>
 <CAHbf0-F-KNQu5NrFcUw1JOwaVQJq5hS+d9OHTmV3J2Pi+hfOqA@mail.gmail.com>
Date: Mon, 31 Aug 2026 18:54:29 +0200
Message-ID: <87ik4qxmbe.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Mike Lothian" <mike@fireburn.co.uk> writes:

Hi Mike,

Please note that HTML messages are rejected by lore.

> On Thu, 27 Aug 2026, Andreas Hindborg wrote:
>> The intention is that handlers use the `forward` method on the context
>> object in combination with return value `HrTimerRestart::Restart` to re
>> arm the timer.
>>
>> However, we found a data race in the face of concurrent `start`
>> operations, so we are solving that over at [1].
>
> You are right, and checking properly, the driver that motivated this does
> not need it: its callback already ends with
>
> ctx.forward_now(Delta::from_nanos(interval));
> HrTimerRestart::Restart
>
> and nothing anywhere calls the handle's restart(). I will drop this patch
> rather than carry an API with no user, and rebase the rest on your
> expires-v2 series.
>
> Thanks for the pointer.

You are welcome :)

Best regards,
Andreas Hindborg

