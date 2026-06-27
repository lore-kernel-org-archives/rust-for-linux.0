Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624EA28E0F
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 00:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782518454; cv=none; b=Mk1xFTjGB3eISUYx2liie0M7umuqYvxIfVrJLyvmzKJOM4dxc70TbgIx4u4RH9Rls7CMDJKNK5mlCxVlLXj5P+hNHw9mxjajD6IFFW9Ug8aO+WkI+qYK4Pur5SYu3KID7tSzy01aDwZzNGwvmtwzjpuwAC3VvBRwPh9giW6ejaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782518454; c=relaxed/simple;
	bh=tGIQHoq4qK5Eb4FAZpd/KMB8JhWc6zGurunEeF1Sxg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvYVoVvXHeY56gt0cySlKk1l3albh7WPX2VyszqEQib9meU9FaScxIu8o0ioKpQR501ksjQ5h90NniCOangVrxxtkKjShuSkJ/2T1OOKa0KCLUUwPFmLSU2qvAQP+mAdhLqhIKLmcyxld6U2b0Ib6dgoksbIN42w6AF7CxZHwhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l5damnCH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l5damnCH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c9b2ac97cdso825ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 17:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782518453; x=1783123253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QqDPPLJzwuxTB89us7bsdVJAmyNxYkv4BpfCzxYJck0=;
        b=l5damnCH21c52U4xUKOm6SbLFVDsXUmSrT0CBS9sAHcDHYexifr8aH7AXLtNV9mDXT
         u47nuU0LlCSlBLh38P2xXdOi3xwxAtm4hpwVoMq+ERCsOJxLSpcAOgIbAU74i7IDgQKC
         MHN5NlIUTS2t1lh5AWDvj9YtSzNCrNhHNbTqf1WtjNn5AQmHx9GOll9Dm+wvcfapkQJc
         E6IN4lBAUWIJfckcMo/bZ/hBk2E+vsc/FN0xbnbLNZdkYWWfDTj2nSnHzIcNMb5vExeR
         qF7UVXk/EiA9Et+Ac7kxHyi+V945x7IEi4kCqpwhRdXFp+R7ohDlxTldUAtpA0gUjVli
         NJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782518453; x=1783123253;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqDPPLJzwuxTB89us7bsdVJAmyNxYkv4BpfCzxYJck0=;
        b=EmOz7VQioXPkoNm9T9v61pmzVPm1wbNCrYjqqeJ3S99aVBWxKbG7LtyaQIXZYXj9dK
         qSGwETP4oey5p1J9MLZlqpJLmzGPgwZMsGeIgP8V+Sg3d87nQjxfNpQ5DpKkBm02yJ9H
         5l21EW8nN6FHZ4ZqTPelwIywjrC8/796Ep0dXccvtDT3Nfg56IrP6e01+MHY0mml5/BA
         heLE9OCAGhaSoa1Y2W9zGx8vArxNKvUfYd6TxqYnLgw7GhMIXEgiZxVEy7Z+9+7vHqcf
         z4jUsADbmCKrIxK864+4okxiYg0KwnvdwfuyHnIVYTTKGWyryGTLJrAInjFTGIFumKOI
         7PHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Z1rEiZFCiF8PkmClB+beOib2lUM5ESr/liQ7rHQhsIac5XuTBgRJsHb9JrMuBRz3uMSp/ZBdvyiw7UJPBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrwS2/2sHYMYGBJTnw/ulgkPT8lD6FLvYE1x6kuYq83OHXr/qf
	/RGE+3qjBKeuTzFl3hsAq5MP/gqn+V40pap/pUCJDkxKfVqA/WFJWo1wn1g8XP97Ew==
X-Gm-Gg: AfdE7ckLt6Io6U+DNiJ8PwiJlqt/c78MCYbHU9v/vN4SOqTSs/Y1sfx44ktj0fuvMJS
	pmjVEl0IZm0kMcs/mU512QD3+zLGG/c3pHmPzpZ2LQVK/OgA2oM0kx1wf3rZYiKIqI8a8snez5g
	x5IvUSsqfnd6TduhmfDX/LN/Q0Iv6bzT6GVpcfi/eoWRr7j4OBOgEEbbo0yoaHZP8eM8071oQo0
	lzDSJ6jiKqBbWatQ6bqlICown9GCSHmGXxcSGWOyVQfaoLCYBMeLd6OdWYq0xZuEaGeMQMRNr/P
	yZUmurOW3S8EcGuFgdwqW0ARntQRcq+Ioeat7g6sInHQGr7gF1j7XDrsITFqNR9ZKYzWvhJFbh4
	yFGRU5pwMC2H5SU+Kk9fr9c1iyRXfrfLaHHfExBY/LmqefERar0BcXqKKpYpJUDnQh0BrBCVOXT
	LweKZvNHQ+dKRhvOphQmGlbNj0vXHgk2p5725jJBFo00vo32fVXDdytAIEfFcdw5rV1lzNGj1VU
	8wvGY2Ii67cV2ajjatfCwP7cNjnKgToEy8=
X-Received: by 2002:a17:902:f612:b0:2c7:9e6a:1a8d with SMTP id d9443c01a7336-2c9a24512fcmr1139135ad.12.1782518452128;
        Fri, 26 Jun 2026 17:00:52 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c81aa46aeasm20037615ad.17.2026.06.26.17.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 17:00:51 -0700 (PDT)
Date: Sat, 27 Jun 2026 00:00:46 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Hyunwoo Kim <imv4bel@gmail.com>, aliceryhl@google.com
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, aliceryhl@google.com, mo@sdhn.cc,
	wedsonaf@gmail.com, Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] rust_binder: use a u64 stride when cleaning up the
 offsets array
Message-ID: <aj8Srto26mBb3vQ6@google.com>
References: <ahw3tFhLz9bMMJAO@v4bel>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahw3tFhLz9bMMJAO@v4bel>

On Sun, May 31, 2026 at 10:29:24PM +0900, Hyunwoo Kim wrote:
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
> Changes in v2:
> - reformat to satisfy rustfmt, as pointed out by the kernel test robot
> - v1: https://lore.kernel.org/all/ahjpn-3WQTywTdyj@v4bel/
> ---
>  drivers/android/binder/allocation.rs | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
> index b7b05e72970a..ea5846e4da16 100644
> --- a/drivers/android/binder/allocation.rs
> +++ b/drivers/android/binder/allocation.rs
> @@ -259,7 +259,7 @@ fn drop(&mut self) {
>  
>              if let Some(offsets) = info.offsets.clone() {
>                  let view = AllocationView::new(self, offsets.start);
> -                for i in offsets.step_by(size_of::<usize>()) {
> +                for i in offsets.step_by(size_of::<u64>()) {
>                      if view.cleanup_object(i).is_err() {
>                          pr_warn!("Error cleaning up object at offset {}\n", i)
>                      }
> @@ -420,7 +420,8 @@ pub(crate) fn transfer_binder_object(
>      }
>  
>      fn cleanup_object(&self, index_offset: usize) -> Result {
> -        let offset = self.alloc.read(index_offset)?;
> +        let offset = self.alloc.read::<u64>(index_offset)?;
> +        let offset: usize = offset.try_into().map_err(|_| EINVAL)?;
>          let header = self.read::<BinderObjectHeader>(offset)?;
>          match header.type_ {
>              BINDER_TYPE_WEAK_BINDER | BINDER_TYPE_BINDER => {
> -- 
> 2.43.0
> 

Hey Alice, have you seen this? This looks correct to me so,

Acked-by: Carlos Llamas <cmllamas@google.com>
