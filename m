Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB48346A1F
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 12:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898325; cv=pass; b=RmZw/Yi8nhI2y5z0CuXfQ6Hf7qrhbES9/Co/JjXkYLPq8LPWRJjiTpvcJakw/DR/DU4CVjfxe3tAFVJH5Q4hj5DFOsBhdPrOTg44XQd3vZ2SdJ2dKzKHBlW3dVWj3YwBTZLD7l3y6VI/TALuEQtBXvCk/KjnZgP5SmZGtI6ZvfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898325; c=relaxed/simple;
	bh=hdNJuliFV+u1aeBSpWRoouGk7YA8j6s817VbVZUsNhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6wC17P+Tqm/K20nfDxzuYOr+5CHk7jnbB6t54Pa2+W4VtQ9tqDlzrYIPu49WlHMFJSIbArRHjvNUShB1YNlmpJ+RYmkjxkPcgKCtiCE5fbtYSrt8i5Q8EBO7nsE1l8ooVLWHYd9aZpY64y1J+TZDe5d3goi7u+LSbEbJfDovH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3+T4inr; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3+T4inr"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b867142b07so405970eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 04:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770898323; cv=none;
        d=google.com; s=arc-20240605;
        b=UHgRCx2/dzd6YA2aIuY6ToxJV5ohyHvC6Twza+DsC5gAIxWvm6r8ODSgLxCHW14/e5
         qHdZDxNK5Viwuv6fjfVWK48Oh/zyTrh3UT3w3rGtybAqQVZdiQtu8O+RwmS45Bln9RD9
         1PPP9b3DRtxMdo+7dM9L7sFAfZYfYtqCQTA8o6BailsqTMIPymt+tcoHTfZdcaMZ9HcC
         1kUDG5O6EntK6ZHJzWpnK3hFapiPCMP1zi4W97ltfuvL+cebtfWlP8wmUCbhlA/DLMxD
         wTAM6QiLeir65s0ERybZfll3SD/JNgZcly3LNee/c6exHxNpH3cqv5mhELFWGXQb8V1F
         2tjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hdNJuliFV+u1aeBSpWRoouGk7YA8j6s817VbVZUsNhU=;
        fh=mr81umR/2YBtzOiFXakK0OADTLZbyvg1g5uLOC74Rzs=;
        b=cZwJjKHIo+5iN7wPs7AW4FYNC5hQplGrJQeXr34CRX80fYvpV1YX81wj5N21hfa4VE
         8wxNRLT63dvOSCAwhC15AE6tKOxmr4ng2yz0ZiYvbebipFW2MWyMBNnRYQq5VdfWSFzt
         ErXDI3GqsO3shxGi1LfvAO5nx6zs75sxn90PP6kLz2F4wUzZUVjUZucsuQgNcwLiNU1H
         xHNvgEoaDjXrltrrOMP8xtvCSoNk8q8uu37GFhcQkmkBDMhgoleViII6NjcZTTWXgJCy
         z3NLAzifkVNrkX1xCBz1zlcbcQZY5L5J4i4XM/WGVM9h+2b8kvenelsvnfZD/rsm3dYN
         cXiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770898323; x=1771503123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdNJuliFV+u1aeBSpWRoouGk7YA8j6s817VbVZUsNhU=;
        b=Z3+T4inr9efHMeVhgeHMznhpHHjfeni2n9ADLxyFL1PsK0gqZILhkKz0cgK3d59gnc
         bVeiHmEJRdOSuyH0O46irymHBchIx9gALw0OKXS/sg5CMsbWs42J8YoRVHMhPQ9am4mW
         cKiBFoj5MdA7wTRbIvvw4akr6ZJxswxeoPaqD/NLkqtk/PmYp/3Ki0eRv+x5Mpoe9GCo
         yW8mDzvFnjBo0SIIt6viaC/iOlbbNzUXCDsnkDisLOk56+thnZBlXxzBEB7PQakj6UYO
         66hRj7k2uU4kYMR9hjODwdCkpGiPNIGTtG4rcLS6i+JDVm5MuRm/PR4qET/BOMRgWkVT
         b6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770898323; x=1771503123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hdNJuliFV+u1aeBSpWRoouGk7YA8j6s817VbVZUsNhU=;
        b=rI3L3CfnWqr0a1HhQ96IOl0agkE/z56j5KOjpjQcLU+QdQM0syrfRuQvTx1Z7EnJYQ
         dw0j5LjiMqEhcxVx4axbWVRd/4+rDYckyktxVSDbRc1SQevIup0S6ygx19vK/mcqA+rG
         mKW/DOajq4vLOXNELFxoGR0/QaNXA6PJffISQ3/irzJz1zf0ssJQMK7z1SGHMOrmg+gZ
         ojJZ7IG5/AtuJ4eu260S/5+ZGR6d7rA+Gm9hB4XHg9BmStSaFrdA/7BOLwHBIxADzVgY
         V/6hNrw0wnV4DW3LN8yrvDGyVvF/W4ZvQSHsdkiOursaJ9wGTS7wfvgZsSRe4l6uqeFV
         7f1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIp2R9RSlTSYGjVzQgeRBpxtS9cq+weAVjnBYioIak/x9JjnPMrljr9qW39zbsSeS+UGG2fc07zmD/GSfiAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpbQfDfPzYpuR6UtNrzguSxV9dF0RMmH+aEDSO9pB/Gk+rKPPc
	+/dqs8sHHCKphqUUhlNxuE86dfWO/5kjeMKiPPW82lsKkVnzrJlFVqy2L5ewjzKRKzK7CgMTz2d
	ilETI3M+wb1CsEfRAgMAF+6BirYvcT8Q=
