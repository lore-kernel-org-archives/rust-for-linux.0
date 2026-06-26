Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143B125B095
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 23:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782515562; cv=none; b=AuIOc/9nHZ4cN89P+2rH88xsruPCy79QGgVvSS/P5y8tflujRSMFJbTLUUSkp+gBNF/IYGoeH8rOW+bPokRgO8alCWQ7NYhgpyYzr9uJxwZpy119zM/FdGnAXdcrTQ0vIBgs/9qKz4KLGCLIVXMcsJt7V3Rfj+wRAfGTc4oi2Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782515562; c=relaxed/simple;
	bh=97vSIlbDwWaa0UfyuV5pHBVrlMO1u7JI94+1zk28WGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRTrC4yFS80NxUqX73/L7Z9rb1zXQx1Fs1GuH15pY+RfaRzkpAkqklkQkSpguFODeMsXbdGYkFiv90YbAPT27vxr1cEPBk2MfM1tgBfBT3qiPEZErdzh4GubhmCslVOT4Bttp4MZCoCQ4i549ZQqCB8m7DiszjIiIQlblz1amtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=icvXOwp7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="icvXOwp7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c813a45a65so7395ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 16:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782515560; x=1783120360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oX8nCqOGJq2zy+er1vdOxPtxogsVLVugJ1Z/7AQnxCc=;
        b=icvXOwp78y9vVodIl/R1ngn9zLCJ5fW0c5XWkQtqhOFfHcPWGHgL46ET0c7nCsI5w2
         TgFkK3SLAYRgI1lSgcamPckOCJ5PPnIkXppsKq/wtp3+eJCmgai8jO2GvHeRObsN4aTF
         TjpxwhxAW/ApvpNFr4ClfanA9K4h/wgClhng9cOLudfkyJaYZlx6X3oyEDWpawgQIcOX
         tARV81EeQi76CKPXzo6LQknv4501KeqHLkbpdmhh7a8pKaXjJbE4Q9DBqIJ0IStO5iNE
         LME8yGdgG5uQY5nwe3Tyxisxip2M6ld6utsPtl4+r+5yLkp0zUVqWv1fYZodICM7z4jI
         0Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782515560; x=1783120360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oX8nCqOGJq2zy+er1vdOxPtxogsVLVugJ1Z/7AQnxCc=;
        b=OFRDhPv1/50fGWtruBUV6PgTjmTLxPDYE11YUevzdr4deNz7ocEh9yVA0+myB7SM4r
         LWkXvb21Si6n9+Sv0QoH2bJynoQokBAFfPbBYcRvYKoW+Wqsx0xvq1m0M0v3GxyaoTMs
         kUCz/GifqnpkRTUVdUMMnjFDfAyiGvmBQU0bc6b9vr3m2RZDp7glzlx3RUbXgzztLp9G
         7+RsDqp9nt1TpnCp80q/a7WcNopPAAZWtxLy+Qke+k/xACtG4Ib5U/FeUXGVbstniNK5
         KfPb3h1jMZhDlVBxvwiMvjuyWEm57b5noJ4OgLDM/CL1yuA3hZVyN3ebXeHuQA8yfCdi
         bFqw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4/ASuYENZ8BpQP9dGA4szBdtX27duorUgqJ0MXqwa/XeiciSSWDX+LG73tktQh1baCpQ07RaGM2YKSB9NBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaGUFU2CpYTLDUAAo7Wb/Fwz6aKYtYGMI7jfvCsQhRU+qH1O7w
	LcAcX8abJDpsvgtb3BCiKxgu9dMAm+RONavwCfn5R79IFzXTgoaM5krhzGw0Bh9dGQ==
X-Gm-Gg: AfdE7ckm1+2a9Tufej5h0wDwvKFmmbKScZ6hDV6F865+Nw+HA8SYjkbUiePvpuR9Viz
	+60BhuA9C6RwrM3KWQKDrp5JGPfyZQ9NlFsV0nWWlEHkezT1nYiopSmngjrdkPPBEZlO0a5GKpY
	KW4gf6JtMPe2y/ohutOOSQmk7/k9Cns3ALnG5meeLkDjnX54H4BWEUosgKKynm7joUVD4Jy4H1u
	mKaPSFeTLhc/J/Oz7YVadBW2Bl86ZCw+q+uGQ0cymaBbnErkkYipiekVsKO8+ttAsiOx5GyqsZO
	JUiPDnyXOkwFFGJdgSNCFr7gIncMr9NwwzBVSt97T2F7tLGVI0Sn4SME50EDHxtZqVYip9hH2kN
	U8+RGDiJXIPpJ1cQe/4e3GZrnAiYDz4LR/eTC1e9VLkfgObHxMvTl2hlWhoWPF0wGCk5SeImimz
	nae635puaWP6xa4habfrglyWqyFu3ybZWHBLja858BwJDc3OahTLpn4+z+Ohm2fD1sDZrY32xSk
	W1H7eix2/G2mMiDNoIghhTv78yCKEHVlqSB8/19cjZ1/Q==
X-Received: by 2002:a17:902:ea08:b0:2c9:9a72:fb44 with SMTP id d9443c01a7336-2c9ae3122ebmr402875ad.3.1782515559808;
        Fri, 26 Jun 2026 16:12:39 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm47132035ad.1.2026.06.26.16.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 16:12:38 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:12:34 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
Message-ID: <aj8HYnDaxh8es4E-@google.com>
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>

On Tue, Jun 23, 2026 at 03:38:06PM +0000, Alice Ryhl wrote:
> Printing can be very expensive if it occurs often, so printing that can
> be triggered by userspace should be rate limited. For this purpose, add
> a Rust wrapper around `struct ratelimit_state` and use it in the new
> macros.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

FWIW, this looks good to me too

Reviewed-by: Carlos Llamas <cmllamas@google.com>
