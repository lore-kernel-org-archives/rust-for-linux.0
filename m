Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C8E35B122
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767806679; cv=none; b=h8qw+znGjYaFqyMV8xa47io0FmeJYB6RoN5tj6vmwHOAdCs8ZicmDZiwNqVipXLHf8xgD3N+2KJRmUHVebnKscrZOUw/NG8Q2OoDp/QeHRe8Cc+fe2KVBkbgn1LuZyA6UMKKzZeuTmTeNYQIe+XOWNwxLhKu5V8GJ+FieZAb7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767806679; c=relaxed/simple;
	bh=XqdCPkDx31P+/88ZI9oqnb0Z6s4jrFfvs9pYpKRo6yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYUaIZRsrBinbGjiQjcsJoOKsajHqdYmveF5Oh5WXfb1ZHQsabLm8lQFcjIboSVSF4yPrxajcFnWZY9cCaIp8St9jNjAphS5G0gOYDUIvrNLhY9JusTz23vtCYMDNsCkREyrZ9HPHb7z8DtFPePp0zDV4hpznH4pegi/pBpLssQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aW5A1LXm; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aW5A1LXm"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b175c4bb64so136589eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 09:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767806672; x=1768411472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqdCPkDx31P+/88ZI9oqnb0Z6s4jrFfvs9pYpKRo6yA=;
        b=aW5A1LXmNeNADbdSRgXKnUuGmfIoqMFu9lALasol6jgp0fYY2RYeXvCCMoZHMHWnMg
         m8CbU+1LiHK5oG9KvKG9s4IfVGSbsGIh0CtU1jOkXmLXLfmnyFbCwgFR17R7eHfPQ4Hy
         9bkXsFmP4nXZ2pXesGPOen7kLOr+amPhToxF5qefGNxW3vNaofVM8rc3Gmypr6cJrnUw
         lYOlcaNRZt1guXycp2VrAqAzP5Xs8I8strkt7QcTcYS9ekc0Il/VodGK+4U48fxDwJxF
         ueqEMUJH8YNQNcFk5rAZtGBG5QGNKQ96ziPQrpE3c2IdY5R41hP2aKewX7xAhsqgZoT0
         3QXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767806672; x=1768411472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqdCPkDx31P+/88ZI9oqnb0Z6s4jrFfvs9pYpKRo6yA=;
        b=KN7bxxHYbsLFSyV8zzJyANiRU/zZC9d3nI4hEm5+HtLY2wRL6lSJ5YzSEKhe06l8PH
         SRRTRavYu5DtRNEN5j2/XfG3j7PrtX19o2r1aRAte2ogX1i4Iq31EB/xGCK6oQWC535q
         ehzBufZRMlFZYmcY0tdsCWTKd4nw0vtsHnb3iZoJWhWoEB8pzmN4cxbqCGmWgZrpWq9e
         4VTwQYUrJpDShGu96QdQclL8eyFWm4ceeyvcIczeLlrF1G79LDvFQmq6NAfkh2F4HJBk
         +lrdAisnknuo1ZuvS5MNYuBTV9YRq++FJL3xHHUOcpOASfOInXc0JVCwqu9bSS58b4L6
         rhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGSSgzd07TaeOPZeseqM7uh1PiGwazrz4DKIoaxne6EaDkokuxc20eEBE47mARW5u3Yk6SABMq57G5zoV4Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHgskZlotzeMF7Oq0T+Yn13UWlUfFITbtgsnvTxAGxOolPU7Hl
	bD03BTEk9mjWiRLAKhBh75f8b/Ck7motGc3o728TznFIpEcDRJlppa7naAXCRGI6upB/toQhGFA
	8Fvmnnl3eiTa4Hn8s/Xl4O3GxWhBN6F4=
X-Gm-Gg: AY/fxX6bkyF6gYxHLxJNXzeCRfomJvBKEzX8quF9LxEGYuUpfMzri3fPuUGTT2/jtjO
	o/wonCb1DBEyLZl9cEBgJVmefANQDLePfGovveRer5Z+ikOej2boPj6cTp66YRmeXDUl5cB+XjH
	88z84WMobesCGHZogeP7vNTgxDOOBC53mNx0J2u096sPDV7Il7jS4PXf/OzyVw6NKNq7cffcaBg
	FkF5jvDFFPYb0PLMPfE8X1g0mEnP3gwcuz8qo+/th+D76pxIDnic047mA0YhTS553ck1z9VHgws
	/nv/zE04J0unWfEtx5mJkncCx5g3KkqfW7kQVIvVsxd20fwlq5r8gU90vBDRX4dfgXxh4jWroK7
	LQLY1MVG9exUo
X-Google-Smtp-Source: AGHT+IEmNxe4H46v90z5Qsg81/iqvWHE2i419t6wujoy5EZQVIHlyBEXzgh5s/UfED7pXNr75mh1zoYiP0dchnOTKuI=
X-Received: by 2002:a05:7300:e58b:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b17d33c615mr1278675eec.7.1767806671760; Wed, 07 Jan 2026
 09:24:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
 <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org> <CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com>
 <39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com>
In-Reply-To: <39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 18:24:17 +0100
X-Gm-Features: AQt7F2rzlYOZPcNPb5Y3stczaGAhwYq9zU0rJFqAE7X1RLdvvhtO7z7v_rYamrg
Message-ID: <CANiq72=vcYkfZtgDfSZaHY=0PMOwc+XiiJo74pciPOV7nrN6Nw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Joel Fernandes <joel@joelfernandes.org>, John Hubbard <jhubbard@nvidia.com>, 
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, nouveau@lists.freedesktop.org, 
	Boqun Feng <boqun.feng@gmail.com>, Paul E McKenney <paulmck@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>, rostedt@google.com, 
	Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 6:20=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Thank you for the suggestion! Unfortunately, that would hide the company
> attribution too. Or require it to be in brackets along with the name. The=
re

Yeah, I meant it only as a solution for the email trouble -- the
attribution in parenthesis would of course still be needed if you /
your company want that.

> appears to be resistance to both these. I do feel fortunate to get compan=
y time
> to work upstream, so, on this matter, I have to go with the company's
> preferences.;-).

I suspected that given the thread... :) But happy to sign your key if
you need it in the future, and happy new year too!

Cheers,
Miguel
