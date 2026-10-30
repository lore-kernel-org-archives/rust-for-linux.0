Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374296;
	b=zKBgizhVO+mcy0W3sK+6fXR442Mo9yWGQtxIv1Uus/QtV/+bQg2Rak7/4e+Fph1LVarI
	 wZ1UFDfK+v5367KFUcPbRlEKWeei04sN4/qaSf10EWIkvpNRkhcNOj2mzby2TXKDFcbP5
	 kC3atrAPvE45nUF5cYBYTzm1/rnfA3wu0Wh9cEalwY2UxsrWCdNgo5G06LdZtzmuFhxSk
	 AiDJca8cICAS1KzbkgIxH4RbXmgTYqmUTqj12gX+dUuffqe+P3AUlE/N5v0RwiNcRuTET
	 rhYftvPeqndDSbpE1e+n2mW4ul93XHGbNLQzyREzI3cQ1m3OYxgN4/GVaWsSct20nTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374296;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=GJhKVMRP3nLdXr/seYaUvr3XBjJFlywTfuPoM1+IcBI=;
	b=uMr3U0eDA8J7l2nTxaJl1xM4Bq0y3O0e+aiPYIEXDoSAJvxW04/CuCGrKruKJkkg94dO
	 GKcqMCZ9U2yNq0x9CROou81cu31CsAOvttoSdBYwW+w4V4nTj2b44UibiFshLzcFs7N4f
	 G0tVi5X+HbcVhDZfbuX/5PLsJQo9EXmcpTcBi6c8IvRtkiIPNO/fVQVv/9que2V6zXhZB
	 5aCdNeV5J8cZSkT4J8ZOUQ2dOx76bj3sfXsce/yU5TYxXFyvCDQ0omOwsAR+D3wwTXJCV
	 k4xApAs5uGi1/zibISAw467MwnwLrnwzvhq5+e/KM4ALRMEclTk9LKstwjH6Zvoi1OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ajqra+aQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6312606A31A
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ajqra+aQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB381F000C1;
	Fri, 30 Oct 2026 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793374296;
	bh=GJhKVMRP3nLdXr/seYaUvr3XBjJFlywTfuPoM1+IcBI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ajqra+aQzW7x27kzT8A5W3FjdbNbsJ38qYAabj0FtDmeqw86csOoBjja0ZCEN6kb/
	 mpedafMr2klM4ZwceD5JNb5zUTBq8awlAn+V7clWO7Ec/548WdTZdkTLrH5gdkrYZW
	 +ftnVv4l3bGIynlNw+Kx6M3gCfA093uv/tTTBFySjSP/jVUkLiM8ejZsWI9GJdA9ex
	 bBbRdfy6Fav5IIcBsJNPeg04MvOFHMSvlVS0+PbqM/t9ewLFHGM9AWbllDzazun8RI
	 Y5Wny2RP7Rd75ygMeIH1Y5T9Ii9P73RbK7g8XtmYyOyCVq1BmJj+OJ93jjfRBTGBMq
	 w4APQkvya1sog==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: time: remove leftover "clock source" wording
 from doc comments
In-Reply-To: <20261030044803.3863267-1-tomo@flapping.org>
References: <70lCMDfO9RKOmQM0cJWbGH-Xb2obLme9j31nmGPFgVtxFjpGGolzh6OVOtVaPwvM8dMHEIJSl8UOb9vq3abM_w==@protonmail.internalid>
 <20261030044803.3863267-1-tomo@flapping.org>
Date: Fri, 30 Oct 2026 13:41:56 +0100
Message-ID: <875wyjnywb.fsf@t14s.mail-host-address-is-not-set>
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

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Commit 6a8e2c63f2fe ("rust: time: rename ClockSource trait to ClockId")
> renamed the trait because it represents a `clockid_t`, not the C
> `struct clocksource`. Two doc comments still say "clock source".
>
> Replace them with "clock". This matches the `ClockId` doc ("Get the
> current time from the clock") and the C hrtimer_setup() kerneldoc
> ("@clock_id: the clock to be used").
>
> No functional change.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



