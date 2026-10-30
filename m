Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386768;
	b=ve23j56miYeNKOTHhJW0ZyYgmxrY3dzh/Y0PJT8UYC2R0Fn+KhG+X0RNHFiBAbsTp7L2
	 q5pd2Fj929IMH53YJxfcli7pzvBpQbbqiL0/BUnDWkuVDg9tbE1OTgh9pvyT2enJjNvU8
	 E0nEgHgmCkLmDxiI4NX7NI3a3kicOd4/ifU0LeqGEPu3lKO+6WPiutxNubOpX9D1Qa/oG
	 MFRUPqCB4HZr3IZAaTxFBavH4rTiknOztDKvKdO3snYsQpKoFp52fTQCEZ1uejxwubveW
	 dRbfHodE15+52RZaHOim+F8DHgsJXSL4ANwQ//I2Eng5G60li1hJcFfciPr+v9HUTgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386768;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hPoGYDC/EcX64TLH24GIzKak03OQbDgbY40101dK4cw=;
	b=NUmBqH+G3gT56PykZXGDDannCw4OAUr0zFwD+Sbv+/VmRMQfg1pF0pgtYZjtlAp67EqY
	 +De/63mSNn+4RX1TyDSrbNEoJDXvHC0VW1CK38cWzHJH/2rZClcT/ztptNDnqSKR3i8Og
	 XpEGDNEO/wPJwSXGn5wHhAGfTPS6C0ylM6IFJJdoP8bWK+HQEl7ouQeQcs3CFc7GjBaXB
	 yf2YdYLDvmLYPkt/xNyi0TiN2kzrzxf6b2g0j8qM3W2FT6AgJQYAIGMeoMUnbML/+4DqP
	 iI80iKDDCuCCYTS/pR0pYB8G3weugSpAuC885cWpCFuE88zG26DIIrEVaScUUZ7EbQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWlEiL3x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E94606A31C
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWlEiL3x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7571F00A02;
	Fri, 30 Oct 2026 18:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793386767;
	bh=hPoGYDC/EcX64TLH24GIzKak03OQbDgbY40101dK4cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FWlEiL3xtBUIIRLtNg2ILrHuSsKjcjtZznUVcjbHA0NAITdeGRerd/ADUbbvjAdfH
	 WG/ISury1MVYPRwmmWxhOdpK2Zqy6ghUpE9X6n6EMBb5rMn0xh7pNZjy4Dq3jwQXnl
	 /OKrkYgpWJUG3KFXNa8gy3QKlNFMHEBjKq9ZAOvTfH3utP43TBvEFZ/0orA0rAA5Dt
	 N87mYuFe6AaV5gYVEyDazCJ1LjG1xsEEJcLTDpIILI4uZ4ymTycV+SPGis5MwEKm15
	 iBWhlZ/yTXklldNiRg7/n488w5TVnzDX2rnMBe/jWQoxTdB+wgAUVQu3OwOU92sHFm
	 FdtCtdqPy4Njg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5B4EEF40069;
	Fri, 30 Oct 2026 14:59:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 30 Oct 2026 14:59:26 -0400
X-ME-Sender: <xms:DunkalMziSZyqZv2aEGvjKSI1ua6ASEBXTFFisW-QC1Sdzd6c3ZYjA>
    <xme:Dunkav4iAvvw23r73dFrEnnHBqparfd1s0gGcJzIQdluXj4vVdAtVgXEOzTno39Li
    GfSTBwAuO9SfVFaQFsFrrCo6ZOYMtoRh2GJdHDbZnkPUg6qtyheIA>
