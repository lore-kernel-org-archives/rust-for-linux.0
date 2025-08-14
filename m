Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B57A2E717F
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755159128; cv=none; b=K78qeiPDCbgJI+ZVmORXQKGzJGgq4CSjdH17ULeorpA0JKVo+7MeEwhWG6m/TuRr8AOtxrenYfUT5d50he4zMmLdbjC0aUts/Z3gQbEpLC9T5H2I7pAXdg4uDm9geziOlBsiC6pfj3QaULoWkUzQR2Q84BhF0JXuzMI0KhSndCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755159128; c=relaxed/simple;
	bh=etPciUF+58gxBC38Z5tb2kbCgRKAGBYjba2+obhP3Pk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e8uandRxm60OVJ9GVb1NpRaM6sKusNkyG3QIwlOMZx1ebQjP0zEL0aQMyU3wmXUefhToRR5muIGFHKIOtUUaG7q4+XHsvUYie24AIVlSM+5sxP4/+I3cJ1f6rQzYdTb3c12dPBxHeeZnVofmcOydCETD0Ql40OqQVoEmKE0VT8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yZE5IBOU; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yZE5IBOU"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45a1b05a59cso3229285e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755159124; x=1755763924; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iiv0D3Enw9HFquQbvd+ThrKyXaUitLTqjTCCoxDtDU4=;
        b=yZE5IBOUbz8EFYZpMjKI4pgWb2674opRK1u7Mp8CpZgBoEp1Gi+ABWV3tfs3ct8ifA
         Dlc3rjJG+hdeMN4QvAY3+NCxn3xL/o6RI2WU99gzxkMCd9QY3PHmRGcAPXcRv0twn73G
         TZ/rYCZmGHtXaa33MN4rV/ag8rNG9edLePWdLE/cBHExO+GTOqecCXAeHa2lIAY5+iAg
         C4/P6NUxgK6LLXEpCakQSiJxJJ/XlPp41S4yML41pEDIncEZAqrkNGUFcKkMDJbAK96A
         oYsoEjZ74t3ueGi99QYjBaY3KWhioV85S4s72nRV8M2IieZjpaX4vT0WbKdM2LeWqtbK
         TFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755159124; x=1755763924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iiv0D3Enw9HFquQbvd+ThrKyXaUitLTqjTCCoxDtDU4=;
        b=QlmjRpbhMaD3FOXMbw1GnhwP4i0pUiF4eQor0yPVPG0BkEF0HTRzlojObWi59lQoB4
         qUp5b+bDf25Ra/bd/Q+Abm0SiUC1b+L28Boahk9DvmuS6coi7MSQW5ipKBy1U3KowVcH
         KfBb2xclvaG+Kj9X+xEkbgFZLEZoTk6tulQ/v5ffrQTmYahhX31d8lfR8TPUzUH0owNh
         79LYxZ5RYXruIF1bqvNBqMvQNe9PS/CutOuONBujBSMGeJaAXAjOuN3lrJ2I9EYVNgzN
         OAy7E/MwisJpnm3tJf1YfhVt2Qt5kqcky17+XWZ6ZKUBONVLrxIDGiCJvB02jkLPuhL9
         7pKw==
X-Forwarded-Encrypted: i=1; AJvYcCV9KJS4pf2+NszDiHcz73vPA8q9DZScOgKPIWgs/ULmFPLkDX8Te+xpKfvo26kGGD2pDqVlJnMoqpqKY18eWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFm6gg2hVwDPvrRy11Qtp7Cgaa05KO7Hxn+dYYyeqKmW20cMi2
	+ggMselP3zE03dV85j7ObcXMrVzZs3Y+C3QQVnA3j1ciiTKy3uDnagWIDLt24iir9XPGDXkm9lZ
	0Mrf14MgIQcAi4a46tA==
X-Google-Smtp-Source: AGHT+IESv7C6uOw2zHqQOv3YRyUouZwm6W4bbO31jyAkUIflR+veVNh5T/iYXpCb7ihU/hXwmic0ConekAIa/1U=
X-Received: from wmsp31.prod.google.com ([2002:a05:600c:1d9f:b0:456:111e:4717])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cb:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-45a1ba14d28mr15596215e9.16.1755159124425;
 Thu, 14 Aug 2025 01:12:04 -0700 (PDT)
Date: Thu, 14 Aug 2025 08:12:03 +0000
In-Reply-To: <20250813192621.25255-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250716091827.816971-1-shankari.ak0208@gmail.com> <20250813192621.25255-1-shankari.ak0208@gmail.com>
Message-ID: <aJ2aUwi1L5RjK-X_@google.com>
Subject: Re: [PATCH 4/7] rust: fs: update ARef and AlwaysRefCounted imports
 from sync::aref
From: Alice Ryhl <aliceryhl@google.com>
To: Shankari Anand <shankari.ak0208@gmail.com>, Christian Brauner <brauner@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 14, 2025 at 12:56:21AM +0530, Shankari Anand wrote:
> On Wed, Jul 16, 2025 at 02:48:27PM +0530, Shankari Anand wrote:
> > Update call sites in the fs subsystem to import `ARef` and
> > `AlwaysRefCounted` from `sync::aref` instead of `types`.
> > 
> > This aligns with the ongoing effort to move `ARef` and
> > `AlwaysRefCounted` to sync.
> > 
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1173
> > Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> > ---
> > It part of a subsystem-wise split series, as suggested in:
> > https://lore.kernel.org/rust-for-linux/CANiq72=NSRMV_6UxXVgkebmWmbgN4i=sfRszr-G+x3W5A4DYOg@mail.gmail.com/T/#u
> > This split series is intended to ease review and subsystem-level maintenance.
> > 
> > The original moving patch is here:
> > https://lore.kernel.org/rust-for-linux/20250625111133.698481-1-shankari.ak0208@gmail.com/
> > 
> > Gradually the re-export from types.rs will be eliminated in the
> > future cycle.
> > ---
> >  rust/kernel/fs/file.rs | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> > index 35fd5db35c46..18cf579d3312 100644
> > --- a/rust/kernel/fs/file.rs
> > +++ b/rust/kernel/fs/file.rs
> > @@ -11,7 +11,8 @@
> >      bindings,
> >      cred::Credential,
> >      error::{code::*, Error, Result},
> > -    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
> > +    sync::aref::{ARef, AlwaysRefCounted},
> > +    types::{NotThreadSafe, Opaque},
> >  };
> >  use core::ptr;
> >  
> > -- 
> > 2.34.1
> > 
> 
> Hello, can this be picked for review?
> 
> The initial patch which moves ARef and AlwaysRefCounted to sync/aref.rs is upstream (commit 07dad44aa9a93) [1]
> 
> Thanks,
> Shankari
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=07dad44aa9a93b16af19e8609a10b241c352b440

Christian maintains rust/kernel/fs, so could you resend this patch with

	Christian Brauner <brauner@kernel.org>

as a recipient?

Feel free to add this when you resend:
Acked-by: Alice Ryhl <aliceryhl@google.com>

