Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F42447B42C
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038931; cv=pass; b=BQzn2eHchCVMk2ziV8dAuGtWHltVOh7TW2vNJ3y7PcenS8NBu6zeKNPzNoA4FpLlWotXYhgt7EUtkDv64T+uDwt9Nxi9w7WQ74mzIav+/YbbiMyvsOAiKMr6AM1pkA69ELr6afSY4NFpIzL8ePwPmB7zFFVYxarlNouXQnQX3pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038931; c=relaxed/simple;
	bh=8Z867mVgg/5I5DILgRyOBSHxxSMmij3Z8uiXEH87+MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOjMDZimrEG3gZvpsLBeg6tNCtKIAxLsOpE71HCuAeX2wN906BU/kacmv2JhWocrjBDwPtgT9QJHAl/FEgyTnb/dBlVGr7A3gMBQHIR2yJlWwSiSyiB+6lFz3B5bnX3ygwHKls5Uh91LitmbRnNYyLbP0M68iegw7wwmUmp8uPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEUdz/gp; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEUdz/gp"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-383fff6e8b6so358219a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 07:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784038930; cv=none;
        d=google.com; s=arc-20260327;
        b=s3GgClxBeKdV4U1h4HIonarJXGxtz2vAs3a5risXds+cmTrL6seHKYssyOKPif0SuO
         Dbf2hDJRYh/0MEAqsoDpQHtbvBp0KzXZXZ2QayTsS9UtlaXc1n+Vv3vfsapnqmR+vkuH
         ECUJR4rG2+9+bAa19TdlaDknCYaXNT3cU3+qaF+VDHse9Sf9jnWOftCGsqi2lX65KStM
         iWVkmPh9nN6xanj0H2sieQkdc/aKX71Btyo7mqX1QwmVT+PqwlLxBoghN66y9Hn3H0nh
         EWMnazQX0IOYAh/qAAHTaAS4oIlfGRKUdYpwq18nl9Vovu11iVlW7NQNywjzEcSzGK8f
         KoUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Z867mVgg/5I5DILgRyOBSHxxSMmij3Z8uiXEH87+MI=;
        fh=EhlHfXn+MkGTx+y6OSfBiamuWw+GckWtV+P2bRnAmXo=;
        b=qRLluqBgBl93yCOoPK1t/6/VfyvttpjpE4d5GFx9SOeCRDdl4vNVZZbvQ3OBaVFuiD
         RAFHufZytkmqdbYJkxnui3BuX/fGyl/QAQ/75VRHAZGEn875hNLZJHUp1ZUazYEHdE9D
         xJpdfyvchJWzxpRyGEv99NO2KnzW6ICyRM8f2uPaC0Ru88B1xtWOo8EsMrSyRtvSJgpH
         Erhdn+Q/4wjPcwKHoS7ZeQBfC5AGePUgw6E3pgsYX2ajspwvJMdY35E5k/H+zzpbSszi
         skW8uhYbKOsTzStIprGTMjGVHdqpBo2ooycUWsrCqZ0lCdfdNHpm2m/jYPw+TcC+HbRO
         4LUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038930; x=1784643730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Z867mVgg/5I5DILgRyOBSHxxSMmij3Z8uiXEH87+MI=;
        b=TEUdz/gpfJB18debXU9tMAYPfF4TI3+rAgPk0iQW0cj07Bqwt8xgfLi4TnXqTbhYgw
         WsGzzCkhRe7h1JzMUG6Oh0rWXr9HDVB7u8Ja6hhT4gEUT3sCioxKtfAtsbzegFAo8Qjg
         k4OPEPIo35sls5kM+OPLa1dELEnQx4BWZeOXIkoRLlWykGw98XtzNN9bFaBPJbR5EPtL
         lJQd6kF0Ue2b6IEsKlHC9WCNlh1OzS2DfRCIX40fQvgC286B/UNJ//RrJ2Ul4GbLAjdc
         VInzvVqguS9HRuAZg3g9FVTQEdXKzkQi+EcNiLP0+G5BY/RLYB1Jx5akirILZ/HbOoX5
         4wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038930; x=1784643730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z867mVgg/5I5DILgRyOBSHxxSMmij3Z8uiXEH87+MI=;
        b=LJEHzcC19XqVy3S1FBRvZH7FrRrRiknqmumgHAoFp8Ugs0OKfd3FMpvOS8LJydKVmY
         Uxy5dWgw2ehB+ZEyqzuvEByI9lwhT7M3k7Zf/B2SgBT2px1UKb5xEpq0QskwzEl9RA47
         zCe0AT2NSuKq1drfPNWmCH26Ykp4USILcgRQOcJpivAZ/WIP1yOP5Oy/mKxZsb+bGHiD
         T8S8ngohnfH361GloSzDmrP/sJM5bpFH+1zk3nRF/XWdRy2j41EAgecvetZHWljYXPsX
         5ULfIxQuoLDLtn6Bjr5+abF5fJFl5iCVhVnB8M1W92hnYN2nekFT1FsGXwwZBizf6YNS
         ykQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFTqIM7ePlFTeU3k08H0RG6PGpokHUVVcefc2MExlRHSrFOIDRFtvFWcXJhQcQJ0HpnxhyiQ3PayXBSNYqIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYAYyFgeEboQycjDPvvLHODgHKvl1maQkHkCdJOGYUc/iClCgi
	Suf2jOArQiaOYZoPHm5O3FzBfXPLcWTaSp4aHsQLRLHc5VYaSPRVpT1+2uOgfcS3vbHUW/ZKR9G
	nu8pKkYgHrXUJukig9xPlab66uah15vw=
