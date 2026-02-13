Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCDF218ACC
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770999702; cv=none; b=Sx5OGVkkrYif2yuPowiLpDRphahG/xLfD+CEiHU/4Anq5zUNCgVkhBoRSx7Pwp0lWmqmk8XBUUAV2YDxoHUp29fqB6KadyIXlg+khA52SKLRfZfjYxM6k/PQo3upPz42A/jf7EC5ERa09hVzD/uwx7Sp1JAmDGhZTs8HzX23GAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770999702; c=relaxed/simple;
	bh=89MsOZhPkqrGHPMyz3Il0w6oD2/QvatQlL6IfzX9738=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Msq+ir4weibJmJFAS0IXgH956VL4ErzxM5RAsouUxyDrG5zGakUvDq1erD8P8rQn8eyyBVXW9j+wG0KC31DjNPrBBpHc057o1DA/Hru0UmOr4EY0Xx7dIAaU22Lh+jucdYHS3yu0DqYnT6m5oGl6eT+IAqxnFJSSguoC3SIrqBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qG9Iqb6O; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qG9Iqb6O"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4359849d324so1043398f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 08:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770999699; x=1771604499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89MsOZhPkqrGHPMyz3Il0w6oD2/QvatQlL6IfzX9738=;
        b=qG9Iqb6OGU3BDdaihlo4P1q9f3Uecsz1jP7kVYpIANHghR9GvreSHycRQQTKfzD9Xh
         OHHLoxTwYtLqQwwgvnqmzPMoxHBQABbTMsz4cpSgLfYKGSYWDwKno2I4D6YKHmFuCHPp
         jllRim6RLa+hMPe052Lf9978cN720Lp3sXhr9cEdGlcCs44JqQq7RFnpS0ci4HXfvm7C
         wEpJ8H7/gvqWJqHtJtZ2bYauxqnxwymgknjAKZcfe5U/Rhhh5oQ3aiJxptOjyzHpF6zr
         93LzKyvB7FE4soD2i+DIm1UX+l8miJPvdMgtqSV7iNeRuOifuCqYbR/iymPkN0tL5BOZ
         ltjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770999699; x=1771604499;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=89MsOZhPkqrGHPMyz3Il0w6oD2/QvatQlL6IfzX9738=;
        b=jrLzt+6zPRK5TlMLFZ0ies9uwgk33uaRN2YpaO9U8dkYq8wDRjK+JtJd6drBWDxana
         Z8kXyPV9J06wG2BjEHQXr12k2rcahgHLM8LNnNibqq5mX+NWXO3O8XwqvzIkuvQpcvh0
         bDsIzFY1oQzHsgRq97OFKayHH/vMtdtWaRIIaaJRxEKchJjRORGDUfL/pHx2efxfIfQX
         HsXdYGftd6vsOaeJyatnk5f98XdcyRyibE/foILnZqvfjKCtbDIJ0fHZwLgteuc97UpU
         BAdrOBRyAwcddqiku4AR0MdAJRVUNP+sHnvNeJixYTVmejs5NQWp2z7db1/FrYkaV1ge
         bOrA==
X-Forwarded-Encrypted: i=1; AJvYcCWRbI+mLV1Tk2kPAW9+jGjymcpSzVxPde0pZ6TCm0gXhkzPGJnEDIzmuCXrPD5gYcO59BEbVJVVwRFaRqNXvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4nnHVqpjq50VYXQOC5rVYP5Ixhiq9TvuLmXBlHdVYMF8oIRoZ
	ow0Z/mOOVxfZN4wAJliC6C9o0l6TD1t3KsrLt+fAV5iQ0JRj/33617z5pcUhZrgsX0cm8VRwYYR
	ibomBt8KqTQG4uVds5w==
X-Received: from wrpv13.prod.google.com ([2002:adf:f68d:0:b0:437:68e2:a7c0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:24c4:b0:435:94c1:3714 with SMTP id ffacd0b85a97d-43797856d89mr4031769f8f.0.1770999698964;
 Fri, 13 Feb 2026 08:21:38 -0800 (PST)
Date: Fri, 13 Feb 2026 16:21:38 +0000
In-Reply-To: <CAG48ez0=4Tw-FKF5VF+MZNj4sCqi3CTnbB5PHqvC4mo=3s3Rvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212-rust-uid-v1-1-deff4214c766@google.com>
 <DGDPG8TL1IGS.3OVN0KU25D9YA@garyguo.net> <CAG48ez0=4Tw-FKF5VF+MZNj4sCqi3CTnbB5PHqvC4mo=3s3Rvg@mail.gmail.com>
Message-ID: <aY9Pklev_sI30UoD@google.com>
Subject: Re: [PATCH] rust: task: clarify comments on task UID accessors
From: Alice Ryhl <aliceryhl@google.com>
To: Jann Horn <jannh@google.com>
Cc: Gary Guo <gary@garyguo.net>, Todd Kjos <tkjos@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 03:43:21PM +0100, Jann Horn wrote:
> On Fri, Feb 13, 2026 at 9:53=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote=
:
> > On Fri Feb 13, 2026 at 2:00 AM CST, Jann Horn wrote:
> > > Linux has separate subjective and objective task credentials, see the
> > > comment above `struct cred`. Clarify which accessor functions operate=
 on
> > > which set of credentials.
> > >
> > > Also document that Task::euid() is a very weird operation. You can se=
e how
> > > weird it is by grepping for task_euid() - binder is its only user.
> > > Task::euid() obtains the objective effective UID - it looks at the
> > > credentials of the task for purposes of acting on it as an object, bu=
t then
> > > accesses the effective UID (which the credentials.7 man page describe=
s as
> > > "[...] used by the kernel to determine the permissions that the proce=
ss
> > > will have when accessing shared resources [...]").
> > >
> > > For context:
> > > Arguably, binder's use of task_euid() is a theoretical security probl=
em,
> > > which only has no impact on Android because Android has no setuid bin=
aries
> > > executable by apps.
> >
> > If there's no setuid binary, then the `task_euid` can also just be repl=
aced with
> > `task_uid`?
>=20
> That would still be wrong for binder's usecase though.
>=20
> > > commit 29bc22ac5e5b ("binder: use euid from cred instead of using tas=
k")
> > > fixed that by removing that only user of task_euid(), but the fix got
> > > reverted in commit c21a80ca0684 ("binder: fix test regression due to
> > > sender_euid change") because some Android test started failing.
> >
> > What exactly is relying on the current behaviour? It'll better to fix t=
hat and
> > remove `task_euid` completely as I find "objective effective UID" quite
> > confusing, even with disclaimer that it shouldn't be used.
>=20
> I agree with that; I don't know what that failing test was. (Todd
> would probably know.) My understanding is:
>=20
> In the current version, the ->sender_euid reported to a transaction's
> recipient is the EUID of the sending process *at the time the
> transaction is received by the recipient*. (This is wrong if the
> sending process changed credentials after sending the transaction, and
> especially dangerous if the sending process went through a setuid
> execution in the meantime.)
>=20
> With the reverted fix, the ->sender_euid reported to the recipient was
> the EUID of the sending process *when it opened /dev/binder*. (That is
> secure, and capturing credentials at open() time is a standard
> mechanism in Linux, but it might be surprising to userspace code that
> calls seteuid() between opening /dev/binder and sending a transaction.
> I guess that's probably what that failing test was about.)
>=20
> Probably the right fix would be to capture the current_euid() in the
> sending process when it sends a transaction.

We can certainly do that, but I don't know what the test failure was
either. And it should probably be changed for both drivers if so. I just
mirrored what C did.

Alice
