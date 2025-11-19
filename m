Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8035334166A;
	Wed, 19 Nov 2025 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545126; cv=none; b=BCjclraKiWCXX9CBoebUvUbPzBWXbsKi6m0sJ8UouWRN8VfHwWF4k5Gx8RXA8eEgb0IxJ8ueeFnoHYrouOf1+7c7B9sV7griLxXRH04lJ3uNiQ6uHQzKn22lq57kq2MjRTGATjLC/JSJh+BR4UIlLLyhvux1LNmMLaMBFMdUb6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545126; c=relaxed/simple;
	bh=v7VMbX9pHh6sOvVpq4qaGaPOfeaHmbfaWYjfR3bqjwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJPGsLkCaquXHYrL0/HfUzEXHBoVTfvkj/u/jjS3iQFZ7nwYNlj6bwFda87pqSQO/aHfbgqfhBVZt2RoTBxByaEv5o5sfPwioBJtJUhXmvoRnW21nzo94HrxXD25Owj2wF7OhHEQBOGxSjW7eCFqG8SEibVXs8BrSX3+xXt7n4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-b3-691d901b1ebc
Date: Wed, 19 Nov 2025 18:38:29 +0900
From: Byungchul Park <byungchul@sk.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Guangbo Cui <2407018371@qq.com>, Liam.Howlett@oracle.com,
	amir73il@gmail.com, andi.shyti@kernel.org, andrii@kernel.org,
	bsegall@google.com, gregkh@linuxfoundation.org,
	linaro-mm-sig@lists.linaro.org, link@vivo.com,
	linux-kernel@vger.kernel.org, mark.rutland@arm.com,
	masahiroy@kernel.org, mathieu.desnoyers@efficios.com,
	matthew.brost@intel.com, max.byungchul.park@gmail.com,
	mcgrof@kernel.org, melissa.srw@gmail.com, mgorman@suse.de,
	mhocko@kernel.org, minchan@kernel.org, oleg@redhat.com,
	paulmck@kernel.org, penberg@kernel.org, peterz@infradead.org,
	petr.pavlu@suse.com, torvalds@linux-foundation.org,
	vincent.guittot@linaro.org, will@kernel.org, yeoreum.yun@arm.com,
	ysk@kzalloc.com, rust-for-linux@vger.kernel.org, ojeda@kernel.org,
	gary@garyguo.net, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, dakr@kernel.org, alex.gaynor@gmail.com,
	bjorn3_gh@protonmail.com, kernel_team@skhynix.com
Subject: Re: [PATCH] rust: bindings: add `rust_helper_wait_for_completion`
 helper function