X-Gm-Gg: AZuq6aK5ujwtcLJo8GOjhFyyXKafXm8ZvjFUy4HlomX/TF62PQroNa/mk3avf5OJ704
	VvpV1VsOmb8hPX0VoU/vKGCi0HzaWH5YkYXD/+dgtAd5JTP2QnPi1t+cbrQmYVLzDaT5/PNiNiF
	VHakkNgmyYmTOj5AefHa1JH8SvNvynQQGw0YiySYWpRUB1H0Ln2y0u786iitgu3dZNfYUab5hJG
	a2hwLQTzTJhHu8oAn4+haTjCgFrH6x17sHhQDW6Mpc29ealecZByt43X4kTcY+NZdGdr5eWtKGe
	pnWrWphePCo1nyPUUqoc03MYJ+tquW/0PV0zJ8Z9GBwVNCfeUUnLL6lOTjbPAAfRKogIDszaHIr
	2JUe9f2hf88XFT1sAagrZKNOK
X-Received: by 2002:a05:7300:cb0f:b0:2ba:6f02:2939 with SMTP id
 5a478bee46e88-2baa7f6a42bmr632842eec.1.1770898323327; Thu, 12 Feb 2026
 04:12:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212010955.3480391-1-sashal@kernel.org> <20260212010955.3480391-23-sashal@kernel.org>
In-Reply-To: <20260212010955.3480391-23-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 13:11:50 +0100
X-Gm-Features: AZwV_Qjq6JjCaY13QKYBUvVQv4H6RyUaa8vYnCFiiN4Ovi19FySxcmcySYnCq5A
Message-ID: <CANiq72mi6_UrGoFs2=ch6AyKP0hhCon3epSkXCzwiGUGmfswOQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.19-6.18] rust: sync: Implement Unpin for ARef
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, ojeda@kernel.org, shankari.ak0208@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 2:10=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> This is a **build fix / type system correctness fix**. While no in-tree
> code currently triggers the build failure in 6.19.y,

Hmm... If nothing is failing to build in a tree, then I don't think it
is supposed to be considered a "build fix". It may be still good to
have, e.g. for other backports and for downstream developers/vendors,
but it sounds more critical than it really is when worded like that
(same for "type system correctness fix" -- one could think it may be
referring to unsoundness).

> - The commit is still in linux-next, pending mainline merge

Wait, shouldn't all stable commits land in mainline first? (modulo exceptio=
ns)

...ah, it is actually in mainline, but the AI checked linux-next only
I guess (?).

Would it help to hint at it in the AI review instructions? Or, if you
already only ever make it review things that are picked from mainline
anyway, then telling the AI to avoid checking that?

Thanks!

Cheers,
Miguel
