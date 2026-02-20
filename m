Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A81261B80
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771611536; cv=pass; b=J7/XH0QY5+sEe4ZApwD1xyR/ajCS86uHvG3Fcru6lt+vB0h7oTyafjJKhYKEXFZGdrRxAq4kgkMS4t1P2q1brzFA+96XLH15cHlz3YyBBy6pbH5hRcvgo4Shce5eq99jPbB7v99nFwAuflDGzGNkIXQcAE8M4DXeA1PV9xG+HDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771611536; c=relaxed/simple;
	bh=yZIgMAClRnxOwe52VONCm0w+JHEzicnrQfGWRHP1x3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdOgat0GIVCR6oYer25jveaq8ct9dHURlJqzfplGpzJpPVBk2FBCFI0phqQfkBo2IQy+yZJeKIQB7kDivEV6XHRo4EclKyL2Vg9bejzYkncz3NwI1WJYDacU51UI6NAtFdFnSeofd1JQba9YjPVR/vm/uBCPz9c5hRDAl237Va8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljkVxY6o; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljkVxY6o"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bd5658b901so68323eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 10:18:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771611535; cv=none;
        d=google.com; s=arc-20240605;
        b=OpO87vQyd7CxAA5SFe2pp4BKPclFlDdADDx6RydbyWiCRE4Zsf/VqducOp30U1Hw1p
         DjNn9IxvdraGVlXj2Sx7AdelDQ64qyydqGtLyLiYSwnQFmSwBqbAXPewR4P26LXXSgSJ
         XjaPeDJCwlx4UTUD1pOxGXtVqNXt9diYVxjO6afih+CChM+aMq91W+swNAIqsYqy5EX/
         od4sIJkFLJlrmX64Lt174Q6EuLe8MP2mFDeoWfmNoAuqJfMRVfLEFbvkgmDO7HM7yR1E
         43cgbmVTadi6xABBnQWeBUG++2QLCyFTCyGe4iQI/tfB/AMtR/aH7IuQp4TkefG58jjL
         Lt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pg9qlqNP5QQ6yDTnQsYFq3qCdDqGz2A2Um5lWnCYB60=;
        fh=YoJ5BstkJ88aqCyq6bu7UvnT7L+ygB57e0Lxo/wCzLo=;
        b=fh36GtvDn5W+QvXPOZ2ZrbsPYQCbb/Ov6b+X+VPGcaVDK/a/a7dSYRTtdoB3d8w02B
         yWuJKYyNj3Ulal00ej22Rx6GNTpygRaNSoMaaPS4EdNZlA1osZwnqTV8EzHjh4aYod4T
         CgLf8BjBuRBmcUDfaC4T/98dEASltIleRrOiDazP5o1uAKEp0aipWVjkSffH0WPa6WhE
         U6z1G+ASD5c4Q9SDQ7uuOdh9vzhiD20fzA1Bx4UQZrsZ7VtfzkdSaHHZ+WWUUZj8kBh5
         VGEN8YqoY9lHX/JnBO38QWy4wTwcACwZZKnxSrcitpGXvgtEL+mWIQpsPy9KPRQz7BT0
         YmdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771611535; x=1772216335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg9qlqNP5QQ6yDTnQsYFq3qCdDqGz2A2Um5lWnCYB60=;
        b=ljkVxY6o3QnTeBrfFWqFZlgE7tYppJgY0W1YF0t2XWa++JZO6t47nHzhpm4ly0pDay
         Nh+HuA8VdLWqHXizTwyQZvJzuYtA8ju+M2viSoxcMYIsuZI/6+xoD8zhahx7i2Mtcuiw
         ixhzYURMMJhVjhMTJO3UC9foNGqvO5G2ChLy6wI17ZIjEfhciuCI/3AJdAebOW9jiMRw
         feeonsZOBboEtsqbKD1/FMgxVmqimkKsZVs9ZFMEqZDtozylEsErI1Nu+41JRuP/I+fc
         1kuKjHrx+XEoQltvJF284vc8TIo1kVO2C9CaOAamxRNQOnVLrOrC3JXufXz4kCrpidIg
         6juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771611535; x=1772216335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pg9qlqNP5QQ6yDTnQsYFq3qCdDqGz2A2Um5lWnCYB60=;
        b=EmgAIWUGZeYI/sEfbTQzfzx+RX+if3bTYdKGEW1cJeio8G75GrvS5oTjv1NWqow1vK
         mV6VswJSC7BMNzHEkCUfrnSrCA9TUt59Sctq3rxJUZK2xkInP1POBjPDC+R8Gx4IXbVz
         Y4VTmudhwTAllp5w3V3glhELaUTvcxPMA5e3Act/UxTP2jwlRmL/kEaGwHZlo3KDZBRp
         wE6PpkO9L8yqiaSCnd1kYdJn60HPLpz6ed8LFHseMTI+lIregtXq3EnE13dk8wmncb41
         e1j8azkHomrrJtIu29AoPmNHtUbOq3I810W1CwYezY4ci01IjgKNiIDeOtjhaEWGEF6h
         ybWw==
