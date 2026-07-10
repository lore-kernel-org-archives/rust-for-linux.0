Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFDE2D8382
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 17:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783704848; cv=pass; b=a5WR7/mSeqAsXZDzsQ1JqjO2zCrnnK+nIQPhnjfv/cO/6pibljlfczljaEYz+6ORn1aNA9+DXBonAmXlssGu0IaHu9ajG0mtJpjOYvdRemlPoq08rzhsSTUOFPRTzEwxYILuhCPLq4Yvqgg0Jj+GH8VIX8eiiG5tZLKGZd8D9lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783704848; c=relaxed/simple;
	bh=LxEPjIVzrHW+ecMfzuce5pnKRet2GQcLO4lMpP/KG8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lggNVTqXnuxH84mRCpiWKkF6SIdcSYmtq9Azy7kJVNNkPunlr7xKaDJtSRrWZjiOiPsAA3zlIr9UWrAWR44Te9AqJ2IWx+pd67UcarF/HH1DBiLG5KrZpdnv6TEquonm64c6kTzmc2saxvU9vMuEx1N7LQPXbZiWrZNynk8/A6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEhC+gcV; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEhC+gcV"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-380a02c71e2so524704a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 10:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783704847; cv=none;
        d=google.com; s=arc-20260327;
        b=Yc9/d+Vfpw0+/jhVHYPH0fsN7lw8OmkJfqWk0hK+XkNZFJB/cZoaPeVeJ+HtMFfv8U
         ikU03kGSWFJC3WjIr0h3wliywthD8BY2eAnV/STC2CElgYuY2CV9k839CEiOCrJhUrGp
         KuKah5RUc9yxiAgR7/lxX/W+z3CfpvL6xeXbnQRZPGKtPnwxMscTjrDksOeKXSpacC2K
         8Ao9i4NKFkRI3wChSNP3jmieuxp5JYBQGoMXnv7tQUwJYexupaQKjE0SV+IrqQl5W+DP
         +d9hldQKrHVFwRylP0UXoTHKFutktb0V/4Fu6y7CfDk2kE983up0EP+0ruXzYHOlxRmS
         vWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xrN4t+c3+bp30MOSjaFcq3FvbpeuOxTLajWgTQ/N4Hw=;
        fh=19e739hrgWSWz69LXr2VNCgFAXdQopU/Zo4NHEZqOf0=;
        b=QHawci4qWxp6IoogPqCDyd5AC7ncGiLlSMlt3CrrI2ufBj+zgdhOJ3HTLjWPDRfpmt
         vnvQ0zqHispUiCwzrq2LkI48XcffSATzkvfbqfINMFqmkoznEF7FuUH3OiaH0qnCoxdR
         e1t4qAYtZbJ4qDPTZomtp8F620mLx2NT769dmparbcLvJLpH+EIy7VvYJ6LqJ944SL2Q
         o67pII4xCWSPKtWGXno+M5LgIetDYl4K6A2dhmEc9E14cAVGVamldOuCZImeV5u5IV23
         q/03E9C+tPkINTt7oSs1WXKSGVRa2kiXzm6FhA908Bs7L+ogZVSQNTSoqKwXjFo7jYdK
         6gCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783704847; x=1784309647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrN4t+c3+bp30MOSjaFcq3FvbpeuOxTLajWgTQ/N4Hw=;
        b=iEhC+gcVw+nm7WqUFbLQOWWrCsMnoiXbYR1ssAZluqwOTL1fRw81ZdUZPMp0G654M/
         Z3k+fUzjHNkg6eQ3sc0/QgB348XeoAZ0nNTPE8TplQZxfbtOElWnyfYrdDRRgVSYAxNT
         xNFttw1PC7lzMApoLhZ7nlfTXmtwwF95kKAjbXttY+i9uEVU/sz0tBXSTqh3tRRDv3iO
         CrjrcbNJ79XisPq6/z5S6yNfNQ+CgijBuApa8qFCzf+NSfOL5QID381hz99Ju4+DAQ68
         Zacx3UpAmfbQ++2JZxYq3EFqWF3/3ZNCLSRdGmfVRP3CtwQBWVTzGHC0D93mecQtxNVl
         /t4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783704847; x=1784309647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrN4t+c3+bp30MOSjaFcq3FvbpeuOxTLajWgTQ/N4Hw=;
        b=pl7qu/lnUAsJRwFZypP7vIO5UCHEstE6vek58QKN1ynTwTV6Pri+HL6g7UBmbZohxy
         rM97mZcyC9lBHfHSsTSblyvIdUFEvs3DrYBh/1Dc8gEBX8iikGEz3pRXQiT58Thk9SOG
         pdM7Ibeq9Wf2ELWsKPBeDgGbazqP9uy1LesfN54b2EdBsfJPdiPOkCbvF6dKlDRHxUQL
         lmnu6YtNwdEFv0CyuUxrGbM36QSuJY+bLSZfIrNq3LkdxI44W0SxmJaoLuT6TCn/JXPT
         MC1U0sN5v941za+7ADsHfkXt9bPpTswTp5nXVMUcnCGW0suRH1NO69lSpN88ufjAi4dc
         wdDg==
