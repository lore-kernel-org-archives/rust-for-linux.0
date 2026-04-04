Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DCE1531E8
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 20:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775334529; cv=pass; b=soQ1PO0EYLsEo4r8oHhTXwhe1yRQstRFnCSVft3fxuwh6/J2GczAogWVPDic2JIkDneqfFJnh7h08w44viMdWhmY1U+4jLAhH6yI5CUth71nlgCoMolhteSGxOR9pLU2TRPZC347l7y5VstG9ZzGg90mnKNI2JVoKtY+9pHfYR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775334529; c=relaxed/simple;
	bh=fuYkWQmMSCPcosnkt/+bxaLXK1ECUYr+DyPSImbwjCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tetNIqhgx3cryJUkaL0rjsjBaGCJRzvs4OLxCPaol9Jfk8Lo3+kY04yP+kbRtc9fHVWEiXmZ+TsVWs1cCm+peGkbbN4qyf/P9rvhc9is3MNBg4ic3k1FYdG8Xmu67Zc/zjgYe/Ti8yr/boYYn6cV2eA3tBihrKWPEOwrNSm6A+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkRds59c; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkRds59c"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2cc175eec4dso93259eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 13:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775334527; cv=none;
        d=google.com; s=arc-20240605;
        b=N31TPka8TyXHeepVuk4yOsHQ4Y9m/ExZUYLotlFGLJnyrb9ctM9ZBd3u3ijxRNiTla
         eHAowcNGVnBvlOlD+CqjijOYYvrWh3U/W2CaFrEVEZL9QLz++9dO2Lg9pk/aR1fRBUau
         6e24qDuJMz9cLHUQTDTjUCXClvlnEm3wUe1hQcghuYF5bNdy/ExRUQROq65T9C7vlQO/
         vRzTjYfqZPNsxCNUjtRaEdVAwxtNoKZQV0Az6649MezCTUR1f00KrU6wJ/edLMlUjm4z
         gQWmPUpkwvPKuLzTOb4hd448qXb7wnt8uPxFd8J5+yKm7pLBS5PwwDsHLkAYJhefIb2b
         dxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuYkWQmMSCPcosnkt/+bxaLXK1ECUYr+DyPSImbwjCw=;
        fh=TlfV+arJ1eo9d3I3v1VmBlDMw+vpQ3TBcCmO3KRLFmw=;
        b=ZaypYq8z2mAjLFTWjhuscx1qsfg/0OQZc79gCLlbHstnkLkzyaznd8V4cHqxYLQPv0
         YqL+W10orwLVIpvAfIENYcpwmCDEYypRjP23GUEFcaljBkHkns3Q8XAgZpTzKqpRs4o4
         Sj/U08biR0tEytAOjq1KZaw2Y8gX0a3ruaaW04pS/17x5r7eA5VgNuzzgmgGJF+7yqOP
         JMBXJpu4IPx7hgTkO5PW0CJZMuoceFo+JhACuBtH5LoBbMtSBq//v8JeGXnw/AN2IT8p
         /GnKE/EBZp6pid11cewe5/QDCsbTOa+fj5YVY1ia/03qbiOykgzxtXf27E1qsQHglRki
         iO6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775334527; x=1775939327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuYkWQmMSCPcosnkt/+bxaLXK1ECUYr+DyPSImbwjCw=;
        b=SkRds59cRv7zvIuH9uWG7tW1kkD0+z1H7xjSF+pnkVhmcBHLzv9lYwvWMk8VmEcwK3
         Ebq5da2Rbjn02vycyrUmu77rbSxYd4uyEvaamzFE3CUSwoZ7PgXtx4/lI2ONdTO4aHj9
         7Kgp1D5px6d5it1cVTjkwqPODDzZ/oLSTsxnwDrGCuWpJfIL2vByO4YwmD2XDtteI3aP
         g3YvNS5N/h0kgMz6mobZwq56A/jDBhqQJBrp8eNZXqHETV7QMpCo2VvYJSWRLmktw7Vf
         ySUq+Gef5lnMpUUNeVr22F4a4thqa61FDbJlN5dZZd10QDj70zvQ7YureLsI+6/HAtX5
         bVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775334527; x=1775939327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuYkWQmMSCPcosnkt/+bxaLXK1ECUYr+DyPSImbwjCw=;
        b=qN3IqgihWzx/c1wKhVZABhV+zVhcdGghrTcef++9LKRi7dkb8FwzIXNf5X9/cV219o
         drzQb+vh5DDg1Dv6KK/kjZZdpUFRhzcrsZOMGW3DztfBVnuiMQDFqdGaJvz4frsiDKDO
         Y1R3i849ONN3HXlWviF2rZZcZ4Xr5ekTjpzji5uN49bFnb8rb9AxZCkGS8YRM1F2Z0A3
         EPsthPWrruP+oIKTKG33DTQYAaNrz3/DtPf11u8UOYnRQuqXUPkK1PyGWNsed2QwCzU7
         c1bBCJ9EgfM1ZVEPZnnQvXedfPI/h3IXeJYEfHreFyrgnhUxaYnj4dsXVTYqx65bj5BM
         LeNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsRZiV3qz6sLNVqeMaTdZRntKZizheyTHhdhpxhn4h7c7W8wsbGcN9tJFHVCuegw9LYLhcs7UC1TC+IIjDgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlFejNZaAjS2GGhy6F7xVjCJYaoKkRYghwmSpxTASCwQoePznr
	eFFwjDI5iF4ffLDif4x1Ui2d9uY2esb8au721jhiGopaU2xp+cPGmtE+EYgxNBBffzeqH4qdtZh
	vu0VtFmqDyTkw7Qr9NS5xOAIwJTUR9/A=
