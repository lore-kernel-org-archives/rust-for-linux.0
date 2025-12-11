Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651CF21FF23
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 01:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416013; cv=none; b=oDmCHPPCuWUozloyZlze+46J0YteQU+H1DBiQ6nrqXtA4yChFVNH3A/GIpZkn9TSsNNFIDQ9SlARHQ+Qu15kQyqu1DFpZbD0QzDbfybcvetZwKAM75u6A8fkhYOrp90YdwXebUjLLTg1Fb6EdVHcJ5PqAR3ibvo8lYXx3FNS708=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416013; c=relaxed/simple;
	bh=kYmaS1EySI2ZpVOrBQ5II91JbUvOcTxVrKIgckXw1dg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FnhTJ+GF91kn8yvOaxkBHUrhNmE800z/9xuJSACdrFgE/5SPX6j6K74ZASgWhFJHlhYo8i5jUfM2fzj0+030Dkh9oniFSTdlai6onTBX0oG6bfzco9RB1dxXmamKoBGV5mO30rk7HEfkN5DbNrYz8KNKUidg0fCwIBibsHX6rAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3FGyP1bl; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3FGyP1bl"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b79e98a23c5so24171166b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 17:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765416010; x=1766020810; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=meKtWNpBilYixdM6fRPymu7e3W79Vp1jzlEWK7aJOMU=;
        b=3FGyP1bllhHAe8JF7O5UZ372D1fAvs8CCrXaQxhq3DjhHGncgucrAjQbdwzGOGDhel
         KlCV7Wp+vSfV8xdcRUgzrYumsii4XhCVo4kqArzOO34WnbfjWVMCfOfjAVMum3YPiJFR
         Y+WfsefTArskVzeZSaWYMAUQ2MK4DjpJDgYRBPHHDKy4jgjf2p+BLI1tTwZ9hTUgWQMc
         ev8ENEG3P0KArgMrmWk5EVgDETVeLBvohwuFzCFN6LMh6qXCiMywqQZ8Ve44Wozfb9WJ
         brnFiTF9AShvsfxyY5flCkvQT/tSNu82pwYpYnKMlXdnDuvf1Nz5qlhSlAqS+/mj5PqT
         UnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765416010; x=1766020810;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=meKtWNpBilYixdM6fRPymu7e3W79Vp1jzlEWK7aJOMU=;
        b=kMdNoadD2UjFDcA53h5YbEGJPxEJYhlK17BxaWhCHqiLUz5lLPmcaT6k3aZ227h+vg
         DyRYxJG0Pv4mM3OpDOQ/mkHmoLAWI5By5pOrnVKIJ6oMWVYlBjNAFoRTQQCQXSYj1YBv
         VvYmZ96WJJgiZeOt8KcRKxzBBCsTsUpgdTa9oGf8qldjtQ5+37XXt15+q7+XOOBG//df
         LzpSU87NjD0csrp6alZeuu1xZTq9J32bADSKQsXCFmwn049WgB082NilLPKqJYbpdpEg
         Qf0Tfy4J3fu3wRyaEYb5x1zqxsvJkQSOz9knF8cRQAQet6G8/jUF2K6PYGcEwXsGdwXk
         KSDw==
X-Forwarded-Encrypted: i=1; AJvYcCXIF3rJRoRxLB4sLvevjX5ZRmEf4pm6ODu5TU5LECynoI6vEzcBGcZ7TFS6vYi3M7OpnybLwGW5w/xB6xOIgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxav/M1fjITVZ0JVw/Stj52a1wecu1FXblsC6QLoyeig43YVzLE
	ZTSInySonx/nl74nOIpG1LHgPTrdndbJOHVM2XJip8Of0E8TK3+DAedUREeiObuhnwt/QOozAPi
	FkAeorse1Gy2sgV9gzw==
X-Google-Smtp-Source: AGHT+IGfY76vCQSvfYBdPLqKoAMxg8hBUNzmeY2CO2o9Low3SkoekY/jMRCYPoZXYyb6oBlTLvX0hsVkVhxBbCk=
X-Received: from ejctf13.prod.google.com ([2002:a17:907:8d8d:b0:b7a:21aa:8972])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9613:b0:b73:42df:27a with SMTP id a640c23a62f3a-b7ce8345c0dmr413515166b.1.1765416009673;
 Wed, 10 Dec 2025 17:20:09 -0800 (PST)
Date: Thu, 11 Dec 2025 01:20:08 +0000
In-Reply-To: <aTbg6O2HS2fGAow6@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aTLnV-5jlgfk1aRK@redhat.com> <aTLp73haymcs1fkX@google.com>
 <aTLsUDBbcbl2ivme@google.com> <aTMUqp5pXzAscrdZ@redhat.com>
 <aTMhpX-_H4Y4J7Ud@google.com> <aTbg6O2HS2fGAow6@redhat.com>
Message-ID: <aTocSJ_zlTkejD5F@google.com>
Subject: Re: rust: wrong SAFETY comments in group_leader() and pid() + questions
From: Alice Ryhl <aliceryhl@google.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <christian@brauner.io>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Alexey Gladkov <legion@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 08, 2025 at 03:30:00PM +0100, Oleg Nesterov wrote:
> Alice,
> 
> Thanks again for your explanations. Not that I fully understand
> them, though ;)
> 
> On 12/05, Alice Ryhl wrote:
> >
> > To start with, it's likely that this comment is not the right choice
> > for this function, given our discussion. Most likely group_leader()
> > needs to be moved to `impl CurrentTask {}`
> 
> I obviously can't comment this proposal,
> 
> > and the safety comment needs
> > to explain why being the current task ensures that the returned &Task
> > lives for long enough.
> 
> This is simple. task->group_leader can't change or go away until
> this task exits or execs. The "current" task can't exit/exec.
> 
> (This also covers the race with mt-exec from current's subthread,
>  the execing thread will kill all the threads and wait until they
>  all pass release_task(). Only then it will change ->group_leader).
> 
> > impl CurrentTask {
> >     fn group_leader(&self) -> &Task {
> >         // SAFETY: This is the current task, so the task must be alive.
> >         // Therefore the group leader cannot change, and thus it will
> >         // stay valid as long as self is the current task.
> >         unsafe { &*bindings::task_group_leader(self.as_ptr()).cast::<Task>() }
> >     }
> > }
> 
> Yes, the comment looks good to me.
> 
> But we don't have the task_group_leader() helper yet, so far I
> only sent the trivial initial preparations, see
> https://lore.kernel.org/all/aTV1KYdcDGvjXHos@redhat.com/
> 
> So if you are going to move Task::group_leader to the
> CurrentTask block, please use .group_leader directly, like
> the current code does.

Yeah I'll be moving it soon (after conferences). I'll add a Reported-by
tag for you if that's okay :)

Alice
