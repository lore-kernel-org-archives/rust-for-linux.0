Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266EB3590C0
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764955322; cv=none; b=qdUQ5M50Cm8MxhATURn7hzPZg1c33jRyMQfPPlF6HpnWVQR+oU/cnFFvsNTX5FBgWkKvvGVtacxoJngprM24XdGTuVr6vZconRm6HwsI1QIq7OSosKurmWqXxxlWCO8Usx/98JCo40yJGAgndL8Tbs55AjkACgl7iP5ELxM/5Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764955322; c=relaxed/simple;
	bh=I9ttkriMxl9t6UAhfVHbJQ69OG47mK8uKAxNgPvx834=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B07HC1LVv7mAVp8Qr8hNO1MlESB59uzD5sfdfpizgT18WSEkehufdp20qZq4z39DsPMpHajwyGzIjxZFTjpLdFZfxgbOFrSAH7dj7ec6HP2LpMnzH9he4F+9kCEx0NABSMyk+gaUHya1OWIwuRexhZe9X7Mp231F59xfFyke8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C1lIRgEB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C1lIRgEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764955320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gh3WHTwrfEd/xh5vq0kXt4JOpGCIy5FJ/UXsnMyueQ8=;
	b=C1lIRgEB4R9bspDrAYZc054+xlbFLaUUwZVd70xeo8Vg1DRjYyik/d7+GgOMzGXGteb+qP
	mg2aDAz8IFJzyPP6F0JvSdOQyFpwD/oyvcKO62uYAEnMfJku3eV5o3kAzzaq0z96fAb8zR
	2TVY5laVZQRyiVjE7kyn59L6BpkwnNM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-hCzoFuSHMombLDlxxJ3k7w-1; Fri,
 05 Dec 2025 12:21:56 -0500
X-MC-Unique: hCzoFuSHMombLDlxxJ3k7w-1
X-Mimecast-MFC-AGG-ID: hCzoFuSHMombLDlxxJ3k7w_1764955314
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3DB2F195608D;
	Fri,  5 Dec 2025 17:21:54 +0000 (UTC)
Received: from fedora (unknown [10.45.226.96])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3DEB83011A86;
	Fri,  5 Dec 2025 17:21:47 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  5 Dec 2025 18:21:53 +0100 (CET)
Date: Fri, 5 Dec 2025 18:21:46 +0100
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
Message-ID: <aTMUqp5pXzAscrdZ@redhat.com>
References: <aTLnV-5jlgfk1aRK@redhat.com>
 <aTLp73haymcs1fkX@google.com>
 <aTLsUDBbcbl2ivme@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTLsUDBbcbl2ivme@google.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 12/05, Alice Ryhl wrote:
>
> pub fn group_leader(&self) -> &Task {
>     // SAFETY: The lifetime of the returned task reference is tied to
>     // the lifetime of `self`, and given that a task has a reference to
>     // its group leader, we know it must be valid for the lifetime of
>     // the returned task reference.
>     unsafe { &*bindings::task_group_leader(self.as_ptr()).cast::<Task>() }
> }

Thanks again Alice, but the comment still looks misleading to me...
OK, quite possibly this is because I don't understand what does the
"lifetime of the returned task reference" actually mean in the rust code.
Does it mean "lifetime of task_struct" of "lifetime of the process/thread" ?

Let me provide the artificial example. Suppose we have something like

	struct task_struct *TASK = NULL;

	void stupid_example(void)
	{
		TASK = get_task_struct(current);

		do_exit(0);
	}

and a non-leader task calls stupid_example().

After that the global TASK pointer is still valid, it is safe to
dereference it, task_struct itself can't go away.

But! Right after that TASK->group_leader can point to nowhere (to the freed memory)
if another thread does do_group_exit() or sys_execve().

So. Perhaps the the comment should say something like

	SAFETY: The lifetime of the returned task reference is tied to
	the lifetime of the THREAD represented by `self`

?

Oleg.

