Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B6319860
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944983; cv=none; b=osbIsh6m3GMbwZofd1D6FhRLqg4NQLh99yeTPcxz9byGYrbbpeuuj+w811RIF+SfL0f1Zl6H8lrQ3hyQdlsVchzpGclvaZVTJE7+nWmBYc8rZU0aMKepEyHQ7C1H4oqO194tNygMbpqaNkNe/2ErRgCKJTV7n9CRPokgS4/qDs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944983; c=relaxed/simple;
	bh=abCVAtbqooyF0UIqD8BhSOUnhoH4MFmezPBKW027k0s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LU2DymQLCG7e4ANt8B/b7OCO+JRdm6h0Rnn0vUDHunYgkROTukpbVY2u3mn2iY1dXMSot8XC6c9qLfHYBDfE+ZsaNMj3WI9G1DAPlxkxNotV8TZOG2qIp1rfxATkKB70wwkFChYWsOKBSZeO8/4T7u4183wy7/EAz9DGzVCZyis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nLgv2ewN; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nLgv2ewN"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477bf8c1413so13666025e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764944978; x=1765549778; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihHXRiFptoSn1UPDej1d31iPMC/rnq4IC8M6YRoybz4=;
        b=nLgv2ewNxT4zNmRtxqHlfPrFIe6U63+bDtY7rs+NUALipgyQ5/JYC2YbU6ucqjFVxt
         3J4n79cs33GrZ+/MQE/qEJl+NY8unEwh1EpNxpbpOX5VR0sO0goOmOAI5YFDZXj9uamJ
         TrEw6aDsDduJ1BwLr2gREcn/gfbF7iYFSaRtq0hp69ki6qVu7ku1ex9YM3nI+xcODCkI
         HsxUQBvjAxGZ+gyoWYMusNyjzwYqxgtqqad7I2CD9Ag9bUdHVG/4C9FuQLbecobK26IN
         kllgIvJC+K5Q5R65YCSNZ+l1IFRvpjUTxL3HiprXqXlI3ehf4KPG+2+QCfuHeKZAmzcs
         KETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764944978; x=1765549778;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihHXRiFptoSn1UPDej1d31iPMC/rnq4IC8M6YRoybz4=;
        b=X1jr20ZQoFWaZIcE9nr8zAtmLbkLqvPeEm44/WlbR4T3lwAhft1yfZYUO8+Ll4eRPF
         vDnhC5vfFpLT+QJIDTrVwGmhB16KhdDgGME85HvgKOlrYfNkKAVKgS3yzKoUysioNUyN
         74h4ARHGig+neXtGwg1ndYaVxfLyvsfsqzhyKiAfi5qEE6E1Ae8MqYN7XxqBm6gkxPzb
         Zgllf/38HuEBgoAJma0W+ts19OZOU3y5EU3SixA0grXOd0NETn7QotqvZUMvOBJTdsjz
         qer+UTHjttLcNGuakkqvz93uaJmGT3EXf5CYAf+3+/Toiq2SR8wvvm0myJid/mzZQUmw
         1Z+w==
X-Forwarded-Encrypted: i=1; AJvYcCWJv1N7ksMD1ua8jSU3ZhHGfzPwes4MaxcS+XNNQ2UlYsdAETztzfUCkpadYmO26XmBnvr72dVZWn/HOOmhEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywjOTUbOWGXzoIVq6hcBiz/l8/PjwhsSrpdXPw0Xtrip57UiYP
	+h7YWyQgYygshJS0qqIMq5oCEWIy0DTTivp7lDPkRmxlAGJAzLFIdx89cA7bknegss+QG1x7moJ
	fX35MP/yAkE8PiQfBFw==
X-Google-Smtp-Source: AGHT+IG/BdKdEolpce9IynSZK74/u+mPv+jtkZRvtfG4q4RMC/qkIoJnhSAcuXTaRoHTzDBZuG0/i+Hsy6zvrX0=
X-Received: from wmxb5-n2.prod.google.com ([2002:a05:600d:8445:20b0:477:a148:c6bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474b:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-4792af30ebcmr105499115e9.18.1764944977722;
 Fri, 05 Dec 2025 06:29:37 -0800 (PST)
Date: Fri, 5 Dec 2025 14:29:36 +0000
In-Reply-To: <aTLp73haymcs1fkX@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aTLnV-5jlgfk1aRK@redhat.com> <aTLp73haymcs1fkX@google.com>
Message-ID: <aTLsUDBbcbl2ivme@google.com>
Subject: Re: rust: wrong SAFETY comments in group_leader() and pid() + questions
From: Alice Ryhl <aliceryhl@google.com>
To: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <christian@brauner.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Alexey Gladkov <legion@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Dec 05, 2025 at 02:19:27PM +0000, Alice Ryhl wrote:
> Thanks a lot for your email!
> 
> +Christian Brauner
> 
> On Fri, Dec 05, 2025 at 03:08:23PM +0100, Oleg Nesterov wrote:
> > 2. I am working on the patch(es) which move ->group_leader from task_struct to
> >    signal_struct, so the 1st change adds the new trivial helper in preparation:
> > 
> > 	struct task_struct *task_group_leader(struct task_struct *task)
> > 	{
> > 		return task->group_leader; // will be updated
> > 	}
> > 
> >    Now, how can I change group_leader() to use it? I guess I need to add
> > 
> > 	struct task_struct *rust_helper_task_group_leader(struct task_struct *task)
> > 	{
> > 		return task_group_leader(task);
> > 	}
> > 
> >    into rust/helpers/task.c, but will something like
> > 
> > 	pub fn group_leader(&self) -> &Task {
> > 		unsafe { bindings::task_group_leader(self.as_ptr()) }
> > 	}
> > 
> >     work? I'm afraid it won't ;)
> 
> That looks like it should work. The rust_helper_ function is only
> required if task_group_leader is marked `static inline`. Otherwise
> bindings:: will pick up the function straight from the C header. (As
> long as the relevant header is included in bindings_helper.h)

Ah, actually you need to convert from *mut bindings::task_struct to
&Task. And you need a safety comment. E.g.:

pub fn group_leader(&self) -> &Task {
    // SAFETY: The lifetime of the returned task reference is tied to
    // the lifetime of `self`, and given that a task has a reference to
    // its group leader, we know it must be valid for the lifetime of
    // the returned task reference.
    unsafe { &*bindings::task_group_leader(self.as_ptr()).cast::<Task>() }
}

Alice