X-ME-Received: <xmr:DunkarcjJ2dqccRnB5kr7LrCme0Ty69_loYeRwMESile4x3YZAnD3pvFxk6J-JZvY84JD-F1aZ3y9mPaqJ9gf5_MbxVNKgh0>
X-ME-Proxy-Cause: dmFkZTEANoIokc/FPSwXY9/jcV5fn+Rbv8Dm0sEF6nfTJ5IhU7IzQKAelVIMlJy2Whd5p1
    +hpDoJtmjPRRUclaaP+vGZOk2hO9ReAhYqrPb7zaL2MGoc55s4oCRLML0mMFPuEOnPKxjN
    6Nf+SSmbUrFTTpgsi4TdhkylvIl8vGCX00rawu8/u0FoTXj2FTJMhqOU9rVult+lUvbh09
    6aGM86atILr6fCyGSmKIHWlVsz+GOVqFHF9mH+qY14MHLbtp0frUdw+70WHHhOyYJNHXLj
    zCp/IHfH1pckC7H/m5YUZb8GPabpYBmCWWgYDVwgOEBdsYOjStj8RviUjBxewrIZDe7lUj
    rbfWTgXa7soj0wqi8NuFssXiLBV1diMM94VJiw7Xc+jCUwp+oEP5tTjK38ZS/DyYDyIf7Q
    q5jymcyScI6UL8mS/QOnHH1deT5g9CAhh1dbUNxB6sRs2yLWXZ09q9o41WCxdBZslulB36
    Fka3rP2TcL4RbdxUgwhSA/lNpsbsbZCvkqHX7HDVWNDPrsdBxCptdA7FetTK48LSNo0UgE
    3BMHLxUBFq0aMPLqlzYUahoibVwI2eaf9FV+2Chzl9MhWzJOg99fvher1RY9AN3dzIdiKS
    LNRc8G8Iahx1DLD99ujRYFP4xxUacCoGISQIBMN+5IKZegrAGNApJMDBFI7g
X-ME-Proxy: <xmx:DunkaoL8V8l7BCzzk3dqwV859F7dDPLkQruSG3VSM9AQZmiVSzFIrg>
    <xmx:DunkapmhGv00KZKYz1BB-uaoLLZU0GJqw1IeIR-QtYQdvwuxPyKcGw>
    <xmx:DunkakF8SH0T_mEHFt6yCTS57-cIT17q_AbcB3bOPf8HZd4qd4F8YQ>
    <xmx:DunkaidCynvDGfs-LtwBCUlPDGGH8yWbBxgsLw5PbswhiEzLVvppHg>
    <xmx:DunkahEMU7d8dVG2aenP5RKkvhuWSoykmTRuO3CGYf7DWJyfjE0QRFPy>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 14:59:25 -0400 (EDT)
Date: Fri, 30 Oct 2026 11:59:24 -0700
From: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: mike@fireburn.co.uk, a.hindborg@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	ojeda@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
	tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
	sboyd@kernel.org
Subject: Re: [PATCH 9/9] rust: time: add ktime_get_real_seconds
Message-ID: <auTpDD4GRiD00jP2@tardis.local>
References: <87h5jzx5gj.fsf@t14s.mail-host-address-is-not-set>
 <20261030075750.356854-1-mike@fireburn.co.uk>
 <20261030.190502.1711453613571853758.tomo@flapping.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030.190502.1711453613571853758.tomo@flapping.org>

On Fri, Oct 30, 2026 at 07:05:02PM +0900, FUJITA Tomonori wrote:
> On Fri, 30 Oct 2026 07:57:50 +0000
> Mike Lothian <mike@fireburn.co.uk> wrote:
> 
> > So it's the case you described, Tomonori: the format is fixed outside
> > the kernel, by the dock's firmware, and what the caller wants is an i64
> > of seconds since the epoch.  It never gets subtracted from anything, so a
> > seconds based Instant would only be there to be converted straight back

Even that, I think Instant<Sec> would still be more clear than returning
an i64. Also regarding Tomo's concern:

| So a seconds based `Instant` has to define what `Instant - Instant`
| returns, and `Delta<Sec>` would have no consumer.

We can probably only impl ops::Sub for Instant<C, NSec>, then we don't
have to deal with `Delta<Sec>` until there is a user. (We probably want
to avoid a from_ktime() for Instant<Sec> as well, so separate impl
blocks make sense).

> 
> Right, you only need an i64 of seconds since the epoch and do no
> arithmetic or comparison on it. A type is useful when it guards those
> operations, and there are none here. So the plain function is fine

The way I see it is from kernel::time perspective, we still want to make
sure the APIs are still in the same abstraction layer, a
ktime_get_real_seconds() co-exists with Instant::now() as the public
interface layer breaks that in my opinion. And the generic type
parameter should be flexible enough to avoid introduce anything we don't
have a user yet.

Thoughts?

Regards,
Boqun

> with me. If a caller that needs them shows up later, we can add a type
> then.
