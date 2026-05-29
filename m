Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9A41A682A
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 02:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780022520; cv=none; b=Vzc3efw3Z5o7yV0GIORMKoZCkHfHaRr0k5QRk+jVIRp29MXOfudyeagfgv553eL/vpwHfPm+yjLoyDiqEjdI/cSxz4NXH7u9qiHCX8Jb4iWd+UiCVoceqcV3M25YkZtPEFlhiX8YhR9XcXGBY8uzKzOoXpb1g5SY+dMNYrmOd4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780022520; c=relaxed/simple;
	bh=Ds1p122B60FV2zTmvWNc9nWzQxs8vMilrGSAwxzAFxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azrtn3AtZsdO8N5jOiP50kMjdI9zk9L7sQNr2esMg3J8DtE6F1Usi5EVwxxZB1Lnv9lB9NwHmvGGpSt9Yn3jXZUSb4lChATHEKP+fj842JfISfJ/+AVEazU79yg+jugP0AKSxg7qovoe6v099mLcvq4DEp1vKbZR6pEVqQiPiQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amPlXST+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amPlXST+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b4583f0a1aso98503925ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 19:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780022519; x=1780627319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GZDub8BcFtFH80ZleNgO+woCxrWrG0i7gSDN+ih8DeY=;
        b=amPlXST+wEFjX8ga5F62ffh03AdDxP5AXZUkZrniJU0c9qqM1WvhRYjr/kU8WLCFu3
         vjKH3ZhDJaOeeLcMksIJzDN75v7CZMAKvbUvHSw5fbq9ZGJ0LoGNME+PUMO6UiqXoC1w
         MG6vZWArSeeTEajwcbbXoGjksTsbyKv9BeMJsmL8cPdd709jfQeytEkBEQlD0nO+6JHu
         LvKC8/DEt6PO5XyfxzNI5382J3vqaearojYWPf5K6tmLTYKWXMSzUncLVej4qMPsDpeq
         2li3jg0iXui2z3Bf5CsiZFpxiCQ4ct8Y95vB7u4XI4BCxosEdc6Gkk1YjAdsafctAx8e
         X7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780022519; x=1780627319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZDub8BcFtFH80ZleNgO+woCxrWrG0i7gSDN+ih8DeY=;
        b=eoU1LpBo4vg45yxxal/K77nAqid0E0yiEmzGrbbcAJVXBCuxyOduHxO12Oyc3JQcxJ
         xiiMt6KUB+ny0QmNsKk034FebloOzV5V22ySAHQG4ePZ+C4y24HbA4Tky/XqfSEWqbsw
         WxUic5mLd8YoLb5zlN2fF1FtlZUh7Zb0DfHcqLZWBjJnEvBeMNLVe7GDy2+N4q2gJCbV
         y9kbShDXgNh3vjOwSlNv6IhKPAIQHvPS9erEE+OXg/OhSBxovu7uMhOvwYXexQ8gjsvT
         n9HyNLtezFYnnZpsThbtP2s1RKKiamyFg7lVwL35LMSS8pR/2WwlFzHgksGvvUkaxsJO
         Sb8w==
X-Forwarded-Encrypted: i=1; AFNElJ+trWNOOTEmIXwhp5d3RvQ86s5cr7GEDDvq/ljQRdJl+yIJDzKRgS/ZGtEmWRWf3RSB8Vq6Od2hzoIOYdr2Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5gJh9xUj06a3hM3YulxEDccAK0XRBcy9yvDgO+qphnZK3jeoQ
	qnGgbsWeqQDUAWsSYtgZjOBvv3hyfsgAykE9jLEGJ5IuRyP1wQJXoiv2
