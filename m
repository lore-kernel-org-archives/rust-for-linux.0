Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D4C273D8F
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 05:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770267698; cv=none; b=pOpG738ctobklqQcmIbHi8P9c10LhZfK1PUI+1zYym/6qcYl/qLKhCw1XzL/Dc2wyzGnxVgBCQjLlt+Xg089PJJ73SWaEQ9NsgbAZcQIP0UxQwMlf/Ih3YFv1qHZyzbJeVuNGZBW/3zFfM5SXwmGIHsfrGsjCuLBa/51Fp1Z9s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770267698; c=relaxed/simple;
	bh=iuxZBwW3QRuJTfqfWm/1tje933j9gYVyHAX7Yi3MRbo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XuFHL1M6aETVbYh7nSxP3rxi9PRmwOVS3P5l/5ah8MGk/jM+lr3xm5lwNJPTPpx6lsSpIavSOAXoRpKoVOKxGz1DKV18AW9s1JSYWge59SNBtDQ0NTD083K8sSzNbq9be5Rb2M0iCcEBrI2PZK4yKxRhj1+cQ61PElzy+S05ma0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 5 Feb 2026 14:01:28 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.110)
	by 156.147.1.151 with ESMTP; 5 Feb 2026 14:01:28 +0900
X-Original-SENDERIP: 10.159.44.110
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
Subject: Re: [PATCH v3 3/3] rust_binder: handle PID namespace conversion for freeze operation
Date: Thu,  5 Feb 2026 14:01:28 +0900
Message-Id: <20260205050128.17532-1-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aYMkdwic6UNwTi5D@google.com>
References: <aYMkdwic6UNwTi5D@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Feb 04 2026 10:50:31AM +0000, Alice Ryhl wrote:
> On Wed, Feb 04, 2026 at 06:11:47PM +0900, jongan.kim@lge.com wrote:
> > On Tue Feb 3, 2026 at 12:59:45PM +0000, Gary Guo wrote:
> > > On Tue Feb 3, 2026 at 6:59 AM GMT, jongan.kim wrote:
> > > I think this function already has `ARef<Task>` for all the process, so it feels
> > > to me that the search should be simply based on task, rather than PID.
> > >
> > > I.e. instead of pid_t -> struct pid -> struct tasks -> pid_t and then search
> > > with it, we first get `Task` from VPID, and then search directly with it. This
> > > would also make it no longer necessary to have the init namespace check.
> > >
> > > (BTW, the current impl looks quite inefficient, get_procs_with_pid returns a vec
> > > which is pushed again to a vec, perhaps using a callback or simply passing in a
> > > `&mut Vec` is better?)
> > >
> > > Best,
> > > Gary
> > >
> > > >              procs.push(proc, GFP_KERNEL)?;
> > > >          }
> > > >      }
> >
> > Thank you for the suggestions for more efficient structure.
> >
> > Your proposal to use task-based search instead of PID-based search
> > could simplify the logic.
> >
> > However, I have a few considerations:
> > 1. The current implementation maintains consistency with the existing
> > C binder implementation. Any structural change here would ideally be
> > reflected in the  C code as well to keep both implementations aligned.
> 
> Yes, the drivers should match.
> 
> > 2. Since the majority of binder usage occurs in the init namespace, the
> > current early return (checking task_is_in_init_pid_ns) avoids the overhead
> > of find_vpid() and pid_task() calls in the common case. If we always go
> > through the task lookup path, this optimization would be lost.
> 
> Well, I suggested this approach too on the previous version:
> https://lore.kernel.org/lkml/20260130015427.83556-1-jongan.kim@lge.com/
> (I mentioned it on C Binder, but they should of course match.)
> 
> I'm not necessarily that concerned about the optimization. Freezing is
> already a bit expensive to begin with.

Sorry, I misunderstood your intention before. I will update the new patch
to apply your recommendations for both the Rust and C. Thank you for the
review and suggestions.

> > 3. Regarding the search mechanism and vec efficiency improvements you
> > mentioned, these seem like valuable optimizations but would represent
> > a broader architectural change to the binder driver.
> 
> Improving get_procs_with_pid() seems like a separate thing. Perhaps it
> could be part of this other series:
> https://lore.kernel.org/all/20260201000817.275382-1-shivamklr@cock.li/
> 
> Improving it here should only happen if you need to rewrite said
> function *anyway*.

Since we're changing the implementation to use task-based comparison instead
of PID-based comparison, we won't be using get_procs_with_pid() anymore and
will need to write a new function (e.g., get_procs_with_task()).

Would this approach align with the Rust binder development direction?

> > I'd like to get input from the binder driver maintainers on whether:
> > - This kind of structural change is desired for the binder driver
> > - If so, whether it should be done as part of this PID namespace fix or
> > as a separate refactoring effort
> 
> See above.
> 
> > - Whether both C and Rust implementations should be updated together
> >
> > Alice, could you please advise on the preferred approach here?
> 
> Both implementations should be updated together.

We will update both the Rust and C implementations together.

Thanks.
Jong An, Kim.
