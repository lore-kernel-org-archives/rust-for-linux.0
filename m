Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF223FAE1E
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 10:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975907; cv=none; b=REbLGYHCuDuYoFKMhkhOs9ePYxZnQi7ySjRpqELjRRkzktyxvjEj/YWWXczQ2fteULS3d5x1F6CoQLizb22GhIcPIU8BWNQafM26hwm/wAkEfDDEoU0uwX8gQLk8mIsmE2/qxLtKbuX4jbzDqhIT9BN3Fc68FxYz59WO1IFBA3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975907; c=relaxed/simple;
	bh=bl9dCgtgXj4kG7Vlj7WzRHgq533CCtm64YJUNSuJAT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NZ+y5BZLlp+418MahLLLY3zEH/rsT6MCrtUcebu1wfC4drKwy17syikmZXNehU4ojLcXTaa+yOCfVDBhylSkh2mfsrdbAVZW9W2O5mcnLoWz/y84oYpifWfbExppmzxfQZnVywNwC01Nco+a9g7AHhMTDRoIscuEdeQN6zmpF2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=CjNrP92o; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="CjNrP92o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777975892; x=1778235092;
	bh=I6bhByvftNvr4tiHH/+PU7peJaxA5HKs1ABSsWrfdyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CjNrP92oEWQ50qP0W2kODvQ9UohsoDdMRd1VVlm6YrZCYnIMw/bNmUScXGhNhjE08
	 suGx2Mv08vgfV5rycNpE9crjE8mFqnhyJl64UwLyfWhC+i9WRlDVz7bKOr3JCF7rvc
	 SEXe7nB3JTPeaHaxHyDaDxV+tGcE11+cfWHJVhUBTBAEVpJwGahqT/zlEwhHrT/llg
	 dYlk/7qe8dPszsNqz7Tz+d1C2N32LicIXR0AFv9qlIPS/Vzjoz6vSSgNYDcwVNr4BP
	 5dgIul/XwZI8jG5w30N6UipqUi3itvYyxnMSCx7MjgsY0ZH9J9YquAX8kbIE6YKhMA
	 /VVk38NqTJ1GQ==
X-Pm-Submission-Id: 4g8vS01JVfz1DDX6
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	daniel.almeida@collabora.com
Subject: Re: [PATCH v2 1/1] rust: add Work::disable_sync
Date: Tue,  5 May 2026 13:10:32 +0300
Message-ID: <20260505101126.92832-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260505115014.49eef6d6@fedora>
References: <20260501191122.64311-1-work@onurozkan.dev> <20260501191122.64311-2-work@onurozkan.dev> <afhQzt2VGa-QQYSm@google.com> <20260505060723.11363-1-work@onurozkan.dev> <afmusSlYdOR2Alvp@google.com> <20260505091616.14877-1-work@onurozkan.dev> <20260505115014.49eef6d6@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 05 May 2026 11:50:14 +0200=0D
Boris Brezillon <boris.brezillon@collabora.com> wrote:=0D
=0D
> On Tue,  5 May 2026 12:16:12 +0300=0D
> Onur =C3=96zkan <work@onurozkan.dev> wrote:=0D
> =0D
> > On Tue, 05 May 2026 08:47:45 +0000=0D
> > Alice Ryhl <aliceryhl@google.com> wrote:=0D
> > =0D
> > > On Tue, May 05, 2026 at 09:07:19AM +0300, Onur =C3=96zkan wrote:  =0D
> > > > On Mon, 04 May 2026 07:54:54 +0000=0D
> > > > Alice Ryhl <aliceryhl@google.com> wrote:=0D
> > > >   =0D
> > > > > On Fri, May 01, 2026 at 10:11:22PM +0300, Onur =C3=96zkan wrote: =
 =0D
