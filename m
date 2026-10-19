Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432856;
	b=rC4UWKkDAzA5bUCG1qgewZ9GHq9DCI6JtPQ/CncJnyBdcU0GWASx9n/J1Nk+x5NqZdty
	 KVxWr9sR4dy6H1cfZmfMjAa0YpBVBzQ1OMhKJUZ7mKXOPuOhpUqOjW57Q5AWfIOP/xOsc
	 ZQrKZllCvTwoJSRowK02NB+NRxYjI5VnAuioORmugO83xCS6Y2/7FO6PAesFg2qzis1D9
	 n5736SCe9bYWvurvVkQdxk0mQs/8uNp0LZAgT63e0FUkn8K4Pmbk9svjqv/vH9K3hKsmr
	 DVp+ZsdV7iYRrqIxLtNlXCNfOWLvIfWbEzP0WUqJSzpHyY6FQS3O79clwuSNlSQ65eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432856;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=OOGAPa56kulzPMYmeT21MA0H+ZTEk8QKVOQrCKhESoY=;
	b=MZwAcBg5wQA179xUF56lBYtQhSbBGWt4s8/TpMnWWzbS58Upxu/Td8EsIA2C2kb2S/Bb
	 h5PWcBVwRk8PaSz01yMsb9oyTLXLDsUR0tdWmxl+L+C2efp6unFjXFFgO7KzhGjt1UYS4
	 5owwdgZSO3t4qZYucRnuyGuEggft7OHLc7Iz/4deQsgDeDZ9nva85IBQ9zuF3MgNwr8Ak
	 BIsTMrPbr5i/+DZKF7LGOOfn0IlMOduKGne/Ufs55YxLxCmwEoT8WI4pTBYMZzMu4ZI45
	 0NQzIkA+CD0cRfpKWqXv4l95l3bW4yxUrlIRh05qnKuwoGPSjCiRjk6Lu0gRDx5naoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjgcjWYh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F319606A319
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 18:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjgcjWYh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D61E1F000C5;
	Mon, 19 Oct 2026 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792432856;
	bh=OOGAPa56kulzPMYmeT21MA0H+ZTEk8QKVOQrCKhESoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VjgcjWYhxRtmx6ciWT389ic47DcSaC9xLvuWiECYzHCU7SRRh3LZHhm5bN6SOst+E
	 LACmY9SjuuUup9+tr4ugL2AVPNJUs+N8LlSd/Ua4f5N7ZojjvKzjbv42qj74VShh/2
	 IfXR94f1elyOImMrjIgpZDBwYjaYijlzn/RxHrR/f2esAQRcvHYk2wx+CrFsdq4QcM
	 LgT5kwPVzhwwaDBtTEFHFMdhEH9BL9o/AuGgNATMKd5eyq4C1IM/XzTCPy3b8w9wT8
	 Hp63/oo6oENcgcIGqedAofhmgExjcHdZuO/UbbAushrDaeAiFG6m75Tf8QW55vIHzx
	 KXF4Di9uyDr1g==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id A723AF40069;
	Mon, 19 Oct 2026 14:00:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 19 Oct 2026 14:00:54 -0400
X-ME-Sender: <xms:1lrWar2OQAi4fFtSlnPFCsPhiaBPApWpATiBdkXco0_pIPz32MSw9g>
    <xme:1lrWanTrLhYKIfklcDDx3I0RLLLVw_tC-5U4Mo7_GLrxC0EqZAfaIUrsJz4Bw7t6I
    K5p-KMQzu6v9hYWAe3jAZ8Iwohp7L2n7aicM5kY2VNRRVgYvRhaSg>
