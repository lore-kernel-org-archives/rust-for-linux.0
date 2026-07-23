Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F44322EE
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807921; cv=none; b=g7aKZvTPLR8ndORCujzEnKTjOEzhfCQqcszHaBPN/6o4tl+FmwL0LkgT78wS1qf/N+7WkQr5dVHi8eVhHzwGCuXbwPg39Se76BKqG2rrTNnNq2J984se7W6OWkMrLcXcVRi5rmLd8f6jCxzmRfLfpcVOoX2mYrxqGrTzzSuTIDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807921; c=relaxed/simple;
	bh=rvSLWv1lyggDeshfu8c0P3+zybcNtNai3hRLKesivpQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aWFck8Jp32MUJuA4BzqiwilKRzKa77g/Cy/MqMxIVPKTdKQTZLJ1xUifyy/SwbIDKP3oTiExxs9ZxbO7fx419NF6fbzY43FZSybSl6PBSlPtpgsitN09VbCQJHo5A9P8QTL8Kzrmy6P4smFqCd7weAPWjgbQv6SDLhVnOyE043s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tl6sCs/A; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tl6sCs/A"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4955ce558d8so5829255e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 04:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784807918; x=1785412718; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NC7EUuaERmwRUjpxFJ+SlZvPScb3xGh6wRASl7q1iCc=;
        b=Tl6sCs/AMBcnKJ7FTWFYYzQH/nI/dYTS8a2DzYZlaWcVemk1iVJmmZrQ+3jPnGDU7O
         av8oLX/Imcy9EiC4Ox8PqveHfia2Ffd20MPTr59nkxAnJ0RqmfFYTAbwgsyhV9125fOO
         PWW9X0ytWzXm4raCiB5pThrpfvohyYewu+iMXqDi5INoiLhiCVZKL8eETcYJUttTM0oa
         7oQWoKXWRzlAji1m3CqNUI4h+i6mtd4UWEbQ1KxHcAYF0pDbF2jkAaBYcSPYxqabYlLy
         AJRK7jfOF/1jBQ2DuHOJo/J9hox1sgNQVdO4YvxY1jyE08mL5kqisvCKQOoU6a4BRpJO
         8+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784807918; x=1785412718;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NC7EUuaERmwRUjpxFJ+SlZvPScb3xGh6wRASl7q1iCc=;
        b=BvM9F7xvypbVq7zbLGrHVnwkchqxYP21uMkCQJqUvyvulN5MxRI/ufSahLbTSJe7DL
         iG1asYE75WOSN0ZSQLJVW/dtNOmkwRK1tzIyShH8N7Ky/rGimy6SwEF7G/o934pPTwkH
         rNMra9LjfSqFt09bQUGpyOE7u+zpE925Agmb4y3W71NLrrDSXNYWzmkYbNn+wnKxXCt5
         d32mQFywsstAi0ha71NDx1X6Z4HiK5A0fPG1zUQ0AjsLEW28KqEVF1J9Ka3i7/qquJ8G
         FR1fOM7PE9jUhKRki7MvP0s25UDZ1AlPzHE/k0jBwfE69SCAATPGlV3WyON1h8rFcrEv
         Z+CA==
X-Forwarded-Encrypted: i=1; AHgh+RpaiKPYZquBUNjYKtDzXp2bux3cD5T/4aFbXu1IYZiaS9rEM/q8b7oD8WsMHz/tEJPiStfy0Y1NRJ4UeDOaAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF9RvbrwfXTPSq0YJcU1BOyjncEGPVMp1zaAscXDCgjVV//BHZ
	ZZGdNeDf7vT4UElQobK02Cz1HGYdESfASAxijg+tGwE1RqqJU45E+OhwkncMjP02a9DoDEHpGjo
	s0q+6Ujt3cP6f0nKR8A==
X-Received: from wmtl20.prod.google.com ([2002:a05:600c:c494:b0:493:aecc:773c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470a:b0:495:4572:21af with SMTP id 5b1f17b1804b1-49573cc966emr29430075e9.9.1784807917779;
 Thu, 23 Jul 2026 04:58:37 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:58:36 +0000
In-Reply-To: <20260722-defer-complete-v2-1-6c67af0e2ac2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-defer-complete-v2-1-6c67af0e2ac2@google.com>
Message-ID: <amIB7BNDopHW5LpX@google.com>
Subject: Re: [PATCH v2] rust_binder: add TF_DEFER_COMPLETE flag for avoiding
 userspace roundtrip
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todd Kjos <tkjos@android.com>, 
	Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jul 22, 2026 at 09:09:22PM +0000, Alice Ryhl wrote:
> +            // Note that if the thread list is empty, then the call to `pop_work()` has changed
> +            // `process_work_list` back to `false` even if we set it to `true` above.
> +            thread_has_deferred_work = inner.process_work_list;

Oops, as sashiko points out, this should be:

	thread_has_deferred_work = !inner.work_list.is_empty();

Alice
