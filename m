Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F94311946
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Sep 2026 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636274; cv=pass; b=lW+LS5G8TcmbrD14AIpMezfMIr780V6Z4MKxtX5dgwGjJPDx/Bd049xgHEmqMuKarNtKlL4H2BqaITJ/o6zkqk5apnnZ5y+AkFGHy2niXtOssX9Q2IaJDmMaLTprhqNzCS+EpWT4uWGH2Ayy+86ak1UWaRlcbI4XmNnut3G8+CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636274; c=relaxed/simple;
	bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3Lcs7S4MsiVRxVRojff+Fw1jSzr9UkKle9Ig5fS1qF/dSmJDK8DDklWC6pYd5Dd79V9VS+oguG3QIQ6teBOzas8Giey1iH1XGkdxQ1iHX5D2qNRR6dt/KdAjBsJGp3Y+GkkmELXtc7zzQ1xr71Qd7D03G1D93Lla05FnM/Kcls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E01k6EvM; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E01k6EvM"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3936ebso245605ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Sep 2026 12:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636272; cv=none;
        d=google.com; s=arc-20260327;
        b=EAlnB4byd2zFxaBezisyGs875II/8HQE4X82CnpRfj39xlXXR/0Ff49adGYYH7P2Og
         c2B/pAXwkJKSamxLNPx4u4Fe/W789uJfEnLHOBQoJY3ZBtJYdPTH8goe3JvMFRdLDQXz
         m3vBcx63OXN7V0h8ibju8xqi29TmdszYxAN3aQwAqtbWZPvPrcNvmH07Y3jaTvFpn31n
         ZnI7b4rAaxVOFmcmOUHGPUuQJoeGl63bLyRW3IXhzwvdxYNx+97mBnriy/Ctglq0rimf
         KCpK6iDGlLHqoNK8/Jazz37mgMo09fhMCsW0jSkj15yhd8C/u2Zt9gwV53/IfoFiHVy9
         SobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        fh=odwBmr/d1vzvrc6li7dJWiJfL3ADMwd12aFndTxIOKA=;
        b=ZzI2oSbZTQAXB6FuCnmehQSPeou1jgLOldV/gGjCiMRjKoTwIQgDGSomgcriX5AxHG
         cCQ0XfQhwVCyCPOXRbZQX6SnCp1v7NLAA1nlYTG3+Z8Of3VARVh/+o4yjYsXvJmnkKod
         DVShvgmBPHY/ZyHYXs9A0uz2paErIbiQMXaAWewu6gsk3kJxq9V+XnKp8MsnfeMrcfnu
         eNxQvslTwS1MKQrRs5hkP1Uen0TSnIlqMLzxsnetCME/jR+daA3RlZZilETDqAteWhs7
         dJgjJYRkTH2io4EG+Q8+NNzezLWLwv/d4xnfzn90DuUGeZfyBnIEo6uQQhnhBaE94MAB
         BwYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636272; x=1789241072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        b=E01k6EvMRCFlA72sItVAczr26BLEIdBhQ+4S7l9a9aoMpN4eHz834G1Frh49K6U39i
         P25Cc2UfV/I4XiAE0p5SqR3/CfWPC1wi9WTR20af6Qiqqtd11crr/2ZQSsOJ0DkSQNBT
         BmPhI6D36DGYJDm8SiwaD4BAkUKyEM1jppVyRkVJPKCir3j5o605evKGFaSrIVuGeMrY
         8aPgOsQKePUSw84U7ZeP6fx1lEIpCMp/xgAtYbGq0BJB+6pAeTLQpux1n1XevSKlA2c3
         rswB+w9JunYrXxbHlR2VzjM9Nt+d9hYB7sYqMfNt7DmB7tDyb5kNSYTD1nvNWR0Y6HUu
         GRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636272; x=1789241072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        b=G29yWWmtxipeHK/95wVs5YjLXM/HLkF+m00aQYhzdwqCBM18aCXM5FqMgL7M40H76O
         wMBG2UtDugwbHZDfN8bQg1h9RVVZdMobxfpan1uGfYt533K9NDhBiGnxD8wLg8Sk/0RO
         0XXzqRDYoCjtYz2pQPOxXNReS4MDh6jA1GcXqeLu+5bmTD3KLWHLrhs3IqfFaLE+vhHJ
         ejcncSkjB16dks77tujta/EB+mVm/oj6k35W30u//32KKTQ3rIdmk1NwHxVbJIkG6zdv
         7qah4wiw8+IKxjDp+W9XPbeKNDmWk/M70P6yBtP0v/Brzf4LV7vjgyZi6nlBvm0Z8E09
         zqPw==
X-Forwarded-Encrypted: i=1; AKwUvBxQl3ZLJvV7XjPC3SlyHI0juhWr5BFksxVsLkLWQXrmZHOdAhdOqvefF9NOMcJfE1IFpKTO0W7uWJG2elBuFQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lW7xXWOZy+a1iMdYIZrQ9nWo4HdwD7DwM3Ov0cayvzib+7WDjX
	BoFrOUC1JLrECrozD3wZ4kOaEu1iF3RS9FDmHBaw1VjwflW4q9LiES4z5rOXW4D5+gXD+paa9Mf
	uUajqttKfAW0lRqOrsRBG58RzUsiCtTo=
X-Gm-Gg: AYBFou3xZjz0M2GQ0unI5bOXxHYxxRsDpiIjgfRjy4HfffddPhrhHDqpi0CIL41Zjcc
	6IKEwRmhud424dRqbNj5LviX+DFSP5ROUSdDDSwXvMnCSCzm3drDterPtTJAhSy4siGucV2ZQZl
	vCrMrm40jorLcF02pFIXwcuLqnuxurWlclKKumzmn+c2GrQOKWkCIBDmiG+9G2rtaQLWrnqtUXT
	PLRSaAAisTPHKSlbUCjmjYVct3W040CA3GVtjHeufwsak00g9R7ClMjiwxzzHyVcOaVY0K1//nU
	XpmoDVSvXoa+nybRhrJl93Wf1e7kJXHtM3XoJOR36Xrx1CN06MYd3qhyFubVRlWraWF0hcgGrA6
	jqCEznHM7cEXloa6oByC+wldHNde6zQ1dJOupBbMqyAC9vVT7B9+CAZ2/1aGp
X-Received: by 2002:a17:902:ce90:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2db2776adbbmr63554785ad.2.1788636272311; Sat, 05 Sep 2026
 12:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net>
 <20260903192248.2248560-1-dakr@kernel.org> <DL5XG1N71CVV.TOAF6XQY0SW5@kernel.org>
In-Reply-To: <DL5XG1N71CVV.TOAF6XQY0SW5@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:24:19 +0200
X-Gm-Features: AcwNN1VrVIX1rn-ymHE6KZVlOZK2RCfm_y-i_dbObCbOpleHp8K2ryo0MaspaGI
Message-ID: <CANiq72m1ZxFtQjm4fUAt6Y1MFE=ww6jx+dEg3F4Bqbki=ndO=g@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] rust: io: support register projections and
 remove relative registers
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 9:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Miguel, Boqun: Please let me know if you are fine with the two
> rust/kernel/mem.rs patches.

I see you fixed a few nits -- I pointed a few others in a couple replies.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

It is nice to get a slice of the future of the standard library a bit soone=
r :)

Thanks!

Cheers,
Miguel
