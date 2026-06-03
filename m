Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878243A6B9D
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jun 2026 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502701; cv=pass; b=Ep0xczbcI9L165ktCTpla5JNEJwO7CdnaiA8nvUIgPeJ10JhhX7xUIrDL9SH8ddLzxCxeU86I4dBq/l9k6rfZuXst50DxbA/5a0d+mQuhLMTZaZ1WMWRR/G9PFUY85t7aaZh/Q35xTMVXE0YpUqZFhk6+hiwnaHbuxE/uZ7tTrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502701; c=relaxed/simple;
	bh=KdK+HJPfqWh89Zp4ToM1VwC3m/NfENtvgJL4u0B4uXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJMmuNILgtLV/kKT9TdBsB/fpUVgnKMYEmSJtUCNYl04IN8TtdIIPsn6DL3n2u72UHd2HV6SGq71AS6Ul20HVP750ERrPD+cguaSPgPFHz09RcEvYie/LAzcnFDy00Xdu5t4i428JE55zH/W59PsUAcqe+63Ogt/B3n8OKQ5oFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bEq5JVUy; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bEq5JVUy"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf55c39e16so3845195ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jun 2026 09:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780502700; cv=none;
        d=google.com; s=arc-20240605;
        b=Eqn5hD1SHb/4xAWflwVBEaRUxBIfe+5TBwn81tA/kqWoNxFsy9HIYnpjakofeqnIi5
         S0Ok4EELr0orpASb4X6JgSl54HV+Uo0+g5PJI86/evDLPsjrMthk8THVPR7GTa4wu6Yf
         94Mj7DO8HFcJZqvxf2+iRLimARrlTI8OusC4qMtKtFK32JowAhK94bAr9sr6lBMJlTPV
         mJH9dIuhF/3R3eFEw8c9AF9mucuQ72Hr88YHrt+lxigvRfiJxQ3gJXJOOVITdIGciIeC
         eTl0y6BIe8vtIi1cTY6OFL7UbVsCLb9YQqsUor9VJ4b50aylTyTtJ++X3y2VKWCYIP3A
         5cYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RJiwIu7uyZAaPlamCdTOHC+XlHLfDNYUsMpOrpvH7ck=;
        fh=hLjniOios3uY/qtjIV53uXK79nNEbc+IpqNYfaCNMKA=;
        b=hZHQgdkhZq1tWetgH4fs1Axty/XownEpEOk3Ay1Dh4xy4zJyWwWA+USI8p0Xx6TfH/
         sFWEtPns5VVbfaXeJluuyljF4zKhZj3LGRq5mq31y6j+jvlQVlgyXI61pQcEfRZSIToL
         BR1iYiFFDh5bhW/+FGUTc7zoLWmCV/GBEi11tAbVa9SQcbBIHi+KrASgkg8dX4tL4dLJ
         5/ob6V5JYd/MZd9fO1bT7zpFZBz6tvVhoKsCOT85AqHvsY3w9PcG70Edw904oSXtDE2M
         XMyad8KpsS2GQWVo9gDgpm4OnIBGMfsITxSAaMiKp8xujRI5e9wKxw8cxXwaKZ623sVk
         mUeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780502700; x=1781107500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJiwIu7uyZAaPlamCdTOHC+XlHLfDNYUsMpOrpvH7ck=;
        b=bEq5JVUyik36GznJczEmGp/zvq4S+t4sSQGOdFrNgHDAND8PfN9Jy6RKIG6djwP2V1
         JqQV+TZNTTRJ1oNo1sO3ehK+qWCOk8sj61muK9fh4S3QqbpUJf9exaTJaxa3a1BaJeua
         2vqdWL1JblHn6H8rkvvntMOZ7R5BhjjWC5/ckDpvAaI5T9wmazv0lsk3iLkFPFbqdsBc
         pFP/yTbjeEH7SXox3KDwLwKPJbuciNM2Hviy6PI2pk9VYcY+l6vKNgXPOQd4uZDvBkMb
         gXotbk0hlQl6WGbIgxZ7J4ZIUNRGAV8CX+YPsr0oiqF6Ih8e923eCXrZl4RjD4ETaD0X
         zstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780502700; x=1781107500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RJiwIu7uyZAaPlamCdTOHC+XlHLfDNYUsMpOrpvH7ck=;
        b=bz0iGKtngBg5y9co0v2idYNvry/bvHO4LMFkMVE/3HeGqPnYxGXwUDNfFy564BEp7Q
         SAlOQHIUMAnMPPESa1GcmENRKVRb/3fnF8Kvorm4p0S0rgwkq8HnonVTgdFjlUamAyP1
         QMvnCrX++G8s/doprSOwNykoNRwfDqKce9jENvbEAEDofUzoglJRUsAnanZLbW0I7NXk
         eRp2FBpFxVRCY+dBhniVPoTYHu8hCrUhWTpXROAKWBHFIclpc5PakhE+vxEfwVQiloNp
         fX2E8X5QfGwak9/hzZ8YD+OhimaH1jQbhPH7qOavTbPLTiItYPdtWMvXC1m4ZvULc0FB
         mvjg==
