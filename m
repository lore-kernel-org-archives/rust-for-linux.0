Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036004;
	b=zUMiBWTA70RoHfHqjjnbPAIyI2a26pRfgIoFYOioaBZJWMFbWMGUag38G7+dHaZTlxaY
	 vr5lf3YexDao6LWkPTp8k0dALWvklN1/G+E2CxGxbXg6tymQiPLyFGpRfw73XZr+aHrT6
	 hsPxoqYm90f7wTV9XkIsSZd4TZ0SYcbMPmQmE03Sgx+hHPct/uL+nOHyZ1Sp54bscco8S
	 wG/HrBMgNlsBAebQNYEwwIJnIfJ7X5KCPfltvnlyPEQjx3jkZwoOjsEigp2yQfOUT4GoV
	 po8VeC0BFBNufkiO6ZCDmVwTzwumv7qUUdtPbIjIcCY09t3iBNng3GOZTmpztthPK/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036004;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QcdoykT7wYwH64NiHJnoPRkjFYtZrVANXbTjbGgP68s=;
	b=BU6mxSfvRnxx9oR2i6JrBXEL2fglu/pcvIICDHRLAqJMCfTIyG9dPh0yp+J1IOFdPo0r
	 KDNovYL7b/Fm2BWq8GZK8nET/1BJoEJEu8aUw9y+lzFEbsjp6AUMguf06KzLGBSaQcRLL
	 oDMWd1z54VuasNqF/UeJhTdXKRrDbGKexEfMEk5dEPvbhfKE78KJTbTW8XWPCj+winByc
	 0ZhiqkfSwF5DzapUA+S/QYGgN0GbHMPhAaxymQ8Q2KZNkTUXos07XEnA6sm92UhWmOfMd
	 EfM4xs0n7q8WMc47rJqlovQEUE1QAiIWpCwRR7QheJ2+BmCp0KHgz27J3h8QYPFc6bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UpKi7B/0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AFF606A32C;
	Wed, 18 Nov 2026 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpKi7B/0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6B81F000C7;
	Wed, 18 Nov 2026 21:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036004;
	bh=QcdoykT7wYwH64NiHJnoPRkjFYtZrVANXbTjbGgP68s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UpKi7B/0rBCYX/nY6Jz+aDxC3oaQEMDYkDs+aZgD+uQm1Ob/FaLUnDS+VC8rPjnBp
	 vkaF1O/n1A26L03g0MMXM23H7BKQNSjrNrWux+k3wVksqrOlMYs4hbRGxb/0/AvkFz
	 Aah19WcWHEbQ5N8nTrQlB5WMqIn+kJlC8oQ2cqggEzj3c1FVvPuyLLq+7lcza5UQKN
	 gqMcRWvgg3dvfJCv+0Y2RTJy1zEKeWV7WxZcmUuSJnPsVaV9JdOb84SI3sC4WS49j9
	 5kv4OV3nAOggVayD7JIXHDYgQ9T2t9ddX8N01RHCI6U9TJUQbtWytFDmeAss8Z0QOO
	 /GEXb+FEwfEKw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 74E17F40068;
	Wed, 18 Nov 2026 16:06:42 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 18 Nov 2026 16:06:42 -0500
X-ME-Sender: <xms:YhP-ahF0xGaLJjQTPNDwoZaCXRwMTnC6Rk81rRAnIvKWVx1qnf5IrA>
    <xme:YhP-alnpTiQM444SY2WW_BMaHqPlbtqBTY_qeX8kYe_DZl4KbKEqDBlizX8Pcu1P4
    NQ8NmmR4cZjxcxjapFlvhgfxgVelNnoLhajGrR0Ws7GxXF3cHkvOXc>
X-ME-Received: <xmr:YhP-al9FqsEim7rHDm9gEcW1Rs2pqG-79pBAQlg73yEMIst5oNVQDoAHqz6K28whZ6SDm0zr1Dh-AobTOVIK7OWGcDymjCZv>
X-ME-Proxy-Cause: dmFkZTEBaqTySe0wNL78njswhLR6PyMpnjMwmJKjGUrTkM+Oe0HsPVQTNp/x2OgyHRdGI2
    0TZ5HlEM3gdmwHwtq2f2qFu0/5zzQpamvIg/VqADwmqbHuaVXKsbmfHnlXi/789qV+IN5h
    v8Pg8UJC+mZhXqmH89qeiXq1QUaslvVidTobZCIRk8fyAqek/dmmFmjtiSUdIbtWpcgOrD
    7MS1/sB7Zh8Fhf5NxR1qRcQEJWD93pZp3s89b80gdI7DDoq9h+OBN3wpqK6u+T/L+lwcx2
    nsuCPqaL9xtx96boYuZotJynFjNTWT14i2pFLlzfNGG6COxk4fe1twZVx+c8xdH/lfYldf
    V+kyUAeRSC+dqvMJvOeqncSIhfyQkJHHhGsS58u6jXUs6ReY7e59MDJbVj+txBt5y2Vb8R
    HS4pnANeLQANZMzZxCpA9s0m7+8Za+JdFf3lAArPWgx4MEsbVPa6IVaSlc6axBKrAEJISa
    k9s427jdRW7VVySNbJBwpeBXVcoq8obZNQnAy2C6aXvaKFtMf4MTI16P4Mim9WNua3y6qq
    B2ImwFcxw1UvjLxAIJZbzqWjnbESFFuH7i1LGrV86MpsirbdCCVrpLW3/R8292JIT90f/k
    ZgLZLc89QmC+Z83RkB3fHQZ564V7c5qus0aSPr6slNBsoV4IiGba+Gpd2Eiw
