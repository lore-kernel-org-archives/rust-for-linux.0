Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795775433;
	b=vMR4b6Jy/SAiLDPjViPvFhocrMJteXEUKntXN0lKDdGlx0pNCq2ziMv4f6k0wXKqsQu+
	 PYAMsMwCp6gw1vQy7EBlML1eu1AXo09YYw7UtOb06FSzlqKAKzKn0IIfuOmFR3uJB/mS7
	 Ou3K8ivQvYV3wSSF/1NStfPpAi4iAfaaWuF2AiascxO6q1+gJ1b9++7kiHUfqZda4QKjh
	 bc1yOcrb6jRylXAV2KJobChMB9PZO3HvVSsT7y4mYM2Fcw6G7LjERe7vU1ikdYRq33XB4
	 RnQWmQ8quD7QQ1o7L0Ap+YWLQa5IUmhmdpJ+IgN4ynMmpZiOklQOBtgpLPKiqH/hGaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775433;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=dSZToOiD6uZCJhRrIbPKshRSin+75Q2E1ulnxklEjAI=;
	b=MdRRXKd9FTUaGGUQS7e2fd1ioDaUHWwmiOU16eVAMggLcZNzKfNETzXCkNB44Mp01zOt
	 e34NlLjL8HJpHawB2hhTTE+rrth249BMDLgzp7VVV/yZePFp1NUBLZZBhg4PL973QAnRX
	 Qz63oPAcpVashntuMjAb/8bKBrqTZCPGCTUgPzIhq9WwvAKNmKl9lOuN4p3BnwqS4Qkpd
	 +GM393lqDtcIaoIdCdp4+v6skhzQw/bEfyQ35TOl3s76lOKOzJx4NTFcKI+TqnvyTxXy6
	 X2nHjcwP2Q/QiCP6N/dqdAJWwORjT7VO8TJkjg34pFU06eCnCAKU6yivCBuxEJh7yvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=eBvx5eI3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C85606A323;
	Fri, 27 Nov 2026 10:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C85606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=eBvx5eI3
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5FCB22004F2;
	Fri, 27 Nov 2026 11:30:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795775430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dSZToOiD6uZCJhRrIbPKshRSin+75Q2E1ulnxklEjAI=;
	b=eBvx5eI3tL0u6m3G+lvrvBg/I+a3tQ7LrPzs1ucf2NhV/Gr3nOUAe0xgoe7QXJ/qJyx4i7
	Aa/JOmiTn1KaengHZgis0bbHfyRNZqNwESfhYdYoMaROOTai+30AZ6QRdm8QnAs0jIuoV5
	glT7t59QkuD2TZkmwr+HW3P4GIUKcejBJPVjW0IuoVti/onahOsprAuXzA/Y/D9/sel9rk
	L8K1C7AwjBN7WbAcOcEXgjW339Mv7O281EBvyRodTKDb1F7iftOIYVdNpNfkZSpAOoqnaB
	0VZvSmh2RGN/tQtHc5yzy5Dca4x1J054fvLBpPzBDNaL0aJhRdRwbKmJNcOrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795775430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dSZToOiD6uZCJhRrIbPKshRSin+75Q2E1ulnxklEjAI=;
	b=Y+LiFsES+b88A9tX6daTqFwfByrHwg/Aa6f/5xUmy/i9A5G0Z3Cy1KP8C6qooJgg8Ggmfg
	evYphSXrXRA481j0jmR8b9eYufd+Kq3nAFTTL8CQQvXq/XTfozHmi7gpvYsZEVBbKXR31T
	SaU3WYriRzpeq91iuRShAdnLfpR7pujYxT31LRLmDTkRgvuH4S/GYpJLtNAUlcb9v7Kg9p
	LHn8WwOiNjhJUz/KewgHmnzQi8FfucZwwFhlzal2r25Zb+BYVh4MP8kEOFJKDKuTxOlz00
	BrRRq4JMOnN+IjH97lGq5CSmMhTm0p9DQbmZ5GFaxoQOVx0aSRfoxglv0LQ30w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795775430; a=rsa-sha256;
	cv=none;
	b=QxeEJ28BfhRNSkNTL4dnOLAjPMjtODf9EQh1B5+QtqGrUTtrGvpRLIHFrkTBCDdunxD9Js
	M3Q/28eEX9r0Bbc0zCwmHAsT8iZwrn6uuY0Wv4XLuQoLhr1+UG48VWZQeRrI/kX9f5vxld
	VjtMRp9l3nP8lPKZntsOeA7g6qA66YwOjaMMalOMXO//NyKyoB/EnWERoXso63HrwM8MPi
	sjZ/7E4Pg7zSARKC1sLxmsJ+0ZoDONfxS+6AgP7oDhRB07Lgy2N+zV9FKthG51QGci3n/k
	PS8aJHobE8Dd5WVyu1h9DC9yS9vW5/fSOM1e6dQtWfBYF4yMsJF1VPdaualobQ==
