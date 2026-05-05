Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03734BCADD;
	Tue,  5 May 2026 19:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778010792; cv=none; b=jVSFtXgC6N7uH+K9Ry92s6trHqwhrBPe6u6LaPwYIFa1pGDHcfoozLwetpCbaVhlMDm7Ehi1AbWcoo9RXwjAIbeRlqQ0cxOkx/yU7J0jgzPX2j0z9H8HEHyDCI9D3C1PWIv4HbPJW7+F4ntvC8jEemP3m0kUpBIBl0UKO8TPZGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778010792; c=relaxed/simple;
	bh=CxaCW3SztSa6uVryY2jTfZoS2WTsbMf8c+SG6cLKv1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjMgt1iYan6BC0gOwq0R/Yw1iEUtHQqsGVk+/j3BtAuXtgig8xDkPJduJ1wZ/QveOVHCAHuZoCE6YH0rSTwKxC1DgVnrrKh6y8NX0jUIhJRyYqSa9f6ThJsjvmE1TraNAslWZ6zC9EHTuE7+JkK8JGnDMvUD8GUc9QjqoT5Guus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=15IS1GSy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="15IS1GSy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=G8itzf8Jflt0Ma/iCT1AnAHkLO/HOilqQqAeS0XCM+U=; b=15IS1GSyhzFSvPhxU1034sAYFj
	0zOrPp/3W5wzDxzxJR5TpBoMnIhP+Zi4Q25Tg4ZoIhRg6xcLP+93jPN/k6nf1ng3OVmtE88HXyjn2
	zo2C8S2hdbVZvHTrAlCltrIjHEv6xrfRDsDssAqJYeaHmtzQfy1qnGMNHKuD66MgqWGYE2JRNULHH
	/+51gWC1vyFZJzoVzMbNArcsOE7lcRX2VJNvJN09JU2KhyLIEE5pgPQabMqF3Ag/tfaVhRlBlyhA3
	rQlm/KddivqoG4vduHdVdge3JBrENrFcxWXQ9dw6N4D/JKI1KFrinMJWMJ8JQE3B3saqt/ttJ7uFV
	JF87T0/g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLpG-0000000HLeT-1tFV;
	Tue, 05 May 2026 19:53:02 +0000
Message-ID: <72626637-2ed7-40c6-b5fb-75664e59e377@infradead.org>
Date: Tue, 5 May 2026 12:53:01 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] docs: maintainers_include: clean most
 SPHINXDIRS=process warnings
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
 <b57d83081c28aa52683b403f8836d098fcdd8530.1777987027.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <b57d83081c28aa52683b403f8836d098fcdd8530.1777987027.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/5/26 6:25 AM, Mauro Carvalho Chehab wrote:
> building docs with SPHINXDIRS=process is too noisy, as it
> generates lots of undefined refs. Fixing it is easy: just let
> linkify generate html URLs for the broken links when SPHINXDIRS
> is used.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Is this specific to SPHINXDIRS=process?
I don't see anything here checking for "process".

If this is process-specific, why?
Or is it just for SPHINXDIRS="<subdir(s)>"?

> ---
>  Documentation/sphinx/maintainers_include.py | 44 +++++++++++++++------
>  1 file changed, 32 insertions(+), 12 deletions(-)


-- 
~Randy