X-ME-Proxy: <xmx:YhP-aum6OEIb38kNQeS_ifZ1YRiGH4EeSrkHXjkIKQxnVqvk5rFWDg>
    <xmx:YhP-arkzLboiVCzz6MIH9iDOVwE5hzJRqZDF61tLzJPL2rsdwlaF7w>
    <xmx:YhP-aquKRtpLYbOTyI3HA632QhzExiYCOcswr6urPKMtYDlKzQP6vg>
    <xmx:YhP-atKTVnnST1TuTi0NM2NhaI2I6alMmmxmY56OP3CP7-v70WXsLQ>
    <xmx:YhP-aniGtidSo19Tc7FNvBtb1MZoZr179hSA2Xm3aWdeYbw9MN1fkl_P>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 16:06:41 -0500 (EST)
Date: Wed, 18 Nov 2026 13:06:40 -0800
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <av4TYDj2-mEhIZS5@tardis.local>
References: <20260929-export-do-unlocked-v3-1-f7000684178f@kernel.org>
 <N1IBV5ko8VdO1uPeg7myJ5jVnnfJI-s5phM0IuhjOxWo1AvKFtlvojnvOBY1fnhKJpl9GKVkN0dD6GEM3f1FKQ==@protonmail.internalid>
 <DLRXW31Y0IVK.3A3NJVS2BG39M@garyguo.net>
 <87zex0rl3r.fsf@t14s.mail-host-address-is-not-set>
 <ar0SaUYCeGvi2fTD@MacBook-0RXW5>
 <DLSPFJ7IF2XC.1KZBWTARDIG1I@garyguo.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLSPFJ7IF2XC.1KZBWTARDIG1I@garyguo.net>

On Wed, Sep 30, 2026 at 03:01:41PM +0100, Gary Guo wrote:
> On Wed Sep 30, 2026 at 2:45 PM BST, Boqun Feng wrote:
> > On Tue, Sep 29, 2026 at 08:03:20PM +0200, Andreas Hindborg wrote:
> >> "Gary Guo" <gary@garyguo.net> writes:
> >> 
> >> > On Tue Sep 29, 2026 at 3:45 PM BST, Andreas Hindborg wrote:
> >> >> Export lock::do_unlocked publicly. Add documentation for the method.
> >> >>
> >> >> Reviewed-by: Benno Lossin <lossin@kernel.org>
> >> >> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> >> ---
> >> >> Changes in v3:
> >> >> - Rebase on v7.3-rc5.
> >> >> - Do not import prelude in example (Alice).
> >> >> - Link to v2: https://msgid.link/20260605-export-do-unlocked-v2-1-e23001390231@kernel.org
> >> >>
> >> >> Changes in v2:
> >> >> - Drop spurious space before `guard.do_unlocked` in the doc example (Benno).
> >> >> - Un-hide the imports in the doc example so the rendered docs no longer have a spurious blank line after them (Alice).
> >> >> - Link to v1: https://msgid.link/20260215-export-do-unlocked-v1-1-f5cd2203b20f@kernel.org
> >> >> ---
> >> >>  rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
> >> >>  1 file changed, 25 insertions(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> >> >> index 10b6b5e9b024..edfff9e10199 100644
> >> >> --- a/rust/kernel/sync/lock.rs
> >> >> +++ b/rust/kernel/sync/lock.rs
> >> >> @@ -238,7 +238,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
> >> >>          self.lock
> >> >>      }
> >> >>
> >> >> -    pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
> >> >> +    /// Temporarily unlock the lock to execute the given closure.
> >> >> +    ///
> >> >> +    /// This method unlocks the lock before calling the closure `cb`, and re-locks it afterwards.
> >> >> +    /// This is useful when you need to perform operations that are not allowed while holding
> >> >> +    /// certain locks, such as allocating memory (which is prohibited while holding a spinlock).
> >> >> +    ///
> >> >> +    /// # Examples
> >> >> +    ///
> >> >> +    /// ```
> >> >> +    /// use kernel::new_spinlock;
> >> >> +    /// use pin_init::stack_pin_init;
> >> >> +    ///
> >> >> +    /// stack_pin_init!{
> >> >> +    ///     let lock = new_spinlock!(())
> >> >> +    /// }
> >> >> +    ///
> >> >> +    /// let mut guard = lock.lock();
> >> >> +    /// let mut buffer = KVec::new();
> >> >> +    /// // Temporarily unlock to allocate memory, which should not be done while holding a spinlock.
> >> >> +    /// guard.do_unlocked(|| {
> >> >> +    ///     buffer.push(5u32, GFP_KERNEL)
> >> >> +    /// })?;
> >> >> +    /// # Ok::<(), Error>(())
> >> >> +    /// ```
> >> >> +    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
> >> >
> >> > Do we want to keep the name `do_unlocked` now this is public?
> >> >
> >> > I think we can drop "do_" and just call this `unlocked`, consistent with popular
> >> > Rust ecosystem crates like parking_lot and spin.
> >> 
> >
> > I didn't find a unlocked() in spin. You mean
> > https://crates.io/crates/lock_api ?
> 
> Right, both of them share the common interface via lock_api.
> 
> > To me, `do_unlocked()` is better, since it indicates something is going
> > to be done after the lock being dropped.
> 
> I think that indication is usually "with". So `guard.with_unlocked(|| action)`.
> 
> From my experience in Rust code "do_" is quite commonly the internal helper for
> a public API.
> 

After some thoughts and asking for suggestion, I do want to keep the
name as it is (i.e. using do_unlocked()), the major reason is
`unlockded()` is not necessary a better name. But of course, in kernel
we can always change the name later.

Regards,
Boqun

> Best,
> Gary
> 