X-Gm-Gg: AeBDietZrfNKqZ5v2HL4VcDA+0GJv5UIrL+jSNiQQHDt2FVF1t+bKib3P8bUOthjgcX
	QGluBQwqIGCQ40XlO7O1gyWUaFcjC0XFVcHcmoXaKEtJV7ReQhfraTkGIm/l5hpl0l4OM6iGKN2
	9anJO/hzTS7C8CLwDKHsr94J0Oqqrsi0V9IKJuwJjNKiO37MG5c3B7Qkum+Fl4I/NMXkNjWyxk2
	4rIFIzY3DuJMPpMwwDyycmcI1qiqvyYbA2xNtV+oYn0FvxklPHi7YwIYKxGOUI1ESP1ZRdvzja6
	vGVZOPdae0xNXW77ZFrVBsIBnrBC8er1IsUaUuZdocxyOuuUQ3Xe07tc2IjKzS38GHN1FtQFxDm
	zoq6ZSP1R5q/wzcTkgfOP+bW8LaLjEJ26lQ==
X-Received: by 2002:a05:7301:129a:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-2cbfce5068dmr1382909eec.8.1775334526875; Sat, 04 Apr 2026
 13:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403145308.1042622-1-mkchauras@gmail.com> <20260403145308.1042622-2-mkchauras@gmail.com>
 <DHJM52JEY7D3.MGKXTZB319ZL@garyguo.net> <adCHe9rU_azp8svx@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <adCHe9rU_azp8svx@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 22:28:34 +0200
X-Gm-Features: AQROBzCykZ4QROsJXifMoD7BMVI05gD2ToHAxvSrZBE2nSQXFDkyMtGKnsPYJAc
Message-ID: <CANiq72=chqViRu08TxDBA9k3fpL6vAVzvBnTrkfY7jM=FD1afA@mail.gmail.com>
Subject: Re: [PATCH V8 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 5:39=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Yeah makes sense. Will send out new revision.

In addition to what Gary said, I am not sure if you will need to use
`abspath` anymore in the new one, but in any case, if you do, please
clarify if/why it wouldn't work without an absolute one.

Thanks!

Cheers,
Miguel
