Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799735;
	b=lGG9ja7wSds4I86qRJL9R8gonOwx1f+/Q8vAq0senr6VyZF3OKPgTMyMB9DbBeLwIhbj
	 9kMWyNuTGHn0Xadr5nKnL/iFyq0dv+zLyFjujhQS0T3lRNbBv8cg1TpduNWy6t5LJNDk+
	 8TQJ6dGLo9hTCbwVlBJ5DBzXSB0IJ1Ybii7t2HgVKpUhAIjY1jGMUoF2Zcy05Oxlz+7Jp
	 fKKO71NPp91nHUvhXERCUhAeDtIYLer/MMEEEg0LMweghiesKOvZfRP8srDNcLE7sDMPY
	 edw3cfzvewHP2hd+nerBtMiWFB3vzeGE3Pk9cQAcREOQg5NKRlHF/NjhdTcGa2xR8hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/UfmuLP06BAHAycCguSoDWMAlj8HmLnc5qWwAUzsshs=;
	b=2xqwvjKOSfbPL7RSMPN7+3VEp1kVKC5+aezwnDohnQHzWGs4TRZycqf0vgDQvBLHaA2v
	 AqKIIyMMtvpxGyE3VBGkM8CVSJMs9RAxgJtIyNqd14inOot8e/xwPcOq4Q/c1GjfB62MU
	 ocXdsx0zxXo1pOclUwtY+db6Z9d54Lj6dLgFS7Aq2GtNpUaM3emkAd2Ll8jv/YnVBC883
	 pKxcb5YsvvzKCNl88Dt2x0t/kITgLjEqyZ58vm3ezIGMiVp/80A1ks9cvNpv8Z/3Mjrz6
	 oZKkalhe8YnkVbRoMYEqXMyGJJS0S6yBqxEMXRgAC1jIugPU9EeGJ9Z9kmxSfmyni1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h8Z08pXQ;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FFE606A31E
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 17:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34FFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h8Z08pXQ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4b9f8c66f72so11323225e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 09:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795799733; x=1796404533; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UfmuLP06BAHAycCguSoDWMAlj8HmLnc5qWwAUzsshs=;
        b=h8Z08pXQHuXeva5jFGbGWVRIXlA6LVAQKtUA/qaKGdTo0+oWVHlKRTTUZI03gz18bz
         LjkeHmFWQVcSiLF2q/ZM7h0NE3aNVKut6mqs00TnqgMbpihV8WWcJArbPJGFZ6MBm9vI
         usMgoyrgOL+qf6159TRQCwg0hBTbO95GmQIKtNHld8Sb0HzRhayeJWhqCuPOcXc5g6I0
         2gJwQsURv2Vck7dHGBKhCWv/0FigcQ5kaCxshd2ZhGbYbeIF44398nfRQIYcG9tMRrZx
         +7NmKsFhTm8r4sL9Wm8yqHsR4f2fn2zvW3WgsD14gXQuYlSBnYd5yt4lJT2RExfhVcRG
         RuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799733; x=1796404533;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UfmuLP06BAHAycCguSoDWMAlj8HmLnc5qWwAUzsshs=;
        b=lKfqp6VWuzI5Tx23p/RTwcg91Z3rDzroE4BlRVyNTNAH0YQvHOjbZlmTGlWn3N8uCR
         b/0lYtwgcduui8jGq+wZp13fRCBd7Ud94Z3Jbu6WH/E21f+nlWI1gPU9BkxboGAfczx9
         FfsAJYEL5fwJ+JSNcigUm701+Es8Idha7V3XvKR/gbiJfLv0g6Vp7ewezL3i10xJQLgG
         ABBYqESTQlNf23memSsF5hxHxTKWSgiVaIBrmmNyjEZV6Rf5k6g7/gHv58VHtmI+hdC0
         Ps5Jvb0tpervHsHOunhxS64gJkw8B6cIQCE2NrGMHPUOQpXGfVleMlWC47uc19EdXE+x
         vqaA==
X-Forwarded-Encrypted: i=1; AL+hErEVB+AkzYU8j0LnUPGYY9aZT/Uzx5IheZ1zj4FeG64xtpL8JpcgGQoEwe8rpU/TITYtfo81ESbrK3jZnyQNWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+YDqh3glrjILHz/9EGYq2LtMw6YGT4hNzKz4ExeLydZlmmoD2P
	p5NG4Ncfps6OFl+jifCJIJoCkuoUYdY2OaCzpkNqT2Tv8VsG6Hu1NHUB+Jk+iHw2xIqsstWUg0j
	X9H8/QC1Ej64fPDpyAA==
X-Received: from wmaw11.prod.google.com ([2002:a05:600c:6d4b:b0:4ae:7292:22a7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:18:b0:4bb:abe2:bbce with SMTP id 5b1f17b1804b1-4bbabe2bcc5mr96165705e9.29.1795799733462;
 Fri, 27 Nov 2026 09:15:33 -0800 (PST)
Date: Fri, 27 Nov 2026 17:15:32 +0000
In-Reply-To: <20261127124107.1782-1-AeeSec@126.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261127124107.1782-1-AeeSec@126.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127171532.2097157-1-aliceryhl@google.com>
Subject: Re: [PATCH] drm/tyr: fw: fix integer overflow and inverted range
 check in Cursor
From: Alice Ryhl <aliceryhl@google.com>
To: Bilal Hashim <AeeSec@126.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 08:41:07PM +0800, Bilal Hashim wrote:
> In drivers/gpu/drm/tyr/fw/parser.rs, the firmware binary parser `Cursor`
> has two bounds-checking bugs that can panic the kernel on malformed
> firmware images:

Note that neither of these can actually trigger a panic on malformed firmware
images today. `Cursor` is private to `parser.rs`, and its callers already
guarantee these conditions:

- `view()` is only called in `parse_entry()`, which already checks
  `entry_size >= size_of::<EntryHeader>()` and computes
  `entry_end = entry_start.checked_add(entry_size)?`, so
  `self.cursor.pos() <= entry_end` always holds.
- `read()` is only called with `nbytes` in `{1, 2, 4}`, and `advance()` is
  only called with `section_hdr_size <= 248` (since `EntryHeader::size()` is
  an 8-bit field). Because `self.pos <= self.data.len() <= isize::MAX as
  usize`, `self.pos + nbytes` cannot overflow `usize` even on 32-bit systems.

Hardening `Cursor` so its bounds checks are self-contained is still nice to
have, so please reword the commit message to describe this as defensive
hardening rather than fixing a reachable kernel panic (and no `Fixes:` tag
is needed).

> @@ -144,7 +144,7 @@ impl<'a> Cursor<'a> {
>      ///
>      /// Returns an error if the advance would exceed the data bounds.
>      fn advance(&mut self, nbytes: usize) -> Result {
> -        if self.pos + nbytes > self.data.len() {
> +        let Some(end) = self.pos.checked_add(nbytes).filter(|&e| e <= self.data.len()) else {

This line fails `rustfmt --check` (please run `make LLVM=1 rustfmt`).

Alice
