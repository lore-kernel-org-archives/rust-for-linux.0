Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7362248A1
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 20:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834132; cv=none; b=K1fS7LkiCP2ccsEoNf1SQStJwl7BJSOtKHxWdJ1Nx4rPVJZPNGPGNX0SzGT+p3UV4PL2m2CLR6yQxAIEsfNeeBnUkvVUc/tCU9JHjCClTlLWo3CxxjZIfSLJsqYUKxuWcbKnBBxbEs0n7GIeFFYcIEXy5Zbx2gY/eVeyTjAAHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834132; c=relaxed/simple;
	bh=yE5ECAItcuDQCq+yKRsL3iozYXep7w9OrJcHgAxWW6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEEv8y1c/qw84Z/5Wg0XWycRNTWuGv8pmLJZmSzRuKKDHyD6W6VAIGnYHGJhhqvl3WX04AE8f+zNrrIAQwdVFUEG2Ux19FJsPUvh8WCzFAabuKVJjTMz673HE2sU3QygGlX/vY2RnS2zU01AwTMpZ5HaQgkDac8vADWks4T61yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qZs1i2C+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qZs1i2C+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso44688f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 13:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744834129; x=1745438929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibZ7KQHmkt/3pfRd0AhQfZ4hStjunS1iiXN137ErW8A=;
        b=qZs1i2C+jpT8wbRxtaqreN3nhD6HshW16yGPAaGPW9i/TVZXg/R0+pCIzYhyD+GsZ9
         hB/vZPq4f+Dy55IESwsAzPHWiWZM8vyAzuf69190+4ER4GydMoZl74UKA4qcgSnaxfXs
         t+csjLHU0bp3VyvJgz11eEBFrKGJkWq1vPGZM1k+kZpWEiFN9BGmaSSGkaS56Mn7+IZe
         oNTySu8gOjkgEinrpeantATbRPCNkOnyEmeXLd9fToecmb/021B0WyFPw+jgzGYJ1u6X
         Ep+PglrkxsAjzG9K/QhIDR1DfY3wi+rxj2QOPMlO9Qgvc3vfHoVMZThrCawZ5ssnTvFf
         CfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834129; x=1745438929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibZ7KQHmkt/3pfRd0AhQfZ4hStjunS1iiXN137ErW8A=;
        b=UAfX2nOuY1VjFN4y2A/UGtKkTGv6ixrtK3HJIpXyiijablDPHcHzMyX7l/eA7QtDkt
         VeQRglbm32B1Fif+TXox1F8x8DD/NexUmfvUqa2Wulw4NVHX1uwzEB7IpbqaALxvbrAw
         d1kl8HXgSM9Ly5uHpHTABPgXM9Qw816BOb/S4B9VKtezhIWu1WucWt3XQ0jWpw8Tt2xu
         /CU9qP/C2NPxwSSznKEUfMSyHlKEK4ss6GO/xcdp8Vx2XOr6dcUYmj4ZzJYoyXS7neCp
         48kaySWkJ7UykHUpmSkWBXzMSANFJHLV4E+OVvEJw37iJ8ea6KfUJRU5rLhgPb9jZ5fs
         fX0A==
X-Forwarded-Encrypted: i=1; AJvYcCUqfSkmGuUVW/cleG3dyphdeWhV6by5PIH/lqO0tdu7Zdo84YmW1MYJCBGZouHoQ/elY9IcpF+ffEntgo15IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNIdrTP+JorWLJLsh60ygHm/GhiwHvZ4ZQcAY4ZCE83MiFaUHj
	BdSDz9OtryD7WcYifiYsSS5M3DVDXTVYbTz+8veJYVHgu2gMrW3pubOYe6cPkQGfovmQDbbuS7Q
	S1SwOxIi3oJF0Eorz02u6VQoyqILe3DwSoRgF
X-Gm-Gg: ASbGnctLEXMleC6WqKp7ohuU9w37z0JST+e+3f8IyydSJIG4g11ubbo4bmsnBx/iyCi
	Ln4fqdGLB3tg5tOHddzNbtbwbDAwZL3fQMrp6cqWJDCqwjaGFGWdaoaUxxDHGl+tHKVD4URBOqc
	LiZ9mLn1gQ9cbc97d5/1RVkXQ=
X-Google-Smtp-Source: AGHT+IFp6AC18M0DKQIHU1V+NvGAjfad3pIx2ikOtgjeGe8a+HdGSpHxHxUcanJNCCDfXYEEIfqurbJukqjKN28qZsQ=
X-Received: by 2002:a05:6000:1882:b0:391:4835:d8a8 with SMTP id
 ffacd0b85a97d-39ee5b13e81mr3177874f8f.1.1744834128620; Wed, 16 Apr 2025
 13:08:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae> <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae> <Z_-f7Bgjw35iXkui@google.com> <aAAKwTj9egoFdq6G@slm.duckdns.org>
In-Reply-To: <aAAKwTj9egoFdq6G@slm.duckdns.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Apr 2025 22:08:35 +0200
X-Gm-Features: ATxdqUHfxqvk06XlORJWLcPTpv4_-oZaBa5jnSSToNiy7Edl583cViXZqDH5kBc
Message-ID: <CAH5fLgjvk6841Tn+C64AT6nx3HeZ7EMzruoJPmvT2KNF2Trmng@mail.gmail.com>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
To: Tejun Heo <tj@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 9:53=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Wed, Apr 16, 2025 at 12:17:48PM +0000, Alice Ryhl wrote:
> ...
> > It looks like panthor handles this by only having a single delayed work
> > item on each queue and using cancel_delayed_work_sync before calling
> > destroy_workqueue.
>
> That sounds a bit too restrictive.
>
> > Tejun, what do you suggest? The goal of the Rust API is to make it
> > impossible to accidentally trigger a UAF, so we need to design the API
> > to prevent this mistake.
>
> This is a hole in the C API, which isn't great but also not the end of th=
e
> world in C. I think it'd be best to solve this from C side rather than
> working around it from rust side. e.g.:

Agreed. I think this fits on the C side.

> - Have per-cpu list_head per workqueue (or system-wide).
>
> - When queueing a delayed_work on timer, add the work item to the cpu's
>   per-cpu list. This shouldn't need adding more fields to delayed_work gi=
ven
>   that the work part isn't being used yet. Also need to record the cpu.
>
> - When timer expires, unlink from the per-cpu list and then do the normal
>   queueing. This wil happen on the same cpu in most cases.
>
> - Flush the lists from drain/destroy_workqueue(). If using system-wide
>   per-cpu lists, we'd have to scan the lists and match the target wq.
>
> This should be pretty cheap and we can probably enable this for everyone,
> but if the overhead is noticeable, this can be an optional behavior
> depending on a workqueue flag.

My only concern is that we're executing work items *before* the
deadline they specified. There could be work items that assume this
doesn't happen? But maybe it's okay. Otherwise, what you suggest seems
reasonable enough to me.

Alice