Message-ID: <20251119093829.GA20446@system.software.com>
References: <20251002081247.51255-37-byungchul@sk.com>
 <tencent_13F1EDE0D6B7A44697F31AE274C8E664E908@qq.com>
 <aN62F8t493R7UmCT@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN62F8t493R7UmCT@tardis.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRiA+853bg5Xp6X05SpoEal0p+LtQuiP7IP+BBFEFjXykKupualp
	ENnN5rKaJF0su85Lc6Zo94TVEjO6LboNt9JsrcS0NFuXleTpQv17eN+Hh/fHK2KNk4sRDelZ
	sildb9TxKlbVHXlqstY2xjCtvGQcWHZtBX9bgIMfRy8J0PJsOwuec9UI2j5ZEHwOH8Xg9bgw
	OM9vY+BQ5zYWug5+4OHh3S4EO87U8nApv12A/scvGXAWBTE8unqMB9+9/QKUP3vIwMt2LwcN
	9+5iCO3Tgqd4Lwde22sENT2neTjQE0TQFarAUPHpvQBnT1QiuODahaDPHmKh4OMAB7f2Xmeg
	vL8HQ23wJoaOfd0CWJpCGHb6Z0FZ/3Tor3bwCbHUedyJaPmddzy1F35j6JXS5wI9WZ9NG6ri
	6ZnGTobWOwp5eir8FlP/00aethwOs9RV5hSob+AVpr2vW1laVFDP0NZgDbckeoVqfopsNOTI
	pqkL1qhSqx8cQxt943Ob7feZfBSOsSJRJNJM0uZabkURv/BF2C8ozEoTSNPTDqQwL00kXu9X
	rOhRg3O7Y1BXiViqFchFq4VTnBHSSlJ8peiXr5aAtPmu8YqkkWyINH388mcxnNw+EmAVxlI8
	8Q50MkoUS1pSOSAqGCFNIo+tqxUjWhpPrl+8xSgZInlEcrg5xP2+cxS5UeVlbUgq/a9a+l+1
	9F/1JMIOpDGk56TpDcaZU1Lz0g25U9ZmpNWjwR+q2PI9+TLq8yx1I0lEuki1ZdgYg4bT55jz
	0tyIiFgXpZ6QONqgUafo8zbLpozVpmyjbHYjrcjqRqpnhDalaKR1+ix5gyxvlE1/t4wYEZOP
	ktZGtycXc4lZeOrizGlLzPjIsKXbgzvQoj199vaCoSeicpvfuIPPj4dq3CldB54sexvfqZ3T
	sbM7SZPhaZFLEoU6TW+Dr9ExfF7roYV0bmHs+dlxzrhAFcQGeofsnnU/IfNBXOSL9Z/rbpdF
	nx4yVkyYnGrOto5jO+pWjfRnBhboWHOqfno8Npn1PwEMJX1DPwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTcRjG+Z//uTlanJbWaRbWxC5aZpDwQlH5xQ4SEd2RSEeecjVXbSau
	iDSbzHmbBF00y9JpzZmwvHQDSyWVLmpmDmeapZJZdnGpNZVcFPntx/P8nvfTy2JZNiVnVZp4
	UatRqhW0hJRsXZeyyte8SBUyPMiC0XAGunr6KJjMq2agseMsCS23SxH0/DAiGHPnYXC01GCw
	VSQTcHEwmYShC19paH02hCClsJyGuvwmCqqT3jLgetVLgC1jAEPb/Ss0OJ9nM2DpaCWg962D
	gjvPn2EYzfKFlpxMChzmfgRlwzdoOD88gGBotBhD8Y8vDNy6VoKgssaA4HvRKAmpI1MUNGQ+
	IsDiGsZQPlCH4V3WZwaM9aMYznWFQr5rDbhKrfSmFYLtqg0JlqefaKEo7Rch3Mt9wwgF9hPC
	nZuBQuHDQUKwW9No4br7Axa6Xj+khcZLblKoybcxgnPqPRa+9XeSQkaqnRA6B8qobfMiJetj
	RLUqQdSu3hAtiS1tvoKOOf0TnxS9IJKQW25CXizPreW73V2Mh0kugK9//Q55mOaW8Q7HT2xC
	LOs9nRdZ95qQhMVcOcNXmYyUx5nL7eNz7mX88aUc8D3OB7RHknFmxNePjP8t5vBNl/tID2Mu
	kHdMDRKeo5jz5UumWA96cSv5V6Yoj+HD+fOPqhoIM5Lmzhjnzhjn/h8XIGxF3ipNQpxSpQ4N
	1h2J1WtUicEHjsbZ0fSbFJ+eyLmLXG2baxHHIsUs6bh5oUpGKRN0+rhaxLNY4S0NCJuOpDFK
	/UlRezRKe0It6mqRL0sq5ksj9ojRMu6QMl48IorHRO2/lmC95EmouzEp6sBE75b2oNnpzg59
	X3CZZrJspykshBmPjz/uc9L2uLlyCZkuqgwyd0/mrpGXh3Tb6U+FY0sTw2OC+PY5hl1a53Y/
	fYn/fl1yZHtTTOWlrMOJbZ2XFyyvWNCt9jPId0emf7wdtvKg5ZRx44WIAG19+OKxzpAlLdaD
	Fn32zR0KUherXBOItTrlbzb9/H8iAwAA
X-CFilter-Loop: Reflected

