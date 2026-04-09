Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2048925A354
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 01:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775697655; cv=none; b=nKPCib4LAPfxx6tNOnsVRDxWqkA8vw3Vil/vw9aSefdaEd/wa1XlTQrORlB9X3s5IbbR90fjtDtxVJY37juLUlEqahXKyp53z0CVvzGYolWFzW7fA229l52Lumvwchtyws3KtmuEKOMPxJc/TBibA36SaDTEm76tMOJQQuoCxlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775697655; c=relaxed/simple;
	bh=5XxA5fTwBC6NayOV3TCplxsKPZ+1ZMgEgvtwEae0KhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5Jlp+Vl7pjSGcm3mjbN0KvFQujptq9Z1s/rORllfzzd2LdG1p7rqXVL1f82k/IGoH8vK/wqL4oOV1vfCec+/APXCu+tdEIXRe+RrZbKl1O96GKz59TeCyjt0EhaMz8DJm7YOFvj7kd8HVj6Iv6Bp32UKGfkLSXRaDIlEHPKqlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=U5nMtlSd; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="U5nMtlSd"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so1803095ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 18:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1775697653; x=1776302453; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IwEecnT2k/SYnlacLAvjP0TbOckn4OHxgNLcKdVMuVc=;
        b=U5nMtlSdKFy0CL6t1xuoVvaRsIsrZ4OSYHlsLiPBuj0ux4J5mMD5d9S6c271bON9iT
         I/ERDWnqiu8oWVNF/p0WjvAx1WD8YuEYkB2engRWNm73O2O2Tj+46nkwpnExszsprI1X
         S48wWWRCvrsZtvhU2IFBC/Yyd7IUhr4/fkqpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775697653; x=1776302453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwEecnT2k/SYnlacLAvjP0TbOckn4OHxgNLcKdVMuVc=;
        b=Jj29OS078elftxWZEttpd1yUMP7PO2+L0nZUNOtGLzwKlTXq4CyVf4XQeS0Y1hDQWQ
         rbCK5yhtL8KsEu2J+7DiXSMY/S7tnLKWV0Kd5+J8ToXR/LT6bv9CelsQHORDwUTKbXlf
         c81e2sxildkgGveeF10QRwixqCwS6BcbXSvaP3U9OT3PNvsZoiOuNuLKM1UB5djH1bws
         1RZo6neTItex5a7vPylytzmGcXc9j26i0pSCZRReBD6PNeqRTP686k9hVAk5vbHTc0Y7
         T1iHmRFg3uE4Azf4YR2AXXjgw6q9oeuukMpZj99gy2EuW2YZmYAm48/3XiMlz/cPBgAD
         cgzw==
X-Forwarded-Encrypted: i=1; AJvYcCVsAMySF6EwSNpEx9WwvRErYTctDkEk3N+GVr8IWidWgHmB+GTglCSdTn8JEaF+qW08OxNzsHqNuJfYrL6mrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysMF/tUSZoSsgQHocqwoh6xYVzzyESlhknhoRvoSW5mrFIpPpX
	c2olv9RTAR0qb5Uvtlf25214o0Sz3LQ6qF6bYLzdKZXMB1kwyS0H72PR6CKYggWpweg=
X-Gm-Gg: AeBDiesnHJDaVGDiv95zQOjKSC3AVcD1Wwyy3cQheV//Lp2rt4ZqOXw0u9sp66rmWC5
	TWqPn6c6BNvEhgL2s2BSpriTGtFae4rnev75kJm0zgCkuYpVqiZSIi7Eby+NoVl9OcGeXrnSKbS
	9XykN5nIAPboKuTVdvKucySFp9PmCPa1aF13ZCJwLC+MGB7KEgZ3vbcMRTn1YwzYoYv+fUDcUiI
	g4XZqmoBgcSNgy+xBqWL6GzXI/9XP/wFfcU3h+uS9Tdwpvod58IP6+Usf8scLZSUFBouqNSA/GT
	fUgpBGQY7HwKornoUpzZpD/plSvHk62PU8dzLKtDM07jyU4q6vn+DDNDtvrlOFc/RRW+qLdJNzB
	ujaFin2EbcjIbbDusIEtzuhneK6Bnzzx75fS4ErKQ0k5g2Kpoa0WDiQ5M7BG0nbw+LLk1/eXoJy
	dBqMBb7hWmGN7d+T2zlSFXWYv4HVIE
X-Received: by 2002:a17:902:f70e:b0:2b0:c2d9:2714 with SMTP id d9443c01a7336-2b2c722e6eamr17379185ad.4.1775697653432;
        Wed, 08 Apr 2026 18:20:53 -0700 (PDT)
Received: from sidong ([221.148.76.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274756621sm212879775ad.20.2026.04.08.18.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:20:53 -0700 (PDT)
Date: Thu, 9 Apr 2026 01:20:37 +0000
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: Re: [PATCH v4 1/5] rust: bindings: add io_uring headers in
 bindings_helper.h
Message-ID: <adb-5cz-PS8VFcfq@sidong>
References: <20260408140007.8401-1-sidong.yang@furiosa.ai>
 <20260408140007.8401-2-sidong.yang@furiosa.ai>
 <CANiq72n2h5Vj4-_wfPWXf9HO9UouaKtVKmoTGQeE-g+N-MYUPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n2h5Vj4-_wfPWXf9HO9UouaKtVKmoTGQeE-g+N-MYUPA@mail.gmail.com>

On Wed, Apr 08, 2026 at 04:31:35PM +0200, Miguel Ojeda wrote:
> On Wed, Apr 8, 2026 at 4:00 PM Sidong Yang <sidong.yang@furiosa.ai> wrote:
> >
> > This patch adds two headers io_uring.h io_uring/cmd.h in bindings_helper
> > for implementing rust io_uring abstraction.
> >
> > Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> 
> If there is a reason for putting it at the bottom, then please note it
> in the commit message.

Hi Miguel,

There is no reason for putting it at the bottom, They should be placed
in the proper order. This will be fixed in next version.

Thanks,
Sidong

> 
> Thanks!
> 
> Cheers,
> Miguel