X-Gm-Gg: AfdE7cnld/mG253WRhWQr+EvnQWRSbpEQMhEXbLxGHUPgybRS944/YRU9iJVMPKWFTd
	1O7OId790LKaHY6XctJHs0R9MvVcW7+wLmfkhngkGBLJ81lMjO44LJliOLYlSWEkPjw2zQ/ozoS
	41grUKq6JKWpRcOE+y7shFFScj4dIpck6mSTbm5XWyFp9zQlInmne3RtFUSwj4XmHJU9ptTXos1
	3y75OKYVxJ3EzA7Qa8EVPEGIuoCkCayKHLVZNVaSgGuQN67Ai4VuEjSp4Mzen4t51rXqpwY6gZq
	Nrm5CqqulbbdBTMRrg7zlJBq2+TmG6VamqNTWKPpUdbxLowGPU9KHI53EkAoG2Kfl5pZquLyw5D
	8hzg2KYR6nPFT
X-Received: by 2002:a17:90b:57ef:b0:37f:f00b:bda6 with SMTP id
 98e67ed59e1d1-38dc732cf3fmr9681654a91.0.1784038929717; Tue, 14 Jul 2026
 07:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72m+mx-z6idfdTLh+mcW76nxRr_eA-a6vgjFY6a1GE_ygA@mail.gmail.com>
 <20260714.194916.571807180513332641.tomo@flapping.org> <DJY8NM7TIHZK.15213B4MWETHU@garyguo.net>
 <20260714.211751.124079232269470730.tomo@flapping.org> <CANiq72mokH0-CnObPnFJWsSaofOmiAqtBuvGxPvXSruPT-Xn3g@mail.gmail.com>
 <alYyNtrxK5qz7nxA@google.com>
In-Reply-To: <alYyNtrxK5qz7nxA@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 16:21:55 +0200
X-Gm-Features: AUfX_mw9lhJDC5PA3iwEvVBI9G6NL7lMfFuSxd8Ecbscd4aTBpGvx-Yqodl-2LI
Message-ID: <CANiq72n-MUqf2MBrUTqOD4jbDTZ26kYULzX6YbQLawJ+201jQA@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
To: Alice Ryhl <aliceryhl@google.com>
Cc: FUJITA Tomonori <tomo@flapping.org>, gary@garyguo.net, a.hindborg@kernel.org, 
	ojeda@kernel.org, acourbot@nvidia.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com, 
	lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 2:57=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I mean if the goal is just to explain that values that are too large
> saturate, then the example could look like this?

Yeah, that is what I meant by the 2) group, i.e. I think saturation
should be shown one way or another.

But the boundary case in particular is separate, and a previous patch
showcased the actual boundary (i.e. both N and N + 1). If the docs
mention it (as they do now), then I am OK with the boundary case being
in the example too, even if we may not have a `pub const`, or in
`#[test]`.

Either way, what I really want is to have the basic examples landed
and the fix... we can discuss the boundary (docs, examples, `#[test]`s
and `pub const`s) separately. :)

Thanks!

Cheers,
Miguel
