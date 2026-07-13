Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A573DC4D9
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933670; cv=none; b=oy7FYCdNRd5d6qiT00/Q1R6e5UVyLTBZp8xuk0+mbkuvICMYCQ9WJYf/eRIFJCB1V6asf5Y/TOM/9sBHUxP/ImzL6muKSTw+Ra5APG/SbnQxOwOuP8/Bs4p1s5rGUoF8ZXkq+3RV2ivW4msefHfUxwyULSPuR3RL0hWDmTBmTF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933670; c=relaxed/simple;
	bh=DAAJ/4npfuCKt1MrkmVxkw4cJIRF9ETM+IjT4DNzNsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nO0KlzdsvF0xsWpCtQGhcBqC8p89o01C3lbDOBRMl2EVk24HhV9fd/B5MiZYWmxNQuKoSA6xsfC249mMbb0hJm7EFFIT5hGLnajGL8vVtY1OOji6XwcejbIp2LHOREIcfzfcms2Fy/YRKvHlq6kAgnWAxz2ccvhtiUPV4PIHQnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=VF7NA5ks; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="VF7NA5ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1783933657; x=1784192857;
	bh=DAAJ/4npfuCKt1MrkmVxkw4cJIRF9ETM+IjT4DNzNsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VF7NA5ksboa6mybi1cRl3VNLZ4/Iw4Rrtx/odIIZS2IoZrapZiCwha4IFey+IKFa1
	 8qyxEJrw78BQVtap0Z5Gxv9viH0r7dfdIf8ozc+rGdlW/M6RbSL4JbwsK1ZVEI1rrc
	 +MtFKbqCJTZSn6JEGxc3M827JEZXogq8j1W6owAoLycXndWwHrWnE5iDWbES2wDuCX
	 uOf6xwZfyUfkI80FavLkJp9hnqlWFnb1TjE1q3lJSmcKSre7BhWvDAX0UZSU7O5Gta
	 FFnIDTNT2EOu3REe1hymIHRoDgnE6VaKWPUBQl2a18eW7HjUvJvK5rq4Rc0qyIOGp5
	 C4SZ5ptHHuTCA==
X-Pm-Submission-Id: 4gzGmP48q4z1DDLC
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: FUJITA Tomonori <tomo@flapping.org>,
	a.hindborg@kernel.org,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com,
	acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 3/4] rust: workqueue: use Delta for enqueue_delayed's delay parameter
Date: Mon, 13 Jul 2026 12:07:30 +0300
Message-ID: <20260713090732.115293-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <alSpDAILCIIU4q7u@google.com>
References: <20260712235246.3069713-1-tomo@flapping.org> <20260712235246.3069713-4-tomo@flapping.org> <alSpDAILCIIU4q7u@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Jul 2026 08:59:56 +0000=0D
Alice Ryhl <aliceryhl@google.com> wrote:=0D
=0D
> On Mon, Jul 13, 2026 at 08:52:45AM +0900, FUJITA Tomonori wrote:=0D
> > From: FUJITA Tomonori <fujita.tomonori@gmail.com>=0D
> > =0D
> > enqueue_delayed() took a raw jiffies count (a plain c_ulong alias with=
=0D
> > no type safety), so callers had to know on their own that the value=0D
> > meant jiffies and convert to/from it themselves. This mirrors the=0D
> > issue already fixed for CondVar's wait_interruptible_timeout().=0D
> > =0D
> > Switch to Delta, the duration type already used elsewhere, so the=0D
> > unit is part of the type instead of a caller convention.=0D
> > =0D
> > Use as_jiffies_ceil() rather than a plain truncating conversion:=0D
> > queue_delayed_work_on() treats a delay of 0 jiffies as "enqueue=0D
> > immediately", so truncating a small nonzero Delta down to 0 would=0D
> > silently turn a requested delay into no delay at all.=0D
> > =0D
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>=0D
> =0D
> It seems unfortunate that a caller might be forced to convert jiffies ->=
=0D
> nanos -> jiffies if they already have the value in jiffies.=0D
> =0D
> Alice=0D
=0D
Yeah that's not ideal. We can solve this by making the argument something l=
ike=0D
`impl Into<Delta>`, right?=0D
=0D
Regards,=0D
Onur=0D
=0D
