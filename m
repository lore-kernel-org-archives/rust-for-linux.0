Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109D329384
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764943718; cv=none; b=DPmTlhAbZutt4EdDg+ZTYsU329xQ/UBj8ZdFB22CQkAMyjv+JKb+jlSMtAWBUumrWejTtXP/u3va5lX79RLrNZ2SUwmc0t2v1uGubk2gBPf6RFmsXailx51ipswn1Ce0egr6JpaFoW5zD2yks/xDk9eVBLz9L+sL+7iEDvtfRAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764943718; c=relaxed/simple;
	bh=fyWFgSMRBlnND5t+fCRGQbBB1jFD0ntCxhg5rA7Aulk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNZQfm0Yhww48hLSfy6b5HxeIGKyIUgB9UfHfkscxT12RG5TBNPsvaJfGkTWfkoiWBYOOTq4aHap2c1ezdEf0XEMJWik3dDWoqiDj+0BBZ9GOmdFGRocMgE95FN8T8W8rS70sAzX5KCdgknJg2c/lscdj/uV7TYDed6uVRbI2e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cmXUelU/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cmXUelU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764943714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=vcGdJ94aoiCw20YEyC7Sexj6A+IMUa/67PDcrLfSFtQ=;
	b=cmXUelU/OdMtoOf/4yTE8Z0sxwl39TE67sRnXClIz0xPW2Fzx4q+a4V7BRe3Atd7H4C+CM
	tdLOmNEj1yqJsLMUW3z3Q6+jbzuEYIOujzpE934SabVokcnA1SBKKWU7+1QB3aI91HhJxP
	3pYFycG1SwGgjD/Wrv7/9L8mzNOF8DM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-493-EbneiWTdPli2_-VLW9LMMQ-1; Fri,
 05 Dec 2025 09:08:32 -0500
X-MC-Unique: EbneiWTdPli2_-VLW9LMMQ-1
X-Mimecast-MFC-AGG-ID: EbneiWTdPli2_-VLW9LMMQ_1764943710
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D064E1800675;
	Fri,  5 Dec 2025 14:08:29 +0000 (UTC)
Received: from fedora (unknown [10.45.226.96])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6C8233011A88;
	Fri,  5 Dec 2025 14:08:24 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  5 Dec 2025 15:08:30 +0100 (CET)
Date: Fri, 5 Dec 2025 15:08:23 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Alexey Gladkov <legion@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: rust: wrong SAFETY comments in group_leader() and pid() + questions
Message-ID: <aTLnV-5jlgfk1aRK@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From rust/kernel/task.rs:

    pub fn group_leader(&self) -> &Task {
        // SAFETY: The group leader of a task never changes after initialization, so reading this
        // field is not a data race.
        let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };

        // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
        // and given that a task has a reference to its group leader, we know it must be valid for
        // the lifetime of the returned task reference.
        unsafe { &*ptr.cast() }
    }

    /// Returns the PID of the given task.
    pub fn pid(&self) -> Pid {
        // SAFETY: The pid of a task never changes after initialization, so reading this field is
        // not a data race.
        unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
    }

The comments look wrong. Unless same_thread_group(current, task) == T, task->group_leader
and/or task->pid can change if a non-leader task's sub-thread execs. This also means that
in general it is not safe to dereference group_leader, for example this C code is not safe:

	rcu_read_lock();
	task = find_task_by_vpid(vpid);
	if (task)
		get_task_struct(task);
	rcu_read_unlock();

	if (task)
		pid = task->group_leader->pid; // BUG! ->group_leader can be already freed


Now the questions. Sorry! I don't know rust.

1. Can I simply remove these misleading comments? Or SAFETY comment is mandatory?

2. I am working on the patch(es) which move ->group_leader from task_struct to
   signal_struct, so the 1st change adds the new trivial helper in preparation:

	struct task_struct *task_group_leader(struct task_struct *task)
	{
		return task->group_leader; // will be updated
	}

   Now, how can I change group_leader() to use it? I guess I need to add

	struct task_struct *rust_helper_task_group_leader(struct task_struct *task)
	{
		return task_group_leader(task);
	}

   into rust/helpers/task.c, but will something like

	pub fn group_leader(&self) -> &Task {
		unsafe { bindings::task_group_leader(self.as_ptr()) }
	}

    work? I'm afraid it won't ;)

Oleg.

