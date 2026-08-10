Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDF23B27E7
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357998; cv=none; b=SSMMHhnBAKerDBxz8TYIbbp7LyYcwWerD3DRwsfp7+Y87aCCiNYX6pEIuOcyxgyGjup6kbuHCApYbT3ysWRpABAx4lLrNYNHESfQ4iXG881lTYIk8Y8D+Bva7b9hDfiGT/TufpMGZgQBICkhKoiKOKx+jPi+1KtGCfbYDZXQhPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357998; c=relaxed/simple;
	bh=5pMk5D+alUtS1DA4HkWg+E2BYazYOPGeCCq8ccsDMVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKSYbrIxy002l0PrrPb6Bz3TIGqN/AdHwMAxhyMJwoibfIdro0lWRziZfGwweg/2JcgPIflftGy5i5TQnDmhzSLX2MWU0RoTUHuD4wLucjlDfo23KGuMo/zPO2j6yMLcdYXImJFZ1ge+PmAHnJqhuIrNws7fVKdge6/PILGNqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z7xjGpIW; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z7xjGpIW"
Message-ID: <befe3dbe-e10f-44e7-a12b-e62ab7efdd77@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786357994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yc02dgCpEsm/MumNl3EfwtBUIVi3R+po7nkR8zRTo20=;
	b=Z7xjGpIWIAL0peIOPdF1fh7TlRtvMrEQF4qVR7wq9JrtrU6a1TVjck7pLWfQszL7MTpauR
	waQn/ORI6SUYpBZ/2y4EmqPSyNIJ4qV0pxDS851h0jgmxz6X6E1fqxlD30AoPtTtfkf2qf
	IdV2RjuAO3DqmNfg8PBkKjxB6Mu7PTU=
Date: Mon, 10 Aug 2026 18:32:57 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/7] rust: use vertical import style and remove
 redundant imports
To: Alvin Sun <sk.alvin.x@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
 <20260810093438.208557-1-alvin.sun@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260810093438.208557-1-alvin.sun@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Apologies — this earlier message was sent by accident while I was
editing. Please disregard it.

Best regards,
Alvin

On 8/10/26 17:34, Alvin Sun wrote:
> Hi Miguel and Andreas,
>
> I would like to follow up on the remaining patches from the "rust: use
> vertical import style and remove redundant imports" series:
>
>    rust: block: mq: use vertical import style
>    rust: block: mq: remove redundant imports and format
>    rust: block: rnull: use vertical import style
>    rust: doctest: use vertical import style
>
> As far as I can tell, these have not been merged yet. Andreas already
> acked the block parts [1][2][3] and David Gow acked the doctest change
> [4]. Is there anything else needed from my side before they can be
> picked up, such as a rebase onto a newer base?
>
> [1] https://lore.kernel.org/rust-for-linux/87v7bgf8f3.fsf@t14s.mail-host-address-is-not-set/
> [2] https://lore.kernel.org/rust-for-linux/87se6kf8af.fsf@t14s.mail-host-address-is-not-set/
> [3] https://lore.kernel.org/rust-for-linux/87pl1of7ve.fsf@t14s.mail-host-address-is-not-set/
> [4] https://lore.kernel.org/rust-for-linux/5748f9ca-e684-42a0-9297-e587b178a47c@davidgow.net/
>
> Thanks,
>
> Alvin
