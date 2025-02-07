Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD31DE2D8
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Feb 2025 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921026; cv=none; b=BoI++BfKwnCTAQWO4QtPdMSIvYuQraGZMoI/2WSEb2IpAM17BFrlbt0Bv6LdoGNVwWxvwGgQ11vmhRs6vKP9ZRVRFOWZQmiRpHJI7NG+w/ovYGip52Csj27R8Gqn0+qYKY1Toyf5sp4f58EeTje9i6nzziZhqWqrCFlOiAAwQ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921026; c=relaxed/simple;
	bh=DZTAjfcVEUMXilHAzTkctefbUlsyz5gN6B4U82wmSfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZEAIvjkLlLqj3eMn5+yBnWjjuUSUrst8EYNifH+XTg3tsdZXgaLo6VFqnGi2KGjn9kFEVMZHK+XukB0aLqmFmzTa6is+lAkNWpY338XirBwB4PkvNbMTMwhY/YBnK81Tcd4M+G4KGw1O/JnxQu2dntTgFpf9Np/gFV6RXz6yww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UPGHq/OE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UPGHq/OE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso12471125e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Feb 2025 01:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738921023; x=1739525823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZTAjfcVEUMXilHAzTkctefbUlsyz5gN6B4U82wmSfA=;
        b=UPGHq/OEGsLt/LitskuTmmS481dbq0ATubFggBBwGLX4GiB5KDxrKwXIOp6la7UQer
         ICFaRTtYP1TCcWRSCutXVXWIk+hhMbrss3onbzlLw9kOCUs4o1/V5oXBvLZJBOxVHE/b
         ML4il5yurF9Sza0Gg1nIKPEQ2XLEmq/i1Fj3yjEC/QYOQstbwkuhv27j/og+47Mmaoj9
         iS/4Y1wK9b8Mwmatus2i6I1ys06fQXSZWTnsRsJVj/cX+jbD/iUKfWAk3RUTUyY/hlkq
         TJtkmbOEDSImn4Mnd4xvBeUZ3wizO5/eXNEQrbirhA3H469yY06oGQHn8y/r1H2HuR1R
         Lwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921023; x=1739525823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZTAjfcVEUMXilHAzTkctefbUlsyz5gN6B4U82wmSfA=;
        b=G2mmf+4dK+lrpOIXw5U3TbCDa2eQv8utK0GQmj7AYA2oUpXEslaip1B9qPQtQwl92i
         kFzGNjBPXidiafGcKmNuTXlnQO3xHMiZC74mUUFeolWdEpvBcVb2fp0R/QMlgRrV+M7d
         FwFPnPt0+BxJ7FE0ktGnK1BAkAFBERgMIzskBMuQ6A6ZFh0RkVmivXtrrQpNBwcQHI7v
         vQINZxB+jlWyZKmCs3SWiPLzzrZOfgNPl0iGJcg5TrF2HvTId60uSYQE2BeVBQTofoNN
         p3wo78OyumvKOLhbNyU09Ggvx8KDtK38eE79acy/m7D9mRkUn965Ocm3MNZucVM4unxP
         L6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpLPpnFZOAgBWCxNg5c4xH75MAjg02wirwnFb+KhwApQZi9eF64/mIDFY1aln8sbFoQtpErlUgw2AgkDnv/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmzzXsX+YK+28SmQ/dHV5HERkcz4ksYbsfAgTe3dqg+NvazqL4
	KFWLq+nXj8qtUDz4ximZodDin022hZHgE9pkCeDwvlhm/tWmwL+nJgDV89+Jvd9GF666N7YZGf1
	jDKHEyGSP7czF98OUkzaWUZ3/ILwNAgyLgBfE
X-Gm-Gg: ASbGncsMV6OJq0QYiszY0wF27eQj7OdF01OhgKQb5CIEBsj3UGNr05kO1XViwarbJkG
	3e/5azZP7q3jnvOdMkMxRnvighCOp3VgO1MTI4wlY2DVcHXs22kxGvcfdvadiojfSOc0c407qsz
	h4jLFnfA2SkdhbayUQ/Darxm7FmRk=
X-Google-Smtp-Source: AGHT+IHuGjdlqwgeTAUhzEPVafoaXXC6hiVr8E+u3Ozfb8k4Fr6W8d/NvE60aVN0kWu0TCZXFFymCnn9uBwb/aF1fiA=
X-Received: by 2002:a5d:47c7:0:b0:38d:ada6:f261 with SMTP id
 ffacd0b85a97d-38dc8da7968mr1534040f8f.11.1738921023063; Fri, 07 Feb 2025
 01:37:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai> <20250206-printing_fix-v3-5-a85273b501ae@invicto.ai>
In-Reply-To: <20250206-printing_fix-v3-5-a85273b501ae@invicto.ai>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 7 Feb 2025 10:36:50 +0100
X-Gm-Features: AWEUYZkj2fGcFoTVezigggL9H4Yb160h5AwliIu1UEAWrlmXMzfRaAs7Nqrubqk
Message-ID: <CAH5fLgh56iNEBVO3J9-_brJ=H=ThaXuZ4iEXj=seABvXy=r7AQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] rust: workqueue: add missing newline to pr_info! examples
To: Alban Kurti <kurti@invicto.ai>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Asahi Lina <lina@asahilina.net>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Wedson Almeida Filho <walmeida@microsoft.com>, 
	"Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, Tejun Heo <tj@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, Xiangfei Ding <dingxiangfei2009@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Fox Chen <foxhlchen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 10:08=E2=80=AFPM Alban Kurti <kurti@invicto.ai> wrot=
e:
>
> The documentation examples in rust/kernel/workqueue.rs use pr_info!
> calls that lack a trailing newline. To maintain consistency with
> kernel logging practices, this patch adds the newline to all
> affected examples.
>
> Fixes: 15b286d1fd05 ("rust: workqueue: add examples")
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Alban Kurti <kurti@invicto.ai>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
