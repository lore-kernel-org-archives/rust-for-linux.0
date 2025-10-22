Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9035928031C
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144175; cv=none; b=ZtsYKV7h5u6iUei/6Sq5rcHsjms2gcUsNSy+r6yNnOFrF/uy77151jC8DTL/Z4EXd3lhdhps7GZWnDtj6XYCnIcu9w9T4JUyE+/BOD4NPf8b8rYhL0X512WhSqdSOsHRqugwiIRAhU1UgjEHt6TREtyIeIOFZUnRrES6TOKdYJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144175; c=relaxed/simple;
	bh=pt/hb6LquN+6vliqbTlWkpEkStkiPbe0mMgm1WItlVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhNxtM7c+2ELOzqUAt2dg2Oa4lIl9lP/l2CzAQq/cHti9ixpNXvxWEgGqz7m0p3aNCBDf4VguH6hnWetD2NY+CrGIC/zLGOCHmBKsUjm8zmtNBePubF4m1Cqv5Gov/7lbeU17uOQCqJSYyanVcNPhLDoDGAHh/21sZ6dDl9+XYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QM0sIJO9; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM0sIJO9"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b631a684a9fso528080a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761144174; x=1761748974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt/hb6LquN+6vliqbTlWkpEkStkiPbe0mMgm1WItlVA=;
        b=QM0sIJO94C2ZgElJUunuEmp+k2yxRo96skeqEaS50lUIAckKVlWK9oJVlPzAYybRGA
         fdaR3Qb4lSjjIBdrI7von+o6a50ITjgxMPrnTeSIkgMo1hAePVwEuTqH/ps09IvQlQ73
         qH/nwxA9e4DnApvCFqcKUvEFj5M1Qj3IcIPz7JBQ2T/z95ydOK9YFneSaYndF8xy8E2f
         PU6SlbQrMKppx4CtS2miHH0cD6QCL/NuB9FdVocDIPAmZnTwl3hFD8r/4RLDXafNTGmm
         ajowQJRC+48wqWaPmYwR4If5x2j0Faih8lZjzEp9kvdzQr72sCYrjJ8okbKmYDf7Z6bF
         Yxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144174; x=1761748974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pt/hb6LquN+6vliqbTlWkpEkStkiPbe0mMgm1WItlVA=;
        b=X4cjo2z2r5ahoj0U+8044VvGOt4EcvPqaKVC+Sl3bhK1MhOuFg6j3ukXE5KOK053Zu
         z+G2om/kTqxgCOxwtvvfVxI42NZBzXvZo7zMShwKvV46PqxeR+6J2Jb86/P+ZOHxwGHM
         aT+/hrMx5fL0Ypa1Av+F2ceApy1yMnZBssakeP3B/yN0WB3ENLJMaz8g85SJKaqRxJkS
         xOQsodu45Ka3687MCf+5tgzL68CwoFMEvbNYTqFRzLy678aHucqGek+a/SUlaZcUArgV
         rQ1MD9wdEr1xC3bOstm7IgW7tRnZf7Lsb8WRChz0Y2J4VMQVtQlhduRdieOfGQhv3ouY
         Y2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWNJpGjtDq8demjiZY0+I8NWMK8Lleshi8/Cz7Kd/1eK/K8hS6CwFTvLFUBITVH19M6zX1D+khB4XqynfAgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/jn5m1VCjPOeHvgt5Im6/5erKHu1nNYuZC1gSVp0nKy1wVZnQ
	UYRenVQ1K9TGTxxNBl5yVbAqcfLg4rcQsSAohc4BvMdJsrNE6LBLRLAPOXMXB+P9ZunZ2TXovcd
	H7p8TwnrVmyts3s2WVdNLvVLM8eeTnlM=
X-Gm-Gg: ASbGncuA05pBrrT/oOQWVEdlAZ6SMPgp4dmV8bGp7IX0dikwLdDUjc5tTCNOMRG6aDE
	l6d2xJPHQxbXl27+yAq9HNxIXobZsv6ueUDgojvfCKCwvHovVWRx9WiivVwz8SmzT+XaaVDJL3m
	TwH5YHVEc5NGzbnBmD6pKtdItHAO1LABA7fWedVIIII3nlHqLuoC/+0wtUzxUNii3ipo+lio8JO
	jSk+HvusEujDZ7tZNv7jvUdt7BaazReeFlNsvwJB3/+qi57hRhWvg9SPMEcNfpZsInwzTnSGmZ8
	xyzTqGSLGxifxRN+VR5g9USmA+6P2eikPzU0hqfUXLDXss3pb+Ji5yAEPFerOiawF4MG+ZhRy+o
	I6CNyFyMvV/tejA==
X-Google-Smtp-Source: AGHT+IF0dLkMwF0C67XY0F31H5GqaR1j33ZTT0zRopJ3lXzaqdzE6cfhE7MiQK1KOT8lNdOakdaI73cMWJN4Y9UAbrA=
X-Received: by 2002:a17:903:1105:b0:290:b524:ec80 with SMTP id
 d9443c01a7336-292d3ff86f5mr56183865ad.10.1761144173719; Wed, 22 Oct 2025
 07:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-2-dakr@kernel.org>
In-Reply-To: <20251022143158.64475-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Oct 2025 16:42:40 +0200
X-Gm-Features: AS18NWC_EFQnXFqlR8pd3BpYF88Juy0VblqECc1zdm3U_MxrNHSthFGuCElfR3U
Message-ID: <CANiq72mUauK+Z1nqU-m9LeY4mn2NQPHKNY9Psvfcbw+Axbrhhg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] rust: fs: add new type file::Offset
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, mmaurer@google.com, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 4:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Add a new type for file offsets, i.e. bindings::loff_t. Trying to avoid
> using raw bindings types, this seems to be the better alternative
> compared to just using i64.
>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Jan Kara <jack@suse.cz>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks a lot for this!

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1198

Cheers,
Miguel
