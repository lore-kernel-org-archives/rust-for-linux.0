Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698553;
	b=DJiX+IFehCNod1r7d9PIA6IYA6qr0GxHQK6KG1mgwe++ZxUjh3wz9S4vhXsiIMFtRTXQ
	 +cQ80VjejIej1xUvkbqaL9lIgpaWjoB8JiRc4xVSgO/oACm7gs55sWAFKV8yOXyO3vlcC
	 DMdO5LEi6n8qrDh6471Sytvm0fiASUnU8wA4HRRsY/twrgZnpp2x9r8VDFDSKUjkFnoi7
	 skKEbh0uMLnPrjylBPGBT7XzXR4GcOB7pQ5MW+NF/IBw2+nwYc+AYkb44lE2gyyd1mWmk
	 QAGa49pvwdsfQEJa+DcwvX17Et7oSLn39Sa0tydHOgSGGFWwivbRM9Vko+lngN9b1mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698553;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=BJ5KtG1mVTb3HQeNjQ4qdmJiTu72CNTCdqQc6lFYR7g=;
	b=48EvBLZVTb3voDdiAn9wFdYzWXr6bIDSXtWxzcgglOi0aZIph+t61FVnNWeA5T7BriX+
	 wLJc5+b0L9et4QL8Be95XrRs84gYItkJUQALvVxrYVYNONJZTrswn3tPFPghgvzFf07RB
	 /ANHeSwkWjh5E5X4/9B4ppJfDZHFehoxtIUurql0PHXX4t3ZLTcATbYGtYFZgvdGOt0TH
	 HlPyD9bTTbnOsQseyat6J0n5Q4Uk5I7w6To1jm3DRk70MB6uDprb+O1enipEkjJmOWC9w
	 GFtskczwxbUjgzkyCK27Te2SgbbqVDOTJv5KhHFKDQ+NDJs1lSHzPbcMQXA8YWYCP1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="C/7wFrI4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45574606A333
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C/7wFrI4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CAA1F00919;
	Tue,  3 Nov 2026 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793698553;
	bh=BJ5KtG1mVTb3HQeNjQ4qdmJiTu72CNTCdqQc6lFYR7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=C/7wFrI4BWrlsLEMwWlrlYVCwmxjP/5cwHTRDuhITRBJhIIDwatckLTGTMEBDTM0Z
	 TPrfmR52Hgx2100uXwp5KX9juTIQ5LYGQfBXmivA3CJXrNNHPgjW4VS4SJHA7bFMqi
	 NaK9AF/9kqz2oJV5OyHw1vZFpv/4gK5Ivqes1uehgaC02X8CYx9iNTB94f5lU+0d2a
	 3DaT56SX889+qbjRg2B1kxjcdIHlp2DdQlFD1xHWqIxyCL1wA6zKn5+ZELCbrlQytT
	 w8ED5h2smZKv8O6bs9nKw8X7vGRC4zyB68Vhwvjt4n96erHn4y6avk/ZI1W9Qd90HI
	 t5YptLqAsL9gQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: miguel.ojeda.sandonis@gmail.com, tomo@flapping.org, boqun@kernel.org,
 ojeda@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com,
 mike@fireburn.co.uk, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
In-Reply-To: <20261103.080925.1532537293803570859.tomo@flapping.org>
References: <8yvpSoQ7ihtTj508nQU_nAlk2eMmGH5zK6H5pow6z5cTYGO3yL_DvqwbFMwqzhtbL-52eMYXpT5Cyg0g7fUN7w==@protonmail.internalid>
 <20261031003334.4161188-1-tomo@flapping.org>
 <87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
 <-ovJnxcOvJAiKzPtfo11BN1FAx0pLVrkWbeFGFEQEPR4rxdbT819-RaUD_zMHLXqn-9oyUoPJFT2YexekcZMKw==@protonmail.internalid>
 <CANiq72mjFLQbgfW_f7vAJ+M-95d5s54sBTRfMGYekcRmm7xTAg@mail.gmail.com>
 <87ecd3m6ao.fsf@t14s.mail-host-address-is-not-set>
 <20261103.080925.1532537293803570859.tomo@flapping.org>
Date: Tue, 03 Nov 2026 10:28:08 +0100
Message-ID: <87bj86mfh3.fsf@t14s.mail-host-address-is-not-set>
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

> On Mon, 02 Nov 2026 19:34:07 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>>> Another point is whether we should align also our methods too (e.g.
>>> "nanos", which comes from upstream Rust), i.e. with your suggestion,
>>> we would have all `NSEC`, `nanos` and `NanoSeconds`.
>> 
>> In general I prefer that we match std on naming in general, which is
>> also why we have `as_nanos`. However, chrono is using spelled out names,
>> and I do prefer that to the short hand used in std. Worth a discussion I
>> think.
>
> I don't have a strong opinion, but I slightly prefer the short names.
> Our method names follow std Duration (from_secs(), as_nanos()), and
> short type names fit them better.
>
> Either way, I would like to keep this series as is. Nsec is already in
> mainline, so renaming only Sec here would make the names
> inconsistent. If we decide to rename, I will send a separate series
> that renames all the unit types in the tree. It would be easier to do
> that after the pending Delta<Jiffy> users (condvar, workqueue and
> serdev) are merged.

For sure, the naming is orthogonal and will not delay this series.

Best regards,
Andreas Hindborg


