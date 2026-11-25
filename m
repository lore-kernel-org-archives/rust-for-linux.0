Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634861;
	b=IJXxOMjSwLZbh5aYYd2pMjyKVpVSVeM6JMJ5vaIzfukIw39HkIynTsS5OS6u3Trprhvg
	 88BXLDtCA+Tab4haqTWN9epUyfx3SJIGddvlipa9ysMdMn+WIj9vC6nMWTU0pOGPiTTM4
	 aQWqBkU6MYmd6L86gLu69Fp6Mtr8Pj4skaRM0kU0DIcS060+2IJkx53/jqMdkozoiCGd0
	 jL0DdMEWsjJMyrnMKXuOiiAuzx7LvWvHcEcbb424nwJTT2gqOXCpfnJ50kh/liQ+HmyCK
	 TJ2ybygHRdB5JCmtnAPjjDK3t/fdE/7W/m7UMZlcdbTXqLpnI7CwQDUF+oUTK4iYXuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634861;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=xoUeIF/EloK24acjJaNVCTj/WbZnX7MPKkbItPCajHs=;
	b=l6nxQTDzRkKySNpQXA2nwtOibO2JjDtDdiCgXz+L0LjZ95WVRWXiZY+xeW2K231sGBca
	 qD5TzemfsMqnohWbEWEinurJzFAKD7CQm/NXmZ9HBl0XNlhVtBTcFCv6RcHylaYT1FgwA
	 8xklTZ1sSLMWYbrZD0Fof4vnGPTq0zqkI/q7KhoNDgyN8ZPPRWD2fpSiohARGYYpvxLiR
	 7Oqz3W0DBVUb9iEb+a/49xfqNuhREHzuOjauYsHgKELt92lrkTG1P1baWx8N+aFpNSyKM
	 CqKZB6KN9ZxKOQ5So5doX+yd4pbwtRsE0kTUu23AmSsKYsmkTuVW3b990vDQA5ti1tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbxbiLDo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A121606A321;
	Wed, 25 Nov 2026 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbxbiLDo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75D71F00A03;
	Wed, 25 Nov 2026 19:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795634861;
	bh=xoUeIF/EloK24acjJaNVCTj/WbZnX7MPKkbItPCajHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nbxbiLDobah4WkNwDEFuF066PQoOPRbnWdVtupAo3IA54ome1TbGhE/e5j7nPUBgs
	 viR3jbtsbeEHXXEY4/g9EvQ/+PCnBtJhWXazta6sXCM0NXRjhe5rv4R6NREhQX8xfG
	 8gxAol0N4pHmnUtUqKxAwbshJEoDohx3+4pouGaRQ1F/mRYgC3YJD0Z2i++xoON5RV
	 ZyYyqIAsjsOZh42k0LSI8x5T5p3shznrv0Ip6p0NiVrPpcsbKug+PxwBS24GbUPqav
	 smgv4zuWSfyYnRuNpwqMbQ0/fR9agXK5ujaE3amI9qH/Rm/dJzaxFRYkxcJpQxdCNV
	 yUU490dMVrkQg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261125-hrtimer-active-v4-1-415a37b74d67@kernel.org>
References: <20261125-hrtimer-active-v4-1-415a37b74d67@kernel.org>
Subject: Re: [PATCH v4] rust: hrtimer: add active() method to query timer
 state
Message-Id: <179563484867.2957046.15537503235539912242.b4-ty@b4>
Date: Wed, 25 Nov 2026 20:27:28 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Wed, 25 Nov 2026 13:34:41 +0100, Andreas Hindborg wrote:
> Add an `active()` method to HrTimer that returns true if the timer is in
> the started or running states. This wraps the kernel's hrtimer_active()
> function.
> 
> Unlike a direct read of `node.expires`, this does not race with a
> concurrent start operation. hrtimer_active() reads the timer state inside a
> seqcount retry loop and re-reads `timer->base` with READ_ONCE(), and the
> core documents that it must not return a false negative. No exclusive
> access to the timer is therefore required, and the SAFETY comment reflects
> that.
> 
> [...]

Applied, thanks!

[1/1] rust: hrtimer: add active() method to query timer state
      commit: 5c057c3a0b980e0b923211fd49d7bda0e5bf945f

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


