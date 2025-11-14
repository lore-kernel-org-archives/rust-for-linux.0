Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E33321A2;
	Fri, 14 Nov 2025 15:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134138; cv=none; b=df44WXOHvFJ3V8DMJVmbdSb9X4mrPCvF8cJsIKAJY6x5lFY/uGw9uM4Eb7cu4rHYMKs35MqnEMc9fno+5lUm4VI9Km0na9m8C3T2YKZusyBX3/lnsI/dR82JVKpDhIwfThhijm//6oCmhIpUjs1Dn6eFGZoSK5gemTAz3rFX+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134138; c=relaxed/simple;
	bh=L0GfR3DLaOXmlST7Xvc0YIMrAm/FY6EFY6d+l+xcMeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwMQ07/gr09hSOMqprDJplpO8GQ8uhngLe7qgwB7duw/9ZF717YqTzZ17VeF+1qK9uwvQB79fyAuai3mxbVqIHPm2xhxpKep69v3a+lnaDuZny0u7IAC+o8IWBnsv1mjM8hm21oGcFuY1x8WeGBdUom6K45bTHAiV09gMpO1g6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Uii/z6Oz; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Uii/z6Oz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cIP+x6g2j613UTfq2LpcllgEmE9FAir93lHdWbSSuww=; b=Uii/z6Ozf3ILdyXm/Jjef+1kxY
	QZz6FCx733oifLJh5LUKputjBOwAHCAgjznqRK40n5qZjt2w/s526a67zOxvhCpPwCaBeDMCkigq4
	1f5E24KneqUIOlxuQniFVNuqJ6ejpXn+OFvMPueRoirznsuecj12NuA4j8oIjerzhYOpyNQFNvAxO
	hjLkqQwU2V34RXpCo4gehRfVV/OBNn8Pv52zc8WooIU3wVFphq7IXxnP9bJFhih9W2qjf3OzVWU79
	GedZ7vwq2IsHuGNhuG5F5CE1PV+W4Gh9KmumSyF7OD88qzGCzFP4ZbAnpDyIv0Ii6fNmuSI7+pQma
	0PxYx8Tw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJura-00000002pBM-1EOD;
	Fri, 14 Nov 2025 14:33:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7B62830023C; Fri, 14 Nov 2025 16:28:48 +0100 (CET)
Date: Fri, 14 Nov 2025 16:28:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	reg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [GIT PULL] [PATCH 1/4] Rust atomics & locking changes for v6.19
Message-ID: <20251114152848.GX278048@noisy.programming.kicks-ass.net>
References: <20251114060200.12982-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114060200.12982-1-boqun.feng@gmail.com>

On Thu, Nov 13, 2025 at 10:01:56PM -0800, Boqun Feng wrote:

> Boqun Feng (3):
>       rust: sync: atomic: Make Atomic*Ops pub(crate)
>       rust: sync: atomic: Implement Debug for Atomic<Debug>
>       rust: debugfs: Replace the usage of Rust native atomics
> 
> Sebastian Andrzej Siewior (1):
>       locking/mutex: Redo __mutex_init()

Done, thanks!