X-Gm-Gg: Acq92OH6C3pDTOT77tL8ZnSxTR5a9D6JQQePxOS6DXq2KLwabcbRP/MfTkwXsj2xk39
	ARCHP5nUb5JbzHBBAC91aQ4xlsbM1UDEF1dXFejQKIuKFeKV8cL1ylNGiCEeDkFCSW46t7KKAHS
	Xv8EZLAhNljYlbYwWpfLlcqrrZWIvLwKjBnqAvIs+W0g7S7zwssBHd834FJbEbFX5ncbPywjqZt
	wxIck4/zxfENb0cc6gZ4l+todV4jxfqCNCsKEFzymFHATwf5oOOIFhVvCcOU1Vy5IBMq9J8s06r
	YliygSXWJRba5QkRm0JOv7qga0IKO0TRm6rtasPqI4nmCe0fKx/0qlFeX1DAnl2Yg9MYg1osV0J
	EEyahSgN6xXMIGiW7rE71g5P1eyyVp5/bwO1I3/EgGCjF8/oTEPzDJvv5o9WBhc8mW9KRHDOmlf
	wfbe7k6WhgsCYuMcjEMjcxoNyVvC4o7ZQxM1E/+qyF3SrdIOvuw0kQGA==
X-Received: by 2002:a17:902:f641:b0:2b9:ea53:4cfc with SMTP id d9443c01a7336-2bf20976e99mr12238495ad.19.1780022518682;
        Thu, 28 May 2026 19:41:58 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a0fd4csm1915955ad.30.2026.05.28.19.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 19:41:58 -0700 (PDT)
Date: Fri, 29 May 2026 11:41:53 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, cmllamas@google.com, aliceryhl@google.com,
	mo@sdhn.cc, wedsonaf@gmail.com, Liam.Howlett@oracle.com
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org, imv4bel@gmail.com
Subject: Re: [PATCH] rust_binder: use a u64 stride when cleaning up the
 offsets array
Message-ID: <ahj88dV6McFC0oFu@v4bel>
References: <ahjpn-3WQTywTdyj@v4bel>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahjpn-3WQTywTdyj@v4bel>

On Fri, May 29, 2026 at 10:19:27AM +0900, Hyunwoo Kim wrote:
> Allocation's Drop walks the offsets array (binder_size_t = u64 entries),
> cleaning up the objects, but it used usize instead of u64 for both the
> stride and the per-entry read.
> 
> On 64-bit kernels (usize == u64) this is harmless, but on 32-bit kernels
> it walks the 8-byte entries in 4-byte steps, iterating an N-entry array
> 2N times, and reads the always-zero high word as offset 0, cleaning up
> the object at offset 0 N extra times. As a result the referenced node or
> handle ends up with a lower reference count than it actually has (a
> refcount over-decrement), and binder's reference accounting is corrupted;
> for example, the owner can be notified of a strong reference release
> (BR_RELEASE) even though references still remain.
> 
> Change the stride to u64, and read each entry as a u64, narrowing it to
> usize with try_into().
> 
> On 32-bit ARM, when this over-decrement would drive a count below zero,
> the driver's existing refcount guard refuses it and fires:
> 
>   rust_binder: Failure: refcount underflow!
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> ---
>  drivers/android/binder/allocation.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
> index 0cab959e4b7e..f4ffc57a8cb2 100644
> --- a/drivers/android/binder/allocation.rs
> +++ b/drivers/android/binder/allocation.rs
> @@ -251,7 +251,7 @@ fn drop(&mut self) {
>  
>              if let Some(offsets) = info.offsets.clone() {
>                  let view = AllocationView::new(self, offsets.start);
> -                for i in offsets.step_by(size_of::<usize>()) {
> +                for i in offsets.step_by(size_of::<u64>()) {
>                      if view.cleanup_object(i).is_err() {
>                          pr_warn!("Error cleaning up object at offset {}\n", i)
>                      }
> @@ -412,7 +412,7 @@ pub(crate) fn transfer_binder_object(
>      }
>  
>      fn cleanup_object(&self, index_offset: usize) -> Result {
> -        let offset = self.alloc.read(index_offset)?;
> +        let offset: usize = self.alloc.read::<u64>(index_offset)?.try_into().map_err(|_| EINVAL)?;
>          let header = self.read::<BinderObjectHeader>(offset)?;
>          match header.type_ {
>              BINDER_TYPE_WEAK_BINDER | BINDER_TYPE_BINDER => {
> -- 
> 2.43.0
> 

The BC_FREE_BUFFER handling in thread.rs's write() seems to have 
a similar problem.

Sashiko's review:
https://sashiko.dev/#/patchset/ahjpn-3WQTywTdyj@v4bel?part=1


Best regards,
Hyunwoo Kim
