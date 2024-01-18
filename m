Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05017F4
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 01:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705540493; cv=none; b=qex5VH0VZXW74vUbru6aQs06tynWToO8IIMOeAhdLMygYTwzvgn4IfzX9tnTYzgxxBiFn3C0smll7H6ulK2Ogte4qqfRAkDWIP3qxNbz+QSwyJSbOdp1QlDsBrXrCfGfTTQUFAtKQOHGYcF1RnF6yZHDgsrakwGH/Z/A+w3BM3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705540493; c=relaxed/simple;
	bh=fkGhIFTMptb9xhfAhyS4A/QpWk/RM2gHSsGnq5nv6Zw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=TDQekOwU1wtmm1SRv5bdmjvaz1pc0sUpxwX9//yNQ0FL0vJZkk9ayhkr+lLG7EGxrHWKFTzC/F8XNTTLzSbrajJ1Ljp4uMrpFPt7QdU8eh8Vt1IyDA79OegOS/XuQAUe1m0XxXEDopdkDIybN9kMMguIFp8gEaErWOLXTUAWef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=WmJiqwfq; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="WmJiqwfq"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso8145805276.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 17:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705540490; x=1706145290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtVNathGW0JnXzul60vJtkgKIy5SlrExorwVsK7K+oY=;
        b=WmJiqwfq7/pVOAlZEp6o7ofI0Du0xE0RwWi1V0RtZJpdFGrtODt+LA51yIAp4AZ+YH
         LOUQbjIZ3JHDILCxIy6deGJMxdQTaTfGCHG8X6BcRTv/YiscSmo6Wj/ep8Kv78lScUk3
         SSRd8vaaZ9HGZMa04OkizDtRoOOkCp8OKJp2mmMOFP+B3nuOWrbpOv5EFAeBjmzeRvXv
         9Imq3EK17Iy3/ICLjw+HqfGNt8fAbx+WnoNzW4/MQTo1r39O8b4RNIOyYgIX2PnVjgZ/
         eeZweCItldy/Inw3ODxSnG6jm7mdOqhZUQpuoGouqHPdgkVpNFoLXUr6X2EMZMZfWVgj
         J5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705540490; x=1706145290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtVNathGW0JnXzul60vJtkgKIy5SlrExorwVsK7K+oY=;
        b=MBxnQmcbKRv8IDyD+IYoI2i/cYsaYy+0o3skDAFh5xiGoqKMN6LbNbp5SIFw5uFrHn
         qq9iqmEXpYwWMLS78atDXhJyQT3a/rORD+Ak/k76Yf3vKcCXbna8cs4syrwo43bklApF
         aypLKLpzSzp7jMPxVelI9FKM4aCgRTqVt3n9FY93oCVeo9jBLgFt2oq1vCi5Q+T+iIce
         Q2od5l43Y16euxyBsZxq5LpLcaoSnREa+03Z+/yG3BzGZecanQPdepIvEpFuSaarRyOV
         SUI0FvQSqR8aYrWU4ZHqWDyyM7bUhZhh4dRogo0iL+0qpwNrezNcIL9hO7ujzqKwL+TM
         FBnw==
X-Gm-Message-State: AOJu0YxLdOiJ3gFkicXMZKGyhHqIBsva8okS0skCaTOMtCLiGR0rprfP
	fSgVuPF3B17RIfdWkgb9rWseiJaqWypZ6wIEknQ+NmfBFz5B3LZCqYi+wcRvrQDoko6i1bn9pIp
	VUNtJxyyDsTV09JdenuwsMQ0DpCDgHuGE9x0OKQ==
X-Google-Smtp-Source: AGHT+IG4BS+zDXJpf2yOlKid1p1vo5m1dHuTxpvBKzBUiTuRGsyofb9U7Mhtf1c/FacchHKgt/7wMXgl5ZwN9Tfpdkk=
X-Received: by 2002:a05:6902:8e:b0:dbe:9dca:f1ee with SMTP id
 h14-20020a056902008e00b00dbe9dcaf1eemr34208ybs.120.1705540490228; Wed, 17 Jan
 2024 17:14:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240117001549.169160-1-kernel@valentinobst.de>
In-Reply-To: <20240117001549.169160-1-kernel@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 20:14:38 -0500
Message-ID: <CALNs47voQwiJysBKF-cdOufu8SRjfs9eNTHSwEihZsDJLVNJ4Q@mail.gmail.com>
Subject: Re: [PATCH 12/13] rust: kernel: remove unneeded doclink targets
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 7:16=E2=80=AFPM Valentin Obst <kernel@valentinobst.=
de> wrote:
>
> Remove explicit targets for doclinks in cases where rustdoc can
> determine the correct target by itself. The goal is to reduce verbosity
> in the source code.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> ---
>  rust/kernel/workqueue.rs | 10 ----------
>  1 file changed, 10 deletions(-)

Perhaps "reduce verbosity" -> "reduce unneeded verbosity" in the commit mes=
sage?

Reviewed-by: Trevor Gross <tmgross@umich.edu>
