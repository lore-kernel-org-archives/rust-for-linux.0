Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846D83E3169
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914825; cv=none; b=nAJ7hS8HbrQJxp08LtvpRgaOBGKiahPiys3on7cP52pV2hSSHUPXN0yUdOzk+LwPbgrqOuE8z+cIu5eNTb5H3b28cFYZKpMTYajSiYGU5l+i4T79OruaAyx8Sdth2fXlskDB8DkaZAPDe2HJ7ApxMCsP7banZE8oxS0kJojF6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914825; c=relaxed/simple;
	bh=OyIRKOU6FFOzwyVcqEPwIxYV58F55DTu6YJhG9Khg40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTUetu0DgJOl2Q7dXFMnxfQ5aAJpCcD/juZfb1uunmq/hUdFUxGzHv3DZnI1OEQoSKQm2V2BsBxbhH5KQIO9Jp+xOWAnCXSPH6koRD9/Xjso00Paa1tGuTDYObt+vVcFN3hmzJzWP2suQynjbQW49RKBmdyq3H/Y9Duuir2yB+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mor0uICK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mor0uICK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C161F00A3A;
	Wed,  5 Aug 2026 07:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785914824;
	bh=8GZMhrlelyQXjiEYt8Ds+xa5bbGR+RyYTrRWTrmUDRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mor0uICKfEhmlLbFBgEyGn2badUHuA9r1zMQwjf1FJjx1xeTxEToDFeRRr9pIxszA
	 yg5MCz1O1tvgwy6fW29gG4EdBSUu/7M+UTdkR1/ryVL4xefOYKcdEY4TyRAHsxlQRL
	 y1nkK+0iWeTFjvf2S5ztbQLegp34+LIfaMphYAjYE2FIcDZTiViWd8n+3L/Qq1I2gs
	 m2qV4SehFQd2NQzLi3AIU310qEHe9/tf7+a2K9Dc1svLWmdxJwQvym13lrLzglXZ0V
	 oK/uFUsaF8PBr86Zhqvb9hHREM59tvM+Kpx1TN54kkyEIrHdgFCjs47NEWUXUCLjeN
	 HioqBDeH5lcSA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 078BEF40066;
	Wed,  5 Aug 2026 03:27:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 03:27:03 -0400
X-ME-Sender: <xms:xuVyajwc52SMFqOiEFYF17qmRxr7Bt_W3US4ZYoZXGobIXp2i_-O_w>
    <xme:xuVyaqsRfMTJc_41M0UYLk8-L-DEKonQDfQh2hFc0EQxn-KRlDu_eQXQAy0EZGFxO
    dBC05Us-0dfgWp3MyaE9uPETAT7aBLk06TQbpiOYTqpBu0WXbjxXw>
X-ME-Received: <xmr:xuVyauYsgkjP6GXhtOfCDXW6lYXTQPKyjBk9Lhs4Jmg2N_qozrkOhpKMOGySzRYPvNwBpBP96LyVpiN-2RFnkwqQ2o08M065>
X-ME-Proxy-Cause: dmFkZTF9MNeVhl9OV1AEuolpCY0ecCT1hI97/OwajzlJ9aNF58j2zY08JvUZUhZ86n1Fe8
    uDvYi9jbdI+g3nBXU1A/uf4msuH6151ohJoDHM6UXtfAqGkFQ3ux4z2eq6HUtUY2PnHHyP
    l2dopuYNc4Gih/BqsP7lckcv1oKmdGG7r6pblhY+AkU8LffPMR0a6sxmj7kVaSZw2z7vlL
    QKLcqXQSGVCkPepdx2XZB696QWxU93cW6zGekqUUC/1oYoKGTUQhE8BddCTli5p5GMuca1
    mxEXW7VEeaRSnCi4eu0W4CJpKYb9l5MoBz4BQ9fCsrAnTX/RhfE7/9zQc1oQjcv9HoCIAe
    wAsPiKJHc3qhQ/4ySJ/nTH6slfgFog70raHY+MlFitn5h2XobVgqdRgCq0RmPnsdDpDUmY
    7OLoPGNFcVy0nnMhaSWuk2Wmio15umYuGPxHS7p5iUW50speBmcFA7an2t4XFn+C+ZgXrk
    dri5hzJu2KAvvmJehpBqq/0KPdzr6ZfoyVg/f36XDfrAcnQgsIp8RDXk6hw7t+tmGtAod5
    WIYiNWf3jPktdsw+Dw4UB6bU7D2SCCq0NaueK7R7APNqGj/+NrStza8ShCWji5JBBqu6ap
    BVUPjWPIinitrq6ebCqCbui9/TLha6RsrJsCpYRhp9t60g6QV5skKaTNP62g
X-ME-Proxy: <xmx:xuVyah01dt_8XCe08-q7CHOLWMbz0SsX-ZQYcW-phhpWwpXtpeUg_A>
    <xmx:x-VyaosbrNZbw9RVRfH3Ir54i95X6CB_J9kY1BQQkPGOQO1YBMFgww>
    <xmx:x-VyatBrvEyR4lRBdwQmXL4pyxIavUBSVUrRigq4gNUm4o3iAt7dXg>
    <xmx:x-VyajbSgdMMa7EIjlkmz5oqkHtkYxMb409yb3agjFXpLauludcG_Q>
    <xmx:x-Vyan9kngJ11RRduu88sG5uMIqPvmRvt7k7jeY0BNsKLzKnqB5q5Sro>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 03:27:02 -0400 (EDT)
Date: Wed, 5 Aug 2026 00:27:01 -0700
From: Boqun Feng <boqun@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 10/17] preempt: Introduce
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
Message-ID: <anLlxZ0Qwh6PKzz_@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-11-boqun@kernel.org>
 <2a9aec78-fe1b-49c9-884f-a59eb36c8905@linux.ibm.com>
 <anLeKu7X6SndqFR4@tardis.local>
 <9c59f7d4-03f3-4d7f-b77a-fdbab9a82ce7@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c59f7d4-03f3-4d7f-b77a-fdbab9a82ce7@linux.ibm.com>

On Wed, Aug 05, 2026 at 12:45:04PM +0530, Shrikanth Hegde wrote:
> 
> Hi Boqun.
> 
> > > nit: This limit is because to have the same behavior as other case when
> > > NMI_BITS=4 right?
> > > It is not easy to infer that from comment.
> > > 
> > 
> > It's sort of design by implementation IIUC, previously because of
> > NMI_BITS=4, we could only support nesting level being 15. And here we
> > just want to keep the same behavior here.
> 
> That I understood.
> 
> > 
> > If your question is why 15 was a good number before this change, I guess
> > would be it's just a number that is neither too big or too small.
> 
> Its more about below comment. Something like below is better?
> 
> /* NMI nesting is represented in 4 bits. */
> 

Sounds good, I will apply this, thank you!

Regards,
Boqun

> > 
> > > > +		/* Maximum NMI nesting is 15. */		\
> > > > +		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
> > > > +		__this_cpu_inc(nmi_nesting);			\
> > > > +		preempt_count_set(preempt_count() | NMI_MASK);  \
