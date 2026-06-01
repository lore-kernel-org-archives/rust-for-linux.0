Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0360395ADA
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307170; cv=none; b=lIVHN0+g8G53y8CDSZLCsC1pc4/+2MU0N+OabwU5k12OyeZzIis7BxkxlSTd1YRYwyJ2qHyw9iyiSngkKS+yqaq1+yJb8J1nei7OQT4jUQSub58bHP1htaK4jARIC9D2mfwpL674vWM9nc3PdZCD2aEbTU+uujwSrUGR9GGmWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307170; c=relaxed/simple;
	bh=cV18jvtNXIodO6tysPsBXW0X3xVvWrtNzux1ufx6488=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F/NE/RgyFkoG+CrDE9kBnLe4ynp3zajtaooyj0rH5J1wVVBWGlNB65FOktUJDUDPWAoi/cw6BB8cmQ75wRufN/UYfZZ5FScAz8yfJ3bbsTTEHD0aspTMuy5w+3CDK8N2EwFyjLJnVFBn1wNnauElm5nieqwn5Qt5OJmOw1W3km8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Df+gsVdw; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Df+gsVdw"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-beb86e54b79so125124666b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780307162; x=1780911962; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F2mLiP05KImuXhLYRlm3itUuIPBG7j9sX+uByjRaID4=;
        b=Df+gsVdwnaFnn3ZIHTyclLRbocaC0Vij9gUEXBbEsqwia8hx88vkEF6PrH925lg2F4
         TNkNWB+rjEQ85OPUwZMIbeilLRRRm14mpIG9XQimhC4/GyBjiJxX1Aq6e0IjJGdhoaXQ
         9RuaIevv3hHB2IozWJsYLF11si7iA7x1zS18ujoIoDAfzCEcwxt9UKFWEJEq36f/xzuH
         Unqlf+CvnkFLsRaKk4qu5Lw1T7bUOU/kOBwZ4Po9HiGaTEte9T1rFXm4IUUrcTFF0/NX
         r1QWy5Y/KUoYfUZcBqBlklb8mSemf/5OM6lWVqyNBvGgO0aFoiVE8tLrjCFBVdF1Ijei
         PGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307162; x=1780911962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2mLiP05KImuXhLYRlm3itUuIPBG7j9sX+uByjRaID4=;
        b=UuBghaeFzLyld7l0kh7MBPn4gW4sUr0CtCn5jFW+wUsn7vjUjoLNVCM/n/KdSJ0wI8
         xYwsp90uV5Weww8ydm7r+ULLQ/FQWIzeTnzr+TsjVueQegV2g75rCD2/MhaxjDoU0TXL
         7ZL4hC5eeODEyvNrIymLtnfhyMAJHlL4F7MhMDGJR/owkW/2Tz18guRCxKLQe/SULC/n
         ljJkGPmcsV3YJHqMMDlZj8eMF/XcmscaR3cuY0Kzh5J9xhqg3xNgrbpNda7ae7DJyJFv
         /uEGC6mvHaIOumHsSJc6qBXOU8J3SFJvBBDohY3HJFepDY2TLRE0ayl83/2nVpGHP6wD
         wvWw==
X-Forwarded-Encrypted: i=1; AFNElJ8iHtUxEUl77Pk45HjWDlq9GFyLf86sOuBxU812EFuByN5/ocbwZq51Ct2Ox8J93nGQaYPYwoZjn0cNhIWByA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYIEmGjLnpfCGTtYXEcEUuME6xQbZM2ftLZOT1Qaoh4BNIdUrv
	ZtRhJPTNLg3PMK6rAUwe4JM1moUDq7B7ugTfZoQc0o83Ik7+llPzm8a3Kn8H7xPYRWyzlPSRp1V
	JA1xyEt7V5ZKf/ivu3w==
X-Received: from ejcmy11.prod.google.com ([2002:a17:906:5a4b:b0:beb:3773:86c7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e158:b0:beb:7979:47dd with SMTP id a640c23a62f3a-beb797959f7mr242224566b.27.1780307161830;
 Mon, 01 Jun 2026 02:46:01 -0700 (PDT)
Date: Mon, 1 Jun 2026 09:46:00 +0000
In-Reply-To: <20260530143541.229628-3-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260530143541.229628-2-phasta@kernel.org> <20260530143541.229628-3-phasta@kernel.org>
Message-ID: <ah1U2P8ppTjprYwR@google.com>
Subject: Re: [PATCH 1/4] rust: types: implement ForeignOwnable for ARef<T>
From: Alice Ryhl <aliceryhl@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, May 30, 2026 at 04:35:09PM +0200, Philipp Stanner wrote:
> From: Danilo Krummrich <dakr@kernel.org>
> 
> Implement ForeignOwnable for ARef<T>, making it possible for C code to
> own an ARef<T>.
> 
> Since ARef represents shared ownership, BorrowedMut is &T rather than
> &mut T, matching the semantics of the underlying reference-counted type.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
