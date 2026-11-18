Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017338;
	b=P9SYMt3s2o3NgwePSn6wJGLmqjsi/RiFAj0AmiDCS1wYqcCKNyZuugCyr8r/wrMWUYZC
	 mQn2SsibEzEKWq1N+H8FwgwdHOPsR5idrGxFBifqQbjanpUY25iU27J4ZGKiddmpis+d2
	 MccUvZLAIFQ82BK3AUxdzkH9+UD882cbpbi3OTuRI0w7gPrbPohTCinIONPmJ2ykXRL5V
	 ByfvOJ+Jy1DL77shpfAjPuf102bKIrlkW4O1mMVbrubT9gpRpWRNSjVLw0QhJnN/OdW3n
	 6APyqUy3I1rjtPu6PR1E3h9EvqrphS217O5ykVacjK1QQxI9f3lE+LfECOxmnFPv2jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=opiYjd9kyePy56Loel5UjRPuD8cH7yPxU8I5WOGrYBw=;
	b=r4k57obF/c76k8MkcNpm+3nUC+E92MSL0wR6bL8MdQx5kd8rzZaSCpffBqKXhdO1nrFs
	 CcC3kZ7wA9B/oEjPipI8XbyE4g9z8jmneRyiiUXz+Z+RNs65o3nul91Hq7Og8SIF88xNo
	 musDOJF8jEB2hElU6dPJifHLcPH181FuCkBuMR15l2iK2hKYaCyG2PFFObu2QnlxftjXi
	 EtnJrzu8/JrPz20A008NpubrtNigBwYzpWVqGieNlLXg10TEV5xZpOByor5AINPCPeoUJ
	 aksmK5YMjG983MWa1IDW4oNGQzCQiFiKlTGj2aiR/0oSykWRJEziWIHSxKd31c8nRnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMtU0Ddr;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D7606A320
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 15:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427D7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMtU0Ddr
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492690dd5daso934408f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 07:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017336; x=1795622136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opiYjd9kyePy56Loel5UjRPuD8cH7yPxU8I5WOGrYBw=;
        b=fMtU0Ddr1dtcFOHuJwKGWLeIEgdUmkB1/fhxjb4Zf29xrbuCBwKDtNAfzl6nhpS3yz
         FuX/edLakZ2Fok4Qn2UTwFmQ0HbbTWeQIhMksloMIfzCRPKjmYFTO04zTgSOJg8MtX7j
         ZOBJgwKLyGhIFR8jUDeneVkV5CPzrjMrn20SozI45UkPKvTnwx7+AaWYpIl9ZmMbH2Sc
         SQqyaINGpPm9OYbHGWDPtmDX1KddLlkIXO99bx00yJjA58qF0qesW8V76y/fQPp24hmo
         eu1N1JaOs+YzAYnglKnGinwp8YvQv1edehoNrLrUkloAkfRtv58bGLua8XnuUgPBDd5W
         dfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017336; x=1795622136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opiYjd9kyePy56Loel5UjRPuD8cH7yPxU8I5WOGrYBw=;
        b=RGEWh1sQhXI5Xyb61ovuP6g3Ff9LA9J2CpR0G1z0KEO7Ewkm3DPPveLys/0usDKTEW
         8X6YEWEnfb4olif6oqGVLmm2D8CWSBAWZIlpvKMrqzxwzvy3LQei0hy7+FtKznPyAE9R
         v7HWl6ZoSixXQi7OKbVJl/YRcNathm9yAyJIWLlACH1zIXvDWHMHmed4/8tnrvxl9+jr
         y6Ft0RqZKmlkkMAdGKv5cC0fCSjfBYvbw28MkYNRl8RmbhfxyHxPJRb5VCqdURbGMCSV
         beFD54RB+hVXtrEflfy+MukQywtVz5UjVDug8na1LwfosZBDg0PRh/1rj9QeHrJ7KrMQ
         AeFw==
