Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED821D3CD
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 01:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765415803; cv=none; b=tnAd/cF3rv4EuhoAOgSyil3vvs6ZoovUIgTb77Bw8mbOhPWA0IYJhWTvekzQMau9/TFfMN6o6SXAHerVruE48HvIC2+124zFiLP/51UxmLoFTw2aGBsmI1T94ih2+Ptxh9JZpGBSMvHkE3tyF0KqyCjc+P2PGs1E7HNMQPbJ0Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765415803; c=relaxed/simple;
	bh=PUfjlKpqmKhrLgMhuv3pGJ6/AvS8A5zn7AmLGmmkHKA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SKZKqiLcQSBRlnu3mI9M8fZFhwk7u7iBzloPYOyq/zS5Kz+BZ1VN5nqW2uOp5MQxnHOzvjWemM6u7zjfJLmwghmj3ac9uczyGcjzZGPM1SgjLtEyb64qJSpKbXhROIdmezX+B2cdqwyks9sqTp6RvVnyp20g1/za7xa6IbnmdwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kZJGCiRx; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kZJGCiRx"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b7cea4b3f15so53895866b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 17:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765415800; x=1766020600; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=04UV6S0VTjJRAXzHXMimS82i2wL9M5iXPq4gcu/tWew=;
        b=kZJGCiRx52EWNuH152oBCpQEbYFpa46BxKbiIuQL2ebTutAeScqRu+0IHC4EK+VoXB
         Yez5ldueFvDSVB1NSBee+1i8+gR8Ej0UpISGH1gJ/JJNcP0x9Ca1oxlI5frg+Io6REW5
         sEZps8MY7ZV1b28wXc1s71uB6d8FXvzQosz31qL1v74rPdVHnlpNBi5wNKDLgfINwgBa
         creWMlYqvhV4cwT65KyLApeOSLZ/ewJjYJrBnfbjbSWU+vOfwU7wgT1Ay2eGsri5ZWPp
         PIIZj68V/CT1GY5V+MnXkahwXaLd5F08A5pw3Asiz0K+URJtZqWQdVtyJP5zVdHveflP
         ZfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765415800; x=1766020600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04UV6S0VTjJRAXzHXMimS82i2wL9M5iXPq4gcu/tWew=;
        b=kN8Dvfa6dvpq5I/6NMSiOeJbjnaSO96wneBRz9jyQABhVBh2kj7HDioJEHfXPtNJE8
         tIWQkTamoj+ijK7qrrDzZs/Q5nvZkbhqPmxbm+PUdMW0qu8Z3fSH71KXT7LAdqjlpjJl
         I0ajTz12Kp4OHt2XvXe/xgTLYOfDZE+scr52qM22aHl2rgb4E05UXafQAO+WZuZVvjnE
         D/5u7YPEN2NGLpPAzLn9V2Cs0uST9Uv7Nc3UkajHpv7AwPEF1UQ0iqN11AGvsjlJrg04
         dkD343RLmEjIRPkcF7av9a5gljG1n3jpnpm80wThMEPbf7rbpq117qOWO04hYJ00lWKI
         U3rA==
X-Forwarded-Encrypted: i=1; AJvYcCVJAKduN+lgLt6F7PVHUtrc5rllu8IEOM9+wr2hdN0o2h48kPMR7gT9trYH3DIv7CO9Nx7Et/uX62RQy9IkPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxegg2sp+flCzzzLImnSbtoplrppOkRZDs43X2bdPSNIdWuvteN
	J1sQXM5bnEBQRwuoO9eVkVLTfJHi2rToYXtMsrc1SzcjQon84607KDTGUF3NwhsHeUrUA1BZEdn
	/6BPMQTO8++BE0gB45g==
X-Google-Smtp-Source: AGHT+IH6muzXfzGqtMEb2tDK8/p7uGHEMmriCU/MlJLwjtkA+J7H+i/PuF2Pvtluic0l/XWDw/QxCeBheLSoF/4=
X-Received: from ejcty15.prod.google.com ([2002:a17:907:c70f:b0:b79:f456:e928])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f98:b0:b73:6d56:7459 with SMTP id a640c23a62f3a-b7ce8414a42mr520570066b.38.1765415800418;
 Wed, 10 Dec 2025 17:16:40 -0800 (PST)
Date: Thu, 11 Dec 2025 01:16:39 +0000
In-Reply-To: <20251208154307.0737cc2d.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aTLnV-5jlgfk1aRK@redhat.com> <aTLp73haymcs1fkX@google.com>
 <aTLsUDBbcbl2ivme@google.com> <aTMUqp5pXzAscrdZ@redhat.com>
 <aTMhpX-_H4Y4J7Ud@google.com> <20251208154307.0737cc2d.gary@garyguo.net>
Message-ID: <aTobdw31eNj_ahrU@google.com>
Subject: Re: rust: wrong SAFETY comments in group_leader() and pid() + questions
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <christian@brauner.io>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Alexey Gladkov <legion@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 08, 2025 at 03:43:07PM +0000, Gary Guo wrote:
> On Fri, 5 Dec 2025 18:17:09 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Fri, Dec 05, 2025 at 06:21:46PM +0100, Oleg Nesterov wrote:
> > > On 12/05, Alice Ryhl wrote:  
> > > >
> > > > pub fn group_leader(&self) -> &Task {
> > > >     // SAFETY: The lifetime of the returned task reference is tied to
> > > >     // the lifetime of `self`, and given that a task has a reference to
> > > >     // its group leader, we know it must be valid for the lifetime of
> > > >     // the returned task reference.
> > > >     unsafe { &*bindings::task_group_leader(self.as_ptr()).cast::<Task>() }
> > > > }  
> > > 
> > > Thanks again Alice, but the comment still looks misleading to me...
> > > OK, quite possibly this is because I don't understand what does the
> > > "lifetime of the returned task reference" actually mean in the rust code.
> > > Does it mean "lifetime of task_struct" of "lifetime of the process/thread" ?  
> > 
> > To start with, it's likely that this comment is not the right choice
> > for this function, given our discussion. Most likely group_leader()
> > needs to be moved to `impl CurrentTask {}` and the safety comment needs
> > to explain why being the current task ensures that the returned &Task
> > lives for long enough. I just took the safety comment from the code we
> > have today.
> 
> This indeed sounds like the right approach to take.
> 
> If `Task::pid` or `Task::group_leader` just gives the pid or group
> leader at the time of invocation and doesn't have any stability
> guarantee, then the user of the functions will likely be misusing these
> functions.
> 
> It's better to just have them on `CurrentTask` for now. When an user
> arises that need to retrieve them for another task, then we can come
> back and think about a proper solution taking the scenario into account.

I believe Binder just uses them for including the pid when it prints to
the console. But I'll look into this and figure out the best approach.

Alice
