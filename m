Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E133C13B58C
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Mar 2024 20:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743100; cv=none; b=Qm3/NaYkalkK/zZamMLW/DBGn1EwsqjT3oJSQoUYn1cij9NjA2AX60gJPJcFuIZyH1MGlFJFMbaz43/N7pgUty+H3Rqy25z5H8Dl8WaFoQeZt/ckkf65tB4iRnhL0UJLE8/b09SoWUMlXDdurRCwUq8DM5QpNB4L3e5mZmeJSwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743100; c=relaxed/simple;
	bh=aWEBFB3W36fIIbksQT/SinBTb7IzLV6C2wfIJjxEHLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxEyvmmIZ4KLJd05anDMkcfBS5PVtNEBlQfknLMPdkU1nQE3rwGCh5NkKuFm/C3mKjBtTCw9iJo3/RfLm5u73qlHz71gHtUM6GaFJLEJ3BmXdw1OyPLvysqTm2OJKssrIWYOSoZyoUwkCSWjE2ZGmrxQ+dlidstW9lvEh+jqMU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgE031id; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgE031id"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d094bc2244so24826611fa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Mar 2024 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711743097; x=1712347897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsFVl4q2wlU0WK/wu5gib7bqYzTJySuabFRTqPedoKg=;
        b=UgE031idUiwku2OuI0+N1y8p7ZFsupdLUyorLOBmYgqTtFqYjKTY8lG0r6Xgmxxpow
         yF2RMHUkcVL8Nswj3XlkGhDDTO42lhJiWNfcy2yxePEGuKNCgyww/57cq03CAP1VQxbW
         Vm4jp5+nSarN496CGylzDAWhwvP2aHFjE0vkiQWvM82+BidNO5DyfDS4vT5hoIcJSd8N
         kFKaOtZO4naGCEJfksgBDx3I+ifE5DF6LB+xR49Cm9Pf2k6FD8pamYg0bIapXcovFVN8
         RaO+RnHSBIFOCloZ+8r/pfzuJanPKEnB2nmdv5vzYHmlTkokK/GDw/+fW8Tf4Y4zIZCS
         EuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743097; x=1712347897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsFVl4q2wlU0WK/wu5gib7bqYzTJySuabFRTqPedoKg=;
        b=OzdN6TGaEnskbRQAJ72h3JITzsvOeTPEaK9WgkbgF5hx0YpBUtO5ldEdWf/0/y2pom
         AEifhLi5iLsN1UNNL+PgAg8qNYXQ2U9zt31u62pvRXBLrbttvcvXn7dbBz4K41/XW3Tx
         J306s7Zz7JZ3KkV8f16Fz+krPqk09/w2nf53GxeHMBMGa4aUn07zqjCi2FyOQX8vkpbR
         1g2w1GwAuzWY3PG+VUDJmbIw5ua+Ssu8luz4jXgsOFZ3+AGJApFTUBv+uE6jNsNh5Gdk
         t84r4JmJ6nzA4EDjPvBdCRmLJHtvVWHawL/FAKQD0vlAYp7poQUgI0MS3ZBOs4FuF1MO
         /Jmw==
X-Forwarded-Encrypted: i=1; AJvYcCWNUfAm7H2e7xUPilEa/X3UaXXw21GeelXj6xaB80KS+lCGnoMK5M6trmYzTjvJeWZvGkAZjHWQ3Oc46r5WBvYb+0x/+n5dgQdLkDoGy1E=
X-Gm-Message-State: AOJu0Yzl0kZT3E84CmOlIDka19a/B5Qw8Hw0tgHKg8/MFv0XTsPpDEIp
	U7scdbHmbpxP3MBCSGIsRQe/NhifjzoTU81YQQqtyBckokrI1GsLpDlOiOytgVke3K3jwiiIXCW
	eGqSda9MLfU8RxyMCb7SswuujvTBGdTW1tYChfWZb
X-Google-Smtp-Source: AGHT+IEydScDwSV9ZEoVrx/nKpdtTzUKF+nPLBOyBN81upidrtdsXwpRn6ch1bEKUa1ag94p1Cth+FwEgp7SwFiGDzM=
X-Received: by 2002:a2e:9cc7:0:b0:2d6:acb7:936b with SMTP id
 g7-20020a2e9cc7000000b002d6acb7936bmr1966198ljj.20.1711743096710; Fri, 29 Mar
 2024 13:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325110451.42277-1-vincenzopalazzodev@gmail.com> <CANiq72==OBG+KVJuzW0S5aYowAZ4oq91pk=phRgtedUrGYeHAg@mail.gmail.com>
In-Reply-To: <CANiq72==OBG+KVJuzW0S5aYowAZ4oq91pk=phRgtedUrGYeHAg@mail.gmail.com>
From: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Date: Fri, 29 Mar 2024 21:11:25 +0100
Message-ID: <CAKy8djQjYNS5hmyJ=rZLuGj3jDrtn0QEpF_buo8NucoCqRiXWQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: kernel: types: Add `ARef::into_raw`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	Kartik Prajapati <kartikprajapati987@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Hi Vincenzo,
>
> Thanks for sending this!
>
> (This is a resend -- apparently vger has had some delays for the last
> ~14 hours or so.)

Yeah sorry about the double posting on the ML, but looks like that now
all is fine.

Thanks

   Vincent.

>
> On Mon, Mar 25, 2024 at 12:05=E2=80=AFPM Vincenzo Palazzo
> <vincenzopalazzodev@gmail.com> wrote:
> >
> > Add the function `into_raw` to `ARef<T>`. This method
> > can be used to turn an `ARef` into a raw pointer.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1044
> > Co-developed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> > Signed-off-by: Kartik Prajapati <kartikprajapati987@gmail.com>
> > Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
>
> Given what you wrote here, I think you intended to give the primary
> authorship to Kartik, right? If that is the case, that would require a
> different ordering of these lines (like the last example at
> https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked=
-by-cc-and-co-developed-by):
>
>     Signed-off-by: Kartik Prajapati <kartikprajapati987@gmail.com>
>     Co-developed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
>     Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
>
> In addition, the commit should be properly attributed to Kartik in
> Git, which means you will automatically get the `From: Kartik ...`
> line too that you see in the example of the documentation I linked
> above.
>
> However, from what I can tell, you didn't modify the commit from
> Kartik at all. If that is correct, then the `Co-developed-by` should
> not be there (https://docs.kernel.org/process/submitting-patches.html#dev=
eloper-s-certificate-of-origin-1-1
> has the details).
>
> Finally, for v2, could you please To/Cc the rest of the
> maintainers/reviewers? You can use `scripts/get_maintainer.pl` for
> that, or the couple commands at
> https://rust-for-linux.com/contributing#submitting-patches.
>
> Thanks!
>
> Cheers,
> Miguel