X-ME-Received: <xmr:1lrWagbxKzg_ReZ3G0EG4uTUZ9hUix9xYLDQX2O6fcEXmCD0cdn9Gl9FhCxuKqC2ZiwCryEV6yg-i3RIuXy2PUMcBZapgLD1>
X-ME-Proxy-Cause: dmFkZTEPWlSE2hza4oy8ZGI5UeVgccCGd1k4VVU/Wr3Kbo25gIp72RK+CIxlBWqdmeICf1
    /FnT0B/X1YNFNE6mINY61pCxJQGJZOVYDvNTsDShR0q+EFQnUA2lIDQHqMMmTaavBoA+a9
    AiSNDM6DpzxuD/EvD907oH3iiNRJHc3PppCtYhXeerIrAqQsYzkxvGo6ktuP57VwgZV+7+
    Oj9V4Smlsr/TiYnh6OxWh4uqv5EAvgm25KC0lzJe5py9AjUD9b5cgxHfa7QdKLmyL+uT85
    P1b0qBGJ7US/bXdmmef0lQpovypeeSlEMqltWc8x5PfGtrClg5AzALsMfeGEQ//3HG32hx
    Lq7BchLEwFIjlGdoGd++wQMECbaUP/8JqEJv/qROZEODUff1GHBzVCfQ7O2oCkZN4yGuAD
    cZeRX1SQ3RaHtGs6WJYnj2VaZyeOxuLOdkVLcGw0faTDDPmF+znu4+HwHzrRqcpGsd56Kl
    pGAOHFamBuYl7Z4wk44dgQu9cpz82hlltL9zgIG4xunYM/jcAvnqZCamsuv531m47DYbsd
    2s5MQpigzZ2SCEXhtV++Go9s0fhuLbk52ERYr8T8WlMQ0rHUZDWGBF/OXlLJTKrMXCAo+X
    T0Qgt78xzO9j1DMNS3s6R8xv0Jc1Eg5UHPrtekaUf8KR23Mnqm2cRki8Hffw
X-ME-Proxy: <xmx:1lrWatAKkuC_NnTQIk3c1CGzbsDToCO2-KLolhsRI2EDCDPh28VleQ>
    <xmx:1lrWavBfZ5L-1LdKWa7Ql-EKgBYsXFFqVQUwMxDEn9DCZP4uKkb5rQ>
    <xmx:1lrWahEgh41ySv7OtMz9zp5Pk8tjptvccP2oI4MIx6XXwNqA-iKDDg>
    <xmx:1lrWaqmJ_sSfRDl0VcqDUQcE8O_-nz_BuMokPwgZyHUFlKqqCIEEiw>
    <xmx:1lrWamtmKwgePXLdXk4on_anozJek70SIhLj-gU-2B1mJ9ZqaJrp7_aU>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 14:00:53 -0400 (EDT)
Date: Mon, 19 Oct 2026 11:00:52 -0700
From: Boqun Feng <boqun@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Priya Bala Govindasamy <pgovind2@uci.edu>, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, gary@garyguo.net,
	ojeda@kernel.org, longman@redhat.com, lyude@redhat.com,
	daniel.almeida@collabora.com, work@onurozkan.dev,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, tamird@kernel.org,
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
	ardalan@uci.edu, zhiyunq@cs.ucr.edu, dzueck@uci.edu
Subject: Re: [PATCH 1/1] rust: sync: Make `GlobalLockedBy::as_ref`
 unavailable if T is not Sync
Message-ID: <atZa1L5nsoyKtwNf@tardis.local>
References: <cover.1791594262.git.pgovind2@uci.edu>
 <b3cd79f567b83712155bec1a32a0e1fe174e9b1a.1791594262.git.pgovind2@uci.edu>
 <CAH5fLgh7_vpfuU7wLrgO4ZfW=bxvdL7aRhwW20bBK0Y0PURz_w@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgh7_vpfuU7wLrgO4ZfW=bxvdL7aRhwW20bBK0Y0PURz_w@mail.gmail.com>

On Mon, Oct 19, 2026 at 09:49:22AM +0200, Alice Ryhl wrote:
> On Fri, Oct 16, 2026 at 7:19 PM Priya Bala Govindasamy <pgovind2@uci.edu> wrote:
> >
> > The `GlobalLockedBy::as_ref` method allows `&T` to be obtained from
> > mutliple threads even if `T` is not Sync.
> >
> > This happens because `GlobalLockedBy<T, B>` is Sync if
> > `LockedBy<T, B::item>` is Sync. `LockedBy<T, B>` is Sync if `T` is Send.
> > Since there is no requirement that `T` also implements Sync, it is
> > possible for multiple threads to simultaneously obtain references to a
> > `GlobalLockedBy<T, B>` and then acquire `&T` through
> > `GlobalLockedBy::as_ref`. This can lead to undefined behavior if `T` does
> > not implement Sync.
> >
> > Note that a reference to `GlobalGuard<B>` is required as an argument to
> > `GlobalLockedBy::as_ref`. Therefore, this issue requires that
> > `GlobalGuard<B>` is `Sync` which happens if `B::item` is `Sync`
> > (for example, ()).
> >
> > Fix this by adding a trait bound to `GlobalLockedBy::as_ref` requiring
> > `T: Sync`.
> >
> > Fixes: 8eea62ff94f4 ("rust: sync: add global lock support")
> > Reported-by: Dylan Zueck <dzueck@uci.edu>
> > Assisted-by: LLM
> > Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Queued for more review and testing.

Thank you both!

Regards,
Boqun
