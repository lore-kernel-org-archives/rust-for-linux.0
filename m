Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9497838643B
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 07:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666474; cv=pass; b=bc7xCMRXFZ35NZjXfoaIKWWILFQZfoIlxg1bzFP90bxvtuL2o8Z5aGHBIcimMswP8rSdUUdlFgY395/UTsQg9y9AUDlhHauMgeZStO6OiLWEwykXHXkEi1olnnTHVPEgy3UPTgRnK8Vwk54Y8cORd7IAyWpj85Xf5dFMwwZsqN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666474; c=relaxed/simple;
	bh=5ahjgsld5ebbNV5QvgkIwQyw+eBnwvmrw39XlF/AN8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmZbhJiUgJcuWRUxdbN6h+ryqpUHNkwoQTFQs3GWeDc02smmxg+Y8UCxNnFTUhDvC3LrKs938J3aAwyTs7pSWpJ1khYjCiX4+0rQDmHWXLLrT5Z1SBlbsS14fTOfv7wDmTcBfnuQtKKj+YDHhvdbEG0EABs7jQmqSk0qEIoDAww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qy5Ubfpe; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qy5Ubfpe"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34ad8819612so111099eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 00:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790666472; cv=none;
        d=google.com; s=arc-20260327;
        b=j/i5RaoNOyBokcbmFWXtWULVUb3yRUj5WLevYDvQLcnvJwR+8jgy87D188YKHtjPQ0
         NsXfjx1KpytFNzPQHY1MErWYEkHP/u0XPmcXU3c+Lq6/V3jNEDfi0UiGIXujqi4lUdkX
         w176BZ1Flt5rrXHvjfZHBAKsKrh0CurKIZZE41qo/3yeBBYNVq+R/oSI38StEvAd8P97
         K8qqBgeIH4xEhEgwLzP0NOy7/3cZyHKwpluiEfHioa6+54B7YB5BXprsnts51O0KonWW
         4zmprsCA4OTUrzcfBddfPcCRKSrvSfUk7yeYE1TgjagLC8P2x/ujWHHk7AEPuLlXGkax
         W6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ahjgsld5ebbNV5QvgkIwQyw+eBnwvmrw39XlF/AN8A=;
        fh=G0t0gwJ3Y8JD1gSEsW4Yt9MNRLXSpDAmS0MzgVsmHKU=;
        b=sv+cKtPCtFUjULT2v9UKX+x6uLhQ/Vv9B1BDq2jDjUG6vpaMBh05bhtriIPJAOzjuV
         14iTI8dvqN7n3A3o2/SW8vo+eU01fYft85ES+1+EB1YTvBuNWDCElIZh9bxhtkfnVoti
         fMv/Blt2QYzJhRSZVdkBSU/vM1eed0gGd55yf50zJvCt1vc6A2YPLeoZS/CA9xuW/Zlu
         6BcIkdOHqqZbTPz34xzRjT0tKGJ6aVNemc7kgwTbcqFPH0JiWnMSsLaJweG+wGLpAVRz
         6t3bUK4vVkCUiXBFLAfJnbvFi9HA/37BMHZ6LVNIe5F7T4QwfUiC8OBFdGuL7iwhb1HT
         mbqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666472; x=1791271272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ahjgsld5ebbNV5QvgkIwQyw+eBnwvmrw39XlF/AN8A=;
        b=Qy5UbfpeRKpRif5sdpmAvOa5lZFU2eTh4uZwSOV6OLmPfiLIozN8q+chmOWnzZafcb
         WawNtsO7OyVDnwfNZKEy36n70Wv1WUDWM0jcHvvm+37Tk6IywCiuj0Ko67cn2+mbbIvy
         eiKRWQGgbf0+M9xp8/6kyXpidn+0W11ovo5eeUAB96HRtwOMNq4yQDj7qoVt5WFH0gJ/
         AnqR8Trp0k0NYM82Y/mKAC/NP5TvYKB/VAH+WcbtIYUvvfeOsexaL7Pwa1Vi5+SONc2f
         fatpVOcMItsn7t9YtLrmjuJsmxFLP0MCBMYljfhZuyMo9S7GIWJZlJHEojOFrPGI08Ht
         135A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666472; x=1791271272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ahjgsld5ebbNV5QvgkIwQyw+eBnwvmrw39XlF/AN8A=;
        b=UGAguY+ig4w8vJb9pChzKlH4npO6ReE9bi6726dJfwIdhnxFz73VNql1WgCedTh4CQ
         gCzi/WTOnPWtePrUvxAHs1unEBn2FyLVjZ2vFn3DqctEl84d2bflloUszIUd5SS6mFRK
         ISb9HYmqdUTdL9uT8CAMOHPc2wYjo2cxeiEKLCfs+YQRjcnEIWZfWWz+KeU0SyKGYf3Z
         es+C3ZElGtykHkhMBD0mdXcW9IcjZ9yzjWJqLvlsQLuAdG3L6OPUK2zh1+u4AdqVdxBv
         o+dpE/iqa9nnrOVGTXBPl9jZovmfKyUyd+ZvB59icpjekjIejeGsIRjaG05lkDqb3mUx
         2TCw==
