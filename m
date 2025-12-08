Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F85C31ED7B
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Dec 2025 14:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765204225; cv=none; b=u6aNiH444RReAhUYCeJYBWR0cMY7sUM1lxCNFRrJcFdbklnEr2+XanGF3GAme4SzawyPaV5XIZTr58bJDOSg5P8O2z8TC7jVck2oJo/Gto1I6rT/dmfOFmASf7PwBPNyk0LVY4CnEXowmMNVdTXV29b6euI2ubxku4GluvwuKMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765204225; c=relaxed/simple;
	bh=Dx3drf69sY0I4EUqQ5WyCZgcCAzVdkzxv+Y77YDScyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUt/eRqy7p7lyEzlngN+ZBNuSbeVv4C5yCqveD4uNFJ01e2SgY9NajZL30SkbxtdcidIxocrnbalH/wYOnEW++MjU0mrP7+wZkXe9I0XIYjpMzkkJ97piF+OK+jVoV76YYnjt6DQ1mrA15lzm4crM23nGVEbDpFdrhe82iBX9R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=egM1Kdr1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="egM1Kdr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765204222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e6ZKmsR/YSREUi7ZB/OOrl9whjrrcpHfXDAkzs+rSN4=;
	b=egM1Kdr180UTlVatU0ZWbSyp3ce5nhnc0lzEQHtnVaK4k93/ZORtnv2WRyK5NgsnwBD/BQ
	aM9JyV0Fx/Eqg2YjhGjRr+8N07aLw81nESPXXlmYrYEXXq0Ttsshq7AdJFf5E+r4rZVki+
	SQajgKutT//q8AiahK2vigTbnYdEB/4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-vMKIEFUDNKa82Y7y-AU0XA-1; Mon,
 08 Dec 2025 09:30:11 -0500
X-MC-Unique: vMKIEFUDNKa82Y7y-AU0XA-1
X-Mimecast-MFC-AGG-ID: vMKIEFUDNKa82Y7y-AU0XA_1765204208
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E24418002EC;
	Mon,  8 Dec 2025 14:30:08 +0000 (UTC)
Received: from fedora (unknown [10.45.224.91])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 369AB1800576;
	Mon,  8 Dec 2025 14:30:01 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon,  8 Dec 2025 15:30:07 +0100 (CET)
Date: Mon, 8 Dec 2025 15:30:00 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Christian Brauner <christian@brauner.io>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Alexey Gladkov <legion@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: rust: wrong SAFETY comments in group_leader() and pid() +
 questions
Message-ID: <aTbg6O2HS2fGAow6@redhat.com>
References: <aTLnV-5jlgfk1aRK@redhat.com>
 <aTLp73haymcs1fkX@google.com>
 <aTLsUDBbcbl2ivme@google.com>
 <aTMUqp5pXzAscrdZ@redhat.com>
 <aTMhpX-_H4Y4J7Ud@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTMhpX-_H4Y4J7Ud@google.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Alice,

Thanks again for your explanations. Not that I fully understand
them, though ;)

On 12/05, Alice Ryhl wrote:
>
> To start with, it's likely that this comment is not the right choice
> for this function, given our discussion. Most likely group_leader()
> needs to be moved to `impl CurrentTask {}`

I obviously can't comment this proposal,

> and the safety comment needs
> to explain why being the current task ensures that the returned &Task
> lives for long enough.

This is simple. task->group_leader can't change or go away until
this task exits or execs. The "current" task can't exit/exec.

(This also covers the race with mt-exec from current's subthread,
 the execing thread will kill all the threads and wait until they
 all pass release_task(). Only then it will change ->group_leader).

> impl CurrentTask {
>     fn group_leader(&self) -> &Task {
>         // SAFETY: This is the current task, so the task must be alive.
>         // Therefore the group leader cannot change, and thus it will
>         // stay valid as long as self is the current task.
>         unsafe { &*bindings::task_group_leader(self.as_ptr()).cast::<Task>() }
>     }
> }

Yes, the comment looks good to me.

But we don't have the task_group_leader() helper yet, so far I
only sent the trivial initial preparations, see
https://lore.kernel.org/all/aTV1KYdcDGvjXHos@redhat.com/

So if you are going to move Task::group_leader to the
CurrentTask block, please use .group_leader directly, like
the current code does.

Oleg.

