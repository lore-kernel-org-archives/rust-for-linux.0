Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793492766;
	b=4zb3SSiolmZvAsEnyRQ3QB+ykiBBmmuk2zZ8gXIjanOJP9PGVAkax9TdZjaOEVg4NMnc
	 mMKJU0HLD4qkeae8MCwacXW4afX1s1ljSSgoGMDXQMbTj2/OdT3qDuV4qd7peUFvu1Bja
	 tJIKpnzaV92AmhhX/0XJ0F2zh95rQZOhBtch3dCkw6j6wRsZTiaIPOnLwwzZ2AvjU0Jk2
	 w1FFj1UuURpUSVtGZLimqdx3c6e/O6YuJaRstyf6+NopEKJxy2l26Pp6chW7M7/dEX0Y+
	 2rSOQEJaxfAVKt8fr8FT1aM9eiFco1BiNPLlAED1ZQsY1PhoHun2xfoqG1TRNnMikMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793492766;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ZTxLH/Jv5PE3QbDmOL5+wvTdcO4ZN8shYf7rQSNl+Gg=;
	b=iR6ylxt0y+vhb08zR1cLao3lZ7ASJwqbkOu1DQOx4kQJHop4jON/EtV24fUEtpMNLv93
	 IQHBqC9NowudqSH2Di5ehWtxkTQnGK2XM6IZoMotl7g62+1m1C6vlvUps+jx6Ky6IcppJ
	 rS1NMVmAU760KCtV8OguU6ZpgdQM52wq+h8tjWZDM/CGNaAWzfZXhFHY0RY5xg9pEtJm6
	 wft9aRrqN9rkvgOOeJ2NWwZQ9NWzbK9HvqNSYsV93DIS+Jp1cvhTkYzKZmnIRO+q9EAHG
	 il3Cq4KBtvP7ELqhRvV0MpoNkZ78rtpnb77fZPcctNC7NABtArX81qMGIqAN1bNcL4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YhUkAg8g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AA4606A31A;
	Sun,  1 Nov 2026 00:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YhUkAg8g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EECE1F00919;
	Sun,  1 Nov 2026 00:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793492765;
	bh=ZTxLH/Jv5PE3QbDmOL5+wvTdcO4ZN8shYf7rQSNl+Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YhUkAg8gq4+Z+IOMQdJNRbwn4aGJN5TuF1WxFf6E5C7maZwg6mRv/bR1wiAeMXoD+
	 9AULeNGycFkeenjeqpYts4WAdQ3D2wf6dAfpV9qlNFw6rzo/3HhNH+Bn8MabDui3Qu
	 4tnL2FbuHd4R1AntZNRJO2YPiK4UEcjLNFZYkwXKxP2rX4zgOXFMfR7j7RcWwZ7gKn
	 NM+Dav0g4IwuJpQPiqmOT+uBolhcVhcfFDdYmnYhg27KyS2yn1bBlsvAFESw5vzK62
	 bObd0fbWiY+yZZMLgdTfB0AaK2daGUn3z+rZMurD1aCSM/cdC2Sejr4OhHSVn3CzMy
	 WSAoVnpeZGQhQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 475FDF40066;
	Sat, 31 Oct 2026 20:26:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 31 Oct 2026 20:26:04 -0400
X-ME-Sender: <xms:HIfmaiE8QTnvaYsTx6wGB1aweEeeBfu7RS-Ab4bZgG_JufVJtyyj7A>
    <xme:HIfmahsqq1wsofYfLE5Afs-KLn5T4uw1d69MaNm_DRCMsuIGnmqL8zq73UbfkHV0D
    mO9Nr17Ql1HdYQHks5KgMyKMRfPFLROry4rtI0d0ozPbyiwLz0dmQ>