Message-ID: <67eac3cfcf9a40ebd901512270390d73c96af1c5.camel@pengutronix.de>
Subject: Re: [PATCH 0/7] rust: reset: add reset control abstractions
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda	
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein	 <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Onur =?ISO-8859-1?Q?=D6zkan?=	 <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Detlev Casanova
 <detlev.casanova@collabora.com>,  Nicolas Dufresne
 <nicolas.dufresne@collabora.com>
Date: Fri, 27 Nov 2026 11:30:30 +0100
In-Reply-To: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com>
References: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Daniel,

On Do, 2026-11-26 at 13:04 -0300, Daniel Almeida wrote:
> This series adds a Rust abstraction for the consumer side of the reset
> controller API.

I've been looking forward to this for a while. I'll need some time to
digest this, but let's start with some vague thoughts.

I hope we can use this opportunity to improve the somewhat fuzzy C API
as well.

There's exclusive vs shared reset controls, self-clearing resets that
pulse under firmware or hardware control vs direct assert/deassert
level control, and as I recently discovered, sleeping vs non-sleeping
use cases, all mixed into the same API. I'd like to make this more
explicit in the C API, but have to weigh against potential driver
churn.

And then there's device_reset(), which can also divert to ACPI _RST...

> A driver can get the reset lines of its device, as an
> exclusive or a shared reset control, and assert and deassert them.

I like using the type system to separate exclusive and shared reset
controls.

> This will be used by the upcoming rkvenc driver that my colleagues
> Detlev Casanova, Nicolas Dufresne and I are working on, to recover a
> hung core of the encoder without stopping the other one. More details on
> this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> [0]. Samsung's Rust UFS RFC [1] also uses reset lines, through an
> abstraction that it has not posted.

Could you point me to an example that shows how your bindings are used?

> The abstraction follows the regulator abstraction and the clk series
> [2], with the reset state as a type parameter.
>=20
> Patch 1 adds the C helpers that patch 2 needs.
>=20
> Patch 2 adds ExclusiveResetControl, with the Unknown, Asserted and
> Deasserted states.

When a reset_control_assert/deassert() fails, does the state go back to
Unknown?

> Patch 3 adds ExclusiveResetControl::get_array() and
> get_array_optional(), which get all the reset lines of a device as one
> control.

Do you have any users for this?

> Patch 4 adds AssertedGuard, which asserts the line of an exclusive
> control in the Unknown state and deasserts it when dropped, as a
> convenience for drivers.

Same question, I'd like to see how this is used.

> Patch 5 adds SharedResetControl, with the Unknown and Deasserted states
> only, and patch 6 adds its array getters.

And this.

> Patch 7 adds ExclusiveResetControl::devm_deassert() and
> devm_deassert_optional(), for drivers that only need their line
> deasserted while they are bound.

This seems like a straightforward equivalent to
Regulator::devm_enable()?

> reset_control_reset(), the bulk API and the shared devm getters are not
> covered,

Why did you decide to leave those out specifically?

I think the _reset() vs _assert/deassert() APIs could be wrapped in a
TriggeredResetControl vs LevelResetControl (or ResetTrigger/ResetPulse
vs ResetControl?) to separate the two APIs.


regards
Philipp
