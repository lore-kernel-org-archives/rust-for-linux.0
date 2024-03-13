Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7F2562F
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Mar 2024 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710323467; cv=none; b=PamUAsfVKSWxm24dC1ckW82skwUxlaaPk579/QjYwURZHHOsFGcWyucLghIW4z+zgX81bp7FJ8f+ozNckIESGEROBPy6fN3NBrYthJlPCGtPunAWblOHFoNbJPh2/wnHxXSoCnFweMRPjI1btbi6qEHsJLPZaWOuNg9kHZE7nxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710323467; c=relaxed/simple;
	bh=VALqgjTPnatoPxcvD7oU1/NWjcytUzXnQ7aea0zfd7I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NT3/B0ZeMtqvCQUUVnYiNkIX2KovkkK2EVgu3LfSQqTWKI+UuvumzfIiNOu1nVgtrdz/qhSHcWFSIvtOiFpUYlFnGEmHlsmI7XUo2yTDpYhqkvcK9YKHyIWBPhLBErBkze59+WOeF8Rki6Jxup0dZ55m7kY0waOLw7TX67XeS88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B33RN2S6; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B33RN2S6"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-60a0694df25so54194137b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Mar 2024 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710323465; x=1710928265; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XRJfQxahYGAkNrqo7I2PmE92A0G8ANlJPrSGDn6Zu48=;
        b=B33RN2S6UPtn4nbljYXOGlyGZtZrF1eHxck7ZmwxZHmT4XKoLcO8kOzgyOKriI38jz
         dB4yKxutVHtmTBgM0UzKzqw0MOlDlEZV3JYi+Gwill/nOfFq252DVeAhMdGrFdwY/KhU
         tFaX9oqnuVoOUjDls4yTXhcpZaTQIx+w8EzoKkvT4rAJXmNX8sVBP7XtuyaD25w7m+qe
         91ftt27nlLMvKdWOu/YJEzBHhTTZiNd5IgiwSaqqKd8kt3lp3qAbKjufNz+Ytr0QMxou
         up+5kIL8YHpjOuRoTUQSF11HZjmPzNj9VM68HcoxXZUIRZJRDa6g4DZ8f1mejOJ3t5tX
         Fq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710323465; x=1710928265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRJfQxahYGAkNrqo7I2PmE92A0G8ANlJPrSGDn6Zu48=;
        b=wSlR9RcBR5YdCpLzpdMYSrTF5A4CCINqzEIPvFR0LWoOdJ4YfrGb0nPPvKSMn4mSX+
         xmSMeWo0e78Tc95pkmevlQQgvVt5326ZgVl0sVJ2v2SdleYY/jfsT8nn+6LwzXdHn9r7
         pkr8CjxksQgGw74FcRTEz82SuE8uiRyXZ4fsnpOLE2vrBcsqb4TKf61Ts3hC8Kt4nuk4
         AbYBb36RL55bA8cbKWLkECzScWXLh9D6sjRGly0CThG39486nBWNHJpQqq+JtQwBsO80
         yvkf3elL4ODO86ENkZLizNgQA+iPkJfsntfpYG3P0hOoipZOIAYXEgzaKNeVUoAkxucD
         UDYg==
X-Forwarded-Encrypted: i=1; AJvYcCXyxABDr/nWmazFA6HWxbW7BCxLYzZOonUlhy/pwEoVplmpn4w+skXcjNiIYT4BEP4qy9pIF2qXZjFghyhbJzHWoIymR9G38F1lzi/lytI=
X-Gm-Message-State: AOJu0YxsgpODJBmrRHF5ihoNuCE8ztLqykxAXTIiSntpDfHTKv7CULpp
	SMqrUxem5361tG97NhqJentuht0P6GEeSGg4GqCdONMrF9pM+f0od5n7Otwaglq4kR7LH0yrfYP
	Jva3wjChmW4A8Ug==
X-Google-Smtp-Source: AGHT+IEJpiShMQsaleNGTKsdQI82HF3B6Dh14JeDghGydl0QX1ub+75M2xBZWQMzwcI/zPkgrssHsW93gsXcgGI=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:188c:b0:dcc:6bf0:2eb6 with SMTP
 id cj12-20020a056902188c00b00dcc6bf02eb6mr61977ybb.6.1710323464848; Wed, 13
 Mar 2024 02:51:04 -0700 (PDT)
Date: Wed, 13 Mar 2024 09:50:59 +0000
In-Reply-To: <ZfCQuh-JrplKtbco@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ZfCQuh-JrplKtbco@boqun-archlinux>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240313095059.844387-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 2/2] rust: sync: add `Arc::into_unique_or_drop`
From: Alice Ryhl <aliceryhl@google.com>
To: boqun.feng@gmail.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, gary@garyguo.net, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

Boqun Feng <boqun.feng@gmail.com> writes:
> The code looks good, and FWIW, I added the Examples section for the
> function since I at least need something to run when queuing it to
> rust-dev branch ;-) And I think it's overall good to have examples for
> every `pub` function. If there is a next version (which is unlikely),
> feel free to fold it. I can also send it alone once Miguel put your
> patches into the rust-next branch.

Thanks! If you have reviewed it, could I have your Reviewed-by tag?

> From 7d26d1177a2788ba96c607fd9dc45baf469fb439 Mon Sep 17 00:00:00 2001
> From: Boqun Feng <boqun.feng@gmail.com>
> Date: Tue, 12 Mar 2024 10:03:39 -0700
> Subject: [PATCH] kernel: sync: Add "Examples" section for
>  Arc::into_unique_or_drop()
> 
> These examples provide better documentation and can serve as unit tests
> as well, so add them.
> 
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
