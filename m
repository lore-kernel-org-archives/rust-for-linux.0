Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E375543F081
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609162; cv=pass; b=X2Zzxf20imyFBuA6KwTwjdmt3+D8Mbeb8QYZRlk+12yZ/BnpnUWYW+zgG6yAmU+0IivzGxyck4pxVRYb3/cJweP4Yj5pX7XTZ0D5F2bK62S9OaQWELZBGF+rV8qS5wT3ZR7S39drcj0+zApiZmrdV220ziAnQizU6JSfAmteMwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609162; c=relaxed/simple;
	bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z943N3QTyd0axtMj/2oFKKXVqPpKHeM/ByBwoLMx1WlhiHhvbN4jadzV5NLI4J9znahE+Gc1xDcnQzWuGowMm4HsCDhF13hq89EawOOu6VAXR3Neg90GLGE+E175hykYhg7a7feBjGuiyZOHc1ad6Py9vZw4NQ8DaY6jNnQWYTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiKXJg03; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiKXJg03"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-392af6bda98so354687a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 01:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786609160; cv=none;
        d=google.com; s=arc-20260327;
        b=IbqKG/cFR+PYR8G4ZezEESdW9XJzImWur+BBWG3Y5/tactmCimlH+5FTNm+AhpWYVA
         cV+SBz+ui3e+GA5SdJ5cyWv7RfDJ3F4nNyuDtiUn5Kh5A3lM00uDXOV3HwBHqf0jsRGR
         je8Vkz3/TDzvKbQvH/7gQxTZKqqVT1ZznOpByh5seCysmMHFg+MSIWoJY1+hBaamiHFm
         mY5gq1JuHdzG49kQA58wlN6rugBBoNWUYSF81FIub8o/Ji5bwHEiRlv7vKQm1icMU40V
         s/hywt/Er3PesGJLoi2JAeYUqLoB5geCCVDp/s4Zj6fPfIYHpwxZqio6Vv9zCKUS2U7H
         QE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        fh=9NtskMGKd4V5LqSnlJgsxSGJ7Ny5/XH2Y//UlujigCQ=;
        b=OyZdezr3/U5vBr6FcIE2apyY8y3BkysH3gRrbr/5N7BMAsFn1CIrji4Omui0Ie6ZaL
         5mvdjj5zMcjdUKgN2j4haTFc6IaSIZuB2xs6guIiXrgm84OjGUFIaUHZ44RUDdOhPohy
         uhft4K5a2GCvrQNBKxOIjZXT/sCiGGNnnHaetOaCTKaGykICuYi/iMQTGW2PwMkE4QTy
         67Jh+u10Hc+NMC7OG1rcV/heTKTNjW1YkxrPXuP2jqF5hJZGXoziVO0j1n1ixxHdD0Ni
         DSjgf5T/I1S6g3GTvlPzVcn5M7Kwzj0mjZkJLvUdSj3Onhm2aUctvFnswjBh5megeeOT
         ohiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786609160; x=1787213960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        b=jiKXJg03ISCWp4I5Y7ccPMu321Ea6AemOZfQWlLgVESV0Vh7f3GfggkE0tt+xWkPpi
         3ACJjmUZFwOHd4xdX45veGxbDPNmBHmWplhxbEmy/YKTVnkRGV5Zm9dXtlcLWuYbBACn
         M3WXqdZUW47hmbmp3YHhFoRMGh3/FL8SbUiZfcchHI4i43vXfNupNOt0MQTPWpD74ajA
         JptqLcLrvVjxvvALg1i53eNw8PTMq7AS0IgAzYWk1XBV0I7Hygmf7Me67r8NWsjqbyY8
         7GNl2JTiQ+PfCLX7//mzkJspyqK6oK7NOLXJfN5pSltReyQsGmRqKK9Er43gYXiqaEdn
         Bp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609160; x=1787213960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        b=XOGz2POFUSPoqW3PD/Y5WgxlVfYy/K9PvpgAF/mj3teAPT+w0xxymgNK7paMZVqj8b
         +q4Db7lKIGeo8uJCMcYJnvX7edtl37STV/QDJq2JhShbN7rvksgyYUutr/u45GTa+dzu
         wYgKorTaKoLu2VLDw7pqFm5NZPUJOtpChlGpJVc6eSBbX42MnyLjaDkwRyhZrQu3H7v9
         pCwac6pj5PkW8gcQgG5km12ePvyiHX7OKKr/ER2VIEGI/4N7K0DwvISfOfR6pG/RwrxV
         fi661cPGc54ml3SxQfdT97DPemMIDHyvgnCftn4IE4bxOp7qRuiT3vqw6Ks59mlsw59h
         uTaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpe9/ovb7lTbQLtox+7G1HmhDx+mSltCWItKejlxNYKW8VR5ulaaVu1JzcxDV2VErBiw8P8ko6OfIG+uqCBpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+uf4OxDVRk8W8k9y/v95QiqHGOfR7t1fuZJl5xaLmETLBw+d
	NYaD4+oLgAtx0huDvTGCS0KDBJisQwZK4MKM6M09WpHEGWxH0zYPoHeX9RaznJlyA20Q4TdaDsP
	yvPCfWS03JHgKwlgu2tUXJOIXcazBycw=
X-Gm-Gg: AR+sD13qzGzPt+w8YXWjXb6OE9lAPytIs0bwTZzrMfsZtz/4ghVpneZN40OYnZvu8wo
	3QkY/lBCP+PIcBpmBX+Ui4+4AZAJ8j3QbpxoPe5/5+ItgNhq1UBdWvi7bVdDG1I1IQxRv+l7tF+
	ih5sA0WIM9ONGuIhdSiAK13lG7Z7JaDo/rPfk8/AjcpIMLCbK30XxY7eQiq7vTN5BfcTFdeO7w1
	eTcpISePeQj1TfpCQhfsuEr8K4OHhVp2PwsXiRvjPR+1gsPRvwWHbkhCIGm0yfV6A/5HGpGTEid
	Dj8qr/jA0CeDYRURo3nTbTh8Hrbsk+h7nyGf7U11xpejIsUl9KIDQRsvrR3N4YjZCc1akh+w/j2
	17trlW4p/o6dzlEVWA4BsgLH7jrSCj8HF5YmyNAE94Md7Y7nTiy3u3t9VzdhMOswRJ1B9vos=
X-Received: by 2002:a17:90b:5807:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-3931e2aa828mr3336244a91.3.1786609159836; Thu, 13 Aug 2026
 01:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com> <0102f153-154b-430d-a3da-2c8423fb3f1f@linux.dev>
In-Reply-To: <0102f153-154b-430d-a3da-2c8423fb3f1f@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 10:19:07 +0200
X-Gm-Features: AUfX_mwh5p3w0RKVhg92eH8jsf5k7VluJKRFIvAAaH6tiIul7a7G8q8L9_4Mlig
Message-ID: <CANiq72mcFp-MODPkNGPcufxb0YhPDO_eN8J-ZFVzkd2-W6VK6A@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:15=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
> Thanks for applying the series and catching the stray Acked-by.
> It was a v5 series-tag, from before the MAINTAINERS patch existed,
> so no need to re-add it. I'll be more careful with tags in future
> submissions.

Thanks for confirming! :)

Cheers,
Miguel
