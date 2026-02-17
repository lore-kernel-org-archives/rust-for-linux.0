Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC78829A1;
	Tue, 17 Feb 2026 20:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771361773; cv=none; b=fILeJPBlQ2FJyaywnmaQ1703gq5yjAAjyZzymAuOcQeSJ0n5TrkE5/13zz7bQ4we0j199qCTjwbmQt5+WWwhlZzmxcfLpDlUUFxmmgPfE4FeCHAj2EaxGvcPKritGSsgGwsikTMFSJ3RE9qQmjgfnfrt2qdZ1fQ6Jb7LI6U/sXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771361773; c=relaxed/simple;
	bh=rEdYMtc/LMDSmu4lqroltT9WgSaqkm/x/KUtWWsA4w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNK+krPNgU4MbNrJQZfZRnKPx73t5vAiE5fRlBfejnG9zKN/EebY8xKR2yzDlSwiVUsSCMRWsqzVwF8wrlruDSFBDr2pCdcl4ou2cdSzDZkFURzD9L3jjaHwv8ONUpYRnnRdPdUh+OULDz9dUJnYyZZraUoJwdfdN/a9io8adf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0T80UVm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0T80UVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626E9C2BC86;
	Tue, 17 Feb 2026 20:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771361773;
	bh=rEdYMtc/LMDSmu4lqroltT9WgSaqkm/x/KUtWWsA4w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0T80UVmspe/iZ22Ti+mUBk58028KD8QykxmyguzW/7aDR4j+TCBqEq/NoaCIpvi/
	 VTGTFedmNXqN9aCyHz4hf2A8T2zil3KUXxF3fwbtV88tu3FEcuuMnScZlVxSRxfekV
	 hPCDU52oe0mc0KzJ21EFoiJhZSRtrAW0Jibj+VNKLdDWJOBOdGangDGXWax8arWcNj
	 h9uwpFER1MKvDFnQ07kUoVhE/8hhtciUTkeWnR3YRnUN+iXTew/XW5yxutf+gdY1vZ
	 3cFIhLRSLwol6/7ilBqaCCfg20Nhwi8K2cBp0Mp/FPmiIPnOXrInSHMoC9poEZ4hq0
	 X0KsoUW2XJRXg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D023F40068;
	Tue, 17 Feb 2026 15:56:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 17 Feb 2026 15:56:11 -0500
X-ME-Sender: <xms:69WUadOfTd-2FHKWoIXaeQyph6v4RP33WbKsf0K8_zXbJwGfBQ3H3g>
    <xme:69WUaRU2Q4RBoqUc9BF1gS1mSbR4LS0_vVITLCT7xUY0vvrHdKMfKkMG0s2MajxC5
    mYPbpTyAyb8ew8pjNqLHc1QWp79H937qTQlJAyUxplAOMiejADmdqw>
X-ME-Received: <xmr:69WUaVikR2BS_Wo9Ch_sJtb1pB4kpcFCS6mH7vMdcuZTaVnYpTEVUzN4uuRxZIzn_sI7oqRGhF9II7d1R2V46KhWZy3vlJV4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvddtjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdr
    hhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvg
    hnghesghhmrghilhdrtghomhdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhi
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopeht
    ghhlgieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehlih
    hnuhhtrhhonhhigidruggvpdhrtghpthhtohepjhhsthhulhhtiiesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:69WUaR_APjH1fM6jRhoYliukV3vCMyC5L5mLzJ4BazftCDnDtDfVUw>
    <xmx:69WUacSwjWyCx9-IIYQ4FZWtVb3OBoV7xkKV8rmJ8vG76hrrFiuGlQ>
    <xmx:69WUaQu5t4ahUxfmdZjCg2kr9wM0EMfx7UWeKS7oyscwNvVYK_VTug>
    <xmx:69WUae79jD5IW-CkQG74M_ccaqMPea_BLxtE8tIrC2oc0O7OEdQH0Q>
    <xmx:69WUaXIqSu40H1h_PwhuGseNyv25YzNAJWi22dbTQLuNr61jYJHb4PVg>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Feb 2026 15:56:10 -0500 (EST)
Date: Tue, 17 Feb 2026 12:56:09 -0800
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: document handle based design rationale
Message-ID: <aZTV6QPLDlF8_2B2@tardis.local>
References: <20260215-hrtimer-docs-v1-1-bff6a6c0d923@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215-hrtimer-docs-v1-1-bff6a6c0d923@kernel.org>

On Sun, Feb 15, 2026 at 09:36:04PM +0100, Andreas Hindborg wrote:
> Add implementation notes explaining why the hrtimer abstraction uses a
> handle based approach.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Thanks for adding this!

Reviewed-by: Boqun Feng <boqun@kernel.org>

However I feel these are not just implementation details. They are the
design decision we made because of the limitation you mentioned. Maybe
make them "//!" doc comment and just put them as a separate section that
describes the necessity of handles? Thoughts?

Regards,
Boqun

> ---
>  rust/kernel/time/hrtimer.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a008..f92880b2cbdbd 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -67,6 +67,18 @@
>  //! A `restart` operation on a timer in the **stopped** state is equivalent to a
>  //! `start` operation.
>  
> +// Implementation details



> +//
> +// The reasoning for adopting a handle based approach:
> +// - If we explicitly drop the target of a timer callback in the timer callback, we
> +//   may get a dangling reference.
> +// - If the callback owns the last reference to the target, target may be dropped
> +//   in non-sleepable context when the callback is finished.
> +// - When dropping an object that is the target of an armed timer, we may drop
> +//   fields accessed by the timer callback before we cancel the timer (drop order).
> +//
> +// By using a handle, we can make the handle own the callback target and avoid these problems.
> +
>  use super::{ClockSource, Delta, Instant};
>  use crate::{prelude::*, types::Opaque};
>  use core::{marker::PhantomData, ptr::NonNull};
> 
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260215-hrtimer-docs-52ec9c020285
> 
> Best regards,
> -- 
> Andreas Hindborg <a.hindborg@kernel.org>
> 
> 
