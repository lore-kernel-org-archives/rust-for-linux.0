Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F6643991C
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 19:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145435; cv=none; b=kENQ07HeDVQPwe6LtnzqmAkKCHtFX7i6cPftevjWNPOKfnX56zlhvYZ3jTU1I5w4tNHK/mQUODG96AET8DTa/cAkmi3vuajptgOSAkjTudLIS8Xd5BMhH5EMxv403u5EIrhMdiANMrL+pZrCKABWhlUn1IwFWXOErFxWCLjjK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145435; c=relaxed/simple;
	bh=dWqB7+bvcc/NBuM3f79bt9xVLBZ3QNYcA1WJmcoPBwo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/6GAm2z7frn/mHD1mfx02ziw33xefIJVvceSZSIihbnWDXwO5h/DeR7rKApxmQWKGzq6obmwQu+sUdAtXtPDyEOGAiBte+rApzEPb8UjzQ5gJUaV8ZpdVVSrTaE6IeEiFmRQ+XfJxLDEc8bKs2dr9uv4C//ExIYanCcX5e3sCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPlABJkp; arc=none smtp.client-ip=74.125.224.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPlABJkp"
Received: by mail-yx2-f3.google.com with SMTP id 00721157ae682-81daac601a1so18655497b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784145429; x=1784750229; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1wq8otHP0LCRNgmPzcboIygw2YeAuXCKv3ifkhHU0zI=;
        b=KPlABJkp/HaRVWwjuV68joY9ose2xTzSXck5MdpD6uoXZfzic4dsjTiTkywpvebJe0
         Y6VdRAvGgtIY7wNfLiNDKvpKH2ev4NhEU7m3TS7wAUIm8cEJXhJnUx+01PgGlkM43SvT
         FE9Vjh7GPkuuGKQjCyqP/nZdevuTmqEVD49EI3nnKdFxpELgcS3eYE6dpTudZIQpYoOW
         ExoxWaXFXDK5OTHCI8CNd3uNweC3eGcjKaEL4HjAyzAngqJfQORDGrRSIxC/vg4gTMM0
         qO/g+M55LFb3+nbkB+jgFh5IXA10/nom/8ZX/gRMLCOmIM0xt7prkq/HYOOTNK+YD7+I
         I/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784145429; x=1784750229;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1wq8otHP0LCRNgmPzcboIygw2YeAuXCKv3ifkhHU0zI=;
        b=mAjOliQuFsqpXawbm1fyinroOH/7NXBF+wlU2hDpu4jiC2Dm0QL83DDOVuZQx20CCe
         4nvClWWyx80GnV6cROZNG/svQdOAhpKOkKEBt/wlI5WPUe+PHiCsBdtqJXaZ6hP+tcxc
         gHxHF3pAMot5Wrnmp+7nOFWCVaamrSnKFytzmtOrwFtH37uaD2NxNLuh9w7Ht87coFLZ
         DAG8/5erkg3WCmgAu1kTTUnj2gkOGLCKJf/iCql2p6RMmHSGTuydTU17dIlxXuckjDdE
         zoqUSeSoSL0jrKeaHLYe4zuZzdxWSZvYHMUifPkv9IkRmM45kSwMRKa57xPPybjm5OzF
         YW/A==
X-Forwarded-Encrypted: i=1; AHgh+RrOh4E6j4m+px6NBjl2+PJboseN0IGZvgcMdKOIej3Q2Psaq6zMU33gDP+JL/Geex6L3tcZGUqb/QhT8y1z9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMAO/y1+DhhpWhUETzzrkc78hzyjPdhAgmT+9ND6yHxjozqWS
	ZrULVQ88Y+2slrgOAAvst48gKgZHv+eBtGkDO1VLjUtgRTRb4/oGotg0
X-Gm-Gg: AfdE7clciZ/5erbHNRzthNm7u5UgpyTYApDBJ2564NdQVmCTYSqZfOAkxtf/218UT8K
	/CK2GHAEnC72Bftt3zkpM1fL3E2+H9S35ZEDkHTrDmXeoZfsC1N/n68XMSkTYYwBPWXi8D6NGhK
	yLsiuCUYBEPAXZ2yL3OXq7PJC2Vc/h7AKmUU3P1BtM8hMSfR7FWEz8I/DcqdUwe+xiEmRBYklCO
	bXz17xlWrCNZLueqWAOKLlwwhftCtIqtFMh1/oVk1itOTtal8Pelr9sFXjaMtnMN2vKSD/RCOjT
	yiRE1opXpS6Uev8FGf2zQ22FOfIIR5FXBVp99TjB3KcPKw9uTUIW/cghAkTSjWPRlda7hRBxys1
	rVAIyWAhIt8oasMObkPC87tQKyMDR2iUXbGKvRQfO1DXpjKDa1iAiRK8xHIOxbh6aB86q6k6Bo4
	sNyDKhJb3+kGrThXQ9SIotoNPX4zp6ZTgSIZiAkIXRVhpaEif2oOKXzAgWFU9ypybqwG4=
X-Received: by 2002:a05:690c:e1e:b0:81e:735b:c880 with SMTP id 00721157ae682-81ecf82e130mr31797547b3.26.1784145429210;
        Wed, 15 Jul 2026 12:57:09 -0700 (PDT)
Received: from pendragon (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e7795988dsm162879817b3.26.2026.07.15.12.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:57:08 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <electrolitic21@gmail.com>
Date: Wed, 15 Jul 2026 14:57:06 -0500
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [RFC PATCH 0/4] rust: usb: add usb request block abstractions
 and a user
Message-ID: <alfgqLpK9PAluzHF@pendragon>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <1E924102-5CC7-427A-9FD0-3B15BA1BEAEB@collabora.com>
 <alVGanOux7SJ5dpM@pendragon>
 <0CCB6F69-1336-4254-AE1A-5DDC63BCA7B1@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0CCB6F69-1336-4254-AE1A-5DDC63BCA7B1@collabora.com>

On Tue, Jul 14, 2026 at 11:35:50PM -0300, Daniel Almeida wrote:
> I’m cc’ing my colleague Nicolas. He was at the media summit this year
> discussing a topic somewhat related to Rust.
> 
> IIUC, the consensus is unfavorable for Rust media drivers at the moment. They
> are waiting for more progress on gcc-rs before allowing it, as clang does not
> fit some of their infrastructure.

This is good to know, thanks for mentioning this. I will table my work
on the media driver for now, though I might continue working on some of
it privately until gcc-rs has progressed enough.

> This doesn't have to discourage you from this work, though. Last I spoke to
> Greg, I think he was OK with having enough infrastructure to build a Rust
> version of usb-skeleton.c. You could perhaps work on that? I never really found
> the time to, but I can chime in with reviews. It's always nice to onboard new people :)

I would definitely be interested in picking up this work.

Unless my first 3 patches seem to be heading in the wrong direction,
I will integrate the initial and any coming feedback here, as well as
some of the concerns the Sashiko AI bot emailed me. I'll include an
attempt at the rust version of usb-skeleton as well.

I imagine it makes sense to strip out functions usb-skeleton doesn't use,
so I will remove those in my next revision.

Thanks,
Colin
