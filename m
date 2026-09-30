Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE543469E7;
	Wed, 30 Sep 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775925; cv=none; b=M6YM9F+Bc85lRv9D9hCnp+CjDUg46LVANWMzkL8u4ML1D49c7hgyghjxsRt4C9+9w3x0jrcO9HV9ThYpCtlBr7XR7v3iPDc1mCe8RRBC+NN7W21k52wwtgmgrprUElj+srTIWNdMmq1VlWng1tL+bw7mEt10Hzzp+o5gCxG8pPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775925; c=relaxed/simple;
	bh=3hctgdZW06t0mr2BlP/wFMCvUUECW2S2vaO0wRFc5js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiDrYaERlpZsdypyxdgJDFvG+DNilDL2WQhpHLVPGsGbAWEbwG+Qh/Dc8bhaMvGc8jxamWbTgB6XDZNhFEX+E545+i28xJRwV90orwTcwmc8SSriu7KUNEDeeo+7sdLMxJcWqCk/FAAJ6No/kMzCWb9A3DwUPbELjnYd37JgKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gI7ERKCT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gI7ERKCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3F11F000FF;
	Wed, 30 Sep 2026 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775917;
	bh=CkIF50/dTEBiH2vLi3XfNIBnm9n6LoCSF7A/d1Qx2Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gI7ERKCTx0Yb7DrIZZgviZO+T7WsvKurddL6pSnEsXzglU8IjSP1c7BlW6d4SouFf
	 fJ9tGg0ZaVl98ve4SxkplnCOpLZWbGW7yJEufdpdh9f9tic6MuCoMAEubtI2QAbfma
	 u5bPuCd7qAE1EuTHqY4f/W0K6P/y2FGzELVrp6hvyRG4HUmQMe4FyRRqG2jrnyokHe
	 jh9hA+jdGpaEiguGdW6kQ9T8Wlw3dK8VAX/khMldTe2vxyDf2kg2PJ2mNgltO9qvy4
	 uNwBpGv4Hxxz1F1x+M1jBti3mciC4EcH08neDiXqGF6vvwwLXSBvzjv+m6mrMF0flP
	 A3Ne1pHHslpXQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id E269FF40068;
	Wed, 30 Sep 2026 09:45:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 30 Sep 2026 09:45:15 -0400
X-ME-Sender: <xms:axK9amkAVuXUZKnLsU5isgRiz8Pd325mExdn4VuAJMyIJJ5iluBRJA>
    <xme:axK9atG6fn18e6FY67wc13mCatiIZwm5p8QhyPOo44S1eQvAusbr8j8PBcFd74XUe
    eg9R-E9WgarwtDULaAlO-KT9KGXYezt4vXKWZFLUEie91VtIkRTzew>
X-ME-Received: <xmr:axK9andF2Ntu9a432GM7e6-kNFPY5xupGo6FyJoIbU8vmOZPT5pEEYEMKdsO>
X-ME-Proxy-Cause: dmFkZTFjygn0we99Ks46xyEDCkEwIH+mm/OzCcfTij6M9uME+DIw8NfXXtOa5bYOJ++Nyc
    cOpgU1z9xcmHoS6J+o1mswWsyyENbaqYKfdJjOJpquyS9RncKkL5O9NLhnq+mpAgO+QDpz
    37pS3BTT08UrnGIq3GAFX6NpD8Bk/VZ4cOXSZoZ2hD12vkoNalF60LZbKvh5LJ34ec7FfU
    Fo/bYGbJv39XWKqW3YPgvUvXl8h3Nlk8xi7e1kKTwA0E1n0D0h/K5wgsxxbobXkSAH9DRs
    wvQTGd7wCbRCreePgOHHn95GJBDW+0L0Mmp/Oz7qFYYzwF921rn3f/Bjgu7Eqa5Ri+kEVf
    SBRv4VKAo0zHZehD28zYSc+ryOByOP3jn3N+9BgPglEvndTd4lFXA8HyzuZ/fztwMO+6mM
    ScThj6btEzbPaonnMQH4VIrswPJRPlcpKDZUm0GBX2qk/iLAn/xHe/+LaFosE6upljYzPh
    RF06F0YGPHsZ+6WZQWgj6YRTa+FLgyZWNJUvqr6io19NhLNMx3bYEeKlwdSP07fzJRGjj5
    FAjjT+91RfTCgtKnhOTI0epebGi21z8TTpN6R3eht1s0WofJogWZWMSa934++CKUPtIvYC
    9jDB1sNGeDtLLVXbLeCChcm9e6o+Lf3TrIkFVCYOvYH2nQ5VDN+hoLV0CxYQ
