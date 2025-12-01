Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C982F25F8
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764599089; cv=none; b=D/h/J0hcmpGIFryzWkhRM5fHn1rXeHhpmX27w5WsuwYw332AmlcBbkmG2qOWOpgynrfiTIP0YXefIkbky7QVo6ptlV8ASn/a89YKKhO7FoSvscEG0RUsDQq+aJ4SLH3dvc3o14iNRoEplG7OAI2KJ/zGIRHJSdu8kOp9ZdQ0xD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764599089; c=relaxed/simple;
	bh=a8EPmF/cC+sqx/oY3kQwLOrt1PAQ2MkfTR36+NTxUvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+vLNm2PSeh+V63EcviY8QQB6kl6VclBjN8UbNc+F1hOEEUrcjBQxrPRW1GHOnpeKQ9EmlrIOYqQuWu5DmsiIjMuE3smWPtgP6/hLtaXKuiifoPplKSahbm4ymD8ADou1VyM4x6R9U3IE+rRXHxGKsZNo2g0hIJJFOPXhtfuLqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkDTV16+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkDTV16+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297dc3e299bso39892285ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 06:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764599087; x=1765203887; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8AWDIp8T2s8X8h6FiJ48ct1QGBJQJG4GkydFt3dHrIw=;
        b=NkDTV16+oUktR098hNmUuI5JkpcpxpZv004lKKbAQQsQf17U2wHPiyXIBeMfmS8weg
         MqZEa2S97pikcva4nkJbVcmoeE3pakVZKuxlPhNnZ0Zi/aFE1uYw5RtK1bE+FWBwMSv0
         6qKRXA4H3Kaf3rsqLF8qo33eQ2gWvKUp1ZGIvK4fr880oZZOrKSVRRBETE7tBeiOXpEH
         eEVhPklPkSnpUvvAo356SGGpz1svhSKqyY3UsitFiXlN5OttweWvj//5/4GpmXqvXTqV
         eq/FCzGKn6ua2uN3r3vQiO1a7nKtUZr0Wy9Klg+CkEeuiKgpawxg7QWTb6sD6linjgUp
         dm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764599087; x=1765203887;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8AWDIp8T2s8X8h6FiJ48ct1QGBJQJG4GkydFt3dHrIw=;
        b=ZaG25fXtrSmgQb7HmCl0BMK8tyNpZiLQ5hD3PDuQZmNQDKje6D6LKom12KT0IMF0+w
         PTFgwLUmOiIxCWV8free8pYGzetvC30j2+ep7NDSbNnCKy0bzAaWhuD1Of9LnulnlQ2g
         bjLpD1J+v8kk4YAxhucrny+ovxbwhNDz4HxPNLhijez2WwdRLEVCk+fy1EPAdKc6mxie
         n1UAkfJPgzc5uGcBdMk/Jkhlq59xDY8S6S2UiZGhoMgH+NIe9apvhfQ5119IKcOMRAYH
         XCZmB/U3TETZk0XRF+mMpn+fxwY9cWq5Q5eZl3hu3jTmcmnA3slIMTyCOegv5rOqKfAf
         sRbA==
X-Forwarded-Encrypted: i=1; AJvYcCXrkfqjt7yxOq5PlOZyz0Hp/kR+Iv9DBBQ1esbA9SgDe4ggzxkOEpFjn5RT0mpTrWeDaKLMNE6Vog1n9gQp+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9J804KuQudlpjc4KIswg9kOMZ+hn/sOX1ZXy/jXqXnD4ChjOW
	M8BPVtqeVluHf37H/Sx4zLxkN7F37al1TsZbnJukd86s5hryZsddRRMz
X-Gm-Gg: ASbGncu++BqCQHcArYZ1zlqZa0wNBOjiuZ/A+ANEQMYBwiSEe72iWc77MKnFXcg13ug
	iVfVViut9RX9yXJu9Xyv+8BTBFovp1Xoau/Ojk20mQG5MhEpzjiCoAkbW0FpDBy86ptK+bYUzc6
	qJCWpMqgi5/aVFcvxPHmoEuspBP6U9mh7r0D5Ax/xv/urqYOzV2HmW8Todl1jptFiutXPPSsZ8y
	HEAoHKJbjWVortPiKRbsipsp9q50aobVlUkciP8Uri/K31WWNRjpyzeptjMLEkv11iI4LaOGyGr
	mXHUOB9C/OjMHDXSPVb8kZBVGQxtoIh2trkGOeRh29+qP/nczjbVINpgrd2iNiJciJDhJboMjyB
	W/vJbsZNd5AHU2fKvMCzQyZSybvmifCHG6NdfXNKwrAPJmPTuNzVkg2V17PyVbfiOxYixp9iY53
	OU+zmMwezM7c0DxRPcTjqtsNVZKVoXpxOJjUs3QhsU+sWg4+DEvxIl4STJZPYV1w==
X-Google-Smtp-Source: AGHT+IHXlL+uz4wzd9pwT3o1SbKlNtJgEl4Czg1l/kyuo15/sZMEMDPmtxHPUN8KgKdvQ6hwhp37GA==
X-Received: by 2002:a17:902:db04:b0:276:d3e:6844 with SMTP id d9443c01a7336-29bab14895amr294065225ad.33.1764599086419;
        Mon, 01 Dec 2025 06:24:46 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb55192sm126853605ad.91.2025.12.01.06.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:24:46 -0800 (PST)
Date: Mon, 1 Dec 2025 19:54:37 +0530
From: Atharv Dubey <atharvd440@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, arnd@arndb.de,
	gregkh@linuxfoundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: miscdevice: use `pin_init::zeroed()` for C type
 initialization
Message-ID: <aS2lJXfXy0fhc_F-@atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx>
References: <20251128162337.12082-1-atharvd440@gmail.com>
 <071c5fcf-bd7d-40da-ad7c-c0edbe780671@gmail.com>
 <CANiq72mh=7nf7P67GFKpeO5temn+QCStPbwjGG2OUxDLPL970A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mh=7nf7P67GFKpeO5temn+QCStPbwjGG2OUxDLPL970A@mail.gmail.com>

On Sat, Nov 29, 2025 at 05:33:28PM +0100, Miguel Ojeda wrote:
> On Sat, Nov 29, 2025 at 7:46 AM Dirk Behme <dirk.behme@gmail.com> wrote:
> >
> > While getting rid of the `unsafe`what's about dropping the `SAFETY`
> > comment as well? As done by Benno in [1]?
> 
> Yeah -- Atharv: please make sure to check your patches with `CLIPPY=1`
> (which should detect that), `rustdoc`, `rusttest`... Some notes at:
> 
>     https://rust-for-linux.com/contributing#submit-checklist-addendum
> 
> Thanks!
> 
> Cheers,
> Miguel 

>Sure,will keep this in mind while sending out patches.  

-Atharv
