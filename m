Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794659889;
	b=Srl7z4YfPp0myDEiOVYSiChNa8aV76pbU4e474evE2JYHeXJr3PtTaKJCavvOsmy7xGT
	 UrUTGIdeNKkhSD5toDKYD3dvQhQqffeMC794S2h2dWQnHNZw0pwZm67ZnI+i23qjSjoTI
	 aSRvch2fromOZ5TuuPTmKDeh3exHEO1ID1m3CzaqcFIYEB4cADKdB6tehMA3t/bLyG07H
	 yTt3Wm15tRvRKeHflV0oWhsAjlzs4sr1DTT4ejfz8pqjyQqd2owePMtWIgWq3YkHcT/RO
	 XXfco3gOPAn8Bc5GJ0Bc+VY+6UqLa9oSNUeHidT7CO+NlRbJWHjtoDeDB3ge64/u9DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794659889;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UzVGxU4MW62VeR80v0cSXY3TrPWVP7dGkSQALMLtfec=;
	b=wjVBabf6U1HduEFjJ67UfHGSYEdn8rpj2k8sb/KB3zD2MBfxQkmUPm+AevpLuCxpeO3s
	 /tHuZbTM9NEi78i1i5BOxjc+VpGITXXYOSqjbjx7V3AmixBgExhDuKhFNsbrvPC+UF9oo
	 icaAsA/fhvRnEMUZp1eiX4ukbEvjui2jigZgsqWsQawE2L8K80n2XLpoqV8p3HrX69Jqo
	 C8OkjiqqcSBn2ymUL4+N7TyH7CJboDaKK/0gEpC5V4D7zuSbWeITKW0kba71f2d/krqkY
	 fZvOFuGXMKpp0/Qai4pNsUy54o1U/Sml4GtFRJ/r80R8iPF183ZOMiTBpCU3HaenXXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AA317Jo+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4120606A329;
	Sat, 14 Nov 2026 12:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4120606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AA317Jo+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C73201516;
	Sat, 14 Nov 2026 04:37:57 -0800 (PST)
Received: from [10.163.159.227] (unknown [10.163.159.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB0F73F632;
	Sat, 14 Nov 2026 04:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794659880; bh=VZwlqyk/0X7EMW4/W5ZH00FGZKTMqa/W1AB43sYEXDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AA317Jo+BG0PVX+zpc3wReQawZ4z6+3EkeKUwuHZSpCwd8RnNYmuGr3KGZtt8ziaC
	 evp3GfOCJj2imiJeW2gD2EeRZuvZgeXcUK2tyqPEH9U0ISg5xcknH4RHwfPaksLdBZ
	 6F4ajfnCZ/zsi51R7YBArbkNHQ0vHUXnXDSGXCyQ=
Message-ID: <09e19be5-933c-4921-9d68-ae22f5a27e75@arm.com>
Date: Sat, 14 Nov 2026 18:07:46 +0530
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] MAINTAINERS: remove my reviewerships, add CREDITS
 entry for THP
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Uladzislau Rezki <urezki@gmail.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org
References: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261110-drop-reviewerships-v1-0-07c2f06e8dfa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/11/26 5:33 pm, Lorenzo Stoakes (ARM) wrote:
> Given the current throughput in the kernel resulting from AI-generated
> series, I unfortunately lack the bandwidth to generally be able to offer
> review except in those areas I maintain.
> 
> I have separated the patches into areas maintained by David, Andrew, and
> Alice + Danilo, so each can take the patches relevant to the subsystems,
> for convenience.
> 
> Apologies for doing this, but given the current trends I'd like to do
> something to make my inbox a little more manageable :)

Yeah even when I know I am going to simply ignore a patchset, it is
frustrating to see it in my inbox nonetheless.


> 
> Also add a CREDITS entry for THP, as, since Zi's rightful and well-earned
> appointment as co-maintainer there, I have no fear of needing to step in
> there, and so would like to record my time in that role.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---

Acked-by: Dev Jain <dev.jain@arm.com>


> Lorenzo Stoakes (ARM) (4):
>       MAINTAINERS: Remove myself from MM core reviewership
>       MAINTAINERS: Remove myself from MM misc, reclaim reviewership
>       MAINTAINERS: Remove myself from MM rust reviewerships
>       CREDITS: add entry for THP maintenance
> 
>  CREDITS     | 6 ++++++
>  MAINTAINERS | 5 -----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> ---
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
> change-id: 20261110-drop-reviewerships-264c745b11b5
> 
> Cheers,