On Thu, Oct 02, 2025 at 10:27:51AM -0700, Boqun Feng wrote:
> On Thu, Oct 02, 2025 at 10:06:17AM +0000, Guangbo Cui wrote:
> > > -extern void wait_for_completion(struct completion *);
> > > -extern void wait_for_completion_io(struct completion *);
> > > -extern int wait_for_completion_interruptible(struct completion *x);
> > > -extern int wait_for_completion_killable(struct completion *x);
> > > -extern int wait_for_completion_state(struct completion *x, unsigned int state);
> > > -extern unsigned long wait_for_completion_timeout(struct completion *x,
> > > +extern void __wait_for_completion(struct completion *);
> > > +extern void __wait_for_completion_io(struct completion *);
> > > +extern int __wait_for_completion_interruptible(struct completion *x);
> > > +extern int __wait_for_completion_killable(struct completion *x);
> > > +extern int __wait_for_completion_state(struct completion *x, unsigned int state);
> > > +extern unsigned long __wait_for_completion_timeout(struct completion *x,
> > >                                                unsigned long timeout);
> > > -extern unsigned long wait_for_completion_io_timeout(struct completion *x,
> > > +extern unsigned long __wait_for_completion_io_timeout(struct completion *x,
> > >                                                 unsigned long timeout);
> > > -extern long wait_for_completion_interruptible_timeout(
> > > +extern long __wait_for_completion_interruptible_timeout(
> > >     struct completion *x, unsigned long timeout);
> > > -extern long wait_for_completion_killable_timeout(
> > > +extern long __wait_for_completion_killable_timeout(
> > >     struct completion *x, unsigned long timeout);
> > >  extern bool try_wait_for_completion(struct completion *x);
> > >  extern bool completion_done(struct completion *x);
> > > @@ -139,4 +134,79 @@ extern void complete(struct completion *);
> > >  extern void complete_on_current_cpu(struct completion *x);
> > >  extern void complete_all(struct completion *);
> > >
> > > +#define wait_for_completion(x)                                             \
> > > +({                                                                 \
> > > +   sdt_might_sleep_start_timeout(NULL, -1L);                       \
> > > +   __wait_for_completion(x);                                       \
> > > +   sdt_might_sleep_end();                                          \
> > > +})
> >
> > The DEPT patch series changed `wait_for_completion` into a macro.
> > Because bindgen cannot handle function-like macros, this caused
> > Rust build errors. Add a helper function to fix it.
> >
> > ```
> > error[E0425]: cannot find function `wait_for_completion` in crate `bindings`
> >      --> rust/kernel/sync/completion.rs:110:28
> >       |
> >   110 |         unsafe { bindings::wait_for_completion(self.as_raw()) };
> >       |                            ^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `__wait_for_completion`
> >       |
> >      ::: /root/linux/rust/bindings/bindings_generated.rs:33440:5
> >       |
> > 33440 |     pub fn __wait_for_completion(arg1: *mut completion);
> >       |     ---------------------------------------------------- similarly named function `__wait_for_completion` defined here
> >
> > error: aborting due to 1 previous error
> >
> > For more information about this error, try `rustc --explain E0425`.
> > ```
> >
> 
> I think Danilo already made it clear, please fold this the existing
> patch. Moreover, since this patchset doesn't adjust init_completion()
> from the Rust side, the result is Rust code will also use the same dept
> key for completion, which has to be fixed if dept wants to be in-tree.

Right.  The same key in Rust may generate false positives.  However, for
now, I will keep the current code until finding ways to assign
appropriate keys in Rust.  Thanks anyway.

	Byungchul

> Regards,
> Boqun
> 
> > Signed-off-by: Guangbo Cui <2407018371@qq.com>
> > ---
> >  rust/helpers/completion.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/rust/helpers/completion.c b/rust/helpers/completion.c
> > index b2443262a2ae..5bae5e749def 100644
> > --- a/rust/helpers/completion.c
> > +++ b/rust/helpers/completion.c
> > @@ -6,3 +6,8 @@ void rust_helper_init_completion(struct completion *x)
> >  {
> >       init_completion(x);
> >  }
> > +
> > +void rust_helper_wait_for_completion(struct completion *x)
> > +{
> > +     wait_for_completion(x);
> > +}
> > --
> > 2.43.0
> >
