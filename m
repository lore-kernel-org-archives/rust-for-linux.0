Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5709478859;
	Fri,  2 Oct 2026 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937046; cv=none; b=c+ccW9d4sI2z/0aEPJhBlNJVjdh1gJzgoRybvbrJ6sMMlxqvEYuBQab4RTNcJjnezN6gjbXJ5Xt2vSQrp3Id/AOKgypwWDWXEqNro9yxqTTifn+n6Bvl9piIDP3K/HOcHwOuFUNUH6eVjSRUv+96wz/0h9PIzwzw2KNfNIhGcrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937046; c=relaxed/simple;
	bh=za7qNb0TLjJ58DaEWYAlKuUTCS/PrWaTuliDAKdudNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlJDE1/MwzGQ/8kYehdH4ZJc/YjYsPotxalEloMQfC7Cnx6g5RmhDdrl9tUpEsji7Tuu/Ba1vpyXfDftCrnjh2LJSsI8GYrzyWj1ZNTGT6+oe+LVOe85YV+stdjxKzgwQmIl8AhCGnbj1Z2kauebAQOH0jvC57WQTutNLJnHfzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bz/dBXkw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bz/dBXkw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72041F000FF;
	Fri,  2 Oct 2026 10:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790937041;
	bh=9nuK3YV/XzBe+ru33Wrf1ZVJGYfxXNazzoLOdqnc7qM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bz/dBXkwXQpEPp0WOqI05zyaoICaN1LJKCCejUcr+QwF4H6QzHP3VV6ZsfMR7LIe3
	 TzVXlHn7sVUhKkzNYmlxOGDQIm7PiHbvH7YUNaC0BQek+BE40SS358Ry9zWhZnRzGz
	 +zXWQpAu3zQEZZRK1IDpSN93nUghh1CPIm32B39dtH95mwuauyI3v44+G9IRmK1ETA
	 BEoFzaxD84+4NwYBDq1T6MCoUVq1fyja6TYI0ibZqyqm2hDvn8XMARkQ/5sJjEbK94
	 CdJAe2Vq/bk9bDaU7BcFVImBVvcEVSuV9dthPlZcAkmNaYDrDVeXy9t6MIlSiSgmry
	 RDUy/jY6CMBSg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6FFF3F40067;
	Fri,  2 Oct 2026 06:30:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 02 Oct 2026 06:30:40 -0400
X-ME-Sender: <xms:z4e_alnd5P4unqns0iPA0wWiiobHfzaEJbLdRXcd7CEzTOv1aF9tiw>
    <xme:z4e_arNJkel_2KK8_Dtzg_v8hmBgqyqA6VEOz3A_SnnkYdP4LvZxGzVpFpk2va_hJ
    RRh1OyLQH3ebnqHtGPNJZ05ZAOZh85lZo5Y8XQO2xPYfLq_ViAFQvA>
X-ME-Received: <xmr:z4e_ahzT3dKM91tsY1-30knwZXcwS47i8Op8vqS1RIvygf4n4Jmxf34du5_u>
X-ME-Proxy-Cause: dmFkZTE1dEoi5AaCsnClKv3jc8uYgvvv6Mm/jlDkqzOHiKsnaoXj3ZHEAmPkqSieazWQas
    YuWKW9LSi/hYkuWyQ8e5vG7M2YBVg1CrahRrHPzqQ25oAIiVADYEIgZFmWW1bgU+Uze3O2
    MAuZDZPS6pnbsgSW8RYJf7g0AuVES0az1mt4p+h1J4N5qdd+LAI58he/0HODPbGAJjRa0G
    BelSVhB4HNAJRejW3FNweOBdQm8Tzt79B27QQJduLm+Ylj2lcEWkHa8oO22xnw81VyBv1i
    I2jFp5kKLZZr1HvjzE9A5T+JNlhabat+DsuV6IAFFyBBxS0VcEl30okuGztrCoBQle7VDE
    Nk6OAwxpXM2g2ZIEp6zmCEtrbVFFU7GLiuXRNKdShNb+5/kSo43M3/N6MjoCTkHt9TTxPn
    oqgwQgbitbfX7MDSN2IdFOxqW9zTOf/ys5niHM+VWOns8CL4E92kVnWJxpqIfbz56ISwnT
    I7fG9vHKxl3dgM4KhxbtjjXKARx985wbxM0TbpDzXfw1iHqiU5GsEwTWteqY/XQjnftf2Z
    KiQujnudeAetFVvJYA2fPVUe6dyhqCRXWYWAFuftaw5sRJm2LzDV71rIX1BO+/yZ2vExmY
    CAzrz5EbHGuwrsLY2O3Qxi2L8ktDEmpyv3T0KNmhwPjtcUCLJIm9PqjWLRCQ
X-ME-Proxy: <xmx:z4e_agsvVRVzEBO1KQAV0f2l6ggrOdhhFLJIYfnr51MIoLbZ3k6Fig>
    <xmx:z4e_asbu1xlMSUXHClHzdm1KUNShSinGdZug6NemKGZgB3z9GpsmUg>
    <xmx:z4e_an0BqQeztI9PkHbfc2InRoPBl3fgZn0vdgpgmKNbN8zN-Xzbqg>
    <xmx:z4e_amtga0CBujI5_HcYR_eTcUsO0SFV8cob6lj93wGWaUJpSx1j6A>
    <xmx:z4e_ajD_jemGbbpXDcJZZEPslNY2MHyGhLEBfekZbwK-QSgmE3M4zULk>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 06:30:38 -0400 (EDT)
Date: Fri, 2 Oct 2026 12:30:38 +0200
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Improvements and fixes on SpinLockIrq patch series
Message-ID: <ar-HztKCh7CKvzbH@MacBook-0RXW5>
References: <20261001082519.16195-1-boqun@kernel.org>
 <20261002094244.GU88198@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002094244.GU88198@noisy.programming.kicks-ass.net>

On Fri, Oct 02, 2026 at 11:42:44AM +0200, Peter Zijlstra wrote:
> On Thu, Oct 01, 2026 at 10:25:14AM +0200, Boqun Feng wrote:
> > Hi Peter,
> > 
> > I realized that v1 [1] was left on the list so I just want to respin it.
> > Just to refresh the memory, v1 was requested [2] as separate patches for
> > changes between v4 and v5 in the main series. I also include the
> > refcount_interrupt kunit test Kconfig change in this version as well.
> > Based on v7.3-rc5.
> 
> The first should now be in tip/locking/urgent, while all but the BPF one
> are in queue/locking/core, which will be promoted to tip/locking/core
> after the robot had a go at it.

Thanks! I resend the bpf fix v3:

* https://lore.kernel.org/lkml/20261001082519.16195-4-boqun@kernel.org/

Regards,
Boqun
