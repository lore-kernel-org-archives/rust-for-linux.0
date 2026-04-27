Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F19036B061
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297491; cv=none; b=Vgu4Jho+gv/9gCZ+5MoAGJmYzPWT0pshvDCHg7nhXX80W4lXldq1I4YsQ9R1AVNRGE4zZosjdqZMUFM4DuAqH/NmwEtauntD2x6BsIETUXjr2PbLLCnEy614u2NL3l3BjmwJjhzLGqOBcrARljYmaCZApPODN5QYVUDdc3YC/2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297491; c=relaxed/simple;
	bh=w+dTdSpE+Y+1gg62RpUFxLsRiy9A/gMW1420jUsWT1E=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pD0cIywzUma8SPWJcfDkKp9G6xE6wpNVdzHxr2EMLexSy6SK7uvtvKTZz0730JVvQzrNafQLiSOGctvX7ZvDQU3StazP4YKSXKfEa/ogfBsEJJ7izumYjjCEzmDNxWInXxQk0J5rl2XZVgWxKBw5N4VvLExYQucjcxYizCqGFw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MR+Oznlv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MR+Oznlv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-83177129e28so1757284b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777297487; x=1777902287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPKcNdGlF1/MHK+kyTy5aQ4mT8GX6zZr6hlWhe1cldA=;
        b=MR+OznlvTe6W9kHSTg+68fQAJbqe48Atw9+kyNcwm5BNUNqVPFtjnEyw06Kdba8MeQ
         PIkEUt9mAMYVvCLJ6eC6EjIaU/laqMDX93TOEf0cS6nBU8h7y+ZZPcWBN3z0hXojJmhh
         Lm7Xab2I1YJE6mQgKJojp5p7pvu6fbT2dKMEBRR2pYikvYV93APN54gkaimYaOeHX7rm
         pxXR3zs4jCuYRPgu+OFsQs1rs5KGMPQk1bOi86ctR3WcD+BCYfsZOz9Mvg10H33DIt/s
         FU3uxSMa4J6v/XVcraE7FlzBAL1fwpjSBXLLOe+jFTnqb8F/ymjvHZHa5Woa+5Jt5y3Y
         5jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777297487; x=1777902287;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPKcNdGlF1/MHK+kyTy5aQ4mT8GX6zZr6hlWhe1cldA=;
        b=TbkwFQ20XDUHN/cZK4uVfP9anVCzSGH+Y4ZE1ojhm+Aroyfik0pp9SwtRYPQBobky+
         Ag8Epu6UN4XMbPEU+3msx6BZv0670Yh5DSII9dOTdx4rBJT+DPSC/HGkgrZcWa/GRorl
         F5qaYPvNXzywPJaAfkwuTLu4Do4VyEK8GsmiCOVb/K5RhFqauMUTCyqjS8IbQiZn0wsc
         pjbQ0rEBHeRfz38je2wVWzkRzZKMRWeogzzkCq0L1HBQHNg2y64qSCZ1NjPmYyr2mLSb
         33RhUgBQo0qH02oRaq5sNyeG9ai21Dm+/nRNgv90JETUbR6dYYb674870E6PwUD4DkQf
         1nOA==
X-Gm-Message-State: AOJu0Yx7LEVYsJH1By530DwD+/n+gOHVPdPZcWAgt5qFxRCPbPWSVYFu
	PcFVHhwUzIN1LEBc++SOFjo6rU5/UGU62eKTj8Jfktn6R+AXqlqJUGB/
X-Gm-Gg: AeBDievvc2VkHHaz83q8wT20z/odqacrP8mh628e+4MzIBOlXgLm7a2bSZ7V7Ua4Oou
	IIPf71s/zymYjiepfKoouh57pP4SgZvPivaK0ofBQNf1maaWMgXfWi61t3SYf3m0IBu+SRqPLsf
	fcTiObrgmHozl24GTJvF0HNmLoy4gjovPhWVhPylQ1J92til8FG60yhdh5okQeHngizDpwlyyUk
	CqzJg84KJQtpsXIdkceNrfEa8/rCkaD1SIsI+ccDyps1oWgBwEzV18+ktFQEyB6Kp9YzcW2Vt2B
	CTtE+l7K82uF/eJvNl9tExuol2FaXmgHLT0V9wspSS4KXYRO90kG4tFtgR/uN1V4zSWocsOLcnw
	ohXewvEEvPL4yGS3gvEuZBzN8VwLiZKj+DBlSwYd55l8zKEP08hk1Uv6lJQY85kbRRWdORBD5ES
	M1ctmH+dXchUcBAU47wAgtFDa4UNVtmjflfzNqMerIp6Zojng=
X-Received: by 2002:a05:6a00:1307:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-82f8c83bf5dmr42243914b3a.21.1777297486509;
        Mon, 27 Apr 2026 06:44:46 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm33675914b3a.3.2026.04.27.06.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:44:45 -0700 (PDT)
Message-ID: <69ef684d.a70a0220.2a0a5f.8511@mx.google.com>
X-Google-Original-Message-ID: <ae9oSVX8q4mg4wU9@yuwhisper-pc.>
Date: Mon, 27 Apr 2026 21:44:41 +0800
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	open list <linux-kernel@vger.kernel.org>,
	Hsiu Che Yu <yu.whisper.personal@gmail.com>
Subject: Re: [PATCH v2 2/2] rust: alloc: fix `Vec::extend_with` SAFETY comment
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	open list <linux-kernel@vger.kernel.org>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
 <cover.1777111268.git.yu.whisper.personal@gmail.com>
 <18fc8eee2f057a6bfbcadae156d1d0b7c40d0077.1777111268.git.yu.whisper.personal@gmail.com>
 <CANiq72nkXWhjK9iFRrhGtkMZGsvNE_zVsu4JnxaFRfxWL7RRdg@mail.gmail.com>
 <69eedee0.170a0220.230e6f.9507@mx.google.com>
 <CANiq72mKS=uvd_F0n5LHBgBgpTvnP+RKX3gaSxmQnjwenktOTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CANiq72mKS=uvd_F0n5LHBgBgpTvnP+RKX3gaSxmQnjwenktOTw@mail.gmail.com>

On Mon, Apr 27, 2026 at 03:22:18PM +0200, Miguel Ojeda wrote:
>If you only need to resend just for that, then what is usually done
>instead is to reply with the tags here -- then they can be picked up
>by maintainers or in the next version by the author, e.g.
>
>  Fixes: ...
>
>(ideally without the indentation so that tools may pick it up automatically)
>
>By the way, an easy rule of thumb is using, for fixes, Reported-by: +
>Closes: + Fixes:, while Suggested-by: + Link: for features (but there
>are of course exceptions, e.g. someone may have suggested something
>important in a fix etc., i.e. it depends -- please see
>Documentation/process/submitting-patches.rst for the actual meaning).

Thanks, that's very helpful!

Fixes: 2aac4cd7dae3d ("rust: alloc: implement kernel `Vec` type")

Thanks,
Hsiu
