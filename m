Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655439DBC5
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783274; cv=none; b=fchbrgShK/hEwXOsZd/QR00te8cik8M5jBx1SAfGohjaxml4teyPVNbL7OrG23wCyJZQXHoph1bhQfiRNdE87F9CM8XlRPQ7fg0bfnAYO0KB8P3/bGGDlRHA37ujV3/LCfJexZhgyJCRGrF+syvddL/vXqabOWZ/PrBa+3r/OCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783274; c=relaxed/simple;
	bh=W0cpK2StdmVL+ja9a8PSpNEPhuBWL1p2yceMG1dcpr8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eA1sukGbYDlKtOsC8+og6AlRnl+q/QboGtk+bUbe/j2RnDnjGnFDtOLZx5+6Qig4dOIlUClsG72F/d1SSlO+5UWyCFg0yyQQvBfvpS29bQf1xUsOrgaLZ2Kx85N5VtWEUZ8Y3yG5QmAXMXZL/kWUntZJR0fWSiZO3fPY5WmkFLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HuXOM1u8; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HuXOM1u8"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-46010bc0f1eso572874f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 04:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781783270; x=1782388070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0cpK2StdmVL+ja9a8PSpNEPhuBWL1p2yceMG1dcpr8=;
        b=HuXOM1u8TYYsLI5JH0ImVny08eNx07ge5UWnepfm5m+zMF+3wdpoKrCrbhPy5ZzNj4
         euvVOI/MsaspH9o/YrKJk8x1Zj1dHSLjlUgrtcp+Yg1LI2RVtPdyFWc900XXamzLLVoH
         ebZWW7wO78QFm6aYfjXrtzrstbQVumVR6kUKD8zDHWXBBgowdfoTOT6qE6+ONIB66cxI
         xUQPe53lgYhYy+TxspcPKnwEFBWdBxT//7AWpjZhB0jeF+hBY5t5LGIxXHGOT4vXmDK+
         Pg6pMRlMXhuvUdMsRlOQXUcpTMdejfh9BMEYdDY7i9C89Gm1AJy8u4sYdXxp4sBe16U/
         q3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783270; x=1782388070;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W0cpK2StdmVL+ja9a8PSpNEPhuBWL1p2yceMG1dcpr8=;
        b=f2j6dUYc5tuNibmoyjlb/TBAwuAisPIwXWbegnbSewVOUlWHPEu47MJDkN6BFglYsa
         LYNnoIMzph3cJo3DAvXVn73mpBQvxdmSGHHqojwg52Qx0XTJY2xmoKZ0QTiudC7oeAsU
         ecCvBt/Ijhg2JlrxecBvPVTnJyzOgaPPrDiFi0oujXEndKw7qwZ5EG/Iqx8MCXYBgB4j
         iBgvLFuwfCoCv8Ogleg6lLbxrg+bwUciDQkx+GFUnjZ2V7sHKWfXVcYY77sckI46cNrm
         2nkCfx3kpw6tru4sATXhXwxd9trkkHGLqfEuwgrAVt3fKdeEAyRTJl9yndkpQ39XjPcB
         aEsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vBwaJgm0MkZa40yKo7rZ6cgtZEhwF/WErfs6ZEQEgVGNvJ5q53xOh5UhF1u2zTOu49EvScH81ftCRMUf/ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvtaKyWgHzxvX9b5EPFvfJa/FndgcdDkfeH04PftEWtKe/P41W
	ltFjWGDsfFF+ZkYFsSc89nSkKpXOvdOBPjitO5jmiuUYDwfcy53JeZa4nKd+VjG0FB5o7zg9d19
	y6BEG6jd7rWA4CehnNA==
X-Received: from wmaj8.prod.google.com ([2002:a05:600c:6c08:b0:489:1f08:926])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46ca:b0:490:b642:ce2c with SMTP id 5b1f17b1804b1-4923a9956cdmr27269655e9.14.1781783269180;
 Thu, 18 Jun 2026 04:47:49 -0700 (PDT)
Date: Thu, 18 Jun 2026 11:47:47 +0000
In-Reply-To: <15e81f5bf354cbe3cde765526762e4ebb3ef6970.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618095952.3687099-1-phasta@kernel.org> <20260618095952.3687099-2-phasta@kernel.org>
 <15e81f5bf354cbe3cde765526762e4ebb3ef6970.camel@mailbox.org>
Message-ID: <ajPa4_U_gcxr8SKO@google.com>
Subject: Re: [PATCH 1/3] rust: sync: Add abstraction for synchronize_rcu()
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Lyude Paul <lyude@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 01:40:05PM +0200, Philipp Stanner wrote:
> On Thu, 2026-06-18 at 11:59 +0200, Philipp Stanner wrote:
> > synchronize_rcu() is a frequently used C function which is always safe
> > to be called.
> >=20
> > Add a safe abstraction for synchronize_rcu().
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0rust/kernel/sync/rcu.rs | 8 ++++++++
> > =C2=A01 file changed, 8 insertions(+)
> >=20
> > diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
> > index a32bef6e490b..9b9addf8fedf 100644
> > --- a/rust/kernel/sync/rcu.rs
> > +++ b/rust/kernel/sync/rcu.rs
> > @@ -50,3 +50,11 @@ fn drop(&mut self) {
> > =C2=A0pub fn read_lock() -> Guard {
> > =C2=A0=C2=A0=C2=A0=C2=A0 Guard::new()
> > =C2=A0}
> > +
> > +/// Wait for one RCU grace period.
> > +///
> > +/// You typically do this to wait for everyone holding a [`Guard`].
> > +pub fn synchronize_rcu() {
>=20
> Hm, should it actually be #[inline]?
>=20
> In C nowadays usage of inline is discouraged ("compiler knows better").
> Unsure how Rust handles it; is its compiler different?

If you don't mark it #[inline], then Rust is going to generate a
function for the Rust synchronize_rcu() wrapper just in case a module
wants to call it. The module might still decide to inline it, but
because there's the possibility that a module could choose not to inline
it, it will generate a wrapper in the core kernel.

For simple wrappers around C functions, we generally just want the
module to invoke the C function directly, so #[inline] is good here to
avoid the core kernel function.

> Moreover, this would be an opportunity to change the naming convention
> to rcu::synchronize()
>=20
> But since Boqun & Alice are pushing for rcu::RcuKBox for the reason
> that it seems desirable to explicitly highlight that that's a special
> Box, I guess we should be consistent with that and also have "rcu" in
> the name here.

I prefer the naming of synchronize_rcu() here.

Alice