X-Forwarded-Encrypted: i=1; AFNElJ/IXsJhJccgFvpDHUaSG2GLPS1I81NOE7JHkagX1U5QSEgDQjPmtaHpPDG2UlzmcJkft6HU25cVz44WR+B/lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRhHd98Pm6tpeBTxSvqsUiW63lKamOO1EoMG4POMUDD+EFdi1Q
	BNFjwLkaCqgDUtYoHQjVHpur6FK10Da7f4olIF7G5gCjfw8nLb+cV5AfHkesaCX3rR/OvXMuDH7
	ThgPbpR6rWMhkjK8d0z47c7TYs/gT1Zv9/MLBFw35
X-Gm-Gg: Acq92OGFXu2oKzWom6O/LbI/Mikva1XQflHc9mAMOajM1ofJBq3OwYSQNH1FFjXcyu1
	3K4vdeJac5mFqlWLnBjdj3OGIAhIvm7ASCbRKmhWN0S7IRG68wI1wsDjsqUxZr9d9uka9FQpwdp
	dmxyoswlGeFusRQDQhQEE5mP4eUdSLXDNqIqtV4MPYycSYGIt4zWeOoW3LWW9N9/p2ZIeqbr2fe
	YpLnHSSAZ2nMGoMbVYZ2JilGhS2ByUj/G7rmcBtA+R51h1VCdFSApfbwARQM9f5sTuSc3XbTnqI
	h2cqBhJxlPdH3LHV2g==
X-Received: by 2002:a17:903:2352:b0:2bf:361e:3edc with SMTP id
 d9443c01a7336-2c197a1e664mr634245ad.2.1780502699785; Wed, 03 Jun 2026
 09:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
 <CAHC9VhR5Ca+WyP2OiNGtL1SqHn0SwLe=M9SB8D2bxtdS52quhg@mail.gmail.com> <ah51DY5yfaNZejBd@google.com>
In-Reply-To: <ah51DY5yfaNZejBd@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 3 Jun 2026 12:04:47 -0400
X-Gm-Features: AVHnY4Il2nbhkxMxu_bFZ4TFGt7Ipvw1ewyd2x_7Gw2WYSaTiJOB7iM0xVPzXF4
Message-ID: <CAHC9VhQyNzxJgdMkmEsOeAQ7Wt2L+eW6aNLjeoYmnCQLmcYRnw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Delete task_euid()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 2:15=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> On Mon, Jun 01, 2026 at 07:13:37PM -0400, Paul Moore wrote:
> > On Fri, May 29, 2026 at 5:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > The task_euid() method is a very weird method, and Binder was the onl=
y
> > > user. As of commit 65b672152289 ("binder: use current_euid() for
> > > transaction sender identity") Binder doesn't use task_euid() anymore,
> > > so we can delete this method.
> >
> > Given the problems from last time, it seems like it might be prudent
> > to let the commit have some time to "breathe" in a proper release, I'd
> > suggest merging this not for the upcoming v7.2 merge window but
> > instead waiting for v7.3.
>
> Sure, that makes sense. I'll resend after the merge window.

No need to resend if there are no changes (see below), it's in
patchwork and I'm tracking it so you're all set.  I'll send another
notice when I merge it.

> > > My suggestion would be to merge this through the LSM tree.
> >
> > That's fine with me.  I'd also suggest updating the commit description
> > in patch 1/2 to indicate that binder is no longer using task_euid();
> > it currently reads like it is still being used.
>
> I guess this occurred because when patch 1 was written, it really *was*
> still being used.

Yeah, I understand the world has changed since patch 1/2 was written,
which is okay, we just need to update the commit description ... which
should be a trivial task.

> Perhaps we could pick up only patch 1 now since even
> if we run into problems and Binder has to go back to using task_euid(),
> clarifying the docs is still useful.

I assumed that was one of the reasons for splitting the changes across
two patches (reverting patch 2/2 leaves patch 1/2 intact).
Regardless, we're at -rc6 and with patch 1/2 being purely a comment
update I don't see an urgent rush on this, especially considering that
if I did pick it up now, it would be for the v7.2 merge window and the
binder/current_euid() change will ship in v7.1.

Let's update the commit description - you've got a couple of weeks to
do that - and then we'll merge everything once the v7.2 merge window
closes.

--=20
paul-moore.com
