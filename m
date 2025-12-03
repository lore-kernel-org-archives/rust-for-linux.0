Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4913207
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 01:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764726339; cv=none; b=eKLYRp3zNlDFR8eWpazpSiHAPM2R3725jTjBtbWpR2P5k4UCxYPJwnrCQwdwdtRii6fVW+gV33rkT5uINVWDrJXHvpwq6gTzpV+1jNG2dCYbPJ3vyOSq3/3VQ2wxCcmTAJAqPThqD2bhwxybO/1uw35dzXG23tpNznaWLoVQyeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764726339; c=relaxed/simple;
	bh=IE9/p2bocks1GCD6WKF0TQXP4zz84IPpq+7lROT/TDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgUWh6rIL93Fc5bW5MC8YIPSR0yVvjtMgVkaOM12wWwULXg/N6W5LlD4J4bFzH5fE8PKCoMhNvCulQjsi20jUoEpnjmkTXWRTueIiFAdfyo35NsHRX+9CEu3jhXfTt+8piiEv+4DOneh9TXnHCmn5nGiswHks1jPMQ1DwL4AP5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9wTSy+6; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9wTSy+6"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b2aa1ae006so791035185a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 17:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764726336; x=1765331136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGb1K10u242N9+is0MZiFTl2fbTh8iuEfqdDUmPi85U=;
        b=h9wTSy+6Q//zJIUHlKT5g2GfPmeqtiIHPwmg2wypoy6wvtUYRf98E1YTiSvTuyxGig
         pMeRznzGkOpsqJZnsfup3SIV/ozMbAnNDlzQ1OUt+a8nCH9aKj/n7hX0IIyaLNE41GKA
         8nlHbE74yi2z9Eb368cRHY57qEmlEEWWRQJSPsid9N81C+J1n/pK94PcRrt95+IYVm2/
         mwhNsxcCSGhzV000MT/O/PUcW/j8QWVoVZ23cT8+F7aHyAnEdIn354Fs5OsVrU1GFhVL
         t3Wa/74a2s6WHxMHPhzI/jXLvqU5g3jYtrBqiPpRGf68S2JE99TEtX4EuAg2k3Y0LR42
         fw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764726336; x=1765331136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UGb1K10u242N9+is0MZiFTl2fbTh8iuEfqdDUmPi85U=;
        b=RzAtNukL+EkNSlN4Eqom0+xHc37GYJvtNo31XsTcuNp7aE7l4IamvDwO+er0XUrFVR
         RZFd3FKJIFVDWXwvYW3Sa8gazxQkaW2e0NdHYXzJr4PnesS7S2kwaGXjzh/BSqiIVjKn
         qCzFZcaXGtCMf2fc3vtXELDOl1CSvGHpJG2R9cPRtqStuktEG3iyd6OX6jT51l45GSuR
         xoNTtkvTU5l/ELhTg6SQW7rGphXXs84DDjoTo2j6iW7yocZzltUAL5pnOkdIi2vK9y8a
         IkzP5vss7GXDXmIuT7t6c3CVPHFtSa15486dTBffXKxzrGYE6fV/wyRMVC3j4oh07+u0
         HIFA==
X-Gm-Message-State: AOJu0Yw/BgvN26XBSWOGe+nJJmYI9I4BbKfp+omprFo9d0lDOaoRxX4j
	6KC4jLzflu8lrz0cvzzzZOkI2YMsodWy0odP45zVX6ZtNh1gefww9sDo
X-Gm-Gg: ASbGnctADSAQ5YnqCbDBxNnEO3bayTSm5SB8i2E0lev790EFl1JAdyL2rKgoNyPH2bn
	Dx+SyOj2NeRfNty+m3VmhXneRy8X9HPRAzlTzsYiMxJ3bhmeG47JJ1EmN8duPOzNQ8wCM42hqnS
	PMeaxay4NvzGHrNqfduc6hW2dmEJ0JsSeFl7mOjIP6wX4AxsmcxmfctzScWlPv9I3Nh66s+ckRZ
	zYayA+XV7ZDMfH8Bf5QyYwKcJcWFakjl0/ApDIF7KzNCifpM7ozE4fbwl768huF7Wdmn0PuOFfa
	JK5Fvrcp1/ix9yKPiTQb8wSK3zmVfLH6biPi5wMdba+lwMLEHDTrvlk4SwdovI/MVLt+LHxQxlD
	m4s9lipsc3R/E2No+OmHI2wDhDkmO4WDnjMBtR0+vmkDfHpSMkaUJfmLHHCAB8YljMFEzJVMb5R
	qgPGrO3loMF5+fhn9CDxbIqkKf1bxrvha2nAGE6JphWSTzveJwgM49779625e5SHg0zCqIIpC3v
	6V8cZ8aUVJ71Q4=
