Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6441323D281
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 22:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982591; cv=none; b=Fz48XYJ8FJV8pOpKcgdZaSvtRq54CVaJiuXd2hCqTcI4CbBkPBETXhWpnzFaIFGVJ9qX5Yvz/t2qb0NU/XTbAoi2zvvYyQMvdfPgqpiptMHaVKXPZbXEzhuv9RwJDGoL4vK3glVNnwU2tbqSvwnupc/P/U7HYbz93BjXwS+d6A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982591; c=relaxed/simple;
	bh=WManK8fYea5hc4U49WCTf7Pw4RApp4ZhF9zpL+ZYO58=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=fLmr72IPBDqzm0DF0fSa6p2xUKT+YOtLKLvWp/szjX9jHr9aXM75z5uGJQjhztMQyho1joHGtTjBm1Sf1eR3SzeN0lV70FU1J52GfME43i/IVLS+xbyo6dErIfWg0WEHm1Q6xnTq/+RDTaWuFEDG6hPM2lP+gpbD6G5Joueeeuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I5o6YFmm; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I5o6YFmm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776982587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=WManK8fYea5hc4U49WCTf7Pw4RApp4ZhF9zpL+ZYO58=;
	b=I5o6YFmmNan+dfYbeCVXWJBHXCilGpMhckK8LfRHCYCntNOM4dHkXLZFvNkEDJkbIQ2ODF
	kO/s1Jvz+emtMOogf3T+u/u1X8r66Nxiqe0nxr+GQwL5Z48gtkUz8QA0L023efRsBV5JjD
	HphwppyN09ERMK3Qdab/0DCG/0CROcE=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>,
 lyude@redhat.com
Subject: Re: Maybe make Sashiko emails opt-in please?
In-Reply-To: <971a606f-3319-46c5-ad84-a250f8044d53@nvidia.com>
Date: Thu, 23 Apr 2026 22:16:07 +0000
Message-ID: <7ia4tst18grc.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Hey!

I'm totally happy to disable email delivery for rust-for-linux if Miguel
is onboard - I generally rely on maintainers for the decision how to use
Sashiko or not use at all. I have obviously zero interest in pushing it
against developers will, however it's hard to achieve a full consensus
on anything in a large group of people, so I have to prioritize maintainers
opinion.

Miguel, what do you think? I can keep you on cc, so that you will be
receiving reviews, but nobody else. That would be my personal preference
in this case.

Otherwise:
Unfortunately I can't provide Sashiko as a free service for an open set
of kernel engineers, I simple don't have a big enough budget to cover
associated compute costs. If there is some company which is willing to
cover it, we can probably set something up via LF - Sashiko as a project
belongs to LF.

I try to make it easy to set up local/corporate instances and also
try to make it work with any LLM providers. I personally only have
access to Gemini, so I'm somewhat limited in testing here and rely on
other contributors.

Thanks