X-ME-Received: <xmr:HIfmaoLoBPOv2yEv3N3aPIo1rqDZTEZVfH5nkdIhMLSqK_LmKTUPsU52ERntEgOuGvhsIS51v4p3OofmCMP23aBkitrKBRxu>
X-ME-Proxy-Cause: dmFkZTGFcRsnq5CozJj+s6dHqAcfqpKsZpe8KYvLtP31zGx4RGgZ57uSlT50gepXDrJuTQ
    8A9B1z9vQGVs6LklPJEJFXKxPM1t+3Uc65ubU5Rs89q1Xm7WvkcgOKUN9wJs81oI8ymp7D
    vIFP9MqTitH2T3eBQAHtOribawiA6YxULHKa5zpv5Tb5fXh8LbUATjVmF12F9dCmB6Otmp
    WWVvRxlVObkXhA+2TL55oSlr8iVpr7tLnsIXAcysRWq7wZGyyZwPcP5TRd66wOMETFtssK
    uEMqotOuT3FARnYoCcaQ/XCMB7mZqo4KaTcKBPmkQxbk5eGUdqxkrUFtRN9jeVfhDuSkfF
    QYjeCMN0gS/x4LY+aWyfVW9pr4YpjgEZHGuP8yVLQvtVFKi0vbcxyAz5okiGTBZupyD+97
    tu74nO5XGMGL1BzqR+HyZagaB3LAPUI3ZC0lS3BACBukWucMw9fF0y/yfz792AuS7sneka
    9QCtRmYIsq0UEc8oKlSLDNQkTpgFSqrdLP6jgZhaQog70I0pIo/shEduuiMrTq/XAg7JpY
    wcftukz51TeBGSMXm8nreBA/paoAPuWa3/bMDJk4B5rYxKkQqlflR6UXaOKom6ajVSy2Nh
    F9CAIlgYJ8quEajR0yuEqbK8+DS1bFMHVT/Ev4vbAJ9J5lMKGNzrXtAtDZ6A
X-ME-Proxy: <xmx:HIfmavNhL7Z_b8mzgVx7GbtfAqVfxAiGMxxIIslI9UgvCRbOHiMn_w>
    <xmx:HIfmagYo-zOLKTcb8_wZSem9CBj5HQmzXHBMpNx6Kx0i1PwgX8DQxg>
    <xmx:HIfmarwifKvLSRllwOF0MW7TUrl8YmTZ90ghv6L8wosGJFDwAfukJg>
    <xmx:HIfmasG_GRfh8S5qK0S3-5u_9bAwmlCf_Fq0KsUHA7nxWCcirNfRew>
    <xmx:HIfmamq8-7mvjWAshYCfxuqr-A-fzpHrNwetqBVF_N8MeDtFHITWesTm>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Oct 2026 20:26:03 -0400 (EDT)
Date: Sat, 31 Oct 2026 17:26:02 -0700
From: Boqun Feng <boqun@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Philipp Stanner <phasta@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4] rust: sync: Accept errors for Lock payload data
Message-ID: <auaHGpX2jG_PNcmm@tardis.local>
References: <20261022160725.2215244-2-phasta@kernel.org>
 <20261031191344.2913779-1-aliceryhl@google.com>
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
In-Reply-To: <20261031191344.2913779-1-aliceryhl@google.com>

On Sat, Oct 31, 2026 at 07:13:44PM +0000, Alice Ryhl wrote:
> On Thu, Oct 22, 2026 at 06:07:26PM +0200, Philipp Stanner wrote:
> > The `Lock` baseclass currently does not allow for fallible user-data.
> > This can cause conflicts when used with other primitives, for example
> > when a lock shall be pin-initialized with payload data that is fallible.
> > 
> > Add support for the lock base class so that it works with
> > try_pin_init!(). Adjust spinlock and mutex accordingly.
> > 
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> 
> Boqun, are you ok with merging this through drm-rust-next for JobQueue, once
> we get Gary's reviewed-by?
> 

Yes ;-)

Regards,
Boqun

> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