X-Forwarded-Encrypted: i=1; AHgh+RrEepemJ8h0I2XqOtE5q/ReWUs7WJ3YNa5jOk9Pxnl95+1D4bCcz3rLew8uuNo6/tETt3GVLp5vGcvkVAduwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza5RkTIpTUQHkWJrSzxjldPWA5YClIEMxEVH0Pl/hZvZ3cvetR
	YtG6hilSkEeiAZ3g8oWKiH0wtNe3/0gMbTP7ZWbkQT0iYDJ0iD1xf1dn6ZkrgbLobeMQc05r5Pu
	l3w9XNkWp4jcR4uhXdEpB+JKm1H+if/A=
X-Gm-Gg: AfdE7cmHTYhCxBfF6QO/AUP9pNZNqxN83Qp/4Zs03xmb5yGSTKBa9RlqyLTV3UCvsIr
	4RE4+SuZQb1lvzm+/0QPfNsuVGqlzZjxsbRGrJGpjjR3/9wuJXrtZ8bkkvtauNS5FPJyioZCjoX
	y1ZQD35bJsBwgw03Xb9iAsRWb26z48HjkrLuBLFsqJZjettJQSXvak9q5UxJUhIl55LHOhwReHY
	8nmOhBzmflrjs/FDRSZsW2FQKfdndgc7+iyj7kTVJnlUQmioiABOloD3enj1U32geqh8MW9vrsO
	tEtpsyl/couXZtLNQfUWbKwZhLC2y2j3y/poXmycmokRDSLo+4T5Wp2CiwwtLN9Yz/4HqRoJdvY
	wefsQl0HPavGV
X-Received: by 2002:a17:90b:2d0e:b0:368:b002:bdad with SMTP id
 98e67ed59e1d1-389421ac44dmr10172029a91.5.1783704846625; Fri, 10 Jul 2026
 10:34:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org>
 <52feb9b1-2073-4fcf-b2d1-a7f42f1e72a5@suse.com> <CANiq72m3w7L5CmAsFvOpSh_jNk4jL8+A4vz8GEp+E8FY=TJcRA@mail.gmail.com>
 <30e500ce-e9e6-43cc-bbdf-ded7c0ae56cd@suse.com> <alEBInX9gD1M5NAr@google.com>
 <bd1f78bc-51b4-44b7-8e3c-7accc9e173f2@suse.com> <CANiq72nxK=nCf7C-GQ8JCtaTnOaDGwGDFKoQEVb4fqNonkKn3w@mail.gmail.com>
In-Reply-To: <CANiq72nxK=nCf7C-GQ8JCtaTnOaDGwGDFKoQEVb4fqNonkKn3w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 19:33:53 +0200
X-Gm-Features: AUfX_mxpYRAXpHh167qMfvyuyRIHpVHXCtc4SQ3JZqk7k3B7Nfp8isZoobBknGA
Message-ID: <CANiq72kpR9-7_WLzt1d4FrvMwwMAmvzuHexUXFE69zL4pi9o+A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: module_param: return value by copy from `value`
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 7:00=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> It looks like `panic_null_reference_constructed`, added the other day
> -- I will send the patch.

  https://lore.kernel.org/rust-for-linux/20260710173252.191781-1-ojeda@kern=
el.org/

Cheers,
Miguel