X-ME-Proxy: <xmx:axK9aiFVBKJCZ2_TxC6hZ2YuOQvmr023hXf7V4575P1Smi3-ScUwbA>
    <xmx:axK9apEtDCxRJSYFfs3n2GyBdjMpwc0wYRdOiHCuenFxWiqqeEhZfQ>
    <xmx:axK9aqP7zk1BgMTk3H0syHrLc_6BLTi0FDjsJbJihu7hNMANrpcesg>
    <xmx:axK9amp9jXTi7Yv_XqjUO3tWqEHJv2UlnmvnAwqoo2ei5WEP1qRQBg>
    <xmx:axK9ajCMFpwhGsniyjmomTETFlUH4vnBc4HCs_pvOH2YPkADLXOucNjO>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 09:45:15 -0400 (EDT)
Date: Wed, 30 Sep 2026 15:45:13 +0200
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: sync: export lock::do_unlocked
Message-ID: <ar0SaUYCeGvi2fTD@MacBook-0RXW5>
References: <20260929-export-do-unlocked-v3-1-f7000684178f@kernel.org>
 <N1IBV5ko8VdO1uPeg7myJ5jVnnfJI-s5phM0IuhjOxWo1AvKFtlvojnvOBY1fnhKJpl9GKVkN0dD6GEM3f1FKQ==@protonmail.internalid>
 <DLRXW31Y0IVK.3A3NJVS2BG39M@garyguo.net>
 <87zex0rl3r.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zex0rl3r.fsf@t14s.mail-host-address-is-not-set>

On Tue, Sep 29, 2026 at 08:03:20PM +0200, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
> 
> > On Tue Sep 29, 2026 at 3:45 PM BST, Andreas Hindborg wrote:
> >> Export lock::do_unlocked publicly. Add documentation for the method.
> >>
> >> Reviewed-by: Benno Lossin <lossin@kernel.org>
> >> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> ---
> >> Changes in v3:
> >> - Rebase on v7.3-rc5.
> >> - Do not import prelude in example (Alice).
> >> - Link to v2: https://msgid.link/20260605-export-do-unlocked-v2-1-e23001390231@kernel.org
> >>
> >> Changes in v2:
> >> - Drop spurious space before `guard.do_unlocked` in the doc example (Benno).
> >> - Un-hide the imports in the doc example so the rendered docs no longer have a spurious blank line after them (Alice).
> >> - Link to v1: https://msgid.link/20260215-export-do-unlocked-v1-1-f5cd2203b20f@kernel.org
> >> ---
> >>  rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
> >>  1 file changed, 25 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> >> index 10b6b5e9b024..edfff9e10199 100644
> >> --- a/rust/kernel/sync/lock.rs
> >> +++ b/rust/kernel/sync/lock.rs
> >> @@ -238,7 +238,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
> >>          self.lock
> >>      }
> >>
> >> -    pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
> >> +    /// Temporarily unlock the lock to execute the given closure.
> >> +    ///
> >> +    /// This method unlocks the lock before calling the closure `cb`, and re-locks it afterwards.
> >> +    /// This is useful when you need to perform operations that are not allowed while holding
> >> +    /// certain locks, such as allocating memory (which is prohibited while holding a spinlock).
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// use kernel::new_spinlock;
> >> +    /// use pin_init::stack_pin_init;
> >> +    ///
> >> +    /// stack_pin_init!{
> >> +    ///     let lock = new_spinlock!(())
> >> +    /// }
> >> +    ///
> >> +    /// let mut guard = lock.lock();
> >> +    /// let mut buffer = KVec::new();
> >> +    /// // Temporarily unlock to allocate memory, which should not be done while holding a spinlock.
> >> +    /// guard.do_unlocked(|| {
> >> +    ///     buffer.push(5u32, GFP_KERNEL)
> >> +    /// })?;
> >> +    /// # Ok::<(), Error>(())
> >> +    /// ```
> >> +    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
> >
> > Do we want to keep the name `do_unlocked` now this is public?
> >
> > I think we can drop "do_" and just call this `unlocked`, consistent with popular
> > Rust ecosystem crates like parking_lot and spin.
> 

I didn't find a unlocked() in spin. You mean
https://crates.io/crates/lock_api ?

To me, `do_unlocked()` is better, since it indicates something is going
to be done after the lock being dropped.

Regards,
Boqun

> If this is the established way, I think we should do that.
> 
> I don't think we need a new version of the patch, just fix it during
> apply?
> 
> Best regards,
> Andreas Hindborg
> 
> 
> 
