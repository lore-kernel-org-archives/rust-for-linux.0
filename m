Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119A21ABCB
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826797; cv=none; b=IytJQpEXPIFWB+wSMEpSkKqeefRCJNCFOyq/H/AM5teWRblQcjq190Vj9OB/xoCodgibswZG5zB8us8KQkl1rUOv17WWb2xZrRFfItRuqsvxXefsth2Bcf5Hp4Ko2ZLn9ZD73kEizakS3S6MYpERI4ODbVMoDFYU/suljl3tbcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826797; c=relaxed/simple;
	bh=/1pNMMV8yCIS11pdB+iT0Ev7icNKnIUvh9pqMmV/HCA=;
	h=Message-ID:Date:From:To:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUZhD7u6xzob/qMGIVnK0Lt+AREiNmnx2SFcBqxGiYW8ONs4cam4cOxaPEt+Ep2JmitWE7P0BDD24yHnn8F9kjUer76yxLcaUbBToWMuMxgh5tYw+OTudxmMfhE2hBXq+hZEBy/3DMnPktQy82BPJ2C4c48jkJkfFKfmMaPXhJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUly77QH; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUly77QH"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47692b9d059so88433451cf.3
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744826795; x=1745431595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:feedback-id:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bD1x83He2MSLD9eTJ3evZIJZAR0U11CDX9W2e7CZ09M=;
        b=hUly77QHBuNRuIvVyXTfZivKyUAHGR3XE8RlunC5XkEAW5YSlLGN/Znkmi7vOnVWmq
         PWzwJBhmINZZL9zjmdA81B4LH4Ms9hgYzJVs03DX1OS08LpQN0GswxxHmcc+GSS7CuFd
         chX5BKj3fmq3UbtSdj6RsEUfHXQXSMUi+uBj0Ht8Iz57IIR253nGZA27NK1TgZSeODaj
         pafDS6oKzPCQ1QaCZeDrj8DyAAqoVT0OLQWiwqfrCJczEtyv6iXUQPBudMn6Dev+R/Iz
         e72G1zKP0tVrMLvMxr9hgVGSBB7095wefbvQIqFHKkdXkcdCvur3B16y2Ux/5/yBWvua
         SEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826795; x=1745431595;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bD1x83He2MSLD9eTJ3evZIJZAR0U11CDX9W2e7CZ09M=;
        b=A4D5e3lKddrZtkICPhzjbh29rBkD8jJh/uw9rdL/32Ofihrisq2VlFQ+cS0HXne1ux
         jclZlod9OZbyNGOm/HpyZgqAFV7f0j3hwgGzl3X9O0YJzxFKEse9qgCPxcLhXyZ4/2CG
         kY799NsaQ5jwMCPUHPRD4IobvZJDnnJCLb4ISr1IFl3Z4q/oO0T23QvzvOXQe0sH12EJ
         FEqrFAfuOPkSSFjEW8UiZ764qEg+xfBazJIv728Z0ZsvnmB4XvSgGZ3LL2Y5wzfxE8Tn
         RvqDhvOB4o+aSt71OyoWI0HGS2NrtmB830W1DKEik5LDzFu85E3us0IVy91LLpMrW4ix
         Uctg==
X-Gm-Message-State: AOJu0Ywibydi7KPtuOJEQ4qG0at+G7D7lCGMNXdb255pyHHPeeuvza73
	VQcNuLYK8+gWTC6I02z0kUV//f2pXZmh7oVSUXHnggJ1xYfKN51W
X-Gm-Gg: ASbGnctPD63UEdq3NCHuHMMr489Z8BHBkm0oeZ2wJ0iCCbA0SouVYIR/WuOU9UVu88v
	HIHhIAFXuPs0z2snuWfcp/J0BgV3MSkJYJRPqXlswjqjPPO/kJQkDGbmaHQLdQ6p1zNnBsEnqvA
	RQ0VkGMJ1QEc3SXONYjnIROxFQcBX6ErrbmLQZIaogGOY05Zs940WPi7lZ60Rcf8C3GG+IjBR6w
	F8hIs6w6YZGkdFemuOpfACuSugjd5yQoJKYBR8AIGsKVb8Rb+22Fwo7vlMT16VQNu+DBD8WRci1
	Tsihc4maPuNZ68bhCq/ZqjJ5GCdv+9PW3B5noGfaiY9qRUgUDQE+XFmhKuHDLTu7U1VR+PceJjr
	lMK4Lb0kMlmRJIkh1ATmADsNA1Q/h10A=
