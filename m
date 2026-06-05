Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91659175A9F
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 06:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639799; cv=none; b=qqideuUUZR6O8i671B34/musww/NvyVQdaJC4Izf2ogSwTrx5uEM4CkU7ho5qUiofnG70yqcdY9cu9tqmHcs/bd/ew4q+AnWS4hI+4wQBJkw8W2RtYz6wUx7TXNmVwR+65p66+Z33fH4croOlG7s8kSowsWuvCRzfy+RyCOChHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639799; c=relaxed/simple;
	bh=PU8oJ90NZ7OmOd8dwIkg4Vgi+EVBdVd9meAdUBCnRSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nghHiDlOUWihtjZouMjBQRMWH7gyc/AiLjKl9AkXDoPfg6cJbtb8fQ6bVUgbcwQBuHpiO3FGjdVr694eskrl/dQuU2X+LzE1U8cIF6IVWouh0Bj599Wiyb3Za+UiltPiNNr/Mn+Vfb4A7CL9SqLQT0rI0owx128ZX3XW98CEwDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mhklfw2e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mhklfw2e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF17D1F00893;
	Fri,  5 Jun 2026 06:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780639798;
	bh=PPihRo4DKT0FvOdWXMI6iMoaR0YK31lXTF5Y1BH87so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mhklfw2er5oboDzAABDDEieqdzMjcpWcAJQMZTOv+Zr1WNc6+RTtku5nF4Q6qXFAV
	 i0FyEmm0gnADg1podlitrB3pyp+l+qf1RnHMu6s0l91MDhYREZa1G1dJkxT2V0y9FM
	 MGNZzxLYCioV85ZtlL+A43iEdDQja/TV17MUK3JYgWxKlQfJJqtX60ge8kzY7IG1dY
	 k/8x26lA40QbhNcW3RD+XYjL4K+z5M+4J1CJIoOeZRA6SGxTnPHa589w0AqFicY4MG
	 EnUu+fLXkuCg6kqLZ7RvTTy8wDXdpuoylz9sUsWcPOdDCERr42KuYYTQmrt9Mmbmp4
	 aH/zzWeTKBYZg==
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 22610F4006A;
	Fri,  5 Jun 2026 02:09:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 05 Jun 2026 02:09:57 -0400
X-ME-Sender: <xms:NWgiau9roEQnsp1wFhVyJp4Q7wG8yb-kZ1gMfo9it6Id4afp5HAj4g>
    <xme:NWgiaovMg5DOUKCN1H_JYaEYFBn967FWoYuQR4MbcYpuH5IgPi0iCaBA8UG1ycpvj
    cO6Py7rIKMSz2TioKXRMTWI7U8hWndrci3EoC9Wg_QFXZUKP-8MfA>
X-ME-Received: <xmr:NWgiaqqHRTRCiziv7wmckKQxVsmvpJzHXvQBCB2H9653AC0A9mxmP9LKCf8>
X-ME-Proxy-Cause: dmFkZTGZQ+eD19vUZIAlx/IW1hCdiPGtIVj7NsSAX2RRYF1/MjfWe139NGj43XNPtUWnm7
    XLpYM7xIL984vkygumJu4zOcVJXJnEpl2ZMbYTBEND+hurkGq96NqnKlHU+wEKIOH7wFm8
    Cnr3hBhATjzN9wyrnLHG8PvRH5BTe1HRfPvoqyR1OO6o4+DFVwVmDw/Vu1WMCFQT5hawYF
    7DYXXSFXFygePXLwCj0pE9GtvY0FXUjDUame20vgEyHBdWRxQHo2nsv7bBoPAhKEi8ZYlg
    scqlWBweiKNZnyT/O2PL/T5H8B+NwfuTkaZO9x5esiz/aeiYGvkr9/cnQ3HD5qn8a0gPtj
    9GKJyyiOnlmwuzmTNAtfrmrEX2fKwJloVYCKx6A4WLOqwM7XZQnx+fjh/1vgCww8dHm1qZ
    FxgC83L6PHwPNSgopZBbqdq4x1zTMS1qKhu7/9YRZwceWSXV4ytPv3jKHQbihQkPlnXPJI
    r808QFne0A7p7DarnHXeLocZEF/8JgkHhbQk9dS86Jq8uIrl0+GvshHkagFn82a0ZPrOuN
    krphOTUmpB+NaEAuzwwoQT1lnwDRyHFDkb+R/yOT6JL6YxlondbYaZukhi3wxaH7rJQ/u5
    YrO71cGHRx7p+9FxT8YQ9NKeYankSaspMV8jbDLbwhyZBs1bKu6CC11MPMcg
