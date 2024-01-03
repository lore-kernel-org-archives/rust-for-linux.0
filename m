Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DD41A706
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jan 2024 14:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="rRW4sZPj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3368ac0f74dso8779097f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jan 2024 06:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1704293827; x=1704898627; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=LKWLeV7Q3gA/vrqJpCC3mSJ1R84I9SSvQaOC1GaAkZg=;
        b=rRW4sZPj02XjkYMuQhYt+Pqj09RGPvpgZT6GBzjpNZMYRSM0SIeBzYDyDS4gJ3bqKl
         qCjXUhUp1ey3IXcOsYMVPxEvwPoliltwjhGDefu8yMnRcDbQ82GWFPdmhJjmkMHb4gNh
         E9TVphYoMzJKTikpf59EzGytybDpUyUb3y70JE7x6oXHGZ1dnxvmu664X4YR2ARW0fFJ
         uKfzYl8TQA50aU3Eik4Pc6QFPze7Tn4EN12hLsDwYStplWdSDi/XezHj+GknfesaJALB
         yKHdoNlZiwqaY/WAKw5EhNiYy8TtYaG6sNAv1m2vBLOsNOJETH7kJ9XTdCi34ZuBE6+c
         fJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293827; x=1704898627;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKWLeV7Q3gA/vrqJpCC3mSJ1R84I9SSvQaOC1GaAkZg=;
        b=JK1xFKLIjtEVOzUHnKkQ3k1+L2wjSTCSCVPYoxiWcJBqa6k8irFgOUPZPl725n+X2f
         GaRoknI8oHb3pycwQnEm2PlX+3xrbbKlYOjnROk+7Zf6xGzIWtD1fevq8PQ4Jo7dEOIK
         ZeAbFjDZ4SiU/PRgoeopxKsA5dsGwdh7PeXYXv779TG8wco2gkHYB7VOgGH2un0v/SQx
         Hs8eH/WWjtiSuJ5TLrNGxB8kIMk+xzCr7k7wCFZ3DhlDbPmC+6XB2/J012oIFNt5DdxL
         uWLpaCP73c4WEnhpQ7bTZDG4cbVHGrL4dlp2oSSItEedDB/vzr/xDNWeMZw2N1U9utsD
         ujtA==
X-Gm-Message-State: AOJu0Yy4uMUiOL1ZD6dj0ucBWvVZCR8OTYr5tfOwdb/ImTkIYqMjFagH
	wz9OsCze6kcOllBbHSlOtRXOxLVRjJzEEA==
X-Google-Smtp-Source: AGHT+IEa7XToIYeYWf0mL5aMaFplc/gYwwuh2NOGSE/Mr0AXxwWAmkDc3WX835ihfguSLawEtSRrXg==
X-Received: by 2002:adf:ea10:0:b0:333:2fd2:8166 with SMTP id q16-20020adfea10000000b003332fd28166mr12511785wrm.131.1704293827083;
        Wed, 03 Jan 2024 06:57:07 -0800 (PST)
Received: from localhost ([165.225.194.221])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d4dc7000000b00336ebf93416sm18854116wru.17.2024.01.03.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:57:06 -0800 (PST)
References: <20231018122518.128049-1-wedsonaf@gmail.com>
 <20231018122518.128049-5-wedsonaf@gmail.com>
User-agent: mu4e 1.10.8; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Matthew Wilcox <willy@infradead.org>, Kent
 Overstreet <kent.overstreet@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Wedson Almeida Filho
 <walmeida@microsoft.com>
Subject: Re: [RFC PATCH 04/19] rust: fs: introduce `FileSystem::super_params`
Date: Wed, 03 Jan 2024 13:25:29 +0100
In-reply-to: <20231018122518.128049-5-wedsonaf@gmail.com>
Message-ID: <871qay79r9.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Wedson Almeida Filho <wedsonaf@gmail.com> writes:

<snip>

> +    unsafe extern "C" fn fill_super_callback(
> +        sb_ptr: *mut bindings::super_block,
> +        _fc: *mut bindings::fs_context,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The callback contract guarantees that `sb_ptr` is a unique pointer to a
> +            // newly-created superblock.
> +            let sb = unsafe { &mut *sb_ptr.cast() };
> +            let params = T::super_params(sb)?;
> +
> +            sb.0.s_magic = params.magic as _;

I would prefer an explicit target type for the cast.

BR Andreas

