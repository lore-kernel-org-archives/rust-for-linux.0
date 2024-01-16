Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23E91EB53
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 19:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705431837; cv=none; b=U2aWqwdkZpLpHCfnJmYa7PQt2FyoeB7c/7J5nB3acVVuqgU5TcTZ1dSxH/O36MWWJATju4ansFdQjydlwOVmMRAD0L3tq5H0XTiNhexqPIWoXel44RShDRnVERQItM2on0lcZ6LpoVdUTj1Xu1IU6A6iuRfSYJO/c9l2MQTBCqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705431837; c=relaxed/simple;
	bh=KsutbF0tNhyBIyYmY5mniQ1+g9VFosByUoGtxgU9160=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=JHqcxAZfdEYLhUB+4HhAsr+yj4e0sM2QvT90Dlx/C0ASoO7p/GNS/4evzPCyyIwYMjzVkIqtRszu+/iqIW4BTFsEhfQsHVnKO6sw2mjyMmzmTvDnUyb2PL5GkCxey8pFkrKYxem16DZqny5oKPkmAeVkWvNY0NAHxAPup+2c6bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGb1+rA/; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGb1+rA/"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc22ae445d2so806702276.1
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 11:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705431835; x=1706036635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idTZjvmX9/Apgy9ulz5inxg7528qAfGEAMjsOnPPysw=;
        b=ZGb1+rA/yK4z1UVa6xmRN8Wm8Q1+2wT7JD78RNz+cM4ArrXv0ho926TO0xKLC9398N
         m5PuynAK+f/e5TrvHHfxaDh+BAYTNPm1AOcBHhYMNJagrcwM2aIaYfoOfwynLx0YNvAM
         U41vuKl7m0G2FcajKhkOO43C1g7t1G1zc8YAoIaq7AH/YG5+PS0yYYhQ00M3jwMxD5gZ
         FqW84UNkEq0iPzo6NZLi95sjSvoXDrKOhCY8CXYdHIM76ujH2RYeDNjP6+N7VZ+qnwk5
         1tUnkZKXsXwopoukW5oD59lv0Pop+33rLYT1yf9ZC1JbZdwqO69rrZ+dsHQdLAFUFm4z
         jq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705431835; x=1706036635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idTZjvmX9/Apgy9ulz5inxg7528qAfGEAMjsOnPPysw=;
        b=IkNjwPYqCpMcPrqB5qAN/87KNAa5jLIncbfgUHvkGVbamBILO7sjs5BbcMdooDkn29
         zDrCVwIRIF5t+EEfM5uARYSuTelB7GdCczVudUkIlEXfMxISpZL19LRkVocpWz7ffRMH
         dz5ruTzk73vHUvBD1cuun+QweklqRxkEnynQYMctg7aAG+VlS6dejOOGP3xdJzvAs/Or
         yHLenVMtVFCdV+K9q0p1TEl6AIbWtPAasY9Mo84qP5t8q4f6MMUfTTS+IFb4/k17Dzg6
         qzjY23J1pkjxSPo9zu6+Bjrmb3DqhlX3gAPz7KU3v+fL2dp9f7MMgxMpQcS9PpWYLq+x
         TwKA==
X-Gm-Message-State: AOJu0YwWirvob7jG1n1wuOk3SN6lNxxWlI3pEt9NMBOZxfSocaIJQ5ww
	3HNWlKcO2KkCqNlAsvLH5bWMe5xIyZxpBw6YgYDVy1es
X-Google-Smtp-Source: AGHT+IHmI9hoB66gRXpzVB43q1SY+G+QHRXWpGup12iCt5VAUoiC0w9mnFynwkw/mDTbs9yTGguXRf0xZD5iiaZLzdU=
X-Received: by 2002:a25:8d08:0:b0:dbd:7491:368f with SMTP id
 n8-20020a258d08000000b00dbd7491368fmr3598865ybl.7.1705431834838; Tue, 16 Jan
 2024 11:03:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116022823.64058-1-antoniohickey99@gmail.com> <ZabJ0lCKDahbCHGh@boqun-archlinux>
In-Reply-To: <ZabJ0lCKDahbCHGh@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Jan 2024 20:03:43 +0100
Message-ID: <CANiq72mGUXEz+T7aTfbNLkmoeeKAA+nR_PzeNjTKPbY51DYo9A@mail.gmail.com>
Subject: Re: [PATCH] rust: task: add `as_raw()` to `Task`
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Antonio Hickey <antoniohickey99@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 7:24=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> While we are at it, maybe we can clarify the terminology a bit,
> according to:
>
>         https://doc.rust-lang.org/core/ptr/index.html#safety
>
> "valid" implies "non-null", so here we can just say:

I think Wedson and I discussed this term a few times and whether to
avoid saying non-null or not. If we go ahead with this, then it would
be nice to clean all the instances across the board (we could create a
"good first issue" for it).

Cheers,
Miguel
