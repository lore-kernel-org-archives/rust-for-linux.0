Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6F1FD4
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 04:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748134; cv=pass; b=kRFWtKoqOQtVonZgO2YhDnP4XLVT9UxWfTznd6CX8IOTM4h2SaMet/xJsn6QbPJNMw7tN/yBsZtD30eu8CkrvvPGsBx5+IQ9CTERQyWKCuKgvcfJBJecMr5stWhafMJavU8V52LFRk+uYasn5zt/U31mN3TboRwCyU4sCutzH+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748134; c=relaxed/simple;
	bh=9AtXd8g8cv324hiwUaOLJkTtg+EH4HxvCYA3UxkJaWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coq3vAMcC4KWwktPdfodrx/rKbtAwfbTCayYgWBI2aCoPXOFUcnwLatb6CmGRcOwvEcvPsofnaSy1tzT5XOBmauUjM6S7uAShJW3EjDTSapirWweNPHW1vYqain6nyUfo9sGnpA5xRPrKzRal5VSWkXy/CrX7JQmwaw/z2FaXJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkIDdzpm; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkIDdzpm"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b703e04984so27514eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 20:42:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748132; cv=none;
        d=google.com; s=arc-20240605;
        b=dhUH9JdJ4EksSbhgpVYTh5Us4HwBAMoTwWr0WgHE9hDDwXK5bNn5ICC8XwvyYV8vTA
         pX0O1/b1tE4hjImXAzvit933np3RbZyG0FWOma7l5n2QnE7AErRjOMJef4udcVQ2ipmD
         KwHrSLbuvwfDtv26Yz4Ae251yrZxy+lCtrTDEmaNjX3vpgHOIyU+nMR/Nnd9vood14v5
         +q/KIPoX38s9H13Df2IgSyz21Cj9gz66oO1L+oFoRJyOKwWJa143M6R6cHsoJ4KPfXen
         RAcbo9bNJw+zE38PO/21HdWqe6O8FEuAt+Mrwt8i0ImfPMyJ1TH476jtdEzZaV/ML+EJ
         yrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRhqTEHqwyvVmwdWFyLPo5xELcEwDSdFsxzHqxGTMCs=;
        fh=yAlu048se37aik1Wf59UbZ0TbTFf8lwf5EIkIHWm07A=;
        b=Ehbdpt3Md101wXBvdcxW1Ld4aJtRD9J4mzD6zI7QZZEaLAkOtrijbC6pgXy3cFSFcp
         UNPOX5FmdFBfULf512h/1Ck6+nUcOei/ykLrfUI3oi1EVLFAEfuK/H+Pb4ca5KPAfxho
         RcNgMo/Q55dR5EeJpumnKcI/TA/W07b5cAqsR33GdlouX13va0imkMDzRzVlkRgh4Lp5
         5dbXqV4g0jZBMTlqIe9wSzvgoYxoU0C3JWRhus0drLDMM+rot2Z+wm1I59/K1zZmXvsC
         o2cRVpkxY7Sa4QNQdlhSAE4UB3nRUyTqhcTFys2boqF1kDlOodYDXQaYxsCVbZ0XyVkx
         jgqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748132; x=1770352932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRhqTEHqwyvVmwdWFyLPo5xELcEwDSdFsxzHqxGTMCs=;
        b=gkIDdzpmtE9+kJpMumRJ7OS8TJ5D5jc5lS346q/pDHhicEpDU+6Dxoe7NJiKfqYPzf
         5UvDCi5jSVB3oQcfAc8PQOEDHXcZJUT/WVIaPVgKRF/6qQ3+4lAkfcUkMGVc6aLoVRUm
         OmPRXIVZkZu4LMwLZ6KUihEbJNf79CmJ1a6iBl+Leo6UDg09GRV9GsZT9iXYMrtrc5Wk
         O+qj/D9vyM8LJpCSLq0FhLDAZNUby4XYwgn7nfAPserKZFZuCe4vG1KhaiHriwZtYLaw
         NYv6rqDBCJDlRDCsbBpXkQTIgN9AZKrl21NLgoK+6PkNGoToC+waiyQr8wqjFjdsIqTn
         W/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748132; x=1770352932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRhqTEHqwyvVmwdWFyLPo5xELcEwDSdFsxzHqxGTMCs=;
        b=Utp33s1PwtCRZQe9S+62AJXWdVRa51cMICRNvbRnwZEfHjpINMESL9LcLU2Lti+F7I
         UW4Hps2ApbVI+Ie6/62vO0VNurgSbgthbM1FXJdsDH+m4sSZyzFtv4fVDcbd42MBnTcO
         TjhRSrWsroiiS2Yf4O509QbC6b1IeymDlaSQcC0KRDG68UnfcFgUN+VQET7qBL/Ajjui
         NnGWxLx1/0qCmqwrh9wiy2BxhA8QTUHboDc1jebqqrKXLKq36M/3BhY/JykoB1Rabv40
         8RIn44vSDmIKWm5ASeCQM9xshhbqYt/fzOJ6oKxCHWFDN6RqH1i5ugsaYRfoWZc6lG59
         xb0g==
