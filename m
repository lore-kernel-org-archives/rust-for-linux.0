Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FAB2DC32C
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016812; cv=pass; b=YYJCtSYwMPnHtJ0jFKzbcQmAGMLbI+uRM7PcRl9z7Jxpqehsn8r+A5En2G6jBUKWa5u8UbMM9Hju0ctsW/ImpeJ4NA49FeHme0PKo6Pzg+OQXDgu5AgyGMwVDjToU3ASYz8eP9NP0wvwLlJJbOwA5oYS5FW/cYexRuyuRbV2CtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016812; c=relaxed/simple;
	bh=X5Rl5lNzcPM/zxKVGRo0hD7K7rU/ElLrH3SqVAQTBl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaVWieu2sDY1I9HYcZshLBgL7m6E3hi1OqZpqyEwpPfdTusIP3bN8XW9/3Bf5aqCgzy5JyM5a94REI7cPFAJ+WnpdM2K8V8WFQWWGsUFrKH8KgnwAV0FOr1a2YdLaP3vW4hiegRWPsBF96koC9CrNMJ4+ngdGc9fNjFuHcdCHWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAK5cc0e; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAK5cc0e"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137e836ccc8so404986c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 07:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781016811; cv=none;
        d=google.com; s=arc-20240605;
        b=TMQ4k4xwobq+9+5oMxpbBl/oPlsCpsT/Ll4v2Yr+yOpuyHWb3jI/zty/hCXtrUQgL0
         rramPC5LFzy6bfRKC7SlMkmN2m4I5NxkexJ5kz9yAWEZw5bt5v1oyAUZ4HrgcpC/imr0
         mk5aOyF7XDe4gY6BVicI4SSjwNa5llZxBkTUFMTshIwiIEAA1RhFY9vp1hWOtHlxl2c7
         jV7LF7DQJwO+mlTXakUBzPYG8VPqr1T9LGVUQ+bC60B4xE6MxHzjt2CxZnLGy+9OnuHo
         SQkjUNjVtFgce2C8mjacRYPrkHW35V2v4ikqgkctQOUrZpuFGrGtEYILAh9otDyR9SPG
         qdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EaC8nh7KYLS78yjACqQzX8jGGQc86wGruCKn4Ldsi2Y=;
        fh=XvkbiekxxQTw74L0jrnYCwZIS3tiAt/aDMXQjWQGsls=;
        b=R7hChN0TTGFF5/qJkoiOj11Zn/tJrtG9O251W6v2nVjm1IzAQTlvYNPnptkTUY3NPw
         CuYEm34arO1myVUfE60mMEpWpbKUBi5/g0tEeUBOEuxlcK3/0Sc9yysBwtJNxyhH0lwF
         gkbKMcBmu6vcoXviWLAdV5/SERx8CFzlcylgII9Uo/GtkOknaGc4o1vgvnBrMOhVeNx/
         D3V9X18EdIXsvvMfHRXN7ftyPUGrQJgCqD4Z3ZHY4L1aFNDSGfAE2y9HIDqd3y8Ea1vt
         r0RPlps5N9hDJPcT6XoBDLLrUlNOwjJMjD0UdOrhP4rIO6TAKAAGyRMStKRZojprWays
         WNzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781016811; x=1781621611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaC8nh7KYLS78yjACqQzX8jGGQc86wGruCKn4Ldsi2Y=;
        b=cAK5cc0eQYsQTNqV+Dt2UxMVm5nawItI2QMVrlaAoTRFn7jdW0MCY8a+8tjSQgOD3x
         K/xXjrKBno//iwndysRPsABes/R5T71vd+/YcVdv3EPNGqmF+7xiyrGgGkBszZLkXdLJ
         WB7sue1QsJKIOOc0yMLpixYyxPRhuHgrYxSExgmqe53OUk9fftpy39HXgcnD8/HAlFgE
         Vm8ZzVWrQiM1ar6oRqF5ndhDPhLqr6qwMrVaycCOclBqaFc8ilCk4pLZ75Wphdsv0hkC
         0teZnFSyB7yYIL62O+wBqIrR4VgNsqr547h9VLwey3lvKw/YK+v/l2vfhXNqfpI7Vmcm
         cnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016811; x=1781621611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EaC8nh7KYLS78yjACqQzX8jGGQc86wGruCKn4Ldsi2Y=;
        b=baW3OGLmtRoJhrDIfgc36r94Gwe5n3dDhLK4906OPd4a3y94gfV4iOT5KcREjCnS8k
         P20W+LCkA9ScfqgQjcqdENj0yYuokEl0vJ2PUXDK3SAZVgSTAIB/v/zSTLcYkfs7krGi
         34K1p1R1iujVtwHEimyrLzYscUTbeu5YlSMcjwneryAHVEAzlFYnJ79DsYc1HMcLL/7r
         L/mUJWXFP/s0dZdnFFujO1tKfCk+MjN0khyr9Uy0fHHZFeZ6BNe1txXGeyYZatk8drnw
         9NjYW2nRrfixtUhxfSDD/EgwPBInXkwZhh4ADUT7HZuZXnwW2XajKje/nDyjJHOWksx4
         Cf/g==
