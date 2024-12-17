Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15AEEEB2
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734474677; cv=none; b=oYAe3y9JoZJrm1UcwnEGOYRNFbaE4B4moPVm9sAK9uUkrIVKVWKL0X5OSxFdkJjfTeBc7171acXsUwly45+vkkSyvfP2hF3B79v5M6aq1VCH8VHqiawJeQumhwmTjLoL7ozb3n7dAHfKm93pVzRqr/MnJZHhLOB6wBqlpSwpRzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734474677; c=relaxed/simple;
	bh=MhuHHVeuDfitVNhf+e6r8dpgSn2pNmZGABoSAOA5ApQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWZUm2G+6jHLg0oFaAXEpUz9lduFOgEBFzT+ocYzG5d5Dj8c9G9qT/4JWWZcffGn2RBojgAZ6DQBSHAg/x51zHwnsnHnvY9yi6dS89cK5T+Cn5wRvoksk+ZrT76TA+6EVRiUor5UQhVcKSzjhflTrTpj5GnQub3ZlhGS/Gk7B9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LP/W9RjY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LP/W9RjY"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ef7733a1dcso991502a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 14:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734474675; x=1735079475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhuHHVeuDfitVNhf+e6r8dpgSn2pNmZGABoSAOA5ApQ=;
        b=LP/W9RjY0c2uLH+cCznkIKMIA/GQZc2Gz5Oj7JLNzYhuEJH52uQ4C/YtswyTyaiNxy
         an0aUG2WyU0q6ebNocGbDbYXl4N2HOvIkNvjih1Y1+GCcu/ogXDpjxbcNwngW+6D4Kqy
         yOWx83P2lWsmo9JnP8SkjLvbS6MWQQ7wZHkCMomyJBiTIBPcYI5c4IbE8gDAQMCJzjRo
         HEmWMABrEvVisEgGyW2dNJU0WljNa9ONMlRUwgFg6d1Gry9yr/yD8UuDr/CNOkttR/RG
         NFFCo+MNuth2PTdOiXGwJL2IWY/9sQKFwVUNRC627L/+C4aFtoreG5CBreaVZpTs+j1t
         X4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734474675; x=1735079475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhuHHVeuDfitVNhf+e6r8dpgSn2pNmZGABoSAOA5ApQ=;
        b=FfltVsDpaBplc2ACrkZNUnwdTw1wtveY5Y3AA2Z3p+XiF5DjW0JciTcKC9Rzq+VrYu
         J7ZZ2LdStTmR2Zzlg1RFMft5rOeu+vULqSsa27R6e9g5XCi8l68gX/ztQKDFLT+3DrRb
         FnYI/O0yW8tJL4LILr39IRChRs1a1qbGPr9H+Nd0OeJV0xDmkzp9sxKhtDm4xiogeJe2
         cEVIpk2NH2eGeQbvtCBgQ9pNgCPvucoPMMQkAN/ikpgKcLvwX9K+zvrTWT68+rdOcFBu
         yCdC2Bix+fd3xWEEQHV8PNHudKP38SryeZ2MS3QxjqD4In/NTcKNQJSJ+pSx2xbQa0u6
         8Bqw==
X-Gm-Message-State: AOJu0Yx2H2fC1HvXnSAVOpAihY3/1P32BmamPD9zA9DCmQrVx7AemF0g
	Rrm2tzuagj27SX7txQW+UaJchVfzqVuxqVxz31qPo8ZDIdnTbb02st9M914rlCd06sFhVQoa/ko
	o2k09CHJGAPWW2O8UptgR97njQ5c=
X-Gm-Gg: ASbGnct2K6iBIEj2xsTUkkDlzTRhcfi2JbhYyKY2ZDCYqznsqMGnb1Zdhw8VW79rgtF
	p//0B67VaLkzXIrpIle98OPYG6X7kWpNy+9g13w==
X-Google-Smtp-Source: AGHT+IFyMXcoB0YgTP3Uvu5coPUSBkhKllCJSLYvcUcs6RfzRESBq+MwdMi0287c4WQRTO9j6Gj401HR5K6XmYdb/Lk=
X-Received: by 2002:a17:90b:5484:b0:2ea:853a:99e0 with SMTP id
 98e67ed59e1d1-2f2e933c4e0mr321313a91.5.1734474675028; Tue, 17 Dec 2024
 14:31:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZxkcU5yTFCagg_lX@ohnotp> <CANiq72n_UpZVgcs2=bBGPX9NYbpmGA6TQgREYk+2qAD_8ksV3Q@mail.gmail.com>
In-Reply-To: <CANiq72n_UpZVgcs2=bBGPX9NYbpmGA6TQgREYk+2qAD_8ksV3Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Dec 2024 23:31:03 +0100
Message-ID: <CANiq72kyRUsUfP63PHupCCAKCFvSWdrdKo8sLcbhiM0aBBntvw@mail.gmail.com>
Subject: Re: [PATCH] rust: block: fix formatting in GenDisk doc
To: Yutaro Ohno <yutaro.ono.418@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 4:02=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Andreas: happy to apply this through `rust-next` if needed.

Ping -- do you want me to take it?

Thanks!

Cheers,
Miguel
