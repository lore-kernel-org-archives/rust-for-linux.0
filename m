Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ED321ADB0
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 10:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746010695; cv=none; b=mjjBQ+ZxZRC1RkMsPb0Idhq5H+sJ2OuofJNoFyYGVkXKyFwHzWduSu5Ga7R32wnzTFqM4kIXVxMN3aEWUig4bl+ZHe+J3q/T6PlmLlTTFwzhJjTo7BJAoh9cO9vx+nepAh1OqyJ6Vjafg5T6dpRZ2beLXzeMSFBSxzh+Zkx9QME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746010695; c=relaxed/simple;
	bh=wexxi0ap4CXj2TdUjTN/SGo3qqqbSHtLyszKPCwTYeg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BKgU2/hYW2oY28dQp4WVf5dP/3WVXrQt3u31oHRfXEpl56GVL4jLuS3iCZesXCKdP7NHEet/4KGWsAgmUUi0i0Iy2m5y8sF/0hJL3uc/EqXuEH6YRh6ZpqI/0xiUZ88n1ebycDuN2qT1T9C4rahftFwyaO8e96m6KTvgREea/8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mccJD+7I; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mccJD+7I"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so40552335e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 03:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746010692; x=1746615492; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PjBYTT0O+qrh/MBY7t8QOEH5IexTf99svcE/px8AU2g=;
        b=mccJD+7IqYfYmKspkv+R9bQcBwiar2lvGHBEaZHR53/uiDh1rvEokRffTODEHEu3iz
         blt4Cj0hBJZWAE5Ft920b4K1TpdkEmnam0SZDksV7nuH2doyikk01M4PjMm8/fT9E6cs
         Rgqq/xJ40uqEbI/TfNrWbwsDwrh2gU54Bitkvm8y7IO3jIW21uVhLrFuXHMBAR+Szd6g
         rkBjjR+1ynnyVO77fprcaz+/lwmfOnGDDbIVRHV38LUG/Z/cC1Kwd0CfacaDekX55cHH
         jjjwvrv3LiAXyzeZoPNRqveJ9p4MxdyHodSDxTByXwNe7YjTWP2vetRdAOEwh49Tlfup
         4MWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746010692; x=1746615492;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PjBYTT0O+qrh/MBY7t8QOEH5IexTf99svcE/px8AU2g=;
        b=cGIU3nDe0Na6uBE33WT+mEhQWxAX+6k9Pso+cwAWl0gQHfhZaMKKQxEbERudOmXddj
         LlioJuqYuUBKGKlLqDkQTQnYJ9TYiPbq7r7Gphqg22B6UlVEuO450DRkuMZB1gm87Hzr
         LFNaynazr0gaHmJF0U42OpPvJ2ItiyC4DqDV9nbSYcIdLVpWWr7AxdLobDXPnPNfxMUi
         0D4MJrlvlTQJQlgEvTumt5IxJ1kSz2FF01kt50b1FDiApXyt11yUfFnchruF527AkeoZ
         Sn7F6Fx+5gImJ0LxKbr8moflj9JjKnSXN4imKByFGDWTZ48P2n1X+H2WJ+zcDbSsrA7Q
         W9bg==
X-Forwarded-Encrypted: i=1; AJvYcCV6U7TVjBN5zmE2bPSLfXrvDz8cDBgk6n1vLwODddzy37oYbJjkebvSOMAimP3RNG3vmfQ2qXepK39GfjmxgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEwLWr1sSEchPvm5ZsCWUPHspF/bWZgVM7jq1Nq7lRc8gvgjNu
	FI+r5dXe+N8MKyWYq2cb25jKQOguzkDKqn2WqVUQRHsEWZ8ipxu6Qo8BZzyvYBBsBDQ/DxW6mu7
	HETs4dysbMEntpQ==
X-Google-Smtp-Source: AGHT+IFHjlIIuhkrr7l7slmv8Wy05WcmyIvuTRpTjV32LT1bl3shxS1yicpwR5n+T6uAEoLrOuYDlyMrRCQ1Qsc=
X-Received: from wrbbs1.prod.google.com ([2002:a05:6000:701:b0:39a:bca2:7a1d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6488:0:b0:390:fbba:e64b with SMTP id ffacd0b85a97d-3a08ff3adfcmr1387255f8f.31.1746010692094;
 Wed, 30 Apr 2025 03:58:12 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:58:10 +0000
In-Reply-To: <2025042919-varsity-registrar-fb45@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com> <2025042919-varsity-registrar-fb45@gregkh>
Message-ID: <aBICQt-CzQkMw4uk@google.com>
Subject: Re: [PATCH v2 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 29, 2025 at 01:09:18PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
> > This patch adds a more convenient method for reading C strings from
> > userspace. Logic is added to NUL-terminate the buffer when necessary so
> > that a &CStr can be returned.
> > 
> > Note that we treat attempts to read past `self.length` as a fault, so
> > this returns EFAULT if that limit is exceeded before `buf.len()` is
> > reached.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>

> > +        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
> > +        if len < dst.len() {
> > +            // Add one to include the NUL-terminator.
> > +            len += 1;
> > +        } else if len < buf.len() {
> > +            // We hit the `self.length` limit before `buf.len()`.
> > +            return Err(EFAULT);
> 
> How can this happen?  And if it does, why is that a memory fault?
> Doesn't this just mean that we read smaller than our overall size of our
> buffer?  Or am I misreading this completely?
> 
> Maybe a self-test would be good to exercise all of this :)

How can I test userspace access? Is there a way to create a kernel
buffer that strncpy_from_user will let you read from for use in a kunit
test?

Alice
