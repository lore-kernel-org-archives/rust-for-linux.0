Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2181AAE13
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 01:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769738074; cv=none; b=Pb5XzBDLiONaybHkxwHYy+1yqfCjbFqavyS8ie62OyPzJFWRBPxq8Pti5y3dCGPNXnaepu2ovHFomWy/Q7qan51SrFkeZQfe3GAtYnatUSftQwbPyiH9ALFnxm5Hg+jjBtL8gRkDelwo6EFPPtpD3bfdiTb7fsXhMOpvREopbRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769738074; c=relaxed/simple;
	bh=3L2l1fhjrObn4jtIzMcPt3JbcP0nPxYcDHKszlf8Qbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HeDmqIGzr4XrcqTkFpfe7e3KjvmS6nHYO5qn+vr9fpnxE2TxX8GLuj/tJf1mW8vmw7eeGq36vqYqP8U76mN0YQvWtfq9HpVsHct9qBrVYRojyBh0nL/Jk6dhoP03H34+BQOo38puVhCqCxFMbcBxXtgCxnGuTy89eab5ZkB5gBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.53 with ESMTP; 30 Jan 2026 10:54:27 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.48)
	by 156.147.1.125 with ESMTP; 30 Jan 2026 10:54:27 +0900
X-Original-SENDERIP: 10.159.44.48
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	arve@android.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brauner@kernel.org,
	cmllamas@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jongan.kim@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com,
	tamird@gmail.com,
	tkjos@android.com,
	tmgross@umich.edu,
	viresh.kumar@linaro.org,
	vitaly.wool@konsulko.se,
	yury.norov@gmail.com
Subject: Re: [PATCH v2 1/3] binder: handle PID namespace conversion for freeze operation
Date: Fri, 30 Jan 2026 10:54:27 +0900
Message-Id: <20260130015427.83556-1-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aXs5Y3xAFKyZr6nd@google.com>
References: <aXs5Y3xAFKyZr6nd@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alice Ryhl @ 2026-01-29 10:41 UTC wrote:
> On Thu, Jan 29, 2026 at 05:41:17PM +0900, jongan.kim@lge.com wrote:
> > From: JongAn Kim <jongan.kim@lge.com>
> >
> > Currently, when a freeze is attempted from a non-init PID namespace,
> > there is a possibility that the wrong process in the init namespace
> > may be frozen due to PID collision across namespaces.
> >
> > For example, if a container with PID namespace has a process with
> > PID 100 (which maps to PID 5000 in init namespace), attempting to
> > freeze PID 100 from the container could incorrectly match a different
> > process with PID 100 in the init namespace.
> >
> > This patch fixes the issue by:
> > 1. Converting the caller's PID from their namespace to init namespace
> > 2. Matching against binder_proc->pid (which stores init namespace TGID)
> > 3. Returning -EINVAL for invalid PIDs and -ESRCH for not-found processes
> >
> > This change ensures correct PID handling when binder freeze occurs in
> > non-init PID namespace.
> >
> > Signed-off-by: JongAn Kim <jongan.kim@lge.com>
> 
> > +     rcu_read_lock();
> > +     task = pid_task(find_vpid(pid), PIDTYPE_PID);
> > +     init_ns_pid = task ? task_tgid_nr_ns(task, &init_pid_ns) : -ESRCH;
> 
> You know this is making me think ... here we are obtaining a pointer to
> the `struct task_struct`, then we convert it to a pid, and we compare
> with the pid of the binder_proc's task.
> 
> Why not just outright compare the `struct task_struct` pointers?

Thanks for review and feedback. I hadn't considered that.
I will update patch to compare by using `struct task_struct` pointers.

Thanks. // JongAn, Kim
