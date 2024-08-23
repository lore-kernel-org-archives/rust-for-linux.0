Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F203718754E
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724412210; cv=none; b=pYzZm9EmPNVQW6DIXQIdML9ExO/pTm8RH3KrdghJ2sGO5jfpKtYmHrNG+TQ7bEaqAQVAhNYHY4AdZl+8mE9dpgan2eM8Ud+ghII/QYlD1SWPlb2RlJ/af707J2jbPTIyIW+5b20zB0qGBxYZrtriZbKBkIh1LldpcbBuO/jR1xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724412210; c=relaxed/simple;
	bh=9zPwRVTbxJhE7Ic3efyU4P6aRiX+muNt3WCGVVGpUb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHzL7+LbwJyDde810IQbx7bP6PQk29dJ2gPtXhQ7an/wOzTYwhcZyiZnfsWqvYwGu/RV+99ADZ4q555lXOLNnHzowA1hY2YBoZSpXcdzRyF8H8YO1/gFtj9swKvJk/xPjmtL/gWPV8634+wjpOlJ0/4NIZqdR8Sccn3Y4mZhbhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHOhE/Q+; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHOhE/Q+"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-268e0b13471so245220fac.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 04:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724412208; x=1725017008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zPwRVTbxJhE7Ic3efyU4P6aRiX+muNt3WCGVVGpUb0=;
        b=lHOhE/Q+KR3VEaFrW7mspuJeFpZZ8ak+tnXbnPSE7Q03fJxOfc+rdD+V5W0Z+/RuUi
         CYBiRDszqYKLPNIuOP7O9v4FuP8/D24+JmwEqV3JmPbSd6kZS1fBEOXUW+6d5qnmWpP8
         Yi4c89WsovGfp/kWQhEud9G1TxyXb3PAUg/XHiMgXlWclwLfFs6vF4IaOyf0k3LDx456
         wdHUusZ/0G5UDNWHRtttaOplNnvTlBw7GmEzAjZYWn9TWpBxvtHIHrIfYlIGaEx2uWSj
         XohtqhyAfOeMWvUYX1EEFNrmziBXRJmN1xDQnc6gKaiy7iY2N50zeCWs97VSkq+P3gAU
         oKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724412208; x=1725017008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zPwRVTbxJhE7Ic3efyU4P6aRiX+muNt3WCGVVGpUb0=;
        b=uashAF/kHSKoHM7qSXMfmcNWb98EXwySO+G8ZCE6tBRxgWE/VeUP0FOqgTf3Zmo2W7
         0C0rCibBni4M4uoMQifZt/5JaaLB9AeuTAo78p2m2fLRc6+gwZH+kinzH0GBjlkx1nLq
         OXGytTh9/3nTQwkJpoXb/b2TGuvplecj9dr1/G8wcqiQiWRgaUw4W0WngRY8DvI6ciyb
         0vEKZhKk9knMr3HDsZ82L9hPIddAB1JHS/74eEannlGO7wv7UxhfN2b4MFLFiaIZYCyL
         XKQaIyOao17BUCWnDNlFMWGrsOQJPtgQLUKVhKaWw6wVTVgo+gGtR9kggSqAbq3cIRaa
         mo8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWyQcZMdNdOuTe1yT2YFg8SxXq7BCKpaAH+q+l6pH6fonZcktNRCL3WfAlX/nHEzFiHx/FE50DmXbzoVfifA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrf6cQ5SLw4H9M4eZXpbAtsHmiFpnFNpp81DWBXHnHDBMzTQ1M
	N9aKDqLkNQNeWqxl4p7xy5I2UF5oyC4MUPuexi4OiWOP9m26ST7w8rcZ8qsRfI5eSrAWZlOPRRz
	lMny68//boJX7jLNcNTKgFLChDp4=
X-Google-Smtp-Source: AGHT+IHDP4C/3yO90RywJ4cAv8fQnPB5eu1INeOoHTL1B4MeXum/gzyQhaY1QoMkztNCvn0F+EMEHMcWui+idNEzV3Y=
X-Received: by 2002:a05:6870:171e:b0:25e:14d9:da27 with SMTP id
 586e51a60fabf-273e600c02dmr1181926fac.0.1724412207988; Fri, 23 Aug 2024
 04:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823050359.1737893-1-workingjubilee@gmail.com> <CAH5fLgj8dVUrsin0PTBxFDd5QsRf_QGfPzTosTZk2iP9-hP_Hw@mail.gmail.com>
In-Reply-To: <CAH5fLgj8dVUrsin0PTBxFDd5QsRf_QGfPzTosTZk2iP9-hP_Hw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Aug 2024 13:23:16 +0200
Message-ID: <CANiq72krF5M5CnBJxRXrXB1KbM8vUERhwu4v9YDRPU0RVr1+8g@mail.gmail.com>
Subject: Re: [PATCH] rust: Eschew `Box<MaybeUninit<T>>::write`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Jubilee Young <workingjubilee@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 1:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I'm not sure if this should have a Fixes tag? The original code is
> from commit 08d3f5492879 ("rust: alloc: introduce the `BoxExt` trait")
> which got merged in 6.10.

There was no bug in the original code, so I don't think so.

Cheers,
Miguel
