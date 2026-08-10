Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB33A1696
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 09:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786353942; cv=none; b=Fj176wY1aMhwXl5U6Te4wQ29XBhnd6s7sSY9EzWYvdVVPI0vFkleVNXD1Xrr1SNJM/k5IFUI39r4PYEhtyBPd09iLDbPl8q1CMjrVUzhXjjJvcfyDCt/m04M7QDQnFtn3kRqRKz4cCQoP93Ew3g9qLYv5g3lVVhgD5+VkFhIa0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786353942; c=relaxed/simple;
	bh=MM3ExJWEXPBI+WXbSAASBE9BBEq02/O08Ur70Nj751g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VHHP8Qy+J1QHwVeO4AO8w/lmprUX1FljbkuAUTuy1bCzyqHJKouRnA7GKVyRAEBcCIXVQU+SpGZm/+VYukcG1BstymMjdZA5rEwDGwUsh5qiBiBKXPDmgo9xuTeU4Qr3LQyCZcr2ruL+g3WCOMyy/R+8EpurNgcVS1bsU0CEJgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=eIifJ0C9; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="eIifJ0C9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786353933; x=1786613133;
	bh=MM3ExJWEXPBI+WXbSAASBE9BBEq02/O08Ur70Nj751g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eIifJ0C9aS7A03M/JgTDUzGenkiEg2EuT1hIbUt7b1Kt0Lc0HoqbtYMPSRwwSgdTy
	 Qp3MF2IbmMLl+3EZy1couOfe9y60J8pK8FruryJnlmBL/XCFImXjJCGDE91xfDrPyO
	 pHWkdyLw2SppAeWG6K5qspS9pypeXnvYMvd5I0Dqi+1k/kmbsUjDoLDTNHG5oeOel4
	 lvI/Do66CgLPTWKhiPjKd4XW4Q3ZWNLSaD74WhiaW6FJutjsP5ZJHUsyvgULaCiqPa
	 mSEQJxASsKTDkC2p1/6kOuZzpe1EHtlnSudUIsqzdwCzixF53a6Jsvx4USJ6OXRMpG
	 6uy+8nXXBBBOA==
X-Pm-Submission-Id: 4hJTr92QCzz2Scct
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v3 0/3] implement GPU reset API
Date: Mon, 10 Aug 2026 12:25:22 +0300
Message-ID: <20260810092527.116794-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <ED267FF1-08A7-4C77-B0ED-F74D250DA93F@collabora.com>
References: <20260708114358.957305-1-work@onurozkan.dev> <ED267FF1-08A7-4C77-B0ED-F74D250DA93F@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 05 Aug 2026 21:06:31 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> Hi Onur,=0D
> =0D
> I went through this and Sami's downstream implementation as asked. I thin=
k we=0D
> can strike a middle ground here, because it looks like the two trees need=
=0D
> different things at the moment.=0D
> =0D
> Upstream tyr today has no scheduler and no jobs. It seems like everywhere=
 we=0D
> might want to issue resets can get a hold of &Device<Bound>: probe,=0D
> ScopedQueue, IRQ handlers and etc. For this, I think your 'bound design f=
its,=0D
> and I'd like v4 to keep it.=0D
> =0D
> I think the problem starts when the job queue lands, because now we might=
 find=0D
> ourselves in places that only have access to the DRM device data which ha=
s a=0D
> 'static bound and thus a hard requirement on Devres, AFAIU. I think we ca=
n keep=0D
> that in tyr-dev for now and land on top of your code later, if we shape a=
 few=0D
> things accordingly. I will leave comments on 3/3.=0D
> =0D
> In any case, there are changes in !74 which I think are improvements rega=
rdless=0D
> of the 'bound vs devres question, and I also think v4 should come with a =
user.=0D
> How about adding the GLB_PING watchdog? It would exercise schedule(), giv=
e=0D
> ScopedQueue its first user and lets us test this on the board.=0D
> =0D
> Lastly, can you use b4 to manage the dependencies for this series, if you=
=0D
> haven't yet? It would make it easier to apply.=0D
> =0D
> =0D
> -- Daniel=0D
> =0D
=0D
Hi Daniel,=0D
=0D
Sorry for the late response, I forgot to reply. As I mentioned in our previ=
ous=0D
call, I have v4 on my TODO list and I will try to address everything there.=
=0D
=0D
For now, I am waiting for Sami's response on GitLab [1].=0D
=0D
[1]: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/74#note=
_3607402=0D
=0D
Regards,=0D
Onur=0D
=0D