X-Google-Smtp-Source: AGHT+IG6O3bogQGW7Qdmskf/SlKxIClKPscpCPubu77y/+ze4HIxJpk4GrYNsiNmoobS/XI703T2iQ==
X-Received: by 2002:a05:620a:40cb:b0:8a1:21a6:e040 with SMTP id af79cd13be357-8b5e6d88b5cmr86464385a.77.1764726336383;
        Tue, 02 Dec 2025 17:45:36 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b529993978sm1206672585a.5.2025.12.02.17.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 17:45:35 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 81016F40077;
	Tue,  2 Dec 2025 20:45:35 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 02 Dec 2025 20:45:35 -0500
X-ME-Sender: <xms:P5YvaRPf10h76o-YPsqa-NUrz_FsfgbK0YqCEaIpOjrHiFAdQFO9GQ>
    <xme:P5YvaXAOTkZk7NmA3NlXQMdxgRwhyr-AnnhOV2fKC-LkBSOgKfADehtlEehLq8Lpv
    c08WlaxbO-pzWKrNm7NMbuwfDVUeZGFwJ0qVd9X3cwCys1-f3WPpw>
X-ME-Received: <xmr:P5Yvaa6dkttOzuOI2mcgPdG8f0fGmwR6ZUVWBwcDI34i88Vx0ZTZ7-RW_nWacq3jr-5bPBUefIRQ5x3ltT-2zBYwET5xEeCd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehruhhsth
    dqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hvsggrsghkrgesshhushgvrdgtiidprhgtphhtthhopegrkhhpmheslhhinhhugidqfhho
    uhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheptghlsehgvghnthifohdrohhrghdprh
    gtphhtthhopehrihgvnhhtjhgvshesghhoohhglhgvrdgtohhmpdhrtghpthhtohepvhhi
    thgrlhihrdifohholheskhhonhhsuhhlkhhordhsvgdprhgtphhtthhopegurghkrheskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:P5YvaZ7ugVALVA89VJdlLPIQ2K2Z_W89z0DIgVE0FHRXmi-McP8Lxg>
    <xmx:P5YvaUT2HJV2pCQkB9NUPxBMrZOvi4hRf1m_cecXMSOh69Ud1nkYng>
    <xmx:P5YvaZ8DuENliN3Ud2VIGeR6M3pqSrkjWTJIetDC6cRcVszkfw8TrQ>
    <xmx:P5YvadYmqerXhA-yhyW6ypxonCZ7hbdouagmcGO2h2yLcq8MW3k9QA>
    <xmx:P5YvaSpTqqY1i7qB7SuBOdAvsrRj-bY-St-FbW6bHg7KWTVpafJVh9ej>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Dec 2025 20:45:34 -0500 (EST)
Date: Tue, 2 Dec 2025 17:45:34 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 38/46] rust: slab: add __rust_helper to helpers
Message-ID: <aS-WPmuwgvzbI0AA@tardis.local>
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
 <20251202-define-rust-helper-v1-38-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-define-rust-helper-v1-38-a2e13cbc17a6@google.com>

On Tue, Dec 02, 2025 at 07:38:02PM +0000, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Christoph Lameter <cl@gentwo.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Vitaly Wool <vitaly.wool@konsulko.se>
> Cc: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/helpers/slab.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
> index 7fac958907b0a7cbb28ef3a8a56e0cc10d39288f..970161023d8885935f2116fe81949d0ed622f9e9 100644
> --- a/rust/helpers/slab.c
> +++ b/rust/helpers/slab.c
> @@ -2,16 +2,18 @@
>  
>  #include <linux/slab.h>
>  
> -void * __must_check __realloc_size(2)
> -rust_helper_krealloc_node_align(const void *objp, size_t new_size, unsigned long align,
> -				gfp_t flags, int node)
> +__rust_helper void *__must_check __realloc_size(2)
> +	rust_helper_krealloc_node_align(const void *objp, size_t new_size,

Similar here, shouldn't it be:


__rust_helper void *__must_check __realloc_size(2)
rust_helper_krealloc_node_align(const void *objp, size_t new_size,
				unsigned long align, gfp_t flags,
				int node)

?
> +					unsigned long align, gfp_t flags,
> +					int node)
>  {
>  	return krealloc_node_align(objp, new_size, align, flags, node);
>  }
>  
> -void * __must_check __realloc_size(2)
> -rust_helper_kvrealloc_node_align(const void *p, size_t size, unsigned long align,
> -				 gfp_t flags, int node)
> +__rust_helper void *__must_check __realloc_size(2)
> +	rust_helper_kvrealloc_node_align(const void *p, size_t size,

Ditto.

Regards,
Boqun

> +					 unsigned long align, gfp_t flags,
> +					 int node)
>  {
>  	return kvrealloc_node_align(p, size, align, flags, node);
>  }
> 
> -- 
> 2.52.0.158.g65b55ccf14-goog
> 
> 
