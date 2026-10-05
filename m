Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B8B47F785
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Oct 2026 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219962; cv=pass; b=B7JrbfxYMOERtnqD3CRQYBjnZ4BDQn1UWxYkpwLq+tmf7ypL1VB0GWLm1yimyGQ2JBOMu8ixHKLWd3eD4VzpVqY74ko8OR3vgPVy1NoJ1xVXEZKO282flo2XgfFx5FSn4xEA3Jz7GHxQExcFmER5UVskH5UAJ3BywOyCWvPni8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219962; c=relaxed/simple;
	bh=2RXkrvI8XGSx/1oVfdObGE9PLA8OssOwVxQ91HAiD08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPHcomY0AFdqRZSqkSvaM4T7+5b3NlI+1kEhwT/lDJegnmNBSYnDS0DwdOZHiq14pqTdI+VSU9RyE7T5sNDlCHz35CuFh77yPVBCt2e5CJpKRAG1w9ZxiTg+p5nfdXJKwuLgRIfczBtIENKLBsL+CDOqqHuqZpMmnwzt3lWsDa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLSiFWv4; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLSiFWv4"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4f6d98ff6c7so1271090b6e.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Oct 2026 10:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791219959; cv=none;
        d=google.com; s=arc-20260327;
        b=qo/ksH/P5jQfjFO1oDKOvF214Kk1p4jS3+gdrZ9hdunns3VVvoBvcLAgAoGXp2SLII
         bPOUdXa+ymFHyjAJ7resCiFycoS0db+j/HrFZehu2e65YGkczkmzNdH0ocmRXiSorRun
         qKkuAYC1iGEsLFoaQ3ZtRpxF4qdQr6qYX3HZAzJoQcp21/Xsg4TVQIFaTGyyIO7sH9vK
         QAUTYqFjEPWt5BNlErz4tdvOC5AKeTYVQPKyrj2ovPvqBTD9LgValwH6Z4H2PVCZkRmj
         fcgUP/sGzg/auPTvCkEyHp9WKK49KC7dkFtVgUeKUL9afMOlzLCyhUQcGr1YXEJKGFI+
         qk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V3QHsfD9eae4eVmZwhjIqULbQNwImtk17XMJTw0B7T8=;
        fh=iofWSAkub0UinBzC2oA5sD2UYa5RTMzz8KRQSsClkNE=;
        b=Xgg90lRLZsu9NLR+bMskGSVtSV8XQmSo3UmHIv6nM6pl4Ufd8WaVsDPdcSNTTDbXK4
         i05usHG2/OBfOaJFL8LaviaCl4NLEQ5mmM2ehB8O2ByMQ3mS6A6QwnH6675sFlXnPLD3
         k3qhlgWX/OcoT1N1buQZTzHFGhZujWlQ10lh0vZLPbHDeCPbCk5uJQh/noQHRfr6lhMn
         R5H+4dBccJmH52K9eXvwiBivXz2eifJlK9sopBacdMYzN3F/bnR2/le43tDL9CgqmMaP
         p9x+QHo1y6xLIcBppYDaNXGbRATShQgNOw7B4Nj1zcfDKwZVnB2sdYcioeAYK7xTkNF5
         5R7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791219959; x=1791824759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V3QHsfD9eae4eVmZwhjIqULbQNwImtk17XMJTw0B7T8=;
        b=mLSiFWv49QmGqH6AcvhRb/RHPfgAfJ3GHS8U2YOfeN/lFkYaMDoC6pkzyo/gK/cbwv
         5Ent4KeoVAnvmhRhcQ81oYaPMUgsjM8+zyQbQRoArQGr4fNl5+nf0J6izYYVKPcVk0zn
         g0HImbOAaNf/CtWtJ3ZqcFzU038XbZuLRt2DHoA+9TT5UYncN9jpWG/ViZ1MtznMmt/J
         BUPm/SVNj5MGrglli7HOET2qMVIJi9zYBvLn41gnaPltOwb7Fnne2rJwCStg/jblvSmS
         V0O+s/7RtbA/m8mn5dWnurZy+DIYJdCdU1zeFmGxiLoyAjGkuXV7ktuugjbzIfhv4Lqm
         oiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791219959; x=1791824759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3QHsfD9eae4eVmZwhjIqULbQNwImtk17XMJTw0B7T8=;
        b=zt4P+jFZwq4uuIsnP+qDAzbC0wF4ebt2me6i/zGDzB0ccSVdyeGgoHPzUfjke2fh4v
         zl0ktu72zzWeFn0uroVyZc/vBgKmA82nON7AkRiGQO3VYchameS7xDLc6wY3VSOJyB4w
         0JecJJhPcOi2zO1A6ZVoVrLhbTF6lykxRx7uGh0fy9At7zxlo0E7zyRPn2OgI+P5i+Zx
         +tetnsvFkpY5l/yzFbX/Q1KK8ZnzMGhqxR6xCtUGuuDfKW1PYusY5g9Hp5l1m/6b4+en
         Y9TyV7EF1rlA3pF7KulTlIjUSXU1vkWcNMlPLJr5YAjc/iQ0Sp6CEWyKwRcElb4auGFG
         IFyg==