X-ME-Proxy: <xmx:NWgiakp97RYgPNgs7-Qa1AVKmyfwTOlEewAGnhdhTCHMsTl8GQB9gw>
    <xmx:NWgiahYlqlDtf6HeS-TSyawQPVOV9-QxpgLMJHHGgzrDrIRHmJZpSQ>
    <xmx:NWgiaq9uv6xfiE_umbCB_yJ2G1neKnUJ-hzcSXEBsD8-DFuKsAOWyg>
    <xmx:NWgiankvZd0MrT43_V6J0U3LOvni3y4pgWNaGn662LM_o_HdQQ3cuw>
    <xmx:NWgiavyh1OuRAeNsGtEZDHPdVelInIIVLhIQvI9B0_ed_eVEIhazQm6J>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 02:09:56 -0400 (EDT)
Date: Thu, 4 Jun 2026 23:09:55 -0700
From: Boqun Feng <boqun@kernel.org>
To: Yuan Tan <ytan089@ucr.edu>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, zhiyunq@cs.ucr.edu,
	ardalan@uci.edu, pgovind2@uci.edu, dzueck@uci.edu
Subject: Re: [PATCH 0/1] rust: revocable: Fix racing access during revocation
Message-ID: <aiJoM6FrFVGYFJOI@tardis-2.local>
References: <cover.1780635248.git.ytan089@ucr.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1780635248.git.ytan089@ucr.edu>

On Thu, Jun 04, 2026 at 10:02:46PM -0700, Yuan Tan wrote:
> Hi Linux kernel maintainers,
> 
> We are developing a tool called FerroLens to detect potential unsound
> behavior in Rust code in the Linux kernel. FerroLens reported the following
> bug in rust/kernel/revocable.rs.
> 
> There is a potential race condition between the call to
> revoke_internal/no_sync and try_access/try_access_with_guard on the same
> object. This occurs due to the use of Ordering::Relaxed to synchronize on
> is_available.
> 
> The race occurs in the following scenario:
> 
> Thread A (Revoker)
> 1. is_available.swap(false, Relaxed)
> 2. synchronize_rcu() begins
> 
> Thread B (reader)
> 3. executes rcu_read_lock().
> 4. is_available.load(Relaxed) returns true (stale value).
> 
> Thread A
> 5. synchronize_rcu() decides it doesn't need to wait for Thread B because
>    B's critical section started after A's grace period began

This part is impossible because:

	https://docs.kernel.org/RCU/Design/Requirements/Requirements.html#grace-period-guarantee

Does your tool understand Linux kernel memory model?

Regards,
Boqun

> 6. synchronize_rcu() returns
> 7. drop_in_place(data)
> 
> Thread B
> 8. UB: Thread B accesses data via the guard.
> 
> The safety comment for revoke says there are "no more concurrent users",
> but that does not prevent a new `try_access` from starting concurrently
> with `revoke_internal`. And because both accesses to `is_available` are
> `Relaxed`, a racing reader can still observe the old `true` value and
> create a reference to `T`.
> 
> If `SYNC = true`, `synchronize_rcu()` only waits for RCU read-side critical
> sections that were already in flight when the grace period started. A
> reader that starts after that point is not waited for, even if it still
> reads the stale `true` and obtains `&T`. Then `drop_in_place` can run while
> that reader still holds the reference, which is a use-after-free.
> 
[...]
