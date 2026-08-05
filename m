Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3747DF9A
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 16:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947058; cv=pass; b=X4ZSipSGG4JHM4wjh7+ZxbeHee5e7+3RF37q0JnHYCtsQ3hF8EzEerx2i3uEjNW6ZCTFt6pxqmdifastazsb02gNkgqXQMbBiyURycGLLpI4lfWfZCncn8A94O/wQ/cUz9apbBCi8BMf43PdOBybSIPVuU1TKQ/Y5ACLwX6rK5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947058; c=relaxed/simple;
	bh=rKAZ3Lkdt6WEA5wFMWmLMVDk2hee68HtY6N4UyDz42I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrBH4C3wSKkvQmwmiZGe1xFa+t/v/EwJ9Xv2DAVIsQeGrY0gvBYU39xZRjQcTJzcZK6L6tJ7zBwyQMhnfnOmbszyQZsdaKWpDb+CsUx0oMAb+KmBnvyDo2oxm+8P3jZZQft+lXB90b2TLu6kBbkBEVj0vjz9//IpBzhFwTibgoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJA0Bwk2; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJA0Bwk2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cffd93cdedso1747495ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 09:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785947056; cv=none;
        d=google.com; s=arc-20260327;
        b=Vp6jGhloCXCiCvdu35YwyfotN2Cp1md5056YX1VOcMN8ehisT5diSBVQpB7jzKb07n
         s2VjN/Rq6avVYKKe95RgIuazshPcU9NrHT60lyqpv94kS336IjyMrATN2/wqhoID1XIY
         Fey0U2qBF/3Va211RzBZoRH9P/Aj4I6BLp2xfjkwt6AFesAIOLToVwB4iAhaA44A/sMC
         RGQp+NWrWq/xeQKcyIBau/1f71q5b+B7zc0XQfL5jbDsedGq4mUBcmT4okin/cA8UEKM
         fLb77stBEkt0cE4YEHXK2OHU71U43kQLSYeVOADXEhPZfhxx9ieRWnkLEdF15lL34Zbp
         BBIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xh5IJEgMTtV1LRctkdQByNw6TmfCgKyTJ338f2MQFak=;
        fh=cZXZlh4NxzQgHKtNfEzKUMlHCwb/9evA4GPAVtXt3nY=;
        b=SmYDpki7FLyznWfh6hoep9T9dcZOhYOWyy0Q1vJ4mMsDSi2TWDzNIaMNtIG1gxzTZn
         DcPETSLkvaGrvrXtAqR5PVav8V21oRAiWd7UUcRhKKZd6/lqxgP236ADgKWNlhzDYUQm
         PSz1D5Fw/+kue7XyWRFctUDh4yL3oI5WMUOQ/ftCssLa/QYkB2C/QkLsL2SGH3dL3Mex
         QjcYMWX+TzE5Y/5uEwSwznt05dmWZTHx30LM9qunmRpJSZmA+qILb36hZ8IP12BIl1a8
         plbXJ80QV7o6uCvxkFJkvHsOHnl/kSEH5CES4nEdcUTcE88s6hZnF/d6I/GPNTez+aHo
         Zf8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785947056; x=1786551856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xh5IJEgMTtV1LRctkdQByNw6TmfCgKyTJ338f2MQFak=;
        b=IJA0Bwk2Hl6Zf0FnJMyrHsnXW83KRxgQypgn6wDjH9LVPmEUBcsL359jbmDwvv03jT
         1Pi9sJqigcuuGcRAIhha12HDTemXi+AKWIPmCV7wRsQGy1xpE2sbw7OA221ibQF+bQiA
         qZjoeGvWFaAL+GLRhg0lcQFhfqaSVFQdesCMuXMENJW+IfGjHk+NRIF0TTAjTB9FdML+
         2ITDXAMBaPuMyLfwEz5nJ0Yyco85147N5MjmhzxHkoW+F0fwQatNG76jNPz3nuv/51Dm
         PKMnMAVvpQH7bKtTQoI3Pi+4zhalsJT/dzksyA7yR676WLFn0XjwAhj22tWLfjbAdvI5
         bZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785947056; x=1786551856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xh5IJEgMTtV1LRctkdQByNw6TmfCgKyTJ338f2MQFak=;
        b=TIbSUlXG4h74lH9bDV6fHSs3xwXuEfaogwGQRvZhCAwnxaUJAsW4oIqc6MyqIFnMqX
         TCGJpaRWTU2e/Bz5lpO4Q6wckUmJtTSMCD5f72HFtC0ncPtzY2x84KHz3P8ZCe5clZiw
         uM9JeFEXGsJebgefgmPaM9kiD3Zk9eAh/wVe3QAGTZ9UBk23ZMg+ZpkLb4G2xDp7MJHA
         1Fz9P9SPiFxy8teTb7DVt54/N+i2+SN3z1cGjnLh3q5JSx9BKINRMjwMsFoaN9PZPURx
         9xukADAIVhvtvxYbdqP1/7nj4fCkRfHwYO6D3txSlJzv/m45J6SDmIeokRROVgmxLvJK
         ZvfA==
