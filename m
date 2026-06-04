Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9874CA265
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jun 2026 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604624; cv=pass; b=kJZgeq0hqrPBSoV8hge6zEu3xcdp0azLFGJ5Yd2rr7iOS1J+Vz2m6KsWzcfXG25+5WBEOgWUY3GFxXRZlDyH8NEXr6eOf1rvMsF10AHxqvkZ/belhWCmkguDr+NTjeFk0b8nKwRY2K5QHjHNxcAiWiAJsQBedMBtGYE7CrDaZV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604624; c=relaxed/simple;
	bh=ZeQiLRq1Fz6L0v7jCtoPU2Nyl/VCwVCBYRJt3NYv8q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqd81QQoc4URohZvUqS6ogwm2r9l+hGm0O0q/58ZhyGHSX+CGv4FWyhD/oHA+Vz/7X1mjM2+0wXvRQ3dBljHTA6kNEW87SyrRGn0JdArRq6/r+qJqCY0Z0W8FloYusyuUhl2prktJn1QyP1II2DP9EgxA5bRa/I6TFGvrEW534M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEQOZQyn; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEQOZQyn"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304cf9a02f9so48781eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 13:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780604622; cv=none;
        d=google.com; s=arc-20240605;
        b=FCB7H7sFtkVtSLV6HWAJhmWJc1DTGs8ttbtH0gnCXaUbpjIjvLqBj29en2+HABgIHU
         9PBlDPDaUJZPzHx8gGHFy1NHrRhavU2fhMykNaQ0Z1SIibi/3tpFzs0C4hhmJrwbIPBi
         +3EaenIkRcJeFjQxvkjZA0Q6oLwDmqdvrnwg93o94hVEUd310nT9jL5LSExKd8OFeh4Q
         BF/DKI1pI5hYq71ZgyjWXwYWQM5ObYw4EUScSsw0j301OesdBY9OJtfPy0kM9Tw4d2/d
         k/pMGNDH7h4KieQIL25JJbKWJDAYmssq3Op6ROzXehzsi7fBJEICyP/ktHMdnZ3yJgTh
         yF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZeQiLRq1Fz6L0v7jCtoPU2Nyl/VCwVCBYRJt3NYv8q0=;
        fh=Gct4rdaFG/cakWzzZiDCim6OsYKT0IPvsAGho2rQjjo=;
        b=A+tMt94AKY19pGlVNwkU3R+k1+hSBXM66qHVM+s8r531lMuL7B/PSB8qXR4qS6x/7n
         Jj++wyEpY60rDip2c1+YoLb/q3HFilg6qIBrDJ0davT/yfz7+RFOKCFc42TJ8JIgA6Gh
         JuMow73CmfaDEcr8U7H1WveRURlfDt9Qc6pBwkwZCqdoEua8B6Aam/xtXPyL2P4j4IO1
         Xwp0h61IQFi36M2ML4SxNCXlCxbe7V5gUMGh7BAE2DP9AP1ByvpU5EnvdgcfICLDOtYY
         tRqaJvtF8Trbx0z39akUWMaYJipI+TtYRNHRem9aeQl0AnFqf8xD4IHcqP7clARQfxoc
         2iug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780604622; x=1781209422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeQiLRq1Fz6L0v7jCtoPU2Nyl/VCwVCBYRJt3NYv8q0=;
        b=oEQOZQynlJ3WKNRiPjJvW1F8p7QKHe21Kq9xGm17PgA/s7q+drPin7ews2ia7Mmnp2
         6gTgTGJhfg3t3/NChI9HLCmYbCP4HNx7RbH9K+vuHGVqdKwj0TGClb7cUx6qGilb8uKN
         M7VhftOybMcLoDUaDniui798ftNCBLpAGlf7Dd9fU5ML1q5LT1uWjPOErGTeZhA4YNXq
         Di3Fd7h2hAjeZqM8OJUnOFO173ufMwLjol6e7y2Cwdlm3CcVAFsIIX28m44B4UIIdAMp
         t2vUh7LiN5iiWpzRi2FU35rAIoGDhkapJinB6myriKaomHyOKBvVEiPCtRqk1joM3Vt4
         /Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604622; x=1781209422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZeQiLRq1Fz6L0v7jCtoPU2Nyl/VCwVCBYRJt3NYv8q0=;
        b=LbxLdcIk0asFEbnP5pXBvGk9NE1WTOp2xLN0M1mfi9Vwu5+cLIaPaMo7XW8wDmUSK9
         5qeticsA5g4ac6JkyPg/bLq28BlTyQPSX0Y0++cRcacKW3eRxaB1Nxr7tamIZn98PM26
         iNuJlcKeAA2Ovk7UascuakEiHvRnwBr6ohOXbFT55sU3/VebPk1cd2JDSzxNO9oublc1
         OMEE5wbBb23ZJgOelnpQZRaKHfvg6qlliOPzPTZCaXNVKcFCPXumBqtrpRk5bW3aea7p
         OJsU+P0xV6hQ/O/PrTT2TGZKRKuwMn8UVjp3h1elOikuQRoUJYnVMFzjikvSM1OEF1Sk
         /NGw==
