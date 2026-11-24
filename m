Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522412;
	b=Vq2cbCjB6ITydX94g6YRcYV+JtfxsjR0E4NfXDg69uZO08sErX1zj9g46dx/ANlrynH2
	 1MI2evxb7M7WsH7s+OIkiOD6ZOhM8Lb1qnOqslED5ivm64PyCToi4uPp4G9lzaOfqP/3Y
	 LslwsIU+eiMAOJRhEIxSUtey6qiUSbki7MPw5tezDhVTC3auDmr3Xc/vjU+3Qy5L87h8q
	 wbt06sG4uga4ijunxJs+SUr3GkLHcG7Iv29Dg3D4P+fHSGBj3kcyntfEbbSGJasJdv64S
	 mCxrCxCD75FmcG8b6By1rNsq8VPzaMtQ+xo+j2xol5fs2avIXih51PxZvkx8fHcdeqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9txfLV0X7J+AJlocBX4pn0cSS8Iiklmn56A4kBLwtUM=;
	b=YVutpOFtA6LiObPn9rlxSPFQwRXws2r4hKbTe24Eu2o0Sd5VbryG+cGxnRTuFIuhS4wm
	 TqtH6LBPL7wue32sDRjq3gmP7tykf7KKGFLwgIl08lcdp86y4jaxKmcom4X1Xn5LPh3NC
	 utIqVnTdPVnestDXYCOhfXIe//VLQ6DUD5U6i49DAKOimDs2rkpv2wRCpOiRqZYUQNs8P
	 yb448ppocYdfZsLgosfrtgSirgLCBtGOKCy6d+CIkMNKjQbYZ2x+m4AjdMJsZ1TQcoJev
	 WJ2diLfLVFcRHnWZkogUePMxPb4GMrdy1H1ZOUhuaGlQiC0BtAJk3wOIG0hZKVITA7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YsgMZmDi;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC1E606A321
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 12:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BC1E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YsgMZmDi
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so28781155e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 04:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795522409; x=1796127209; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9txfLV0X7J+AJlocBX4pn0cSS8Iiklmn56A4kBLwtUM=;
        b=YsgMZmDiQbEqjVJRBimGhvLGwr9kzHj9glkDjgCVetBle1OrRe66JT2A0wAoDOJlVH
         3eKtFaYlR3COaFP7I/pHY1t8i9hQGp7K5EqlwMLpxS0/3XEv74X92iuLuCqG8QX6il7q
         kxoYjIvqquTnoKXVyJ72GFWMyDlIOjTrV1z04jHYs1a3vXYdoOUq2rHc8At8o4Dsn4MH
         e1YWey657bbBZm42gXftzDS94wKDaAbUCOuEPOmQRcTQgJzH4bjlgFN62yBYHdzAasdG
         14cuZ44P62LK117RMeK1ZJCVP9A8fBDkyM9/uACc8LIXi/lDaHSu6B4E9tl0HW4IX3WO
         77zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522409; x=1796127209;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9txfLV0X7J+AJlocBX4pn0cSS8Iiklmn56A4kBLwtUM=;
        b=m/jU2slzOwXDZdQ9jhdJmJnF+U1+++c7i1QC/dj1jJJglA4WRWBgo6K2NWpWFLp9on
         My5+AccI1TlRxS6xKBmGrIk9B6aAoyCKUoCQIry34+GSbCE0M3O3yPc9eHLewgYCfydT
         p5jGl5Uxl+g8w6cxOPLJhoZVh9MPPUdf6Dr6lXmlR4SjeUtm76je9kHRm1ems0dv/Heb
         Z3fzxC2srFuHrNREhFk4O7oKgAt/7ZS2fCGmXXVyfH7LQL2qzwJTS2uHjhipxUV7qpcl
         3BUHoSrw3G8eRiQPd0oWXBOJNSUJwcRlNqFpl7I92InFZlT3Hm2wNonWYGS4rCrnS4Zn
         T50w==
X-Forwarded-Encrypted: i=1; AL+hErHAm7m3VZhkgyYX99e955zqVV9rgQuE9GqW5PLHTN/I04Oid04yxmFdObxh4lwKDGMcI/5ljdE06DxyPiAKbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+z+h+fIZVFeuzrXqdaXxSqIoXFcgHZUaz3LcltN88BgSoThhL+
	EIL6fCJ/Kh/MfmY4W2zcC8TXPusaaYuyj8wphUqbNhnEkUWN3xjwhYT7opvCk6NtgIrSC0bEU7q
	/HG1XQG8BUCzIwlrwSw==
X-Received: from wmcn6.prod.google.com ([2002:a05:600c:c0c6:b0:4a2:853:1e95])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb8881c378mr304628095e9.8.1795522409266;
 Tue, 24 Nov 2026 04:13:29 -0800 (PST)
Date: Tue, 24 Nov 2026 12:13:27 +0000
In-Reply-To: <20261122191322.929005-1-inguyen@fit.vut.cz>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122191322.929005-1-inguyen@fit.vut.cz>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124121328.3253693-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust_binder: only remove a node from the tree if it is
 still there
From: Alice Ryhl <aliceryhl@google.com>
To: Nguyen Le Duy <inguyen@fit.vut.cz>
Cc: Alice Ryhl <aliceryhl@google.com>, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, brauner@kernel.org, cmllamas@google.com, ojeda@kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2026 at 08:13:22PM +0100, Nguyen Le Duy wrote:
> --- a/drivers/android/binder/node.rs
> +++ b/drivers/android/binder/node.rs
> @@ -636,7 +636,7 @@ impl Node {
>          }
>          if no_active_inc_refs && !weak {
>              // Remove the node if there are no references to it.
> -            guard.remove_node(self.ptr);
> +            guard.remove_node(self);
>          }
>          drop(guard);

Nice catch, thanks for tracking this down!

Instead of still running `do_work_locked()` on a node that was already
deleted and checking the tree in `remove_node()`, perhaps `Node::do_work()`
should simply be a no-op if the node has been deleted?

If we track `is_deleted: bool` in `NodeInner` (set when `do_work_locked()`
removes the node from `ProcessInner::nodes`), then when the stale `Node`
work item later runs `Node::do_work()`, it can clear the `delivery_state`
flags and return `Ok(true)` early without entering `do_work_locked()` or
touching `nodes` at all (and `Node::cancel()` can skip re-queueing a
deleted node as well).

Since `do_work_locked()` only removes the node when `active_inc_refs == 0`
and `!weak`, any required `BR_RELEASE`/`BR_DECREFS` was already sent when
the node was deleted, and no new references can be acquired afterward.

What do you think?

Alice
