Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0AE11CA0
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 18:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727202719; cv=none; b=LxGdxF19c2DTAnuZJj6QTqdU78IyTpJ84Dtx1DBvAAk3Osia0F6A2A/ecal/S/9h9d7i75FkEibMTpqZbf0teJM1UNRXUJoTpF1FDAUuuwzuY8Rh7Pi/lxQy9vy0VHRR/jJkYbAlPOrke+zlWU0F1iTd2aUtxY1oNOk+EdZKfJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727202719; c=relaxed/simple;
	bh=eAlEqlnFKxw99tuoJn9T7UJ/7w3qa6+uKHLx3oYiMI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8pS4oCfWn+tqZV9AdS7qNzsY5l209tZ5cmpx0tqo7lkFC/foBVSgSU76MsHOT4PktLgd1fXlo0CkLwm6nv+/cmbNzb5pu2RJzkygTelz4KO6qPuVp0fCDQfa+oyc7M2ml9zXlFsi8u9gED5/z0WmIHwALCHi/XrkhWomqel9dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQU+2WKP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQU+2WKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727202717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWEro6+TZCX0c9y7ajSJKcVMwKuIv2bm1FybTA79CcI=;
	b=dQU+2WKPm3Ms5HvXJRbJ7hoOeyTX08gX9iU5AhIwCYOXxucppZfWTqs+wWyBECber2SvlL
	WP+ZxQpPabChpzWfSfOqyB2kd586u1io7GuhdI84WpW716FBKWjdxLp7kuiHE4hdJZDlC/
	6A2p2Xx7ZlO345P5Fem7FcbFz2iqRzE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-HigSunj1MN2KLtqlfxcE6Q-1; Tue,
 24 Sep 2024 14:31:54 -0400
X-MC-Unique: HigSunj1MN2KLtqlfxcE6Q-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A66E0188FE98;
	Tue, 24 Sep 2024 18:31:46 +0000 (UTC)
Received: from [10.2.16.229] (unknown [10.2.16.229])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BFD6A1956088;
	Tue, 24 Sep 2024 18:31:44 +0000 (UTC)
Message-ID: <4c94912d-b0d9-4b7e-8490-ffd91fdd2184@redhat.com>
Date: Tue, 24 Sep 2024 14:31:43 -0400
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: add trylock method support for lock backend
To: Boqun Feng <boqun.feng@gmail.com>, Filipe Xavier <felipe_life@live.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, gary@garyguo.net,
 benno.lossin@proton.me, will@kernel.org, rust-for-linux@vger.kernel.org
References: <DM4PR14MB727673292DEC9134C3FE559CE9672@DM4PR14MB7276.namprd14.prod.outlook.com>
 <ZvJkFr6kdVx8kIMq@boqun-archlinux>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZvJkFr6kdVx8kIMq@boqun-archlinux>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/24 03:02, Boqun Feng wrote:
>> +
>> +int rust_helper_spin_trylock(spinlock_t *lock)
>> +{
>> +	return spin_trylock(lock);
>> +}
>> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
>> index f6c34ca4d819..f4e51a5a1f23 100644
>> --- a/rust/kernel/sync/lock.rs
>> +++ b/rust/kernel/sync/lock.rs
>> @@ -58,6 +58,13 @@ unsafe fn init(
>>       #[must_use]
>>       unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState;
>>   
>> +    /// Tries to acquire the lock without blocking.
> As I suggested in v1, "without blocking" is not accurate here because
> a lock can be a spinlock. So you can just remove it. I think the word
> "Tries" itself implies "neither busy waiting nor blocking".

Actually a spinlock in a PREEMPT_RT kernel is a sleeping lock. Not all 
people will associate "Tries" with not blocking. Anyway, I don't think 
it is a problem with the "without blocking" phrase.

Cheers,
Longman

