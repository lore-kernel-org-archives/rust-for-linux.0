Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C075464E
	for <rust-for-linux@vger.kernel.org>; Tue, 27 May 2025 01:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748308347; cv=none; b=Oj1qU9NulDx03uidGVmzY5xx5x5mSru94xF68Np0bw0HXhn/oVSF+OGDhNEGXTtpkn9F4D9v36YuVVKbdvz2og2cYGpaKb5pVEXJ7pTdvCWM8zSBLkuC8oi0BsuQqtDRjRJCJWLpFDhdGtuTE1UsVO8u7LdhKiD4YgtKhuL3Quc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748308347; c=relaxed/simple;
	bh=laho0BQGs9LeuV4Nq+vEsB28bk43Ur6ZTT1Nlr5pGrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caLjyLN3ndFJfw7xmwV3R2U5Dl6LBnIvSysiyidWaoFIAgwz+JnYVbKRZXGkxQKUU1/P9wVMmy/J+ozjnok9Gl0wx8HMYafnycHHRrpH0DElbu9HNZNERkgLijpxaQTyy35d4bODobbDcrH9ZcmJoKckLQm4ZApv+h6d7j3Chz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZdiDdL7; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZdiDdL7"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4774193fdffso41269341cf.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 May 2025 18:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748308345; x=1748913145; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=laho0BQGs9LeuV4Nq+vEsB28bk43Ur6ZTT1Nlr5pGrA=;
        b=OZdiDdL7nj2bf/Y9C8v2kexqrhzHMdna4XiaaZY/svR3DQvtQtG7mVI17B1dryEJH8
         2hiMSeSEtmiL2/sxkLPpuzFNmogCsJL8qY7+CgW0fJOPoOFAOP/NgYGhpoM8sCdlXACw
         O8K+/dPRY/1FRurVin6FoWpp9GJ+qYP4K1ZSXlWXcRiqk6oQZvXNfvkGx4taW9tXLzEI
         bAckQIHzSMBuDst3YYKMXG6e4CuKuPyeH47wIBHDhouGqrytpOUj5sSMzTBqEX8a8azL
         GyNT491WL/a+r6WU/6pWSfoUCw1N6ghZwYK+3Mba2GpL9iqnDR3qXTRysAHlriZlIz+x
         z5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748308345; x=1748913145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laho0BQGs9LeuV4Nq+vEsB28bk43Ur6ZTT1Nlr5pGrA=;
        b=JyYK+LSqhOFG7IiU9/hkvyzrHJoxMr4aZWpRFSSmBEpqrpfiC6ChxKEdpvBcm6up8P
         1mLsSNLXzn4uI68wh1ivhQNjBxIGgZvKGU7phNdA0IqE0pmNFn2CEQZpsP3TimZv/CT1
         801qbD3SnZUVellJ2PPmrgqosRTlDtpeGqOwMVVmcjC98tHYQU6OHsvskHejGsxgUhQh
         6krPbt2V0WClTujzzx6glVz9wKMpHKn3Du/87oeHSGIaKozPLewndLFW4HfjnfEFOODZ
         sUvy/4GSbPqnNJb78UaqYBH1UuurtUk0qZY6jKolmKsVa4ppJnxSWQ1p66YtbXiVp0wq
         afQg==
X-Forwarded-Encrypted: i=1; AJvYcCVyWQgGGCeQGf6NjYfdo5t7eLXiL8drOYfDndgnD4WT/AvevJ7cEroIjwk0Kx9YhMhQXPMrCSPuvpc7UjF6ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiePYfBRmT2qt2DtvV4MDXoBDbpX7n2TTBG8i5CFdrV2KWYcHN
	rUp8leD/0AkGW/ZJd3tGKV0A3FCi+jEHd4YW23L82f/fUhut72BWq+pq
X-Gm-Gg: ASbGncvw/c8E2i5/JcN1+sKQL8PbupAo0QNZ8/lUh9zOGfODkpu3/CryD3DgknFU20j
	vcXLlJiaTf+zily/iajgbkdum0TDEIQiX1X0ByadOrPqJ+sM3eP5KLcYuZ8Ro2/Pr4FtaQqTpru
	uRYKPrNbrBpUXYZKh1OiazBh1NiXX3ljZLvoTsbSZkmKfmj7Lmt4XPiLquxo8yYVZF12GhKdOsQ
	l+91MysWcakg+35a8mdqdbyMZ4tUFn+sZ/7FBY/f7pxhZzFmtEINpc4CvIejPWEwGO+n3Vm4KC0
	azpAoAl8F0UdLDnBDBz6s8DwdeVudoY5+J7byijwVdovBR1W8xFKy0k=
X-Google-Smtp-Source: AGHT+IGAA82griBVyLAcckFqasycDnmuG0ngHpo4ChEJfsb0E5f2mn1iM2wE0gPYxFVkDr8RbYs9Mw==
X-Received: by 2002:a05:622a:5a92:b0:476:74de:81e2 with SMTP id d75a77b69052e-49f47de6543mr202342021cf.43.1748308345103;
        Mon, 26 May 2025 18:12:25 -0700 (PDT)
Received: from arch-box ([2607:fea8:54de:2200::dd7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49b8acabd14sm86902881cf.80.2025.05.26.18.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 18:12:24 -0700 (PDT)
Date: Mon, 26 May 2025 21:12:22 -0400
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [[PATCH]] rust/list: replace unwrap() with ? in doctest examples
Message-ID: <aDURdsc1rAbIC40T@arch-box>
References: <20250525225925.14797-1-albinbabuvarghese20@gmail.com>
 <DA5Y0QPY52WJ.DFA7YNSN2B2M@kernel.org>
 <CANiq72nNX++eUKAHYvxMvEeHy6cfDP98cteVAgM7RuQH5hDkVg@mail.gmail.com>
 <DA6DJEG780UH.3FURKORQ8OY6U@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DA6DJEG780UH.3FURKORQ8OY6U@kernel.org>

Thank you, Benno and Miguel, for your feedback

> Having thought about this more, I think this is fine. I don't know which
> extension function we would add to make this nicer.

If the code looks good, I’ll submit a v2 with updates to the subject line, commit
message, description and tag list.

---
Cheers,
Albin
