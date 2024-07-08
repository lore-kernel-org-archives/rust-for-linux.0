Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878415644E
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jul 2024 11:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720437882; cv=none; b=UNmap7cBA+4VCQQloXTOiMpSMEAFN1Xp3XaXE2W5em1VEjJbqtgNtflniRNqIE5rcoK4GbGEnyKbYNMwDQZi2DLItO/VkkkNf9VUkoh4u0u9aBUrmW/E6pRNRPR+XP7sOVCoxr5aoxKAyzZeX4waouSwwJsFklF9XCS70DhLd3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720437882; c=relaxed/simple;
	bh=xTYdYQU1dKWsApIW/T3x4V9sQRMMo94fk5/3o9tWCig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=W6KFM9qZZ7uiSATOvS/WiIikGxq8+up/gMVKfq7fIuSLGnIi64Aiv/uNqm1DuJut1XOJ/7e/7CSYJjsZg15R4RgQXy0dW3QfWJna69MTOU1+HtoVsPmzDLwHPhKsH1Ury+KdZgm6a3JkXxBxEQF6p/dPn7ia7QyVp0DZoOK21TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fWV2FIQ7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fWV2FIQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720437879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oD998hd8L73BF0lomUfy/e1mUZZ0TqEdQJsnDYHHly0=;
	b=fWV2FIQ7oSc+OuQzh9SXIPTnWIGFSTBMkb9IfoAUwB3wHdytQTOjLOyIEFhcGXXx5KOmN7
	TGUVG/zZr39t7aWLgpl4x4STeReRN4GiHuGcOgvlN2A4Wq9mItI5F8gDXb5MbsPwqwNkhY
	So8/3XWRJaYtI9vGV9GvEZ7+EPKrfVg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-iZmHgZVqMaquDTS5hkUe_g-1; Mon, 08 Jul 2024 07:24:37 -0400
X-MC-Unique: iZmHgZVqMaquDTS5hkUe_g-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52ea88005bfso2648229e87.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jul 2024 04:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720437876; x=1721042676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oD998hd8L73BF0lomUfy/e1mUZZ0TqEdQJsnDYHHly0=;
        b=PLFwy6VAVoYon1vbLzISFdMbKVEwUYHaXvWOVU2wdC90NdD5c76zj1dsBeKsxLxkBp
         FG8uFnGYzTWm8h40Ncn42DEaFICtfnP7cUeardha/KEUGmWia3DW5PczIymYFNBx9G5D
         481ovnAbWtST3P7+6jQpsEaxzzue8iykdVoxz6CEaMHigUXWzXtB0d1jkyGwy5QOUI7+
         zuivdRCURNigsAuIPBBvpHcoyozq4uJNdPCnWd61Nlc445Zlx9vam/PxI+UvrdoDsIJr
         dALUTHoE7MPKJwymSx9wgjRbL85y2v2hd2up346H+/clMfadS3hszyHH8yWbO+fGR02V
         iLPg==
X-Forwarded-Encrypted: i=1; AJvYcCWuRNaXB5h0Y34aDz2Hws84GwHf/gStFwJYZtbNbuHJb8K1q0hiutwoRHSNrO7M71QaYR0pDX4AJPE8RoCN6+OjFsy2LU5vxnoMNKK/CmU=
X-Gm-Message-State: AOJu0YwZUMN0dYUj0oWWkGLZFkUOlwuH4/EKN4G6qezrkd1LIQyCcAHA
	wd3WkJdiJE5/GoZgPZkDKhd2zdBnEnVBsYQMspLFD0DlPhPlXh6fdsheXSoLk6UzvkB40FoMFdr
	9TSDVGOGfiD88+UOLXB5Azgyqj5LN/KxjeUguifNNz11uCKp/fujIMuYnrNroc16H
X-Received: by 2002:a19:4355:0:b0:52e:9b87:233c with SMTP id 2adb3069b0e04-52ea063ee82mr7486543e87.36.1720437876445;
        Mon, 08 Jul 2024 04:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFdnakvR9pu+5kvWDlp6fmVf2e9irGiK+WfFFlZ3YcSrSy8lWz1fBvfOFHg0op7WTodR+pyQ==
X-Received: by 2002:a19:4355:0:b0:52e:9b87:233c with SMTP id 2adb3069b0e04-52ea063ee82mr7486521e87.36.1720437876002;
        Mon, 08 Jul 2024 04:24:36 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a188edasm160811275e9.0.2024.07.08.04.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 04:24:35 -0700 (PDT)
Date: Mon, 8 Jul 2024 13:24:32 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: firmware: fix invalid rustdoc link
Message-ID: <ZovMcChz-sfSxNRc@pollux>
References: <20240708090615.2267476-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240708090615.2267476-1-andrewjballance@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

+ Greg

On Mon, Jul 08, 2024 at 04:06:15AM -0500, Andrew Ballance wrote:
> rustdoc generates a link to a nonexistent file because of a extra quote

Please use the imperative like you did in the summary and write a full sentence,
e.g. "Remove an extra quote in the doc comment in order to prevent rustdoc from
generating a link to a non-existent file."

> 
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

With that,

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
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

