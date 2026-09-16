Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F1E4B2CD3
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552260; cv=none; b=ixJqdJ3HbrSFEB3KJ2ElOL3Rea0msrMPhVL2yTCf/N9PTEQF+VrtLkP1xsHr06LdEwVXmeuDFycSdTpDkgfVTexge+cYC0nC2F8Y48eKSPHfDBdS1gQ/G+Q5FziUq1bUouIE45GKgATlCS24pCYWfv0XOqgCni4u48w56mMzAmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552260; c=relaxed/simple;
	bh=sfShbN3MtL04B59VkBAUWMdlggeExdjQmnBFeKwxs9U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a9EfztvfGVxWNgy2UTWvexScILE5NhDsRGaUTI81WzpPozqFOfP32l5rHESYmrH/fzqiMeYMt6yk9f7W8tXvfuxo8OhCZeIn6Q6yA96x9DKN9YTtjFMQV1gi8ZdyAbmVYK4jsSvmWvuUJBaB4AhbbcO/yY4PasJPaYAdhJNjDMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WF3QNUdr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WF3QNUdr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6F61F0089A;
	Wed, 16 Sep 2026 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789552240;
	bh=sfShbN3MtL04B59VkBAUWMdlggeExdjQmnBFeKwxs9U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WF3QNUdrMVgL45Qtq7zg0iXtzef8xqbHxXfatWR0IQn7ymB8zT/Xpbyn3JsClAc35
	 9P4WsBnlZOYW3yNDQhlsotESw6HlNy4MDixOjnHKPjOspettY/KfOLm96mVGQB3xRZ
	 n7rrDBBDXp1/tVCyaVcqABEi39kA2gnHfCpM/MYQ12Ue1+eLGBKZsb6X47oLzy/zqu
	 t/8cWGFrHXMYp/3Qe69PfQPfS8619MG4emidkp05W8ZZK6JpRqSfwNX3hk4gHtgvkH
	 7fTwQz0SsNZN0QcyCkm5xVBplqhyVYwapnY7U1wWPrBctudn+jfUTCqK4cBkE9N5pn
	 HAWS/xPShsEhA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Priya Bala Govindasamy <pgovind2@uci.edu>, boqun@kernel.org,
 ojeda@kernel.org, rust-for-linux@vger.kernel.org
Cc: ardalan@uci.edu, zhiyunq@cs.ucr.edu, dzueck@uci.edu, pgovind2@uci.edu
Subject: Re: [PATCH 0/1] rust: block: Fix unsoundness in `Operations::queue_rq`
In-Reply-To: <cover.1789420324.git.pgovind2@uci.edu>
References: <dr-4ZXYvFqamrGT7sNDgGGci-fvvY9rMjSg9s4XG_gslBqFmVHmmd7yEt5xN5mBU5MlsdK-uvAL4Ydfz0J86Sw==@protonmail.internalid>
 <cover.1789420324.git.pgovind2@uci.edu>
Date: Wed, 16 Sep 2026 11:50:27 +0200
Message-ID: <87cxud4ja4.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Priva,

"Priya Bala Govindasamy" <pgovind2@uci.edu> writes:

> Dear Linux kernel maintainers,
>
> We are developing a tool called FerroLens to detect potential
> unsound behavior in Rust code in the Linux kernel. The tool
> internally uses an LLM to detect bugs.
> We then perform manual analysis to verify these reports.
> FerroLens reported the following bug in rust/kernel/block/mq/operations.rs:
>
> A safe `Operations` implementation of `queue_rq` can retain a clone
> of the provided `ARef<Request>` and return an error. This should not be
> valid under the intended blk-mq ownership semantics, as an error
> means the driver returns ownership of the `Request` to the block layer
> which may requeue or end the request.
> The refcount of the `ARef` is expected to be dropped to 0.
>
> If the driver retains a clone of the `ARef<Request>` while
> returning an error, it leads to a mismatch in the ownership state of the
> request. The refcount of the `ARef` will remain 2 or greater.
> But the refcount alone does not prevent the underlying C allocation
> of the `Request` from being freed.
> A driver with such an incorrect implementation of `queue_rq`
> can lead to use-after-free.
>
> The Rust `Operations::queue_rq` documentation and type signature do
> not currently state or enforce the restriction that it is invalid to
> retain a clone of the `ARef<Request>` while returning an error.
> Operations is also a safe trait. Stating the restriction in
> the documentation may not be enough as soundness depends on the
> implementation.

I am aware of the issue. We have are fixing it by reworking the
reference count on the request structure and introducing a typestate for
the request [1].

I would appreciate review tags on the change.

The change is depending on the `Ownable` series being merged, which
hopefully is not that far into the future [2].

I do not think your solution of making the `Operations` trait unsafe is
viable.

Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/r/20260609-rnull-v6-19-rc5-send-v2-38-82c7404542e2@kernel.org
[2] https://lore.kernel.org/r/20260910-unique-ref-v21-0-e83257373062@kernel.org

