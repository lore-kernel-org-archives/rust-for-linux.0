Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC86A2BD0B
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 04:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748315; cv=pass; b=YqkMahNM7lVpnSs1CbXErU5fywdoUICLRnn/fGWrJXAzTDdHk9iXXfydu404DKoFsPW+77oS+pvGOtggwzHSY2r3G1N6uTg94xsFBEO9H/GcIPrvPRfrnkOUTCqDPK2HETbTncdfY0Fuu3uV7QBvqrtb/pD5ZLwBVFarghn3hec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748315; c=relaxed/simple;
	bh=7rZc4DTOa/koN9gETmFecGyUoKFNaVk9O2h5K+Ma0D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=do+38ZFbPIK97V+0UrFgGtkJr85esUSbDdKk7pYdvllEkXPbL/ZFIM3whC6vDc/9ja6nHRZyLGUd/hG2bSSmtOBpj1sD6UTjtaJg4984GE0tCMc8VNaqF0WHRjtDyzJVz4eBXF2nN2ZexpsIoEt8zv9XajqoTwLHDpedli0k1T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMd9fUz8; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMd9fUz8"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b7063004daso18416eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 20:45:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748314; cv=none;
        d=google.com; s=arc-20240605;
        b=VzKUijs/Gp6UUcji8YWUsmi/gc45vSgv42IxUcw0surrozMA7anqmt6CBjPe+CDlhC
         UbPbjgqc79ywLmmbeP6+ovswmvu0lDeVqEAnrf7eBNStAt4hNMP6jJYTi3okwxvsXuGw
         ACz6/RmegQ1rqGZp579KW2MpDeTAYI1+pBlA6iXkraQyhprmk10ddMsp4E9h+wqicr/e
         3qz8/ZPgWYYg5i8PEF1ZDySNK9ceO/XDOR+pf3qL8RSqW5rS38w8pGzasPgV6dgFXp7E
         ujQ0NgPIrwlgOjsMQOBIvHWj05kQ2iyGNDr/HIP6GCEA2IPnrmuktTdlq9wsEyldf+bU
         ROoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7rZc4DTOa/koN9gETmFecGyUoKFNaVk9O2h5K+Ma0D0=;
        fh=uTlOTghMq+TGa+6ZKKy1EJGcZL6Gi7d0PPPfGui8tRc=;
        b=UOeYHSyAVIAxLsJoZVKH7TGOaRKhxSdpJg/rjgE19vt0wsooMRzE1S5tmKzDLwNqg6
         vmklCjwQqeI1MW22a8zvg9WQ+whdVf3LuJ+oS3PEZPbgp+S1PmuNFkwx3xYBb1wIPZ5a
         RJgr//KAjBO/EmtRShm6o2l1T8c0WuoDUffgZ7XqzrOhzIUPrapdIlgVk2qtVqWtiYq7
         lBXVHISW+Q40A8jvMGrGaXWPi53DCYM5a3EK28kr5ZyahRdoHPD1C12b43zJwReqYYf7
         T3DAtYmvPOzOwkfJRPQHM189BDGDKGtu2++LNQCvQdJj0KyAZcESBp6LV3ApESdZ4Oed
         QTnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748314; x=1770353114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rZc4DTOa/koN9gETmFecGyUoKFNaVk9O2h5K+Ma0D0=;
        b=AMd9fUz8bhVE2BlNqEH4neKXcM7MGydyy2od2zn9pMFEY9D/krQ8N1sG6vUN3E2IRz
         KGz2GxyuEaelg0hM/CI4cQIXk9EvKgNU9U6oovYvT9IulvRu69kTvKpp1OTzWd2WjNY0
         kQbJtckY12C2J5Ma4AngJdHfzxcRHJSiBqGfCjWg/I7qr6TJ4zyWpvYAlg90SWo7F/gb
         mdoo6thJdhUJGMBpX8R4MHeHlualwogGxwdfHZlE+6tRvB45M2i8eGKYTs7eqMPfmUzs
         m0Boi0tRySmfxUABmusjN7AoyAk3ph/5cHCKCQzPX990/uoHz5jmYml6Z9dif0qQXV3y
         5SRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748314; x=1770353114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7rZc4DTOa/koN9gETmFecGyUoKFNaVk9O2h5K+Ma0D0=;
        b=CBJJO1QXZn4IVvFPmPRd7aouTjwthBBc/qWgH9JCseVNZd1030ePo3zEf6M25HqQU6
         ly7II2G9F2tU/vFhIKIRskjxVCio4dh0ugvKR2QE7Ohot5Tnj9hZm9LdOGAoVraF7NuN
         KqF9DKpWupVoJUWfZZxKtnYylAPFuSL/ap/cUL4uwF5EpNzDbZ/f+3r8Pz842g7n2aJd
         iho8QYZ6vJt+8LG6HMsICgbtdk7/W9MgsxBTpyrp9aJQxdYWQx+Zu9uzbbx4yZppUtZ9
         zdJhHH8DliedIiQIG0atFsgEweMtO0erN9GOa/77W872DY6XhPdGUDIk73kxA3REfjxm
         YIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHgbrVrUOFFUvNFli4+rZgke7HsI03V8SB2EfqqsQdNF9s5fi0tpYqB8mJlbsw17RHhemjjp6dNbkhZevhEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqlszP3qrMuzg9sg0lBsC6Yjmm/tp4Qzcq987fKpt+lhyrhp/b
	oRbkhnu6EtYgNZnD1Eysc6QgooNI22gLi5og1mWOO0tdCz0ohXH7UZoXMNNEAXrpftp3f9VXsU3
	KSB8ZvehgW5/h0s8hqu+AmSr476EzMjUBakPxfYo=