X-Forwarded-Encrypted: i=1; AKwUvByFOCnNT+rdfUBoqgOEeoXG+8G3JcJL4yOIGbixtEvQXhgVwYwoVwu8ZQD10B8damEzBcU2DS7/INKC/8sJwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7v1sMbzKWwmd/N4yg7AiNI9RfstUG7WeXnr73t1a8q0UYZKin
	m8Wddc1SBoy+cmTfxo2zgO0d4SZhXDN26/WZBsuxtpBDtZlawekkE9VYVOSBcjeE4tm17mfGmfC
	Ojeju0u4aMTBmhAfBGaILqnE4r+HotXk=
X-Gm-Gg: AYBFou3qdoS7ow0pAB4Fzjkp5p4FsY8u3J23n4JnsLTSDHazM9oU5jjiFm49ek3nwVq
	35JGFRm5bgQNNnUkALQhSg3aTY+nvidzUPClkm+obqAd0WlRIGQuBZ30L/pVjP5eVC+9lkiIiel
	crr9cl5VDQneK6NMVB47swclu9K634KAByeFB+RDIeCioGAyg1TkvUHm+mN5TjUlY47uPtyaeI7
	JFrVSX6IZwLskSBavtx2+vUCmr9Vf/TuiI4Z5APaeVwH+RyGBTjPrCdCH24Z1Qs0ICAK7u1/L6b
	wYIj8PjuzYbINnkq9e9KP7FD8J826WV7z9Y7NivAHrbvL/Hzpxjgi+fQfeK9wIyD0pjf98fHl75
	oWWAucsSeNQAUZnic+vuI1GXSRckq1jXu7LL/Gm7AR9l9Gy2AVesWYPLGkJZQjl67n5ZU0QuPup
	E2hNpkQyweYPScN1yQdlq2RDehRqSkvi5c4JGvlImQeGA8c3ZNB7g=
X-Received: by 2002:a05:7301:1f15:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-34271c88f71mr25962029eec.2.1790666472375; Tue, 29 Sep 2026
 00:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <GrS88TFpjifccsmrblR3hAxYF6f4xInMyFabclrH0IMtQKZWF3-tOTg-CWN-ZFKrgHY8G2kAArtkzeGOx2k-OQ==@protonmail.internalid>
 <20260928183925.1315274-1-chenhan0017.work@gmail.com> <87bj9htclg.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87bj9htclg.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 09:20:58 +0200
X-Gm-Features: AclHuK-u0NH_HyN32s019c0AYOjT_lc-RO6KMNAKCvsTyCxRB8XaGUCfIRG7xkc
Message-ID: <CANiq72kWg-pX36jrJy9M5eKMqRHUT3UUEKTssPwfYWKoseYd-g@mail.gmail.com>
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: chenhan <chenhan0017.work@gmail.com>, ojeda@kernel.org, boqun@kernel.org, 
	fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:12=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> We should probably find a better place for these. How about
> rust/kernel/math.rs? Opinions?

Yeah, they should not be in `time.rs`.

Cheers,
Miguel