X-Forwarded-Encrypted: i=1; AL+hErHlODwc9WDNAF37VkfxXKkkObH7wqreQOTu0tyBVBTkaBQeWPJu6ckrFJbhTcILiNEg8wkxj3klF42RtGZOsQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6O83X3Q/wyp79Uuj5uaxlP2K+zPl8Q8hpEwxq9viPwlzLv+Er
	W778agPVTVPaqdang22i9rztwqkc3ylsA9JIa63Yxca43oT4BcgELGYm
X-Gm-Gg: AZFdTZemjBQBOqTmDmfeDzKzqrJbvCvkREsT4Vsm9YgMvqbt3MYDiOQLDgNwzsaBQPy
	31Gpw595l46Qqenu5bteh297RL8zRqGygt3Q4hY0d98RYser/TBCeyhU3scMjLw0K0D1B+MoTHh
	xup8V7qJrc9+I5DHKR71H1pjkVFl+NDKKmXED+lXgYmJXB0+8uD1kTVfqDzc6XjLEBsYLGgJ4ct
	erlGpXb4Tpq5zwl7HW4qwtAySDTMl/cTNrcv75CAPp5EXqffmCW9C/tOUKxC2hFWtHFabJII1WQ
	aen5GAX+CauHmk7sjEGAbb7TSWOysakSFwfyFti6nqlrDZXv5DzhwiysERFPu8Df3EUMXvE9SHI
	jqQunZ+WXASVP9H5qm3FNw61iQCyKC9JDAyCRhs7V2EaHQJhk5a7qSgm0Ob4pLhWo2+LpKoY9d9
	zOEE+K3H4+wxGL3EhMLnBRZZZNgKGF1tEDcpC9WEkcauUpJGtn7EVvC+vuq4pKRv5q29c5waHE1
	SsmUj3hrHW4kg6b+Kss7/SY0IMAjb3U+Pp9YKUxeQFSsqNOfAJ0bR2rIURzXdAqAmS99uCKBoLl
	lTvKSPgUNIAqwSQdV2V9ZZrtTBw+TX+piwIm/BAwYQqi0bN6F1jN2QNc9xqonjyqspsmgsbmGtC
	YJRzaqhr6iFx3A57itcjL0UDfR89mI/Vt8QGa3lwmWp7IFJxdbyvBowYhmRTdtjO67gHEo1URnR
	Nt
X-Received: by 2002:a05:6000:4102:b0:48e:3bc4:a367 with SMTP id ffacd0b85a97d-4a639ff61aemr5650397f8f.33.1795017336371;
        Wed, 18 Nov 2026 07:55:36 -0800 (PST)
Received: from C422HJQPQG-Fractile (cmbg-18-b2-v4wan-168328-cust3701.vm17.cable.virginm.net. [80.5.206.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c406sm5490881f8f.14.2026.11.18.07.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:55:36 -0800 (PST)
Date: Wed, 18 Nov 2026 15:55:33 +0000
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: drm: ioctl: fix call to unsafe function
Message-ID: <av3KdRxCJsek49L7@C422HJQPQG-Fractile>
References: <20261118133232.48603-1-vishal.moola@gmail.com>
 <20261118152901.788942-1-aliceryhl@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118152901.788942-1-aliceryhl@google.com>

On Wed, Nov 18, 2026 at 03:29:01PM +0000, Alice Ryhl wrote:
> On Wed, Nov 18, 2026 at 01:32:32PM +0000, Vishal Moola (Fractile) wrote:
> > Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
> > Signed-off-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
> > 
> > --------------------
> > Based on drm-rust-next.
> 
> Note that patch commentary needs to go after a three-dash `---` line
> rather than `--------------------`, otherwise `git am` / `b4` includes
> everything above `---` in the commit message. No need to resend just for
> that as we can strip it when applying.

Ah, I never realized the tools were that particular about exactly three
dashes. Thanks for pointing that out, I'll keep that in mind for the
future :).

> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> Alice