X-Forwarded-Encrypted: i=1; AKwUvBwovy+/jKBGEmVPu+zvhe5M54hHEwjRbOUw+ar5iTncHkEg4kQMJi6OxSYgzvy6QqfSez2NK62J0uLxiXTTaQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l6BEp9+gayvc0IrpllTTpGkWBFSO1VD3WphrgOfYTtTdIJ0YfN
	/wvuXHtp2WqwtNt1ZH8dzM7Gmj8S8IqO1BLeDSl+xdxNKUfxWWhK7n4zYJH7XDWCHtlvHN4QBj3
	ofZ5SdCqluoWcnTf7aOxr/sDAV5Ec+Xk=
X-Gm-Gg: AYBFou1nndi5Z2SO6sQNsUAjSeF4WJoVzrAnv6afEXBjm8q5qIcHbiu0NLC8+txBlbt
	dyYxLtLjQWw7Uiw888PQVBO6JRcn6RIilg1MyDKxx1tVW4csSWnLcJPULrANNnEbN2MhpUZi5lh
	S0bIT1hX3y6uHy4v1+tHzLPYcx3PX3dD1Gv6YmnJSWnlyXCU6otCCRcFIX3biKFDEmC+B0Y/22n
	QDmayEXj6v+xdao9cUAqnnEdfws69J446+NLWWxpWkApm4e2w59EHMWnj/n3s5qIYps91hOuC/A
	qgbsN/YcaAafhYgqQT8FHr3qperaY+SKtnuiwFnC+Qa+ZOr8+8rHzrJCwcppM2QT07L5nnWeTWH
	GdbAlPj5g+QOq+g==
X-Received: by 2002:a05:6808:6409:b0:4e8:e73e:e945 with SMTP id
 5614622812f47-4f67b6368eamr6867509b6e.63.1791219959377; Mon, 05 Oct 2026
 10:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923022339.3340694-1-georgeandrout13@gmail.com>
 <arThye_219ruNbM2@google.com> <20260925-stellen-brummen-festrede-266af0305ac7@brauner>
 <20260929044843.GA3909609@ZenIV> <DLRSQRUVOGT2.10ZY01VEJVHCE@garyguo.net>
 <20260929135154.GB989762@ZenIV> <DLRXHGLDR2QQ.WZVRWGY995BT@garyguo.net>
 <20260929170218.GD989762@ZenIV> <DLS0CO1HEGJN.2XX8QX8LW8XJM@garyguo.net> <20260929194726.GE989762@ZenIV>
In-Reply-To: <20260929194726.GE989762@ZenIV>
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Date: Mon, 5 Oct 2026 13:05:48 -0400
X-Gm-Features: AclHuK82zXF_oHnFQwG46GJvuw1FlbpLwvQEpRhqprAmrygF7YVXXrAloo-DO5M
Message-ID: <CAESH5ocD6j_trFz1GyEXLTJKy5-N19=86wjZTm-b__0uX9YMLg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: file: handle fd table teardown in file
 descriptor APIs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Gary Guo <gary@garyguo.net>, Christian Brauner <brauner@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Jan Kara <jack@suse.cz>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Al Viro <viro@ftp.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:47=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Tue, Sep 29, 2026 at 07:22:28PM +0100, Gary Guo wrote:
> > On Tue Sep 29, 2026 at 6:02 PM BST, Al Viro wrote:
> > > On Tue, Sep 29, 2026 at 05:07:40PM +0100, Gary Guo wrote:
> > >
> > >> The reproducer that Georgios posted on GitHub is some cleanup job be=
ing added to
> > >> task_work, which drops FileDescriptorReservation. And since exit_tas=
k_work()
> > >> happens after exit_files(), put_unused_fd in that cleanup observe th=
at
> > >> current->files is NULL.
> > >>
> > >> So it's not from random thread, it's from the current task. And I fi=
nd that
> > >> particular case of doing per-task cleanup not unrealistic.
> > >
> > > FWIW, descriptor reservation ought to be tied to specific files_struc=
t
> > > instance; note that dup_fd() can be called when there are outstanding
> > > reservations and the copy does *NOT* have those reserved.
> > >
> > > What rules would you suggest for such delayed put_unused_fd() wrt e.g=
.
> > > files_struct unsharing?
> >
> > Ah, is this about `unshare(CLONE_FILES)`? For that case indeed our exis=
ting
> > abstraction break down.
>
> FWIW, the current rules are "you must not have any outstanding reservatio=
ns when
> you unshare descriptor table in any manner".  You are adding "... includi=
ng the
> ones that would be discarded by an already-scheduled task_work callback".
>
> It's not just unshare(2) - there are more interesting callchains. For exa=
mple,
> unshare_files() from do_coredump(); this one should be fine in face of
> put_unused_fd() in task_work, due to the task_work_run() in get_signal()
> being upstream of vfs_coredump() call, but it needs to be considered.
> Or begin_new_exec() - that has a lot more callchains leading to it.
> It should be safe at the moment, but that needs to be demonstrated, etc.

Thanks for the discussion. It looks like the issue is broader than the
`exit_files()` case I originally reported, since staying on the same task
does not by itself guarantee the same fd-table context.

It seems that the Rust abstraction needs to account for this stronger
requirement. Would making some affected Rust file APIs `unsafe`, with
appropriate `# Safety` documentation, be a reasonable temporary solution?

I'm not familiar enough with the VFS internals to determine the right
abstraction here, so I'll hold off on sending another version based on the
current runtime checks.

Thanks,
Georgios
