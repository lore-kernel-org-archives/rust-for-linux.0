Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9930E85D
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458914; cv=none; b=pQjY9PPDwTPVvgRja+7VGna6z/s/hBcrT0rfD9MoWa4omtJp8tmDQI5hfeGXNhUgYDBYMQhb0ir/pbvZZ4v8Lhdm9laizaiDDIfYgA9iFxqirTjoT6rtf6B96xPD821oGnjN3u2z6U2EODUxhQKvJP5MlhuqiXMK4VtdOoama1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458914; c=relaxed/simple;
	bh=OF+Lroejiv5nI/a5KUmbw9PHHNa6qmut29sztZOGeeM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTyElzyIi5Frhk/IpFY+Ukk92Ryp1P7Tz02lL3vLlFB6nTw6//xwZi6OBR55TeofDa21FkQK/mwbt0/NKHI2ax3zF4LrngSQNsO0enlWaQNW9uS93rJLUiiYZ7GCWpPuQzXtSnsVXtFP2tLQ1esXpXw1gHsBpbMF5pEz5bAEr8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvVkzJTJ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvVkzJTJ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so8298363a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 03:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777458913; x=1778063713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF+Lroejiv5nI/a5KUmbw9PHHNa6qmut29sztZOGeeM=;
        b=KvVkzJTJzsZ5E/Tn6rRm6os6h9PRKW2hpkkucsRLSsxWkntHjNSjDX+ZKLjtS/Gs2D
         EbR3B2Uvh+hws2/3g+1ienQdvBpnDPcj9LPM5nQ/Qxy7TOYSxUhPdiYz4pnt/rrox7nh
         aHPGN/rifdnJoxBXl6g4e2DUlqpTf2TZu8AG2bPxsrE8CwoidhrNjSjjRRwmNvl/Psl7
         e0tIDA0LnPU0fz7BOfMv3rL0fXz2A8CrWk2xi97KOj8YBDNnVhhS1MhauXu0F/6tR5UM
         7RwKeU5PbKragQN3DqYTZg39YPqTyTGG2eqYa7fNH3rh1bwM4K3CRKpCKmYx/gqdWPVl
         HR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777458913; x=1778063713;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OF+Lroejiv5nI/a5KUmbw9PHHNa6qmut29sztZOGeeM=;
        b=eF6ERNbzyBDDhrLtiPpr9QknOBLcH1u4EFDLRqHPWdhwGLYKx4OwTWkw4oV1rY8OvY
         J8xsomRJZM0p8o37bAFhio4TdjIYxJvu1FdEviqMAZWoQhLwv1J6fLK76BvqBIeMfDXn
         Q0z6vL/d1aJ5DgWDOlgzdvyoT/5sQGnPpKXM6LLGB8FmA2TX3mjIHp0czgq532l19VFI
         A55nFy4LqjurVskYwBABz2yfyYr556AHxHybvGJXLvvIBALj4J5l4GHmBMpR14cvVZHY
         efqW1H5JK1guZVn+p8wcGQAx2K+8bk4D4biEr4F6187CsjDYhiMtfvzclgwNYuOPrsDQ
         rtrw==
X-Forwarded-Encrypted: i=1; AFNElJ+7IO5RL2MbmCpNZ/fA65ykoCw1tavhetKu+EWMTj/RHgqVsyDuCvyXqTx2m5QYZ3WbfZH26k85qbcsDLNOMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhF4xfPW2Tl+uRWhwhId1YKqzTozIM4KNHp8GxCa5aPX2TfWDb
	czYDaOmL17S4Qe1kCtpHWQoK7vUSUEJSXAmHdgJdRcvLkClzcZ81hHRM
X-Gm-Gg: AeBDiesben05WFP3wYwdsqlOrgCt+dcHpkUOqjoEjHvyOIzpMEeRMh3MurSC6+sLc/u
	0d4fnpGC2kiamRNcEf7/m9kklcXc/pIPQDkCeT2Gmqb0cUTerHsurCqiAbEVmETP4NKQeOKJj7t
	RP8yV0V9k4ol7ArRiD80cvE0UCRY3A9V8nd8RSfs/nmBu4jQeKEpBgDxSme3WTtFN8hIqC5iNN2
	F6vuP54DcIyIgRef3JL+OlrLkyE/Nb/Kr+P2tbGya/oi7hSOgvWNWqaYkphd/aAypobyERBraLY
	7JS01FJpvrzWSWOxQ8dfjT+/1yxVDezP56uOxFgTf+GDIdmA1ZywWpuRM7pohDpPZ7+sRzeNu+b
	4GhTo3O96XjIjelAzbo9uBiVkEdTQ7O6CBPzQWW3mJbxfR28q3QmIHyT+bBLLjB6LonEL+dNJVb
	ccFG3c+XYp6jPbsDuaw0JB8K6ds7XpHIUiaiARlOaPUc397MBY1MZqMmiRtg==
X-Received: by 2002:a17:90b:4c92:b0:359:f2e1:5906 with SMTP id 98e67ed59e1d1-36491f6c206mr6861094a91.4.1777458912886;
        Wed, 29 Apr 2026 03:35:12 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a02c54b5sm3066416a91.10.2026.04.29.03.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:35:12 -0700 (PDT)
Message-ID: <69f1dee0.170a0220.115a12.6bcf@mx.google.com>
X-Google-Original-Message-ID: <afHe3HAh1mSqXD2t@yuwhisper-pc.>
Date: Wed, 29 Apr 2026 18:35:08 +0800
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: block: fix comment referring to states by wrong
 labels
Mail-Followup-To: Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <u8w2aT8RMDhNK-zCkHKofFcml9mE8ndgtCnpwTrMWy6Kby41yC9ODSFCSKRZF8QahViSy2ANwHyurTUyVlgroA==@protonmail.internalid>
 <20260428-fix-docs-mq-req-v1-1-260079853836@gmail.com>
 <87cxzioyt4.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <87cxzioyt4.fsf@t14s.mail-host-address-is-not-set>

On Wed, Apr 29, 2026 at 12:17:43PM +0200, Andreas Hindborg wrote:
>Thanks for the patch. Please be aware that this mistake is fixed in the
>latest rust null block series [1]. Please take a look at that series if
>you have more patches for the rust block subsystem queued.

Thank you for letting me know. I'll take a look at the series.

Best regards,
Hsiu
