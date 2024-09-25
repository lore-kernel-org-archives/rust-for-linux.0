Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A675F145B0B
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727227649; cv=none; b=DPjLz/xEdTP/VaUsUVRKGoYYlBPi2nv5OeSEIYpbSqTys41zlQq3VESm0bpnpU8mHUbX7Pr6OEOMm+KPjMhYyT1ulrYDsxGHeGtAnBM5eWiiqrtPvUIrOfqyywrrRPyQXfXO4TwCPJMVWOWuE5G+ouGLVZFk5pndjZLQfCm44JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727227649; c=relaxed/simple;
	bh=4nwk9eNCkK3PWFSCfGa0O+Gl5Sbe0I4ZnSD9RCCCdkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rYK+lp3d35vVl09GZSeBr3s0GRxOKEwtNx98v9NmqzqSBWeLeRxMnRxEmtcVKt4Q4ZGE0ywvM0aESrFTfH7zF9DjKsnDE1XtyHshjoUnNgbFEDtY2N70ncpWj9k8PzT+FAaLFuvoiIsa6HK7C0hUXEMATg0Ds5AIQ4fZs0hx/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R1teuMLo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R1teuMLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727227646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FiQpz48Zv+aPzHRarVm6C4GSQFwmrVBySuudWnyMOdI=;
	b=R1teuMLoT/wX6de8iS33xKi37u99A/UfHcvUqmK2bgYVo/Fri0Tz+EHnv27wpOcWpyRCig
	vB0RFKQ98tcNY7EQqT+iJ8bBTyqT/Grje5UbziXwMJM6txqHb8lmSxEOrsHPIdNQTxpuxn
	IqsM81oXy/HGyoEatf3ihxMWRszZuTQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-LPWt7ITPOOuehTkoLqJX5w-1; Tue,
 24 Sep 2024 21:27:23 -0400
X-MC-Unique: LPWt7ITPOOuehTkoLqJX5w-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E622A196C425;
	Wed, 25 Sep 2024 01:27:21 +0000 (UTC)
Received: from [10.2.16.229] (unknown [10.2.16.229])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 04E8719560A3;
	Wed, 25 Sep 2024 01:27:19 +0000 (UTC)
Message-ID: <9a6f0d8b-7ccb-42f4-a6aa-3e38f08eeb86@redhat.com>
Date: Tue, 24 Sep 2024 21:27:19 -0400
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: add trylock method support for lock backend
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Filipe Xavier <felipe_life@live.com>, aliceryhl@google.com,
 ojeda@kernel.org, gary@garyguo.net, benno.lossin@proton.me, will@kernel.org,
 rust-for-linux@vger.kernel.org
References: <DM4PR14MB727673292DEC9134C3FE559CE9672@DM4PR14MB7276.namprd14.prod.outlook.com>
 <ZvJkFr6kdVx8kIMq@boqun-archlinux>
 <4c94912d-b0d9-4b7e-8490-ffd91fdd2184@redhat.com>
 <ZvM-46lb_CSPr19h@boqun-archlinux>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZvM-46lb_CSPr19h@boqun-archlinux>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/24 18:36, Boqun Feng wrote:
> On Tue, Sep 24, 2024 at 02:31:43PM -0400, Waiman Long wrote:
>> On 9/24/24 03:02, Boqun Feng wrote:
>>>> +
>>>> +int rust_helper_spin_trylock(spinlock_t *lock)
>>>> +{
>>>> +	return spin_trylock(lock);
>>>> +}
>>>> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
>>>> index f6c34ca4d819..f4e51a5a1f23 100644
>>>> --- a/rust/kernel/sync/lock.rs
>>>> +++ b/rust/kernel/sync/lock.rs
>>>> @@ -58,6 +58,13 @@ unsafe fn init(
>>>>        #[must_use]
>>>>        unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState;
>>>> +    /// Tries to acquire the lock without blocking.
>>> As I suggested in v1, "without blocking" is not accurate here because
>>> a lock can be a spinlock. So you can just remove it. I think the word
>>> "Tries" itself implies "neither busy waiting nor blocking".
>> Actually a spinlock in a PREEMPT_RT kernel is a sleeping lock. Not all
> I don't see why a spinlock sometimes being a sleeping lock can justify
> the inaccurate phrase "without blocking", it's still a spinning lock
> when PREEMPT_RT=n, and function document should cover all the cases.
>
>> people will associate "Tries" with not blocking. Anyway, I don't think it is
>> a problem with the "without blocking" phrase.
>>
> The problem is that for a generic Lock which includes spinlock and
> mutex, "without blocking" is really inaccurate or redundant. For
> spinlock, raw_spin_lock() also doesn't block, but it's not a valid
> try_lock implementaiton. The phrase "without blocking" doesn't provide
> useful or correct information to the users IMO. It should really be
> something like "without waiting for the owner infinitely when
> contention" if "Tries" is not an enough sign.

Right, if your focus is about no waiting, the phrase "without blocking" 
is insufficient. It should be "without blocking/waiting" or something 
similar. In that sense, just saying "without blocking" can be misleading.

Cheers,
Longman