X-Forwarded-Encrypted: i=1; AFNElJ/jzgh6sHWN8C50s9bQY8tXkrxhdtoleg3bv3Tq4Hk40HgW2uT2jRZDOBejhtNlr4WauUHPutskM2d28jibkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMgj1eC1SJoPfdVaOUw1ZpBfXYPrFIaPcs3cXDGcXwRojOKsRP
	SPMZZHxL9izUL7/NOH2g92f7dbgMwllsMOnmK1fOiLfo2dU9jsLWLIG31KJPYb+pdAfiDR/KTyp
	UFVExuVQk4uWGjoPzPp4320Lst9jKe+A=
X-Gm-Gg: Acq92OGI6poeUaT9Taxi0nlo3FnYLcaAAZhjwybUOkbP33eDgzWDutjl5ovaLHIM5C6
	xgGQdDlMS7XvNDXuU/zaWIs620R21qldVGZyr6eWRJR4pFTQwWPDI72W9glUOY0WzPKxJ54v3Kh
	i1rrZKmE6WDurkO1sPSLLAt9CIKwuy1wDbWENMLKt8U1mZHU0XBslWisP7L0eNQ0OPawkzvZWqn
	roTpZurhTSuFX/uMvhJCGNMFHeHNDnqWFSVYP5U7iI0UIyIGgak5kF/CyGwjWjCCeddB32peZxM
	trSuWXim1rzWOyWX+SsvWTctUXH6hJl4gBcG+lZ+3zunn2brkDFbsvYbdxjbufJvE7AUx+FDx+F
	+yGgixYYfNoxjX1DUZq1fSDb6EPnjgh/J4w==
X-Received: by 2002:a05:693c:2b06:b0:304:c73b:79fd with SMTP id
 5a478bee46e88-307d602a15bmr1026912eec.5.1781016810809; Tue, 09 Jun 2026
 07:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9e49b71b-8b60-479e-93e7-5c12e352c78e@linux.dev>
 <aiZ0eD-A2F8woqTb@shikoro> <aifcUBtuker3f9t2@shikoro> <5633BA97-5666-45C8-A024-87A737A4086A@linux.dev>
In-Reply-To: <5633BA97-5666-45C8-A024-87A737A4086A@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 16:53:17 +0200
X-Gm-Features: AVVi8CcyoxeNZAw6PKYHOJrixFYdC9_ePz8ovPPuzL-S-mcsUN6BPoCRMB-LkRY
Message-ID: <CANiq72=FY7XMRiH4skr9tuNkH+v2PhKEzQnqVsc5Z_vAnaROrQ@mail.gmail.com>
Subject: Re: [GIT PULL] rust-i2c-fixes for 7.1-rc7
To: Igor Korotin <igor.korotin@linux.dev>, Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, rust-for-linux@vger.kernel.org, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:15=E2=80=AFPM Igor Korotin <igor.korotin@linux.dev=
> wrote:
>
> On the Rust-tree question: I don't have a strong preference either way fr=
om a workflow perspective, but technically your reasoning makes sense to me=
. As long as the changes don't introduce or alter any I2C-specific behavior=
 =E2=80=94 and so far they don't =E2=80=94 routing them through the Rust tr=
ee seems like the more natural fit, and would avoid spurious merge conflict=
s driven by generic abstraction updates rather than anything I2C-related.

Yeah, this is a common question -- I hope I can clarify a bit...

It is true that in most cases Rust changes in abstractions do not need
to change the C side, which is good (and something we tried to
show/emphasize early on in Rust for Linux).

However, the key part is catching changes in the other direction, i.e.
on the C side of the subsystem that need to be reflected on the Rust
one. And, more generally, coordinating the subsystem -- in a sense,
the programming language is an implementation detail, and the experts
of the subsystem and its subtleties are the maintainers there.

So that is why, generally speaking, changes are meant to go through
their respective trees. Sometimes we may take treewide changes through
the Rust tree to simplify logistics. (The Rust tree can also act as a
"fallback tree" when needed, and there can be exceptional cases where
abstractions end up maintained in a subtree of the Rust one.)

I have some more details in:

  - https://rust-for-linux.com/contributing#the-rust-subsystem
  - https://rust-for-linux.com/rust-kernel-policy

(Cc' Andi, by the way)

Cheers,
Miguel