> > > > > > Adds Work::disable_sync() as a safe wrapper for disable_work_sy=
nc().=0D
> > > > > > =0D
> > > > > > Drivers can use this during teardown to stop new queueing and w=
ait for=0D
> > > > > > queued or running work to finish before dropping related resour=
ces.=0D
> > > > > > =0D
> > > > > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > > > > > ---=0D
> > > > > >  rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++-----=
--------=0D
> > > > > >  1 file changed, 81 insertions(+), 40 deletions(-)=0D
> > > > > > =0D
> > > > > > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.r=
s=0D
> > > > > > index 7e253b6f299c..d0f9b4ba7f27 100644=0D
> > > > > > --- a/rust/kernel/workqueue.rs=0D
> > > > > > +++ b/rust/kernel/workqueue.rs=0D
> > > > > > @@ -267,7 +267,7 @@ pub unsafe fn from_raw<'a>(ptr: *const bind=
ings::workqueue_struct) -> &'a Queue=0D
> > > > > >  =0D
> > > > > >      /// Enqueues a work item.=0D
> > > > > >      ///=0D
> > > > > > -    /// This may fail if the work item is already enqueued in =
a workqueue.=0D
> > > > > > +    /// This may fail if the work item is already enqueued in =
a workqueue or disabled.=0D
> > > > > >      ///=0D
> > > > > >      /// The work item will be submitted using `WORK_CPU_UNBOUN=
D`.=0D
> > > > > >      pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::Enqueu=
eOutput  =0D
> > > > > =0D
> > > > > Can you elaborate on the case where disable leads to failure here=
? Can=0D
> > > > > you not enqueue a work item again after disabling it? Is there a =
doc=0D
> > > > > test illustrating this case that I can run for myself to see the=
=0D
> > > > > behavior in action?  =0D
> > > > =0D
> > > > As we discussed on yesterday's call, I looked into cancel_work_sync=
 and=0D
> > > > it seems we can make this work in the tyr reset implementation. We =
already=0D
> > > > store an atomic reset state, it can be used to prevent future enque=
ues in=0D
> > > > reset scheduling.=0D
> > > > =0D
> > > > I will send a patch for the cancel_sync function soon.  =0D
> > > =0D
> > > I did hear from Boris that Panthor actually does make use of the disa=
ble=0D
> > > feature.   =0D
> > =0D
> > I don't have any idea what Boris said, perhaps he should write it here =
as well.=0D
> > Maybe Boris said something that isn't covered on the tyr reset yet in m=
y series,=0D
> > I don't know.=0D
> =0D
> So, I checked where those disable_[delayed_]work[_sync]() are, and they=0D
> seem to cover mostly the unplug path. There's a couple non-unplug=0D
> related use, which both cover the per-queue watchdog[3][4].=0D
> =0D
> As for why we ended up using disable_work instead of cancel_work, it's=0D
> all explained in [1] and [2]. Yes, it could have been done differently,=0D
> but disable_work was the most convenient way of solving these UAFs in C.=
=0D
> =0D
> > =0D
> > What I do know is that I can achieve essentially the same behavior usin=
g=0D
> > cancel_work_sync instead of disable_work_sync on tyr. Like i said there=
's an=0D
> > atomic reset state we can use to prevent future work from being enqueue=
d.=0D
> =0D
> If the atomic is already there to prevent queuing more works, or=0D
> checking if a reset is pending, sure. It might just be more custom=0D
> checks to add, and if we think we'll need to support work items that can=
=0D
> be disabled further down the line anyway, maybe it makes sense to work=0D
> on it now, dunno.=0D
=0D
With the disable_work_sync path, there are the 2 things I don't really like=
:=0D
=0D
	1. Having multiple sources of control for the reset path: one being the=0D
	   atomic state and the other the workqueue. It feels odd to have both at=
=0D
	   the same time.=0D
	2. The added complexity on workqueue.rs=0D
=0D
Regarding 1, IMO only one mechanism should own this logic. If we have to ch=
oose,=0D
we can't drop the atomic state since it's also useful in other parts. It's =
also=0D
more explicit and easier to understand (devs wouldn't need to know the work=
queue=0D
internals to understand the scheduling behavior).=0D
=0D
Regarding 2, Alice's suggestion at [1] seems quite complicated (even withou=
t the=0D
enable part) compare to how simple cancel_work_sync would be done.=0D
=0D
I think I will go with the cancel_work_sync + atomic state approach. At lea=
st until=0D
we run into a case where it doesn't work (which I cannot guess at the momen=
t) and=0D
disable_work_sync becomes necessary.=0D
=0D
[1]: https://lore.kernel.org/rust-for-linux/afmusSlYdOR2Alvp@google.com/=0D
=0D
	Onur=0D
=0D
> =0D
> Actually, looking back at panthor to write this reply, I'm now=0D
> considering replacing the custom checks we have in sched_queue_work()=0D
> by disable_[delayed_]work() calls in the=0D
> panthor_device_schedule_reset() path.=0D
> =0D
> Of course, none of this has to drive how it's done in rust/Tyr, and if=0D
> you think it's better handled with a separate atomic and custom checks,=0D
> feel free to go for this alternative.=0D
> =0D
> > The=0D
> > only real difference is that supporting disable_work_sync in the Rust w=
orkqueue=0D
> > would introduce more complexity than supporting cancel_work_sync. There=
 is also=0D
> > the corresponding enable part we have to support if we want to go with=
=0D
> > disable_work_sync path.=0D
> =0D
> Yep, if you use it in the reset path, you'll have to support=0D
> enable_work as well. For unplug, it's not needed, because the device is=0D
> gone after that.=0D
> =0D
> [1]https://lore.kernel.org/all/20251027140217.121274-1-ketil.johnsen@arm.=
com/=0D
> [2]https://lore.kernel.org/all/20251029111412.924104-1-ketil.johnsen@arm.=
com/=0D
> [3]https://elixir.bootlin.com/linux/v7.0.1/source/drivers/gpu/drm/panthor=
/panthor_sched.c#L2728=0D
> [4]https://elixir.bootlin.com/linux/v7.0.1/source/drivers/gpu/drm/panthor=
/panthor_sched.c#L919=0D
