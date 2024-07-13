Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B60132114
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Jul 2024 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720882203; cv=none; b=EstCcRvKZJwvexkZhpcOkrQiFwOhCdpyFqPSmTPdYKr3b/qyu48HZAw8Q3doYX1Hq/UY7BwDPfOGCwtindqzNoj1+56MX6/l1KHvlWihgDCpUHR0RqrYJAWWzT96KqFWeNzAzv3+2vo61FyBujneDWQ2BN6tkWR8LxnxxxewvWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720882203; c=relaxed/simple;
	bh=lvDrQV56tBUXKpSUYxbx5CkTdDccFytAphDjQRZAsLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oyJKhhePXaTegSvcOZoo+oIFJKciY9E6czBvubm4Xv4IpwHgrldcd2qkOwL9ZHrn3y4jju6mmFmI8rm+jinjd49oc2+W+XR0VO+rOTwd76RDOoZhFlHG++M6HRoAC8s70k18VmdZ/3767VJYoiGmmzJeyd4gwQ//hbDbVrreDy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ip3tOvD8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ip3tOvD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720882200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a4AbNjpp4hqCHzZOlyISRcLeMmOnjyeu6DKbsQlyQtA=;
	b=Ip3tOvD8pDIRJ9pmtPtv68IIMIA/8wxIaI24IWGL2cuNtq/WPxvvtxWztV55i6wsSNuAVw
	Y8FVV4x7z3qtkuenlG0k4GxonlqqFqgvFDG3RaerYsB1Rx7otF3WgA7plpIOxnPDOAOqYG
	PhJRPIdewwsrsyn91DcKSLMqqXAVifw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-Zpf2cZbdNc6IPVlWlqX-HQ-1; Sat, 13 Jul 2024 10:49:56 -0400
X-MC-Unique: Zpf2cZbdNc6IPVlWlqX-HQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42666ed2d5fso18988585e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Jul 2024 07:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720882195; x=1721486995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4AbNjpp4hqCHzZOlyISRcLeMmOnjyeu6DKbsQlyQtA=;
        b=aJ6OGGZDcg3EO27aasZADg28DrQxukp728CB1vHdmom5tgGl+T3j4XNjXCz5bvIcY0
         NXNWtNi7qvDMPQrK+E26b7U6FNH8Df9krX+FpZhABw3J8g1XnBbJVGCKpp9axA5stwUd
         TiAJ8gdEU+9FKz+EcqVaBodxfaNFZZzU4pBhHzegtfYMDk6/TEyhX39NgI54WcTFfCyc
         fuCDv/K2dxyIH21It5gTj0GYFjwOoWpyXdRkg8mI3Og/aXEcDIPF4kUmMXfI+u/NA415
         MXpzc26cWsAp/ggwXYuIrZ54r+Hf/b04nT66wQeSgeaEOugrlN8uo7c3+NlsSTzCme92
         GR0w==
X-Forwarded-Encrypted: i=1; AJvYcCW60HI6E7Sxd0la86qaHZ7vWbuLXIWf/0BTnuhGaDoPMgYjxBcj18Z8K9m4t3ZpKKrKC9HdwKLveSRwCHawP1kRBVBaUfGfrER2mzYCZTQ=
X-Gm-Message-State: AOJu0YyIM/zzt4HwS7vY3CAVwPTTOMlq3+8wemTL0NwzPlkhaePlzngX
	N9xIv8ttLxdaK8cNLQZZINznRA6pBhUjC1tSSPC/2ImE17kmKRHxuanSdZ1t6HiGOPRTNN2LyRy
	LHaUgt93WEqsNo/f2NIrOHs2cc+kkwAKq2d7lHbWywncE6RmPS+abIgI0AWBvOZ+s
X-Received: by 2002:a05:600c:6d8f:b0:426:6f0e:a60 with SMTP id 5b1f17b1804b1-426707e2ffdmr97349215e9.17.1720882195395;
        Sat, 13 Jul 2024 07:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYybzB01yKZQiOWZSW/pi8k9FrEkZ863yhN5Xt/4doo+hsXQoxYA/zL09HPsKtMFVmYmKhRQ==
X-Received: by 2002:a05:600c:6d8f:b0:426:6f0e:a60 with SMTP id 5b1f17b1804b1-426707e2ffdmr97348925e9.17.1720882194772;
        Sat, 13 Jul 2024 07:49:54 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:2522:59b5:3360:91e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a63449fcsm21716525e9.29.2024.07.13.07.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 07:49:54 -0700 (PDT)
Date: Sat, 13 Jul 2024 16:49:52 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@samsung.com,
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	andrewjballance@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, mcgrof@kernel.org, ojeda@kernel.org,
	russ.weight@linux.dev, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org, wedsonaf@gmail.com
Subject: Re: [PATCH v2] rust: firmware: fix invalid rustdoc link
Message-ID: <ZpKUEKHh6gK7SODR@pollux.localdomain>
References: <CANiq72=6LSGwRsc+deE+U8H=mdgFisrKEPOYgVkZfHhGm8hwog@mail.gmail.com>
 <20240709004426.44854-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240709004426.44854-1-andrewjballance@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

On Mon, Jul 08, 2024 at 07:44:26PM -0500, Andrew Ballance wrote:
> remove an extra quote from the doc comment so that rustdoc
> no longer genertes a link to a nonexistent file.
> 
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> Reviewed-by: Danilo Krummrich <dakr@redhat.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Fixes: de6582833db0 ("rust: add firmware abstractions")

Can you please pick this one up?

- Danilo

> ---
> v1 -> v2: updated commit message
> 
>  rust/kernel/firmware.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 386c8fb44785..763d7cbefab5 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -2,7 +2,7 @@
>  
>  //! Firmware abstraction
>  //!
> -//! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h")
> +//! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h)
>  
>  use crate::{bindings, device::Device, error::Error, error::Result, str::CStr};
>  use core::ptr::NonNull;
> -- 
> 2.45.2
> 

