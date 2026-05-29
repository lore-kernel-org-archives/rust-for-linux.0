Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889CE3B1EC6
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040812; cv=none; b=CSKaqWHKfGqUR4lRia1RmfpzVfWHddkHf+JpYfubZ1CgtpC0cPdOGVqE1eJ8S+e3scuEad3CyTlzyxkPwDCnUKQ/0j+TH+TORZ/9EpumHoasSKycUnvIvc0T24JeQ11P+ejkV6UadXELZgcBCCwBndb3Y7PN9Du1xIcbUlkPJF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040812; c=relaxed/simple;
	bh=HyhfteZWEF8Q1ETpLqyPFXNMA+c5i58fEImYDTnbSPI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YtPR7nW9buiTFodFyvmttRNVUDmoqrLB9C0PNCI5iZBV2kEXOGgivzDwr4UjRmm+SlGTzY+ejQejGhxFaxbmk3GlOJtG5IoUBmSeimxp+3GBKyZh/SxTlBJsH+wGjnU5Nzn/4MxRsQJNXzNa67qyv1MOw9lJMebbgZeVD3g1EdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OcvSGa6N; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OcvSGa6N"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-45ef2bd566bso165543f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780040809; x=1780645609; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9q186T6GNJIVHnOw7j9Sd2xFHu9DN0yUpVVi9MMgRKg=;
        b=OcvSGa6N/e+E0LxYHJ91P2yxlVDvUlC4DIlzv53naFv7G4xxWYyARFw5GXL66zOCrv
         Ol9NvriJsUXkG5M936t1/VWqj0RxgdBjt3z+Bt3Rh/RBKy9OHPdjUSCdrjbegIcmV/4U
         PgJqurMw3WaIQeXGpQNvJ/u6W6IshzzyLc4vsW+0jMVHVyxoaMPj7vTxRaKRcOcTITtw
         DkNz459kL+NXB9jx/zhVLioHLyNSNc4kDJgOs9eQjKQFElGEbqFIw9bCfLSavB0dq9l6
         0eZCQShTuhiIJ9WjWnOpHekCmC6IOPTv3R5Kom/ekhBs9BZHuYe6jYGdOrJOYCXQM403
         wJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040809; x=1780645609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9q186T6GNJIVHnOw7j9Sd2xFHu9DN0yUpVVi9MMgRKg=;
        b=Tlb7tUiS8hESELTEhBi8szkXkGGLGTQFHBCuof0WLnl+iNdYnI6QB1Zd2BJ4sb6JE5
         k/gA0CHeKHxBwIXt8Odx4tLpb255hMz8J0qtKmQ/LHaT/nkHaux/uI/m5J+v76pDE7d1
         EEj2FvQR3pzkZcal3t5oZwjuw8kqCjtNmgCaUmjr+QbBkQZU84RYEsHjtKUUD577PY7X
         mK3bATCYNp366s2lkr1D/u/nOgPCk7fyw7PgXTFpO8KI5GOPAOvts5N4mYxe2jR85S1x
         J7dUaBT0IhLmTy2omoboGPrvQiLWRj59bAfIhX4JOa082duuIPRNp4PcTTksL1EGXink
         cD2w==
X-Forwarded-Encrypted: i=1; AFNElJ8saqiK3iDXq1wQGgkk4WRneJn6IoYVA8gKnlzzMM7lCnVyDdTwFI8jtG1SJQcmrZEL+6WGHOBkZtYoG10kHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbpD3HSZKSl3K5RJCX1wfgmB1pek1IFPHTESyXo8V2NXMgVRKp
	4vKS6l7SA2vW2W7tYk0W0tqE/lDA7tJPOXD6uO05a+zITTvvwj0k1euhs8k07jOOqkErHAkDoHA
	B0aQhT6DR970FD31Mfg==
X-Received: from wrp11.prod.google.com ([2002:a05:6000:41eb:b0:45e:eae0:5ba0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:5c7:b0:45e:f266:f4c4 with SMTP id ffacd0b85a97d-45ef266f728mr2318503f8f.29.1780040808861;
 Fri, 29 May 2026 00:46:48 -0700 (PDT)
Date: Fri, 29 May 2026 07:46:47 +0000
In-Reply-To: <ahj88dV6McFC0oFu@v4bel>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ahjpn-3WQTywTdyj@v4bel> <ahj88dV6McFC0oFu@v4bel>
Message-ID: <ahlEZyeCOBtK3ydd@google.com>
Subject: Re: [PATCH] rust_binder: use a u64 stride when cleaning up the
 offsets array
From: Alice Ryhl <aliceryhl@google.com>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, 
	brauner@kernel.org, cmllamas@google.com, mo@sdhn.cc, wedsonaf@gmail.com, 
	Liam.Howlett@oracle.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 29, 2026 at 11:41:53AM +0900, Hyunwoo Kim wrote:
> On Fri, May 29, 2026 at 10:19:27AM +0900, Hyunwoo Kim wrote:
> > Allocation's Drop walks the offsets array (binder_size_t = u64 entries),
> > cleaning up the objects, but it used usize instead of u64 for both the
> > stride and the per-entry read.
> > 
> > On 64-bit kernels (usize == u64) this is harmless, but on 32-bit kernels
> > it walks the 8-byte entries in 4-byte steps, iterating an N-entry array
> > 2N times, and reads the always-zero high word as offset 0, cleaning up
> > the object at offset 0 N extra times. As a result the referenced node or
> > handle ends up with a lower reference count than it actually has (a
> > refcount over-decrement), and binder's reference accounting is corrupted;
> > for example, the owner can be notified of a strong reference release
> > (BR_RELEASE) even though references still remain.
> > 
> > Change the stride to u64, and read each entry as a u64, narrowing it to
> > usize with try_into().
> > 
> > On 32-bit ARM, when this over-decrement would drive a count below zero,
> > the driver's existing refcount guard refuses it and fires:
> > 
> >   rust_binder: Failure: refcount underflow!
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > ---
> >  drivers/android/binder/allocation.rs | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
> > index 0cab959e4b7e..f4ffc57a8cb2 100644
> > --- a/drivers/android/binder/allocation.rs
> > +++ b/drivers/android/binder/allocation.rs
> > @@ -251,7 +251,7 @@ fn drop(&mut self) {
> >  
> >              if let Some(offsets) = info.offsets.clone() {
> >                  let view = AllocationView::new(self, offsets.start);
> > -                for i in offsets.step_by(size_of::<usize>()) {
> > +                for i in offsets.step_by(size_of::<u64>()) {
> >                      if view.cleanup_object(i).is_err() {
> >                          pr_warn!("Error cleaning up object at offset {}\n", i)
> >                      }
> > @@ -412,7 +412,7 @@ pub(crate) fn transfer_binder_object(
> >      }
> >  
> >      fn cleanup_object(&self, index_offset: usize) -> Result {
> > -        let offset = self.alloc.read(index_offset)?;
> > +        let offset: usize = self.alloc.read::<u64>(index_offset)?.try_into().map_err(|_| EINVAL)?;
> >          let header = self.read::<BinderObjectHeader>(offset)?;
> >          match header.type_ {
> >              BINDER_TYPE_WEAK_BINDER | BINDER_TYPE_BINDER => {
> > -- 
> > 2.43.0
> > 
> 
> The BC_FREE_BUFFER handling in thread.rs's write() seems to have 
> a similar problem.
> 
> Sashiko's review:
> https://sashiko.dev/#/patchset/ahjpn-3WQTywTdyj@v4bel?part=1

Yeah I think there are a few instances of this. Would be nice to fix
them.

Alice