X-Forwarded-Encrypted: i=1; AFNElJ+CZH4NOALzPgCArC7L8/RxfE2FJE+W9YxP+gzR7g0tdtMGUC/yG0Xw/iYPauOU1mhHa+vdh9cW3HKoduNqvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPZ7fzwqed2oiqlY1uULrjWfFp/Cah33YAz29uxj1rsW7OEEj
	RPFrDH6QqyvW0lw9kHZ8nLMLGTpjfCqCNSpMCex449n1XTIf6vvJVIz8aV3DlizgQQwXwnzQOWe
	BqgvBaWACTPd8PExAfPDsZBsZZV3N1J8=
X-Gm-Gg: Acq92OEsoTUqs2+BPak35p/2DS2CVhHiS2/lU0g05hVlzQHIznMQMU0QwMWSyvJc8rm
	r5JkDRF7odE4reX/OBw7K+xw2X7Ls+Ypmi1cAP7d0h3Q2KQxjBO5Of0kfIbwun46RfRmsgLGnJo
	xcd1fuJ1bhGu05uBjHTk8dWy6zs2THNYzXMhf2JvuYI13OsKhat/TIv7znib6OIrz+ypSii3V7s
	QURqfClMH1rqCk9YytNOvgvyjXUxzVzmuBA/O6fZC1vnd+qRbSSDogAephJEVU/wZgxVGqun3uD
	6ZLoG3UPvEDevOlT0DMR+Hwkqep+BXWFGfqolKft5/OZynduJpeLcVhKK7j0jCAC9qzHAG2LPzU
	yeKYIqnLVVUXmRshfOx8gNlwTFwvarucbOA==
X-Received: by 2002:a05:693c:3749:b0:304:c73b:79fd with SMTP id
 5a478bee46e88-3077b21905fmr73947eec.5.1780604622237; Thu, 04 Jun 2026
 13:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502160057.3402896-1-ashutoshdesai993@gmail.com>
In-Reply-To: <20260502160057.3402896-1-ashutoshdesai993@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Jun 2026 22:23:29 +0200
X-Gm-Features: AVVi8CfRiQwF4HJygNI6o23Uz3F2askpiUmeccyj0DSJnHTcRpLsEwdNWD0QxzY
Message-ID: <CANiq72=wXe+CKX46rYRT9Udc-Tw9yZyeoJVzkfDtDfazwai3og@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: add #[must_use] to GlobalGuard and GlobalLock::try_lock
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: ojeda@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org, 
	boqun@kernel.org, wl@lyx.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 2, 2026 at 6:02=E2=80=AFPM Ashutosh Desai
<ashutoshdesai993@gmail.com> wrote:
>
> Guard is marked #[must_use] since dropping it releases the lock. GlobalGu=
ard
> wraps Guard with identical semantics but was missing the annotation, so
> discarding it would silently compile without warning.
>
> Similarly, GlobalLock::try_lock was missing #[must_use]. Option<T> does n=
ot
> propagate #[must_use] from T, so the attribute needs to be on the functio=
n
> directly - same reason Lock::try_lock has it.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
