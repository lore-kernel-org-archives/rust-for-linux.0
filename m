Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE35356A09
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802584; cv=pass; b=fnT/go6Q5o13PRDHgkmbk4RxAtdsYKvpBIu9rsfRv0c9gabw4hRJIUBFPu9ntl7M584UZs1ccSyAB49WgHz/sGtEfZaDQcxTbBHwtx+bHVfgMAfmogb6KN7Dz5DJ83x2grXR9UT9L/bYP1gVpcvtGY43k1yEl3rkqSuRlxZXkVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802584; c=relaxed/simple;
	bh=WZv5jlN4zadCd5e2MjU5h4HlNNnSbpBWL7qfPiMmG+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ld5lT38lOJ75v6ZNPLHZummNJeKMzeWsiDHIJ//fjSsd3MRYWuNwFzHPPDA6hK2Oi/nSvjY9YFJ0ibBn0gaA+6vJbng2Xr/ZZj6ax1rH7nPK4NTOy6VFOMlmYgfZ13ofp8DOK8wqvnQF6Kogpo42WtsnqIpyMoNa2TG/4ak0ho4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b=hx2oHccp; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b="hx2oHccp"
ARC-Seal: i=1; a=rsa-sha256; t=1770802557; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=cYFSsA2O5iG7BAP9JDWI27rUEfCE86eXFaEIbmFkPTdnu5Lq4I4OJxo3EAzzmjJT7ORKP/W0iLLjioItjMtkTIWCHktLSaOj0jHM853Y+bkLrm30p4DF3pzwnBfOySea/qs9PtHPuH9F++SigB6Bp5vRGPjDXMoKUAAIFWm3uDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1770802557; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hG8W87yCXt0ssy6KuwVfWY01LdRukPjuXwocfyq7lqg=; 
	b=Y4k8A/5kWmBEbUAatSCfH6LTx8KbAnnXKQnq+eB9a2WSX8VmtgYsoSz1tm8Bi9cb7gtx0G7y8YXpMpvHYupjbufvLCDhSak6QVK9yZZWSfuS+HMp5hRZbedS3CN0/DRyZoVUHnMX97tEQIniinKy2zPb0zk/hz1+slq1Ylc2mzg=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=shivamkalra98@zohomail.in;
	dmarc=pass header.from=<shivamkalra98@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770802556;
	s=zoho; d=zohomail.in; i=shivamkalra98@zohomail.in;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hG8W87yCXt0ssy6KuwVfWY01LdRukPjuXwocfyq7lqg=;
	b=hx2oHccpVVHbEjHzCQ4tnYlNMXOiuyjgiVUQKEmB9BvkQ9G54jxmrgnds0lZc4aF
	qkV70cct6ft85V0M/yCcibXNetdh48gApXLWAUwQeDP8o/VZnb4xHva2dCuZwqOY5w5
	5GWo7mYRSuLPQ6npxTvzaOvIFGAIQUs0/wHf/0jc=
Received: by mx.zoho.in with SMTPS id 1770802554029569.2961951817317;
	Wed, 11 Feb 2026 15:05:54 +0530 (IST)
Message-ID: <91744c4e-d014-4fc8-856b-fafbd4ede284@zohomail.in>
Date: Wed, 11 Feb 2026 15:05:52 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com>
 <aYs5L1aG5S34teKT@google.com> <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
 <CAH5fLghy3_J_in-o=y8yh94+RLn6XihNOTzTiT2kk9DkXBMPVA@mail.gmail.com>
 <DGBKOL8Y6OH8.1X5RHNGCQAMC4@kernel.org>
 <DGBKWSS3PEGY.20YKV5CO7DCKT@kernel.org>
 <CAH5fLgg9sDW+MCK15yVyZ59BzXind+1vRj+PQ2xHQ8Bg7sxLRA@mail.gmail.com>
 <DGBLALCUGY7N.383JKRKNCRDW5@kernel.org>
 <1312bba9-442b-410a-9cb4-fe67879d2dcb@gmail.com>
 <CAH5fLgjwWQSHydyM6AMPiziBQjeO4rcNaOzuNV=CrHxRvYuaVw@mail.gmail.com>
 <af90cbe5-dcfa-46da-83b3-e903134c7f93@zohomail.in>
 <DGC0AJ9L0ZP1.20IV8O6FT1PTD@kernel.org>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@zohomail.in>
In-Reply-To: <DGC0AJ9L0ZP1.20IV8O6FT1PTD@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/02/26 14:27, Danilo Krummrich wrote:
> On Wed Feb 11, 2026 at 9:41 AM CET, Shivam Kalra wrote:
>> Thanks Alice. I'll go with the standalone helper function approach
>> with separate impl blocks for Vec<T, Vmalloc> and Vec<T, KVmalloc>.
> 
> If it's only needed for KVmalloc, which apparently is the case, let's just add
> it for KVVec only.
> 
> Also, please make sure to add a TODO comment mentioning why this workaround
> exists and what it should be replaced with, i.e. a generic shrink_to() that
> calls into A::realloc().
Thanks for the discussion on v3. The direction for v4 is now clear.
Summary of changes for v4:
1. Drop the Shrinkable trait entirely. (Danilo)
2. Implement shrink_to() only for KVVec (impl<T> Vec<T, KVmalloc>),
   since that covers the actual use case (binder). No new traits
   needed. (Danilo,Alice)
3. Add a TODO comment explaining this is a temporary workaround
   (page-boundary check + manual alloc+copy+free) that should be
   replaced with a generic Vec<T, A>::shrink_to() calling
   A::realloc() once vrealloc gains in-place shrinking. (Danilo)
4. In the binder patch, use a less aggressive shrink strategy to
   avoid shrink-then-regrow oscillation: (Alice)
     if len < cap / 4 {
         shrink_to(cap / 2);
     }
5. Fix commit prefix to rust_binder: instead of rust: binder:. (Alice)

Also noting that starting from v4, I will be sending patches from
a new email address: shivamkalra98@zohomail.in
I previously sent patches as shivamklr@cock.li, then briefly from
shivamkalra98@gmail.com. Both accounts ran out of quota, so all
future patches (v4+) will come from this address.
Thanks,
Shivam