X-Gm-Gg: AZuq6aKqr/lmKt0LvKQDbA7Fn0FtWrN1AUelL5/bXv3f72CdQlUnwIKBY+DvcvkT0aK
	/i/b0Vmy4AR99pGy5EzpnzCkCYk+HvL1EoSxDyFjtGjFRXvzGpywCFzqYE3cRGGtSw93V47l7Rr
	9prNyYBz6qaGFCmhKSPhQU3OyCpdUUXf1tFIN/FCt0YgIL1geW+skKBvti39yl/Olk5cPRE7uL2
	aejOmZWS63xON9ZllaoUNFkuU/Fv5uCaub+lTcJkJe9hb6qmUchysQNq4tE5pcymbflWij9axyv
	CEnuDHTc6VTNZ9VyZXZwVgGY2qfW79UACoz/nDs8lQEsnJB8ynlUjLtZeO77Th2tEhjsK0s3IVk
	xRkr4tjeGOgZV6s3133MH0XM=
X-Received: by 2002:a05:7301:1293:b0:2b7:20bb:8c23 with SMTP id
 5a478bee46e88-2b7c8907a54mr465632eec.8.1769748313879; Thu, 29 Jan 2026
 20:45:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108013350.2880613-1-fujita.tomonori@gmail.com>
 <20260108124240.239a5338.gary@garyguo.net> <20260130.081026.1940544935415358894.fujita@bee>
In-Reply-To: <20260130.081026.1940544935415358894.fujita@bee>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:45:00 +0100
X-Gm-Features: AZwV_QhlXh28Qx23CulEpsINRcdN0p7LccvwEc_h1D70r-Mt0uQHtz1nl04pWcU
Message-ID: <CANiq72nk-FCDmjyH2wmuVw9gNuzAsGv-=fLhjqC77fBqyCauwg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bug: Support DEBUG_BUGVERBOSE_DETAILED option
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: ojeda@kernel.org, gary@garyguo.net, fujita.tomonori@gmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, lossin@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 12:10=E2=80=AFAM FUJITA Tomonori <tomo@aliasing.net=
> wrote:
>
> Miguel, any chance you could merge this?

Yeah, this one and the printing once one were in my queue -- I am
pushing a batch for tomorrow's -next.

Cheers,
Miguel