X-Forwarded-Encrypted: i=1; AHgh+RrDi9Kx6PiP1PLXK/aqa4GVdnzVVChn58Z6ttR9ZlOk5luLRKehHwLbTP0a7muiwOtfM+67t1Mb9cnuGKih1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwozYJKhDiuquAmGLk2MPumes89KSlPEv4MG1qyz8YV6Yjwx0IG
	C+Gr+xKLVMfYoE6u5gdvIH0fXs2VK0H09TQb1oLFYdrKNzclVRa/tHnf4uZwMVPSRfNXDYr94OK
	2rbwCghYhpjPOPhXiXFmstcCseqN2mr4=
X-Gm-Gg: AR+sD10b9sH+MAB0F/vfxgOkD/AiyDUiwqnpS5LPYZ/ObHs3klU7D1MJOxzbELQDTC1
	ZvXkcPan3kekdT3tbk4SgfsEUs4JeowKWQzWRCHedQtF2l8I+S8dnO1W+/ieSbtcibDgRTX1EZn
	hceBM5tCfyOE+WAF4nEQEIUyCx+d/G7N7xlch/JjCDlbBmExvsW9TAQSQcogv/h7P3WlgjuHzIR
	dTgra1lxkR4hRzIcoUAjVBF1Q8iqtki2RN052J+OFgZBcAFOhaLKrn1edRZD2oUMI4AGqW4AEFL
	zhOeBYrwLQHoIVW4tNECwBy5odFzMWVHRwMqWyFuFJfXy4ecFu5fDvBuqqyB3wrT6pBOnUNoRDz
	fDMXJsGuQ/DreJ1ld9ohENnOD80WxXCl3UryvvDFao31ew6qtIP5jk+XHJmA12fbyuqHB3y0=
X-Received: by 2002:a17:903:468b:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d0ca761dffmr69410425ad.1.1785947056397; Wed, 05 Aug 2026
 09:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731122826.737703-1-spasswolf@web.de> <20260731192522.GA1014697@ax162>
 <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net> <anCkbMyUIscmAheK@tardis.local>
 <7c39e6cb-0ccf-4a50-a853-0f6012b05044@kernel.org> <DKFF147BG8PR.I12RKSRFQS1B@garyguo.net>
 <11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org> <DKG2TQ94TGLB.3EO7ZNVKB50KY@garyguo.net>
 <7189ebb5-ae48-4466-9055-1ab1b0b5ef7c@kernel.org>
In-Reply-To: <7189ebb5-ae48-4466-9055-1ab1b0b5ef7c@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2026 18:24:03 +0200
X-Gm-Features: AUfX_mygijAuCVxeQaTTUH-pXgVCFiiXo2upSYBRt13e-biayo0C4LzxsKAA0vI
Message-ID: <CANiq72=Y1eVO5F0j4NXbnUzVvEnDGg0evAkeiE9hd-7hkeVr7A@mail.gmail.com>
Subject: Re: rust compile failure in next-20260730
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bert Karwatzki <spasswolf@web.de>, Harry Yoo <harry@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:35=E2=80=AFPM Vlastimil Babka (SUSE)
<vbabka@kernel.org> wrote:
>
> Thanks. The slab/for-next branch now includes the slab changes.
> The merge commit should thus perform the rust/kernel/sync/poll.rs change.

I don't see it in next-20260805 -- Mark, could we please get the last
diff hunk from:

  https://lore.kernel.org/all/11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.o=
rg/

applied tomorrow in the char-misc-next merge? i.e.

    -    rcu: Opaque<bindings::callback_head>,
    +    rcu: Opaque<bindings::kvfree_rcu_head>,

in `rust/kernel/sync/poll.rs`.

Thanks!

Cheers,
Miguel
