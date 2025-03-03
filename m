Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4111EF0BD
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 09:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740994937; cv=none; b=jDhcPxYo/4ckgaI6Ff972FCBRTImsByYq2cu05qKKY+SIrcNOQ+JsWSJ/385GKP6cw29d5yzicvmr6Wu49XHulhXZC2eSMz7UpwN+R/qiFjfCvaYkbBYHs3MyMsKB277qOZoSGuSmmUaIPA5LzidSkp4pjgLAIW1noFmVXw+4TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740994937; c=relaxed/simple;
	bh=2KZN3ZbiL+bTV7no7mxRpvMRno5EVSR1v8XD6Lj/EcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdW8Y9NtzDf3+40/KEvHQKASv/WddVb5Rgo0V3JPjBANESeiLpyPWHG4RRyNaErxATPNlLl0aQHTouX9qcjhVFwUKu+rvRraWQQIZbP0X/Dcx49wlZmXg4Ch7vE8cCAyyW3FbZvmz+Qe8C0J5LtijVPMJ1gX3K5MIX4kRnwCoO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KLObrWoQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KLObrWoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740994935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBVVdo3tOVYaEl+zgFn8dQqxk+vyBv3FmhJQbHVALgc=;
	b=KLObrWoQ7HQU1QBPcSRnqqUhBXpssiHUGjsB9GfKtxgSOQTVK/0F0kVBjUWjbEsUwvwCsm
	cbdImjEOCrRsNGIySTDXS3j0rZEU69IoA/dobYlQNqTiiEvNIHpQnNdHY6/qFe3eN/ak/j
	/fVY5DsIhibqLP7atkMJGPWwNIDyK+M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-7ymIfo-pNxCAeyDhaYoohw-1; Mon, 03 Mar 2025 04:42:13 -0500
X-MC-Unique: 7ymIfo-pNxCAeyDhaYoohw-1
X-Mimecast-MFC-AGG-ID: 7ymIfo-pNxCAeyDhaYoohw_1740994932
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4399d2a1331so20365205e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 01:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994932; x=1741599732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBVVdo3tOVYaEl+zgFn8dQqxk+vyBv3FmhJQbHVALgc=;
        b=uu00bP6llqVyCeDfAEzcMxOlEOldChVGuBcfJkBDPp0JTaJBFv1jhcpTeKqNPYsQvv
         FD/EhoAaZmwamWqfs7sek4Tn9KRku5OfA3dG8EY6AptNeymt1XSwgjogOk3CxEHWKigP
         KNdFwUUEJJj92xjFvGakgpDPh4zXDj3E9UgB5dRvFWLkGQmns1Dwc7Gh4bkRB2L/fUfr
         pbg58wwxp1hIoXwgY/5EnnZNCbsQ3BeGzjf2ozoAxehJ9KxyX6HSqGPe/vUH1y7HrTLb
         c9GOy5sYDw736xgavzgi/ZzvN187It3I/kyf2Ir/s5qqDDQS1w0UKZVmjyTENTS4k5Ln
         JUlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7AbCIY5GFl6p7YQHlxtuZjzuNSvViI1cY4MyV+D/CSSzwjcIM8wRjrS41ry7EmXwTOwsUFpiVO8B72v+usg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4DlJOGfE44pf3EbLUJGmktrE68KAskqTCP20oI7x7YQ8vjMIN
	kx282S0bZfJL9i+bddcj6cBErquH8Vg/Ax95I0MlZgyt1TYApyl6ZwvoLe4PKjm2gv7PMLjCNtH
	q/RCAmh9+eeQ2CJhRIObaZC9gcYBtWLhNlAPu0DDwZ1xBUWPw81Lbs6r/j16KBsMB
X-Gm-Gg: ASbGncvzfNoZri5EAJ2FE8q2IUtdRJGHdMdgA3uoCgxSGsOtle+sO5z0lgGQA0DJoEE
	lWi79VsGLNneDB6tl047ngOjOlYcC1yzlqlNYe9GXip1Es23qo7G+QsTxZxA4bRTMI86A57yQnF
	HliL6D26NSYnwQy/+CnTtb8+Yh+Nqq6lIf4gWesPKkLn/UXUVIN3JYSgLhk3zil54SNmFPM07FL
	9IDxv8V3mVkrxURG7049rGIY/zEA70rvQ8ZLAQze7eNKbHQhpwrjGa6YRTqUDvZjkxJAJD3uxdI
	wbJylx5kToPU5TTEJEqV3B52oPb80WdMbOVaAnAcSw0G1bgJOhMH+Z8=
X-Received: by 2002:a05:600c:b4f:b0:43b:c638:3433 with SMTP id 5b1f17b1804b1-43bc63837a3mr9723095e9.12.1740994932368;
        Mon, 03 Mar 2025 01:42:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDYmizeCfEPwnub6ZUt8HoyBNoVBgCgnBfss7JKJMNfK/DcWCCY9SyISgPNOR5yKhrWm25LA==
X-Received: by 2002:a05:600c:b4f:b0:43b:c638:3433 with SMTP id 5b1f17b1804b1-43bc63837a3mr9722845e9.12.1740994931899;
        Mon, 03 Mar 2025 01:42:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a6a6csm14062502f8f.30.2025.03.03.01.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 01:42:11 -0800 (PST)
Message-ID: <739acf08-6978-41f3-a4db-724acc03ba06@redhat.com>
Date: Mon, 3 Mar 2025 10:42:10 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Thomas_B=C3=B6hler?=
 <witcher@wiredspace.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20250303093242.1011790-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250303093242.1011790-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ym2QjVXcBh9r0drzIPbNkzkCR9yyfdgHrpK0itmb6Ys_1740994932
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2025 10:32, Miguel Ojeda wrote:
> Clippy warns:
> 
>      error: manual implementation of an assign operation
>         --> drivers/gpu/drm/drm_panic_qr.rs:418:25
>          |
>      418 |                         self.carry = self.carry % pow;
>          |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: replace it with: `self.carry %= pow`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#assign_op_pattern
> 
> Thus clean it up.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: dbed4a797e00 ("drm/panic: Better binary encoding in QR code")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 62cb8a162483..3b0dd59781d4 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -415,7 +415,7 @@ fn next(&mut self) -> Option<Self::Item> {
>                           self.carry_len -= out_len;
>                           let pow = u64::pow(10, self.carry_len as u32);
>                           let out = (self.carry / pow) as u16;
> -                        self.carry = self.carry % pow;
> +                        self.carry %= pow;
>                           Some((out, NUM_CHARS_BITS[out_len]))
>                       }
>                   }
> 
> base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1

