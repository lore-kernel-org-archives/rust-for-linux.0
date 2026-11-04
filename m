Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797426;
	b=WSBuceJsECH6XbmWdALNYfQ4AoPctwtrGJluOadHHzN8sYZ+ZRkKfbL7xl7DICT5MAcC
	 Cmrr6J+qlhnX7maS0upalatr2w4LTB5wdnu1wDl3bwXtZseMdHPJ9LpAuiESd9oZZFP3a
	 CmrOMJxf3qz1CXoaRNDTlZgMY3q0XNUcmvwuftA2TyXUosh6KNfBOxcrSg7/p5ubP8vJn
	 QhytMyMppbjOHj7aUOUOkJbLYjflpNXZSlvMg0VoDo/TT69zRGJgJ0/Fh8I9ezM+quoxx
	 qpxBVxFQI6N5nm5JESuuStbjFqVWhKe1cTW0wNL2yQlRekXjJK7oVdWpHzkdcbexljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Rk9I/hs0FAD1JpZN3nz0IyElTxou9AIDzVZ41o0WZsY=;
	b=ppyr4C3S+YoBgBvQDP36MN7zyIAtlPGcurZRIYsnQIDS4sP2F3/jR4grUzN56ApOnVpt
	 XVbb/kTnQP3Qbv18xHnozygdkziuD4k8o7JE7EIWEaUMsMSG6pnUDITPk8jfKptsI+mIY
	 DujiJa41JNWeqqbCJOgvaSy5L0HWgK2O9IgQrhBlT15UkkeYe0jkogfrMmj9ubxmy5R/i
	 /RappuDmntLToZQjl4tT5c32Hw/d8xMXZ9XA6UvfVjyHLFDU4FM67TbXB4DBGpROlEJTO
	 XmzdPwI4ZAnUMdWkjvPpnRm4ywHiyvyIxYNPGv2qYQfnZgL5aspPW5+oxi5zxxPBH6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SundMkPA;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D01606A32C
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 13:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D01606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SundMkPA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4902ce85f72so574672f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Nov 2026 05:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793797424; x=1794402224; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rk9I/hs0FAD1JpZN3nz0IyElTxou9AIDzVZ41o0WZsY=;
        b=SundMkPAP7nK88QqCodUo6cgiHfwucHJ2BB7s+84UW57L+S2JnswkeV3z5E+jnjjiS
         uYJbWuy3crTVgS2v9uNU+xMFoBfOXCY/PZhRZVgDcBN8VIj1Y/vxJkjggQcE7XmYbZ2w
         XgGNoFB2eJzlLFmjeXFS7rrjh4TEnrcWlNJ4k80kYfoIjNxkZ4HXbu9pcdq+dwcIwFlD
         cG1iX7wjqaqYeca+ffIq1Mad6MkDVd8ccTWW4Zas4vB7KvscYTZY3Mv2oJiHb8uMo899
         042BMZAOA12jBTu9X6bJR/ScE7SG6+gseXgxLO9FDy7so+xrDHuko5WnFP310QOIOHZz
         o0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793797424; x=1794402224;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rk9I/hs0FAD1JpZN3nz0IyElTxou9AIDzVZ41o0WZsY=;
        b=gAtDAxcgZV/2eibRhbHdX4z4NdMQnTA1ysfxEX2Xd//60jdAWKMd2sl03oVYoj7jA9
         7JDB8tePl/HrEHpGvw0xNbKOLD2J5X0oYNhv2PUsDetO4+kRA3qNtQVlHl5EIVak3kq6
         AJRUINS7/CZgpj6LXCcISgTATUYIahtPq/GklJuKLxMBjkTJEQBKW7fgob46x1d+mJYe
         Y7UxDUa3hm2lTih14vUtZwKGym2dSNW6LA6QBYqU7C0Cj8KZlXNE/lk7CbtcMTPr1yp3
         gzZOzVq4ijz85WEj/D7UQDi6+jJNmmM5CMXy5WrNIPLfa4S1zIZV2G9RCxtB30cfZS1e
         fIMg==
X-Forwarded-Encrypted: i=1; AKwUvBy3D01lGE7LDVx8LV/rGhbHgUiidsNv3H7+Oc5sltLW2sMGYO/h+TpVI7VpWuxrPzcek3XmZkf6WX5D4HUw8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ozBqMuv/ZSUYomG507yDVIhi+/99TkpheqGrPIreDthFzdeg1
	tRRNNXXh1m98Y/3LorwxxNsxd05aTB4fkNC6ZWx39UkDk2Av5Rni17EHZWYz3Idd27WBuontt7X
	+qD+7PlhikCQ1N2GrJA==
X-Received: from wror10.prod.google.com ([2002:adf:f10a:0:b0:48a:eea0:bc47])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:29cf:b0:48e:6f76:de9c with SMTP id ffacd0b85a97d-48e6f76f453mr21544509f8f.28.1793797423627;
 Wed, 04 Nov 2026 05:03:43 -0800 (PST)
Date: Wed,  4 Nov 2026 13:03:41 +0000
In-Reply-To: <auixgbeSSfBWwVS9@tardis.local>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102035934.711973-1-tomo@flapping.org> <auixgbeSSfBWwVS9@tardis.local>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104130342.261593-1-aliceryhl@google.com>
Subject: Re: [PATCH v9] rust: sync: condvar: use Delta<Jiffy> for timeout and result
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, FUJITA Tomonori <tomo@flapping.org>, arve@android.com, 
	brauner@kernel.org, cmllamas@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	a.hindborg@kernel.org, acourbot@nvidia.com, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, lossin@kernel.org, 
	lyude@redhat.com, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 02, 2026 at 07:51:29AM -0800, Boqun Feng wrote:
> On Mon, Nov 02, 2026 at 12:59:34PM +0900, FUJITA Tomonori wrote:
> > Update the only user, binder. It now converts the freeze timeout with
> > Delta::to_jiffies_timeout() instead of msecs_to_jiffies(). Both round
> > up, so a short timeout does not become zero. They differ only for a
> > very long timeout. msecs_to_jiffies() returns MAX_JIFFY_OFFSET for
> > 2^31 ms (about 24.9 days) or more, which means an infinite
> > timeout. to_jiffies_timeout() has no such special case. It converts
> > such a value to the matching number of jiffies, so the wait is long
> > but finite.
> > 
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Thanks. Alice, any concern regarding the change in binder?
> 
> I have some naming suggestion, please see below:
> 
> > ---
> >  drivers/android/binder/process.rs |  7 ++++---
> >  rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++++---------
> >  2 files changed, 26 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> > index 1f4cb43f1de6..edde0ea35687 100644
> > --- a/drivers/android/binder/process.rs
> > +++ b/drivers/android/binder/process.rs
> > @@ -1552,8 +1553,8 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
> >          inner.is_frozen = IsFrozen::InProgress;
> >  
> >          if info.timeout_ms > 0 {
> > -            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
> > -            while jiffies > 0 {
> > +            let mut jiffies = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();
> 
> I would rename this variable to `timeout`, i.e.
> 
> 	let timeout = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();
> 
> Thoughts?

No concerns from me; the binder change and your naming suggestions look
good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