X-Forwarded-Encrypted: i=1; AJvYcCWniTuNYwCI/2iBTvhaZUqnKinq6O3biE8ncrzq6wDGxu9Phw/py3gxkGC7ujecx8EgLqPVGvDyMbPrmZP81g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcSn2qJz3tAMV8MqyJZpKFTGWQumHFKRR/ArBXa7ys4Um8Sm9K
	OLQp8IDQ/gteBK9SJw9uUsob6s+7QiB0FT+xMJvVTbuM2YqgD/HAKdMeQiRiEt0M/hFjXVebxv8
	BmCykmOzoH6TLM0Gb1cGBBOOj7EZMH0w=
X-Gm-Gg: AZuq6aIeDcpBF6hXbq4a5tbGiCyKu9/R6Y16qZRt0fsoeHyeP3RHYFr+rklUCYUmMiW
	1hqHnN10KJV8aY4LVHytUvXuGeLle/uNmviy1vX6nTV9w1uQXeOORImuQBfcAeB9yH+fXdRNSdb
	cnuia17ZFX0v29kYGHedaoyYigE48sx6/4AO8/X6D49OesW9uiuXrQxBpyWN2Qyl1D6BGgKc3Nl
	sayHiwCXxhoZducvqzBZtdY0xdgPVEP76a/Sug7WK3vI+7gGFrs+UziLw6Xt8aIprI54zm9fVXT
	sl0NJDBxmwGv89jLjl+i25CFjvUwBl+QGoFtq6BKZpVzKM4pcKfjeOkPIiulg+TDYa4sdUjmz/F
	R/qqW/l5PiyO+8Ah2cr3Bi7eA
X-Received: by 2002:a05:7300:6416:b0:2ba:7d5a:a816 with SMTP id
 5a478bee46e88-2bd7bd6a3a0mr163882eec.4.1771611534634; Fri, 20 Feb 2026
 10:18:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-hrtimer-examples-v6-19-rc1-v3-1-ddfc19a90741@kernel.org>
In-Reply-To: <20260220-hrtimer-examples-v6-19-rc1-v3-1-ddfc19a90741@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Feb 2026 19:18:41 +0100
X-Gm-Features: AaiRm5319IKHViXpV7NM8PvDqcEdTXHjfAIJGcyHuN739sM4czvNKiX8Ia0guzQ
Message-ID: <CANiq72mHuOU-KCsX5oOH=D_9caN9C-bdKSBL5aq3QciqXz=KNQ@mail.gmail.com>
Subject: Re: [PATCH v3] hrtimer: add usage examples to documentation
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 9:12=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +//!     prelude::*,

The prelude should already be there in examples.

> +//!     sync::{
> +//!         atomic::{ordering, Atomic},
> +//!         completion::Completion,
> +//!         Arc,
> +//!     },
> +//!     time::{
> +//!         hrtimer::{
> +//!             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer,
> +//!             HrTimerRestart, HrTimerCallbackContext
> +//!         },
> +//!         Delta, Monotonic,
> +//!     },
> +//! };

This uses a mixture of the vertical style and the horizontal one -- I
guess you did it to save on lines, but it looks strange now that we
have a style for imports.

I guess you thought about it, but I wonder if the examples could be
merged to some degree to make them more readable...

Cheers,
Miguel