X-Forwarded-Encrypted: i=1; AJvYcCVl+EW3HkUc6u7nBxCfWvoTxVW1FywSD1tnUgpkXLUXnVIKL9bB1xyZ9OjikPZ98rlLlYACLQHkHYWBsRVfxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz25aksD+h2TvOmcxN/f6uT13o43S4UfrfpAFNhkHz5QOgMtlnB
	44mOOV6gbCfvaQ9HCfk6OdzqB+IouY+rOXJKNgO0RI3bNxVjgF8kbiR4xBoqTLD4F2dBZBqhknE
	+zkg56XeADr2D7YFqGlxBQeM/qAn2HxM=
X-Gm-Gg: AZuq6aLGbwsGaOADm4JT4YX7k3x2gFd3NTSjr7EVFO4r4R3rqJ4zM52xe+g+VEQpKKU
	RMwGTgWz6GCINNUmDrQapUjYmzl2F+3PalWMXbch6RU5XprB1V0X9PYeOKDENutXJNtzIutvWJB
	r6ig+uYOTFTJHrw5xZkG78wR7oEyap48VBFBexKCkuJsrJe+foetKVJqykMEJawKhjZYLq+BUxB
	/0bJf2LLRy6q7RtR6E6ZnuIWXI3IUZIIWwoWcngU5UmdArOu3g8NyHSmRh7kwvsFRgPLpHsf4O8
	H4yFAdXma+FOjmkiOiF/3wAKcp7pljyEO6cPEPazDgOv47u9t7GcLPcENxAVx1s+zMszB1kzxsn
	pcGrbJmW5HJtE
X-Received: by 2002:a05:7022:906:b0:11e:3e9:3e9c with SMTP id
 a92af1059eb24-125c1018f83mr463923c88.7.1769748131683; Thu, 29 Jan 2026
 20:42:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129004520.62697-1-boqun@kernel.org>
In-Reply-To: <20260129004520.62697-1-boqun@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:41:57 +0100
X-Gm-Features: AZwV_QgKWHn9P9hd8qHR3QNl6yV8Hn92j4G2YSbbe9naoXr792u2X3ZGzLx2RN0
Message-ID: <CANiq72=MkDXW-qa9sqGnAbFyz9V74QCkBch1fodAY43_Zkvr+w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update my email address to @kernel.org
To: Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	rcu@vger.kernel.org, lkmm@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 1:45=E2=80=AFAM Boqun Feng <boqun@kernel.org> wrote=
:
>
> I had issues using my gmail account multiple times this week, hence
> switch to @kernel.org.

Applied to `rust-next` -- thanks everyone!

    [ Sorted alphabetically in mailmap. Removed Cc tag list. - Miguel ]

Cheers,
Miguel
