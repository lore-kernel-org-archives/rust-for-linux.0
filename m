Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6175613B58C;
	Tue,  5 May 2026 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777961262; cv=none; b=tV5x3Qq/xsdl4v37Dwyuu6TLD59JRcbk2oAUJBnPghAR4c+eSgbyIuc1mN+74vs7OeEHqPeqIRDCbiOI5LMEZHUsDG7uJpy2Q5DT9dpeI+w1X10hJSYeT3rT32AbNQsRpBbejXBFfNHEXwYkG0vajFLzYiDTvTBEEnQiUjvdhvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777961262; c=relaxed/simple;
	bh=lJTcJi0kFf5Of4Sx4MAiryQ8EGS3bWxtJTTWYIoySWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B1PccULMeFxIIL8Gsd8GyLiQiZaJ/PInnswKKYHDsERuCRtRcGmIEfbQQCrh5LjvkArD5c7AFp5IurfisAmuvHDkoWGFKXwV8u4j/jivBEGsTTlJ4bRTXSuyDKrDLPSoehjRYfC74B74Pg3JmSSzhy1+2WtP1AjNse3jx7pTrX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=cEr6POMc; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="cEr6POMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777961249; x=1778220449;
	bh=KnJkDBw5xfTpznmvaxwg9K4XLvHPjged2DAWtlb4yaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=cEr6POMcCOM02H2kKAB7BFFyT/cCP3r2ca1BE8UpB63JswtovszDlGfIYsMX8Dndb
	 nFmxk+4qbpV6qQLJdZSGmQp+o5sJrchJOn26Q9qGEDxEkZVgtjEbZhmcY3luwrhTo+
	 +SwwGkUrmdbzJbI6g3DV/RlD/8OqMku30oaKJu9aQxNPoacEc9uXz8A7xV+0UH2DSL
	 mSfbtHzIQyH0N/P/CyAbFoTBuPSDftXGXzdnkI02XlCIz/WOtWGFIiaE3LT5UUFEKi
	 MYcrwFYb+ruEfN7oqsYJDytbdvCxhDL76wfZPm3g7Y6KohTVwEuG6Z7djMBI/b9qxN
	 rOafCN3ITiVbA==
X-Pm-Submission-Id: 4g8p2Q3sT9z1DDLg
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org,
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
Date: Tue,  5 May 2026 09:07:19 +0300
Message-ID: <20260505060723.11363-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <afhQzt2VGa-QQYSm@google.com>
References: <20260501191122.64311-1-work@onurozkan.dev> <20260501191122.64311-2-work@onurozkan.dev> <afhQzt2VGa-QQYSm@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 04 May 2026 07:54:54 +0000=0D
Alice Ryhl <aliceryhl@google.com> wrote:=0D
=0D
> On Fri, May 01, 2026 at 10:11:22PM +0300, Onur =C3=96zkan wrote:=0D
> > Adds Work::disable_sync() as a safe wrapper for disable_work_sync().=0D
> > =0D
> > Drivers can use this during teardown to stop new queueing and wait for=
=0D
> > queued or running work to finish before dropping related resources.=0D
> > =0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > ---=0D
> >  rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++-------------=
=0D
> >  1 file changed, 81 insertions(+), 40 deletions(-)=0D
> > =0D
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs=0D
> > index 7e253b6f299c..d0f9b4ba7f27 100644=0D
> > --- a/rust/kernel/workqueue.rs=0D
> > +++ b/rust/kernel/workqueue.rs=0D
> > @@ -267,7 +267,7 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::wo=
rkqueue_struct) -> &'a Queue=0D
> >  =0D
> >      /// Enqueues a work item.=0D
> >      ///=0D
> > -    /// This may fail if the work item is already enqueued in a workqu=
eue.=0D
> > +    /// This may fail if the work item is already enqueued in a workqu=
eue or disabled.=0D
> >      ///=0D
> >      /// The work item will be submitted using `WORK_CPU_UNBOUND`.=0D
> >      pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput=
=0D
> =0D
> Can you elaborate on the case where disable leads to failure here? Can=0D
> you not enqueue a work item again after disabling it? Is there a doc=0D
> test illustrating this case that I can run for myself to see the=0D
> behavior in action?=0D
=0D
As we discussed on yesterday's call, I looked into cancel_work_sync and=0D
it seems we can make this work in the tyr reset implementation. We already=
=0D
store an atomic reset state, it can be used to prevent future enqueues in=0D
reset scheduling.=0D
=0D
I will send a patch for the cancel_sync function soon.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> Alice=0D
