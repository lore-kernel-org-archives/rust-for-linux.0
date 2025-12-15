Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8E33D6DC
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765818536; cv=none; b=ZmTW52/EZKMK05Vaw7FXYrIeVU3NUPLKkeyfzqflzls5NVphpX7l7cSAJ21Ok87/Wn3Iq7se9YDJrUq8QI9ZSDQoJblGTl3nzbInYbvGOIXQkm+TfMX434AVIe2rxUj4KUk4IDMtNos6yPyT7OUALf1EG6G+HFql8GPX755cKF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765818536; c=relaxed/simple;
	bh=EBW19RgSmk6I2wYjbe2O4mtYdbvk000KQRBx3uKlHKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6BiwjjM2EF+I+B1uju+M3y043Hrr2SyfftS8BEWe/1pwH8D0l8Kxninox7Eqhj6YDh8GhlZoPMA3JFwXod3KbJyjMjaden6cbxux6TjXjGjZjgoUopAyFscj2Zv2PT0oxfsHIdPqxCwp/o2yyyCKNsflfe/3e0bN04DoUg9Neg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcXPAIFY; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcXPAIFY"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78c4aa7af99so40076227b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 09:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765818534; x=1766423334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iV4zP71qieSLDsOwkyFucKVZ2qijXXNVpDxC20C7sVE=;
        b=BcXPAIFYdWKcdYaJ89ZRhRSbwLXWNqXJZ2aQXL8nN7DaQav9hV4PWIjv+oOdtDH3Mj
         3/AMI2p8nvD4INMhKZcvdTkYB6zmEbpVPqEV5ZHUPMULyyZvCHjd0GWfLeUvqHQ4knx+
         /B12lZQM4Mf9l5Se6A4M0U/ZXKeA5pC3MIFvs05t2FJJcpIQqlVPgBKSFovRN2QE1XgJ
         nL34OSM1Yqc0BIXzJ5kcct5PMoEfY8FN53lpB1AcvdDCuehlJVH4Z61dY25Ye7qyxCcZ
         3sq2JZsM6dTi25R5bJF8gS+qNaI6pY3aJG+6A2l3Z5WanU1q/ZHCRhAcd2Bqj7TCDd/X
         YOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765818534; x=1766423334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV4zP71qieSLDsOwkyFucKVZ2qijXXNVpDxC20C7sVE=;
        b=cnvypTCQZDrOYHfBqM3OpQW7R8QFMCdmqyNDCQF8xsKPRDTw0JHVva9qDA3fPRquuU
         3B8ukjztVQVluL/mwW4VXTdMDIdyRGusLULq/Lil9I6ryhAy9g6Xo7vHwv59sMKsiibz
         Gi9Ex0m1213v+eeVORNGQqdWCQ7Xg8n4RK2cDLVfDKleAeNeplPBGw6aS4P2SnfIy0pb
         rS2lkeFtmKXMxwzwbkGI27JW7X6d2wHJmobu0A3Pux5vz5wj/wHeSRbB6cLvKVigBINB
         tEA6XpaCcIFIrHscwDL22+Wt8f2w4LH+OVWoYH8y7cDyxeZc1HHDv6Cu+vfPqKldbxP+
         Z2Tw==
X-Gm-Message-State: AOJu0YwzIesMj69TDYFJdWJ/XZjRJQoUAnWSTo1rKMscE909Gq9Ph4XH
	CIrYiPzfgM5XlPGGmkkGrwHweiXyjQUzcudz+ARSqs4d9IhA+qMChTWX
X-Gm-Gg: AY/fxX7y9TyqOXaj6m9tPWE57OS2q0xNW/zBjtx/foFcJHHG3IGtwwBGA3+ZR2YSIck
	+Uf1MieU2HhEc8VH8XnuI0RwQqZop5q2PZCk8A70kLMly7xPHcQf9tT24bxWPmMuGyKqAQkfVMa
	OtOeyTm7hqqRdZXKZToWlOszOB53AXb+nHwOAr3HHTU2ZtJyCOYTQq4iR0uk9k8t+0HfrZHbCyy
	7EoKJF0njBs7BJMwxGRHhHVI1pVNaPIkvosb6zbdomp/nWYM9TAVtBuB8KJghx1Vzsu9HDJBhyh
	UeU3tMeZZyWBGqpftiSAxn/nBHgqlbgEPddQqhN1j1lZKNT7I4wyM1i3eTEglsiPz9CIqUspRI3
	Zlus/88MuLAHiby2G7Llw5Sm4WxbCNMeKoZ+nGCKZq0b+3g2f5qs061/3rxijIjxHL12SEVYVfP
	jjfjFEeg==
X-Google-Smtp-Source: AGHT+IG3ReIb0KxLAMyPOW4swUy3IW8bWSazq1oXowCGYMy2Kc6DrNvrSTzJ8F6nZCQIQC0USMaOpg==
X-Received: by 2002:a05:690e:dc8:b0:641:f5bc:68d1 with SMTP id 956f58d0204a3-645556680d0mr8355414d50.78.1765818534200;
        Mon, 15 Dec 2025 09:08:54 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:6b0:1f10:bc87:9bd7])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78e74a43c4fsm29614107b3.50.2025.12.15.09.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 09:08:53 -0800 (PST)
Date: Mon, 15 Dec 2025 12:08:53 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/46] rust: bitmap: add __rust_helper to helpers
Message-ID: <aUBApSU3gDPLBGSP@yury>
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
 <20251202-define-rust-helper-v1-4-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-define-rust-helper-v1-4-a2e13cbc17a6@google.com>

On Tue, Dec 02, 2025 at 07:37:28PM +0000, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: Yury Norov <yury.norov@gmail.com>
> ---
>  rust/helpers/bitmap.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/helpers/bitmap.c b/rust/helpers/bitmap.c
> index a50e2f082e47ad1bacbf453fd79d1fdfe2cc11f5..57e9e64ab0c385cbaec8ba3f169bc304e07cf419 100644
> --- a/rust/helpers/bitmap.c
> +++ b/rust/helpers/bitmap.c
> @@ -2,8 +2,10 @@
>  
>  #include <linux/bitmap.h>
>  
> -void rust_helper_bitmap_copy_and_extend(unsigned long *to, const unsigned long *from,
> -		unsigned int count, unsigned int size)
> +__rust_helper void rust_helper_bitmap_copy_and_extend(unsigned long *to,
> +						      const unsigned long *from,
> +						      unsigned int count,
> +						      unsigned int size)
>  {
>  	bitmap_copy_and_extend(to, from, count, size);
>  }

Hi Alice,

Thanks for the series.

I've added patches 4, 5 and 12 in bitmap-for-next for testing.

Can you consider adding this prefix on a separate line, like this:

__rust_helper
void rust_helper_bitmap_copy_and_extend(unsigned long *to, const unsigned long *from,
             unsigned int count, unsigned int size)

This way you'd preserve more history, and make the patch intention
cleaner.

As said, I've added the patches in my branch, but if you're willing to
resend - I'll update those 3 patches in bitmap-for-next.

Thanks,
Yury
