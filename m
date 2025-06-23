Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B6423AE7C
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687151; cv=none; b=JkxlefwTl11KDT0fFg9VnWBY1bTNvKldZFid8UDRsRlhGmx2S+tO7bJX8PqoQJBshbPfy796hk9lvprrHAL8hzYCZi7bpqtR2oQGjRWzCg1CUoUzS2xIIMrzuiN1eFmcuw5Xcf7FvdowptL9QGmkXomKnj91LJjrFzfjjPqQoFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687151; c=relaxed/simple;
	bh=inXF4Oubtc3GyfCn/HjA8BZ+YeWKDMlYsxQk1gw6gRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ib3KpAD3Oxqt82wfXNzZZ0XwA+fEGXuGgYe3VaYWHcnW/egVaL99/ZPvBpysJ5aSsFbxdCOg/Uylvg8DRwG2XYZCUOLYqc+fbQi8/EGZD+d8VXgSlWU6HR0zPzZ1njtLMgRXpNUNFBq4xQG347LLib/1BOc2D8wkBWOHStbC1h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OGGnpZLu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OGGnpZLu"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso3423833f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750687148; x=1751291948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqJS7qFMkRiHiiDSabIzy0WZp3PMNXzqu6adpC39pLU=;
        b=OGGnpZLuq4KCShbZx7ZvxdpMDF0LmbwPptQo31y9x6o8iW00VqHW1HkrzlP8p1WltS
         QoDozYshLAVyd2M2RgK6UVvW7pJMQRfXdjOkWoMh6bzhDk+YoBcxOTL2XO6X1z2ukZz9
         sdg8efWQ2qepNsZsNbIilM+jJXbADD0he/VuvhYpp2jvW6ep+Xq2QMdl6sH/8ZnnzMLl
         BczcPr/vPSdYik6I/x+uIPbaAiFa8y7Ol67UQfVQvLKQve9CzeWb4A/y+2DZb/HU4QhQ
         aQ6gn4nSv/wE+TuTeQgVE4FPopXldig4BNPIzXsjoJT8Jgow/ym5ZdVq9E/PNxzkxBTy
         CAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687148; x=1751291948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqJS7qFMkRiHiiDSabIzy0WZp3PMNXzqu6adpC39pLU=;
        b=Av7/N5DD0aduiWZOKM9N0/HKsp3QBl2P7oGZ+xFXT+j3L0rtxeFFh+P0NEx9/Kbu3o
         H+l1cSELXeEo/oSHe2rzkicBZfVWwL1z5WUMp61momIW39XmxSpMQ+bDZKiDTYWBVmGw
         ILAZFKK5c/lFlU1WAdp7H1deD+IpkHGLFLcorx9htUO7eSyHx0r1SvURSomDX5a4GZUh
         SjInQt+0MxyuQS+AHT8C0Z+KsSGgNXsSajo+uYNjss0s0Z+M8avhRwpOLUj8gI8/V6yH
         r0aURqB0ekCbdOQGZjiI1PBZrvifH1cwP5X672tiDZ+rv3Bc+yPp4WrmSzMe1cIJww8V
         eJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCWey8DsyaOxdjxIVXdkqOnbxd87FJH0Jq+Ro3PGzBM/zCZX4LIlkrDFjL+RnMoYfYYicrJTvNvRLBuMhUGN5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Y/DcJOiR7FdWZCNN5OmLmeWa1itHvb7r3ZeLEaO+afVuao6y
	mteNAqy8Sk2DTKX40bWbTJuQE5QRu8kJJUpOCRHJ8Z3RJrCj+qBj3RKDiCEQ9/3ntyv9tsDmoJa
	6RVEQQet9o7KJ41pOhpSS+MgfJtK6ScVO8tKs2HPN7cCiYz3XNw3vTa9N9H0=
X-Gm-Gg: ASbGncsoKDiu+jdeBuCyhjPEOh0iwGQCTcl048ZiEXTaYsBXFJb+KzTjbQm/3xgMoqW
	R5xnNL3JOO0VUPsmWOjVWBfcq1H6Hbk0KNj9Ai1zJbUmU76fWHd1LRzByRePitCcl7hxkYGO7wu
	+uz3jhIqmAH+c/FwLebMIDBLWw69DIHePwiKOx/nRtthVDJPXxMOH5di9PvF9IaBiAoTBz2zOb
X-Google-Smtp-Source: AGHT+IF13VpRWBoHPpgam7052C025eCxfMTe2ZN2zg+750j8LMCwpXZyrZANJdkkdFJASOocVfeSbJe8hg0XFMJ5+R4=
X-Received: by 2002:a5d:64cb:0:b0:3a5:2e59:833a with SMTP id
 ffacd0b85a97d-3a6d12db838mr11127802f8f.1.1750687147965; Mon, 23 Jun 2025
 06:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com> <20250623-gigant-luftraum-ff854d561474@brauner>
In-Reply-To: <20250623-gigant-luftraum-ff854d561474@brauner>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Jun 2025 14:58:55 +0100
X-Gm-Features: Ac12FXxHPXAuSdWs_8rI41rh8PLjcu-3VIb0L7y5j_atAMl1-_MbGOrLem8jdO0
Message-ID: <CAH5fLghv-CE5DLR=VxQFbC3OJadP+GNPG1QCUKhNKa8nScXgvQ@mail.gmail.com>
Subject: Re: [PATCH] poll: rust: allow poll_table ptrs to be null
To: Christian Brauner <brauner@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 12:56=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> On Fri, 20 Jun 2025 11:49:35 +0000, Alice Ryhl wrote:
> > It's possible for a poll_table to be null. This can happen if an
> > end-user just wants to know if a resource has events right now without
> > registering a waiter for when events become available. Furthermore,
> > these null pointers should be handled transparently by the API, so we
> > should not change `from_ptr` to return an `Option`. Thus, change
> > `PollTable` to wrap a raw pointer rather than use a reference so that
> > you can pass null.
> >
> > [...]
>
> Applied to the vfs-6.17.rust branch of the vfs/vfs.git tree.
> Patches in the vfs-6.17.rust branch should appear in linux-next soon.
>
> Please report any outstanding bugs that were missed during review in a
> new review to the original patch series allowing us to drop it.
>
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied. If possible patch trailers will be updated.
>
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. If in doubt, please check the listed branch.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
> branch: vfs-6.17.rust
>
> [1/1] poll: rust: allow poll_table ptrs to be null
>       https://git.kernel.org/vfs/vfs/c/6efbf978891b

I just sent a v2, would you be able to pick that up instead? Thanks!
