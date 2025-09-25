Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AE5305E2F
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 18:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758826361; cv=none; b=oeDHxdxwdr7CqU1Dlx7HoWaQlurh1445I9uh2fvwKp+XLMKqzAD+egIgH9SwmpirQnDRf9SqHY8Me2LRQEaJo75GyTGaLvRHTUNoa9VSFZ1e/LhjddmgtFgGnmeF/W/SdYiwLD1I+hygAOPQXtwh7L45J7VfOLDxrpDVRmGgTNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758826361; c=relaxed/simple;
	bh=py1R90auHUwRZcLSo/U4sqM+Pp8Fv3SpehMlnxzLw/4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=rpZ5pR96PSJPRL9UxAuj+AwYZ/OefS/4poS1NUCjvBLw7ezEpTnLOsJRG2l2ytvPddO6X5A2/O3/hdbi35Ckdt1za5SEBpNxisdCJCq1HtmFx1g1RBYlREKXLBXcSG2R258UErXgv/c70EFgA99hMLn17jK/ZPsAPwSikF2CMyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=elijahs.space; spf=pass smtp.mailfrom=elijahs.space; dkim=pass (2048-bit key) header.d=elijahs.space header.i=@elijahs.space header.b=VL0Rnr3C; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Gge1mCn7; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=elijahs.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elijahs.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=elijahs.space header.i=@elijahs.space header.b="VL0Rnr3C";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Gge1mCn7"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=VL0Rnr3CT252ggiJajFl+wGy782COuKaCRn+M0Vx1ghE9d/7xxu3IyiO8W/Ir4CDeA32xB4C/vrzXsoxs77br6fib1WuFh+vNRj+y5lJLlUSlM7HRyb88WufKm4cazfNv5+9Sviocbw6NNuCJApMqGUlhwPX7i8N0oCzOddGxzquwRy8qfeT7NAxePZzqNV3W6ueRfWdvcnB2HYvkuQL4oeec+9dIcvi0ITBI0WGFieHGkDRi06mM13HtMaBx2HI6VzyDJMkLEJAIzhgpZklAiekRxeiYA+7GgsvG+SmE29MNE1CiljMx1y/KEfas2XtAUAM4qNI++Zar5V8gnLO7g==; s=purelymail2; d=elijahs.space; v=1; bh=py1R90auHUwRZcLSo/U4sqM+Pp8Fv3SpehMlnxzLw/4=; h=Received:Date:Subject:From:To;
DKIM-Signature: a=rsa-sha256; b=Gge1mCn7UZnkjPpZQQY2BEihVNsQPCQVv8hJTjwZAahrf9Hw2bQTq3FnnXMZbyILiTqnV1J9SE8eEZJxZqbyianaOJ8oiwoHjkM/7nebnSy3gy1IHh5WF5pt6WydZrqRLFaqt6Da4ToRWfxVLGi/1uMmxvTbmWS5WbQiBJcJueNnplPhaXOXsOrJNFQDqO8uefITIGF0yZ/1ieL6GICKf1ItUrTQvw0D5mj1W8sHC11uw2/cIPK02Rpd3/uA0tM4lqIFdEdK7B87MaZau0TF/2hmtsP0F3bJ+PTkGaT8+0bG0YxrT44bY54tdf0CLvLCPBP0vGWp3ePE0Y8wLQxLcw==; s=purelymail2; d=purelymail.com; v=1; bh=py1R90auHUwRZcLSo/U4sqM+Pp8Fv3SpehMlnxzLw/4=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 26912:4866:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -567714660;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 25 Sep 2025 18:52:20 +0000 (UTC)
Message-ID: <bacf0774-2128-43e8-92cf-6754fb554824@elijahs.space>
Date: Thu, 25 Sep 2025 11:52:18 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: slab: add basic slab module
From: Elijah <me@elijahs.space>
To: Danilo Krummrich <dakr@kernel.org>
References: <20250924193643.4001-1-git@elijahs.space>
 <DD1SGLU4180C.361W5XLH76XNC@kernel.org>
 <73d7d53f-439b-44a9-98ca-0b1c8fbc1661@elijahs.space>
 <DD22FI7F2ZHT.32SL8PXFZZHV3@kernel.org>
 <6e9c820f-070b-409e-ac25-af96b8b962c6@elijahs.space>
 <DD234804U7YK.3S2MBUJSFHF8J@kernel.org>
 <74b3ef24-a307-4d3c-891a-8c5283448b20@elijahs.space>
Content-Language: en-US
Cc: Elijah Wright <git@elijahs.space>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>,
 linux-mm@kvack.org
In-Reply-To: <74b3ef24-a307-4d3c-891a-8c5283448b20@elijahs.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/2025 11:51 AM, Elijah wrote:
> On 9/25/2025 11:15 AM, Danilo Krummrich wrote:
>> What are the other complex issues you are referring to?
> 
> I think I misunderstood what was involved for (4). I was thinking of 
> keeping the extra reference in the object but I think it can be done per 
> CPU. I'm not totally sure how much would be changed in the kernel but no 
> matter the implementation for (4) there will be some complexity
> 
>> I'm not sold on duplicating the Box code just yet. What issues are you 
>> referring
>> to?
> 
> mainly where the cache isn't static. if you have kmem accounting enabled 
> and a ZST that encodes the original cache's address then that would 
> break, unless I'm misunderstanding (3), but that's just an example. I'm 
> just thinking of potential code in the kernel now