X-Google-Smtp-Source: AGHT+IGGbhLMWc6DQoFMqjWZotESMpP12VxuN3KKf6uKSyPqlU+QJHj1rUyjkxIOhT7mEUt1EOap2g==
X-Received: by 2002:a05:622a:18aa:b0:476:6d30:8af6 with SMTP id d75a77b69052e-47ad81178e0mr34841781cf.42.1744826794763;
        Wed, 16 Apr 2025 11:06:34 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb2c07fsm114241621cf.44.2025.04.16.11.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:06:34 -0700 (PDT)
Message-ID: <67fff1aa.c80a0220.b0808.c742@mx.google.com>
X-Google-Original-Message-ID: <Z__xqEuwYRp83tn5@winterfell.>
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id E9E961200043;
	Wed, 16 Apr 2025 14:06:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 16 Apr 2025 14:06:33 -0400
X-ME-Sender: <xms:qfH_Z6Mt12yCR4E_LP8SVo0w1SosHjSSGwIPfDc0cSUaSTlk_k1gvg>
    <xme:qfH_Z4_82F4SORh0LL6l1NQDY6L-HLwNSm3o6SptTsbSXx5fzUkavkxqxSxHETM8T
    G6NTlL27GzHE1w6QA>
X-ME-Received: <xmr:qfH_ZxRbgCJgvhAWPFhNxXaO99gKBk-2SF5pcngZdtEYbBiFsiBIfR4V90zYLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejtdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceo
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpefhte
    fftdelgffgheegfeffteeiuefhieejkeffgeevjeeffffhtddtkeeghedtheenucffohhm
    rghinhepghhoohhglhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghm
    vg
X-ME-Proxy: <xmx:qfH_Z6srzpWjOL9Iz2n4SiNT0usMwBMKokyKLOrxocJ-eoH2kL7xSQ>
    <xmx:qfH_Zyf-68uSnlRqqHfxOKYO6W8tmpdFevC1y3btS-jjf5rqPRNA_A>
    <xmx:qfH_Z-3crHiqmnVtNtKcFEZ0qgrG2V6LgVjDpm3AHplNX4rYWFPIqg>
    <xmx:qfH_Z2-QMFPNLgkTozgeqnW4-Hj12OfOxChEuezuIhnvE6mqCqeb-w>
    <xmx:qfH_Zx8Gdn6qXa3_tS9IPY5kvjLXl803kGghMNQq0KmNdkt-uNk4zMpA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Apr 2025 14:06:33 -0400 (EDT)
Date: Wed, 16 Apr 2025 11:06:32 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Open Meeting at April 16
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
 <ZPyqLJ62B2GZg6BA@boqun-archlinux>
 <ZUk14802ZWGpR2iM@boqun-archlinux>
 <Za_9bJxeyW0pddKL@boqun-archlinux>
 <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
 <ZlX_KOjdd65k9Jkw@boqun-archlinux>
 <ZqpWRo2M2SaTWU76@Boquns-Mac-mini.home>
 <Z1ClkseCwaEXS6GE@boqun-archlinux>
 <Z6IvhjRFU9R32jHV@Mac.home>
 <67f43ca0.0c0a0220.a75ba.35cb@mx.google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f43ca0.0c0a0220.a75ba.35cb@mx.google.com>

On Mon, Apr 07, 2025 at 01:59:09PM -0700, Boqun Feng wrote:
> Hi all,
> 
> The scheduled open meeting in this week has a conflict with Rust
> Project/Rust for Linux sync meeting, so let's schedule it to the next
> week. Please join us:
> 
>      https://meet.google.com/vii-meij-xpw
> 

Ah, seems we are having a technical issue, and the link above won't
work, so sorry about that. If you can see this email, please join via:

	https://meet.google.com/cik-xrih-wij

Thanks!

Regards,
Boqun

> at next Wednesday (April 16, 2025) 18:00 UTC. See you guys there.
> 
> Regards,
> Boqun
> 
> 
